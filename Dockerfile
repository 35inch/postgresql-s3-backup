FROM alpine:3.13
LABEL maintainer="Selçuk Yıldırım <selcuk.yildirim@35inch.com>"

#update
RUN apk update
#pg_dump & pip
RUN apk add postgresql-client py-pip tar
#s3 client
RUN pip install awscli

ADD backup.sh backup.sh

CMD ["sh", "backup.sh"]
