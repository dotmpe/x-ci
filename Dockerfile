FROM scratch
ARG bin=x-ci-linux-amd64
COPY $bin /hello
ENTRYPOINT ["/hello"]
