# This file is called word_counter.py
from pyspark.sql import SparkSession
from pyspark.sql import functions as F

spark = SparkSession.builder.getOrCreate()

df = spark.read.text(paths='/job/samples/word_counter.py')
# Replace code chars with spaces
df = df.withColumn('value', F.regexp_replace('value', '\W', ' '))
# Split on spaces
df = df.select(F.explode(F.split('value', ' ')).alias('word'))
# Filter min length
df = df.where(F.length('word') > 0)
# Group by occurence and order
agg = (df.groupBy('word')
         .count()
         .sort('count', ascending=False)
      )
# Print top result
agg.limit(5).show()