topics-create:
	docker exec broker kafka-topics --create --topic temas --bootstrap-server localhost:9092 --partitions 1 --replication-factor 1
	docker exec broker kafka-topics --create --topic scripts_video --bootstrap-server localhost:9092 --partitions 1 --replication-factor 1
	docker exec broker kafka-topics --create --topic audio_subtitles --bootstrap-server localhost:9092 --partitions 1 --replication-factor 1
	docker exec broker kafka-topics --create --topic subtitles-audios --bootstrap-server localhost:9092 --partitions 1 --replication-factor 1
	docker exec broker kafka-topics --create --topic audio_homero --bootstrap-server localhost:9092 --partitions 1 --replication-factor 1

mongo-collections-create:
	docker exec -it mongodb mongosh --eval "db.getSiblingDB('reels_automation').createCollection('temas');"
	docker exec -it mongodb mongosh --eval "db.getSiblingDB('reels_automation').createCollection('videos');"

install-ollama:
	docker exec -it ollama sh -c "ollama pull llama3.2:latest"
	
all: topics-create mongo-collections-create
