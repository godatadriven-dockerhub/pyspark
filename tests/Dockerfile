ARG IMAGE_NAME
FROM ${IMAGE_NAME}

ADD . /tests/
RUN chmod +x /tests/run_tests.sh
ENTRYPOINT ["/tests/run_tests.sh"]
CMD [""]