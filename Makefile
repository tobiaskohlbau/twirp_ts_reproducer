PROTOC_GEN_TWIRP_BIN="./node_modules/.bin/protoc-gen-twirp_ts"
PROTOC_GEN_PROTOBUF_TS_BIN="./node_modules/.bin/protoc-gen-ts"

protobuf-ts: clean
	protoc \
	-I ./protos \
	--plugin=protoc-gen-ts=$(PROTOC_GEN_PROTOBUF_TS_BIN) \
	--plugin=protoc-gen-twirp_ts=$(PROTOC_GEN_TWIRP_BIN) \
	--ts_opt=client_none \
	--ts_opt=generate_dependencies \
	--ts_out=$(OUT_DIR) \
	--twirp_ts_opt="gateway" \
	--twirp_ts_opt="index_file" \
	--twirp_ts_out=$(OUT_DIR) \
	./protos/api/v1/*.proto


OUT_DIR="./generated"

clean:
	rm -rf $(OUT_DIR)
	mkdir -p $(OUT_DIR)
