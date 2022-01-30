FROM ubuntu:20.04
COPY /rick.sh /
ENTRYPOINT /rick.sh
CMD ["--link"]

# CMD and UNIX signals are ignored here because 
# shell form, ENTRYPOINT /rick.sh, is used instead of
# exec form, ENTRYPOINT ["/rick.sh"].
