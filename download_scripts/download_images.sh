download_image(){

    IMAGE_NAME_FILE="$1"
    IMAGE_URL="$2"
    BUCKET_NAME="$3"

    source .env
    WORKING_DIR=$(pwd)
    DEST="$WORKING_DIR/downloads/$IMAGE_NAME_FILE"
    touch $DEST
    curl -L -o "$DEST" "$IMAGE_URL"

    mc alias set adminminio http://localhost:9002 $MINIO_ADMIN_FILES_ACCESS_KEY $MINIO_ADMIN_FILES_SECRET_KEY;
    mc put $DEST adminminio/$BUCKET_NAME
    
}

HOMER_BUCKET="personajes-images-homero"

IMAGES_ARRAY_HOMER=("https://pngimg.com/d/simpsons_PNG44.png" "https://pngimg.com/d/simpsons_PNG2.png" "https://pngimg.com/d/simpsons_PNG29.png" "https://pngimg.com/d/simpsons_PNG3.png")

COUNTER_HOMER=0
for IMAGE_LINK_HOMER in ${IMAGES_ARRAY_HOMER[@]}; do

    COUNTER=$((COUNTER+1))
    download_image "Homero$COUNTER.png" $IMAGE_LINK_HOMER $HOMER_BUCKET

done

PETER_BUCKET="personajes-images-peter-griffin"

IMAGES_ARRAY_PETER=("https://www.pngall.com/wp-content/uploads/14/Peter-Griffin-PNG-Images-HD.png" "https://www.pngall.com/wp-content/uploads/14/Peter-Griffin-No-Background.png")

COUNTER_PETER=0
for IMAGE_LINK_PETER in ${IMAGES_ARRAY_PETER[@]}; do

    COUNTER_PETER=$((COUNTER_PETER+1))
    download_image "Peter$COUNTER_PETER.png" $IMAGE_LINK_PETER $PETER_BUCKET

done


