download_gameplay(){

    GAMEPLAY_NAME_FILE="$1"
    VIDEO_URL="$2"
    BUCKET_NAME="$3"

    source .env
    WORKING_DIR=$(pwd)
    DEST="$WORKING_DIR/downloads/$GAMEPLAY_NAME_FILE"
    touch $DEST
    curl -L -o "$DEST" "$VIDEO_URL"

    mc alias set adminminio http://localhost:9000 $MINIO_ROOT_USER $MINIO_ROOT_PASSWORD;
    mc put $DEST adminminio/$BUCKET_NAME
    
}

GAMEPLAYS_BUCKET="gameplays"

download_gameplay subway.mp4 https://res.cloudinary.com/dzuzll4ka/video/upload/v1751517539/subway_hh2c0m.mp4   $GAMEPLAYS_BUCKET
download_gameplay subway1.mp4 https://res.cloudinary.com/dzuzll4ka/video/upload/v1751517535/subway3_bqfeq4.mp4 $GAMEPLAYS_BUCKET
download_gameplay subway2.mp4 https://res.cloudinary.com/dzuzll4ka/video/upload/v1751517522/subway2_ironx8.mp4 $GAMEPLAYS_BUCKET


