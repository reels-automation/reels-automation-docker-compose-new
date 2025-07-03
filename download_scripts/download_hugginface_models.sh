echo "Download Vosk Started"

source .env
WORKING_DIR=$(pwd)


DEST="$WORKING_DIR/downloads/homero.zip"
touch $DEST
VOSK_MODEL_ES_URL="https://huggingface.co/SrIncognito69/Homero/resolve/main/homero.zip?download=true"
curl -L -o "$DEST" "$VOSK_MODEL_ES_URL"

download_model(){
    
    MODEL_FOLDER_NAME=$1
    MODEL_DOWNLOAD_URL=$2
    BUCKET_NAME=$3
    NEW_FILE_NAME=$4

    OUTPUT_FOLDER=$WORKING_DIR/downloads/
    
    DEST="$WORKING_DIR/downloads/$MODEL_FOLDER_NAME"
    curl -L -o "$DEST" "$MODEL_DOWNLOAD_URL"
    
    echo xd $OUTPUT_FOLDER

    unzip $DEST -d $OUTPUT_FOLDER
    
    EXTRACTED_DIR=$(unzip -Z1 "$DEST" | head -1 | cut -d/ -f1)
    TARGET_DIR="$OUTPUT_FOLDER/$EXTRACTED_DIR"

    # Renombrar los archivos dentro de la carpeta extraída
    for file in "$TARGET_DIR"/*; do
        if [ -f "$file" ]; then
            ext="${file##*.}"
            new_file="$TARGET_DIR/${NEW_FILE_NAME}.$ext"
            mv "$file" "$new_file"
            
            mc alias set adminminio http://localhost:9002 $MINIO_ADMIN_FILES_ACCESS_KEY $MINIO_ADMIN_FILES_SECRET_KEY;
            mc put $new_file adminminio/$BUCKET_NAME
        fi
    done

    

}

VOICE_MODELS_BUCKET="voice-models"

download_model "homero.zip" "https://huggingface.co/SrIncognito69/Homero/resolve/main/homero.zip?download=true" $VOICE_MODELS_BUCKET "homero_es"