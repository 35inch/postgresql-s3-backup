# postgresql-s3-backup
Postgresql backup container for kubernetes cronjob system


 ENV variables:
 
 PG_PASS = postgresql password
 
 PG_HOST = posgtrsql host
 
 PG_PORT = postgresql port
 
 PG_USER = postgresql user
 
 PG_DATABASES = database list, example: "db1;db2;db3;db4"

 
 S3_REGION = s3 region
 
 S3_HOST = s3 host (optinal)
 
 S3_ACCESS_KEY = s3 access key
 
 S3_SECRET_KEY = s3 secret key
 
 S3_BUCKET = s3 bucket

 S3_STORAGE_CLASS = STANDARD or GLACIER (optinal)
 

 S3_REGION_2 = s3 region
 
 S3_HOST_2 = s3 host (optinal)
 
 S3_ACCESS_KEY_2 = s3 access key
 
 S3_SECRET_KEY_2 = s3 secret key
 
 S3_BUCKET_2 = s3 bucket

 S3_STORAGE_CLASS_2 = STANDARD or GLACIER (optinal)
 
 Example cronjob yaml:

