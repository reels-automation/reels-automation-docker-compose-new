echo "Downlaod Vosk Started"

source .env
WORKING_DIR=$(pwd)

#vosk-model-es

DEST="$WORKING_DIR/downloads/vosk-model-es-0.42.zip"
touch $DEST
VOSK_MODEL_ES_URL="https://alphacephei.com/vosk/models/vosk-model-small-es-0.42.zip"
curl -L -o "$DEST" "$VOSK_MODEL_ES_URL"
mc alias set adminminio http://localhost:9002 $MINIO_ADMIN_FILES_ACCESS_KEY $MINIO_ADMIN_FILES_SECRET_KEY;
mc put $DEST adminminio/vosk-models

