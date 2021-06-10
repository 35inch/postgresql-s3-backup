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

if [[ -z "${S3_STORAGE_CLASS}" ]]; then
    AWS_ARGS2=""
else
    AWS_ARGS2="--storage-class=${S3_STORAGE_CLASS}"
fi
echo "Uploading to S3 1"
aws s3 cp $file s3://$S3_BUCKET/$file $AWS_ARGS $AWS_ARGS2


if [[ -z "${S3_ACCESS_KEY_2}" ]]; then
    echo "Skip upload to S3 2"
else
    export AWS_ACCESS_KEY_ID=$S3_ACCESS_KEY_2
    export AWS_SECRET_ACCESS_KEY=$S3_SECRET_KEY_2
    export AWS_DEFAULT_REGION=$S3_REGION_2

    if [[ -z "${S3_HOST}" ]]; then
        AWS_ARGS=""
    else
        AWS_ARGS="--endpoint-url=${S3_HOST_2}"
    fi

    if [[ -z "${S3_STORAGE_CLASS_2}" ]]; then
        AWS_ARGS2=""
    else
        AWS_ARGS2="--storage-class=${S3_STORAGE_CLASS_2}"
    fi
    echo "Uploading to S3 2"

    aws s3 cp $file s3://$S3_BUCKET_2/$file $AWS_ARGS $AWS_ARGS2
fi