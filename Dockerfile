FROM openjdk:8-jre-slim

ARG BUILD_DATE
ARG SPARK_VERSION=2.3.0

LABEL org.label-schema.name="Apache PySpark $SPARK_VERSION" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.version=$SPARK_VERSION

ENV PATH="/opt/miniconda3/bin:${PATH}"

RUN apt-get update && \
    apt-get install -y curl bzip2 && \
    curl -s --url "https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh" --output /tmp/miniconda.sh && \
    bash /tmp/miniconda.sh -b -f -p "/opt/miniconda3" && \
    rm /tmp/miniconda.sh && \
    apt-get remove -y curl bzip2 && \
    apt-get autoremove -y && \
    apt-get clean && \
    conda config --set auto_update_conda true && \
    conda config --set channel_priority false && \
    conda update conda -y --force && \
    conda clean -tipsy && \
    echo "PATH=/opt/miniconda${MINICONDA_VERSION}/bin:\${PATH}" > /etc/profile.d/miniconda.sh && \
    pip install --no-cache pyspark==${SPARK_VERSION}

ENTRYPOINT ["pyspark"]
CMD ["--help"]