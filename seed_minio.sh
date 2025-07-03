echo seeding minio 

mkdir downloads

./download_scripts/download_vosk.sh
./download_scripts/download_images.sh
./download_scripts/download_hugginface_models.sh
./download_scripts/download_gameplays.sh

rm -rf downloads