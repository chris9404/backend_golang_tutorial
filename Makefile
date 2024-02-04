postgres:
	docker run --name postgres - 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=ubuntu -d postgres

createdb:
	docker exec -it postgres createdb --username=root --owner=root simplebank

dropdb:
	docker exec -it postgres dropdb simplebank

migrateup:
	--path db/migration -database "postgresql://root:ubuntu@localhost:5432/simplebank?sslmode=disable" --verbose up

migratedown:
	--path db/migration -database "postgresql://root:ubuntu@localhost:5432/simplebank?sslmode=disable" --verbose down

.PHONY: createdb