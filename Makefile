up:
	docker-compose up -d
down:
	docker-compose down -v

rebuild:
	dock-compose down -v; docker-compose up -d

