module github.com/opencord/voltha-protos/v5

go 1.16

require (
	github.com/golang/protobuf v1.5.3
	google.golang.org/genproto v0.0.0-20230629202037-9506855d4529
	google.golang.org/grpc v1.56.2
)

replace google.golang.org/genproto => google.golang.org/genproto v0.0.0-20230711160842-782d3b101e98

replace github.com/golang/protobuf => github.com/golang/protobuf v1.5.3
