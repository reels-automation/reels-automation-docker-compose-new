sleep 5;
echo "Creating buckets"    
/usr/bin/mc alias set dockerminio http://minio:9000 $MINIO_ROOT_USER $MINIO_ROOT_PASSWORD;
/usr/bin/mc mb dockerminio/audios-tts;
/usr/bin/mc mb dockerminio/gameplays;
/usr/bin/mc mb dockerminio/subtitles-json;
/usr/bin/mc mb dockerminio/videos-homero;
exit 0;
