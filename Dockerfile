FROM alpine:3.5

COPY add-pull-token.sh .

RUN chmod u+x add-pull-token.sh
RUN apk update && apk add jq

CMD ["./add-pull-token.sh"]
