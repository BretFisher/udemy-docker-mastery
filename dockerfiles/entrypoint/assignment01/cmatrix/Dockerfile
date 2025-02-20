# use the README.md file for requirements to build this image
# If you get stuck, the answer/ directory has the solution
FROM alpine:latest

RUN apk add --no-cache cmatrix

ENTRYPOINT ["cmatrix"]

CMD ["-abs", "-C", "red"] 

