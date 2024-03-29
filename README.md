# Apache PySpark in Docker

PySpark docker container based on OpenJDK and Miniconda 3.
PySpark 3+ uses OpenJDK 11, PySpark 2 uses OpenJDK 8.

[![](https://img.shields.io/docker/image-size/godatadriven/pyspark/latest)](https://hub.docker.com/r/godatadriven/pyspark) [![](https://img.shields.io/docker/v/godatadriven/pyspark?sort=semver)](https://hub.docker.com/r/godatadriven/pyspark) 

## Running the container
By default spark-submit --help is run:

```bash
docker run godatadriven/pyspark 
```

To run your own job, make the job accessible through a volume and pass the necessary arguments:

```bash
docker run -v /local_folder:/job godatadriven/pyspark [options] /job/<python file> [app arguments]
```

### Samples

The folder samples contain some PySpark jobs, how to obtain a spark session and crunch some data. The current directory is mapped as /job. So run the docker command from the root directory of this project.

```bash
# Self word counter:
docker run -v $(pwd):/job godatadriven/pyspark /job/samples/word_counter.py

# Self word counter with spark extra options
docker run -v $(pwd):/job godatadriven/pyspark \
	--name "I count myself" \
	--master "local[1]" \
	--conf "spark.ui.showConsoleProgress=True" \
	--conf "spark.ui.enabled=False" \
	/job/samples/word_counter.py "jobSampleArgument1"
```