# postgresql-s3-backup
Postgresql backup container for kubernetes cronjob system

Bu proje kubernetes cron job sistemini kullanarak postgresql veritabanının yedeğini almaya yönelik bir image sunar.
Gerekli env variablelerini girerek kullanılabilir, image dockerhub üzerinde public olarak yayınlandıktan sonra burada da paylaşılacaktır. 
Postgresql tabanlı olarak yapılmıştır fakat diğer veri tabanlarına da entegre edilebilir.

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
 
 
 Example cronjob yaml:

