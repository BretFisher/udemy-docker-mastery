FROM alpine

COPY ./do-stuff-then-ping.sh /

CMD ["/do-stuff-then-ping.sh"]

