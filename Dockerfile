FROM scratch
COPY x-ci /hello
ENTRYPOINT ["/hello"]
