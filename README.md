# Apache PySpark in Docker

PySpark docker container based on OpenJDK 8 and Miniconda 3

[![](https://images.microbadger.com/badges/image/godatadriven/pyspark.svg)](https://microbadger.com/images/godatadriven/pyspark "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/godatadriven/pyspark.svg)](https://microbadger.com/images/godatadriven/pyspark "Get your own version badge on microbadger.com") 

## Running the container
By default pyspark --help is run:

```
docker run godatadriven/pyspark 
```

To run your own job, make the job accessible through a volume and pass the necessary arguments:

```
docker run -v /local_folder:/job godatadriven/pyspark [options] /job/<python file> [app arguments]
```