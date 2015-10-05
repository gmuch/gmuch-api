.PHONY: test

test: fixtures/database-v1
	@go test -v -race -cover $(glide nv)
	@rm -rf fixtures/database-v1

fixtures/database-v1: fixtures/database-v1.tar.xz
	@tar -C fixtures -xf fixtures/database-v1.tar.xz

fixtures/database-v1.tar.xz:
	@mkdir -p fixtures
	@curl -Lo fixtures/database-v1.tar.xz http://notmuchmail.org/releases/test-databases/database-v1.tar.xz

server/grpc/gmuch.pb.go:
	@protoc server/grpc/gmuch.proto --go_out=plugins=grpc:.