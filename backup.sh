#set pg password for pg_dump
export PGPASSWORD=$PG_PASS
#set awscli
export AWS_ACCESS_KEY_ID=$S3_ACCESS_KEY
export AWS_SECRET_ACCESS_KEY=$S3_SECRET_KEY
export AWS_DEFAULT_REGION=$S3_REGION

mkdir backup

export IFS=";"
for db in $PG_DATABASES; do
    echo "Creating dump of ${db} from ${PG_HOST}..."
    pg_dump -h $PG_HOST -p $PG_PORT -U $PG_USER $db > backup/${db}.sql
    echo "Finish."
done

file="$(date +"%Y-%m-%d_%H-%M-%S").tar.gz"

tar -zcvf $file backup/ 

if [[ -z "${S3_HOST}" ]]; then
    AWS_ARGS=""
else
    AWS_ARGS="--endpoint-url=${S3_HOST}"
fi
aws s3 cp $file s3://$S3_BUCKET/$file $AWS_ARGS