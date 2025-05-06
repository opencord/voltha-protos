module github.com/opencord/voltha-protos/v5

go 1.25.3

require (
	github.com/golang/protobuf v1.5.3
	google.golang.org/genproto/googleapis/api v0.0.0-20230706204954-ccb25ca9f130
	google.golang.org/grpc v1.56.2
)

require (
	golang.org/x/net v0.10.0 // indirect
	golang.org/x/sys v0.8.0 // indirect
	golang.org/x/text v0.9.0 // indirect
	google.golang.org/genproto v0.0.0-20230629202037-9506855d4529 // indirect
	google.golang.org/genproto/googleapis/rpc v0.0.0-20230706204954-ccb25ca9f130 // indirect
	google.golang.org/protobuf v1.31.0 // indirect
)

replace google.golang.org/genproto => google.golang.org/genproto v0.0.0-20230711160842-782d3b101e98

replace github.com/golang/protobuf => github.com/golang/protobuf v1.5.3
