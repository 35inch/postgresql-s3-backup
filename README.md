# postgresql-s3-backup
Postgresql backup container for kubernetes cronjob system

Bu proje kubernetes cron job sistemini kullanarak postgresql veritabanının yedeğini almaya yönelik bir image sunar.
Gerekli env variablelerini girerek kullanılabilir, image dockerhub üzerinde public olarak yayınlandıktan sonra burada da paylaşılacaktır. 
Postgresql tabanlı olarak yapılmıştır fakat diğer veri tabanlarına da entegre edilebilir.

 ENV variables:
 
 PG_PASS 
 PG_HOST
 PG_PORT
 PG_USER
 
 S3_REGION
 S3_HOST
 S3_ACCESS_KEY
 S3_SECRET_KEY
 S3_BUCKET
 
 
 Example cronjob yaml:



35inch - Selçuk Yıldırım
