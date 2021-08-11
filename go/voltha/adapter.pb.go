// Code generated by protoc-gen-go. DO NOT EDIT.
// source: voltha_protos/adapter.proto

package voltha

import (
	fmt "fmt"
	proto "github.com/golang/protobuf/proto"
	any "github.com/golang/protobuf/ptypes/any"
	_ "github.com/opencord/voltha-protos/v5/go/common"
	math "math"
)

// Reference imports to suppress errors if they are not otherwise used.
var _ = proto.Marshal
var _ = fmt.Errorf
var _ = math.Inf

// This is a compile-time assertion to ensure that this generated file
// is compatible with the proto package it is being compiled against.
// A compilation error at this line likely means your copy of the
// proto package needs to be updated.
const _ = proto.ProtoPackageIsVersion3 // please upgrade the proto package

type AdapterConfig struct {
	// Custom (vendor-specific) configuration attributes
	AdditionalConfig     *any.Any `protobuf:"bytes,64,opt,name=additional_config,json=additionalConfig,proto3" json:"additional_config,omitempty"`
	XXX_NoUnkeyedLiteral struct{} `json:"-"`
	XXX_unrecognized     []byte   `json:"-"`
	XXX_sizecache        int32    `json:"-"`
}

func (m *AdapterConfig) Reset()         { *m = AdapterConfig{} }
func (m *AdapterConfig) String() string { return proto.CompactTextString(m) }
func (*AdapterConfig) ProtoMessage()    {}
func (*AdapterConfig) Descriptor() ([]byte, []int) {
	return fileDescriptor_7e998ce153307274, []int{0}
}

func (m *AdapterConfig) XXX_Unmarshal(b []byte) error {
	return xxx_messageInfo_AdapterConfig.Unmarshal(m, b)
}
func (m *AdapterConfig) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	return xxx_messageInfo_AdapterConfig.Marshal(b, m, deterministic)
}
func (m *AdapterConfig) XXX_Merge(src proto.Message) {
	xxx_messageInfo_AdapterConfig.Merge(m, src)
}
func (m *AdapterConfig) XXX_Size() int {
	return xxx_messageInfo_AdapterConfig.Size(m)
}
func (m *AdapterConfig) XXX_DiscardUnknown() {
	xxx_messageInfo_AdapterConfig.DiscardUnknown(m)
}

var xxx_messageInfo_AdapterConfig proto.InternalMessageInfo

func (m *AdapterConfig) GetAdditionalConfig() *any.Any {
	if m != nil {
		return m.AdditionalConfig
	}
	return nil
}

// Adapter (software plugin)
type Adapter struct {
	// the adapter ID has to be unique,
	// it will be generated as Type + CurrentReplica
	Id      string `protobuf:"bytes,1,opt,name=id,proto3" json:"id,omitempty"`
	Vendor  string `protobuf:"bytes,2,opt,name=vendor,proto3" json:"vendor,omitempty"`
	Version string `protobuf:"bytes,3,opt,name=version,proto3" json:"version,omitempty"`
	// Adapter configuration
	Config *AdapterConfig `protobuf:"bytes,16,opt,name=config,proto3" json:"config,omitempty"`
	// Custom descriptors and custom configuration
	AdditionalDescription *any.Any `protobuf:"bytes,64,opt,name=additional_description,json=additionalDescription,proto3" json:"additional_description,omitempty"`
	LogicalDeviceIds      []string `protobuf:"bytes,4,rep,name=logical_device_ids,json=logicalDeviceIds,proto3" json:"logical_device_ids,omitempty"`
	// timestamp when the adapter last sent a message to the core
	LastCommunication int64  `protobuf:"varint,5,opt,name=last_communication,json=lastCommunication,proto3" json:"last_communication,omitempty"`
	CurrentReplica    int32  `protobuf:"varint,6,opt,name=currentReplica,proto3" json:"currentReplica,omitempty"`
	TotalReplicas     int32  `protobuf:"varint,7,opt,name=totalReplicas,proto3" json:"totalReplicas,omitempty"`
	Endpoint          string `protobuf:"bytes,8,opt,name=endpoint,proto3" json:"endpoint,omitempty"`
	// all replicas of the same adapter will have the same type
	// it is used to associate a device to an adapter
	Type                 string   `protobuf:"bytes,9,opt,name=type,proto3" json:"type,omitempty"`
	XXX_NoUnkeyedLiteral struct{} `json:"-"`
	XXX_unrecognized     []byte   `json:"-"`
	XXX_sizecache        int32    `json:"-"`
}

func (m *Adapter) Reset()         { *m = Adapter{} }
func (m *Adapter) String() string { return proto.CompactTextString(m) }
func (*Adapter) ProtoMessage()    {}
func (*Adapter) Descriptor() ([]byte, []int) {
	return fileDescriptor_7e998ce153307274, []int{1}
}

func (m *Adapter) XXX_Unmarshal(b []byte) error {
	return xxx_messageInfo_Adapter.Unmarshal(m, b)
}
func (m *Adapter) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	return xxx_messageInfo_Adapter.Marshal(b, m, deterministic)
}
func (m *Adapter) XXX_Merge(src proto.Message) {
	xxx_messageInfo_Adapter.Merge(m, src)
}
func (m *Adapter) XXX_Size() int {
	return xxx_messageInfo_Adapter.Size(m)
}
func (m *Adapter) XXX_DiscardUnknown() {
	xxx_messageInfo_Adapter.DiscardUnknown(m)
}

var xxx_messageInfo_Adapter proto.InternalMessageInfo

func (m *Adapter) GetId() string {
	if m != nil {
		return m.Id
	}
	return ""
}

func (m *Adapter) GetVendor() string {
	if m != nil {
		return m.Vendor
	}
	return ""
}

func (m *Adapter) GetVersion() string {
	if m != nil {
		return m.Version
	}
	return ""
}

func (m *Adapter) GetConfig() *AdapterConfig {
	if m != nil {
		return m.Config
	}
	return nil
}

func (m *Adapter) GetAdditionalDescription() *any.Any {
	if m != nil {
		return m.AdditionalDescription
	}
	return nil
}

func (m *Adapter) GetLogicalDeviceIds() []string {
	if m != nil {
		return m.LogicalDeviceIds
	}
	return nil
}

func (m *Adapter) GetLastCommunication() int64 {
	if m != nil {
		return m.LastCommunication
	}
	return 0
}

func (m *Adapter) GetCurrentReplica() int32 {
	if m != nil {
		return m.CurrentReplica
	}
	return 0
}

func (m *Adapter) GetTotalReplicas() int32 {
	if m != nil {
		return m.TotalReplicas
	}
	return 0
}

func (m *Adapter) GetEndpoint() string {
	if m != nil {
		return m.Endpoint
	}
	return ""
}

func (m *Adapter) GetType() string {
	if m != nil {
		return m.Type
	}
	return ""
}

type Adapters struct {
	Items                []*Adapter `protobuf:"bytes,1,rep,name=items,proto3" json:"items,omitempty"`
	XXX_NoUnkeyedLiteral struct{}   `json:"-"`
	XXX_unrecognized     []byte     `json:"-"`
	XXX_sizecache        int32      `json:"-"`
}

func (m *Adapters) Reset()         { *m = Adapters{} }
func (m *Adapters) String() string { return proto.CompactTextString(m) }
func (*Adapters) ProtoMessage()    {}
func (*Adapters) Descriptor() ([]byte, []int) {
	return fileDescriptor_7e998ce153307274, []int{2}
}

func (m *Adapters) XXX_Unmarshal(b []byte) error {
	return xxx_messageInfo_Adapters.Unmarshal(m, b)
}
func (m *Adapters) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	return xxx_messageInfo_Adapters.Marshal(b, m, deterministic)
}
func (m *Adapters) XXX_Merge(src proto.Message) {
	xxx_messageInfo_Adapters.Merge(m, src)
}
func (m *Adapters) XXX_Size() int {
	return xxx_messageInfo_Adapters.Size(m)
}
func (m *Adapters) XXX_DiscardUnknown() {
	xxx_messageInfo_Adapters.DiscardUnknown(m)
}

var xxx_messageInfo_Adapters proto.InternalMessageInfo

func (m *Adapters) GetItems() []*Adapter {
	if m != nil {
		return m.Items
	}
	return nil
}

func init() {
	proto.RegisterType((*AdapterConfig)(nil), "voltha.AdapterConfig")
	proto.RegisterType((*Adapter)(nil), "voltha.Adapter")
	proto.RegisterType((*Adapters)(nil), "voltha.Adapters")
}

func init() { proto.RegisterFile("voltha_protos/adapter.proto", fileDescriptor_7e998ce153307274) }

var fileDescriptor_7e998ce153307274 = []byte{
	// 439 bytes of a gzipped FileDescriptorProto
	0x1f, 0x8b, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0xff, 0x7c, 0x92, 0xc1, 0x8e, 0xd3, 0x30,
	0x14, 0x45, 0x95, 0x66, 0x9a, 0xb6, 0x6f, 0x54, 0xe8, 0x18, 0x8a, 0x4c, 0xd1, 0x88, 0xa8, 0x02,
	0x94, 0x05, 0x4d, 0xc4, 0x20, 0xf6, 0xb4, 0x33, 0x1b, 0xb6, 0x16, 0x62, 0xc1, 0xa6, 0x72, 0x6d,
	0x4f, 0xc6, 0x52, 0xe2, 0x17, 0x25, 0x6e, 0xa4, 0xfe, 0x1c, 0x7f, 0xc0, 0x7f, 0xf0, 0x05, 0xac,
	0x51, 0x1d, 0x97, 0xb6, 0xb3, 0x98, 0x55, 0x7b, 0xef, 0x3d, 0xbe, 0xf6, 0x7b, 0x0a, 0xbc, 0x69,
	0xb1, 0xb0, 0x0f, 0x7c, 0x5d, 0xd5, 0x68, 0xb1, 0xc9, 0xb8, 0xe4, 0x95, 0x55, 0x75, 0xea, 0x24,
	0x89, 0xba, 0x70, 0x46, 0xcf, 0xa1, 0x52, 0x59, 0xde, 0x11, 0xb3, 0xd7, 0x39, 0x62, 0x5e, 0xa8,
	0xcc, 0xa9, 0xcd, 0xf6, 0x3e, 0xe3, 0x66, 0xd7, 0x45, 0x73, 0x06, 0xe3, 0x65, 0xd7, 0x76, 0x8b,
	0xe6, 0x5e, 0xe7, 0x64, 0x09, 0x57, 0x5c, 0x4a, 0x6d, 0x35, 0x1a, 0x5e, 0xac, 0x85, 0x33, 0xe9,
	0xd7, 0x38, 0x48, 0x2e, 0x6f, 0x5e, 0xa6, 0x5d, 0x4f, 0x7a, 0xe8, 0x49, 0x97, 0x66, 0xc7, 0x26,
	0x47, 0xbc, 0xab, 0x98, 0xff, 0x0a, 0x61, 0xe0, 0x4b, 0xc9, 0x14, 0x7a, 0x5a, 0xd2, 0x20, 0x0e,
	0x92, 0xd1, 0xaa, 0xff, 0xe7, 0xef, 0xef, 0xeb, 0x80, 0xf5, 0xb4, 0x24, 0xd7, 0x10, 0xb5, 0xca,
	0x48, 0xac, 0x69, 0xef, 0x34, 0xf2, 0x26, 0x79, 0x0b, 0x83, 0x56, 0xd5, 0x8d, 0x46, 0x43, 0xc3,
	0xd3, 0xfc, 0xe0, 0x92, 0x05, 0x44, 0xfe, 0x69, 0x13, 0xf7, 0xb4, 0x69, 0xda, 0x0d, 0x9f, 0x9e,
	0x0d, 0xc3, 0x3c, 0x44, 0x18, 0xbc, 0x3a, 0x19, 0x4a, 0xaa, 0x46, 0xd4, 0xba, 0xda, 0xab, 0xa7,
	0x26, 0x3b, 0x5c, 0x3a, 0x3d, 0x1e, 0xbd, 0x3b, 0x9e, 0x24, 0x1f, 0x81, 0x14, 0x98, 0x6b, 0xe1,
	0x0a, 0x5b, 0x2d, 0xd4, 0x5a, 0xcb, 0x86, 0x5e, 0xc4, 0x61, 0x32, 0x62, 0x13, 0x9f, 0xdc, 0xb9,
	0xe0, 0x9b, 0x6c, 0xc8, 0x02, 0x48, 0xc1, 0x1b, 0xbb, 0x16, 0x58, 0x96, 0x5b, 0xa3, 0x05, 0x77,
	0xb7, 0xf7, 0xe3, 0x20, 0x09, 0xd9, 0xd5, 0x3e, 0xb9, 0x3d, 0x0d, 0xc8, 0x07, 0x78, 0x26, 0xb6,
	0x75, 0xad, 0x8c, 0x65, 0xaa, 0x2a, 0xb4, 0xe0, 0x34, 0x8a, 0x83, 0xa4, 0xcf, 0x1e, 0xb9, 0xe4,
	0x1d, 0x8c, 0x2d, 0x5a, 0x5e, 0x78, 0xdd, 0xd0, 0x81, 0xc3, 0xce, 0x4d, 0x32, 0x83, 0xa1, 0x32,
	0xb2, 0x42, 0x6d, 0x2c, 0x1d, 0xee, 0xf7, 0xc9, 0xfe, 0x6b, 0x42, 0xe0, 0xc2, 0xee, 0x2a, 0x45,
	0x47, 0xce, 0x77, 0xff, 0xe7, 0x9f, 0x60, 0xe8, 0xf7, 0xd8, 0x90, 0xf7, 0xd0, 0xd7, 0x56, 0x95,
	0x0d, 0x0d, 0xe2, 0x30, 0xb9, 0xbc, 0x79, 0xfe, 0x68, 0xd1, 0xac, 0x4b, 0x57, 0xdf, 0xe1, 0x05,
	0xd6, 0x79, 0x8a, 0x95, 0x32, 0x02, 0x6b, 0xe9, 0xa9, 0xd5, 0xf8, 0x87, 0xfb, 0xf5, 0xf0, 0xcf,
	0x34, 0xd7, 0xf6, 0x61, 0xbb, 0x49, 0x05, 0x96, 0xd9, 0x01, 0xcd, 0x3a, 0x74, 0xe1, 0x3f, 0xdb,
	0xf6, 0x4b, 0x96, 0xa3, 0xf7, 0x36, 0x91, 0x33, 0x3f, 0xff, 0x0b, 0x00, 0x00, 0xff, 0xff, 0xe1,
	0x88, 0x17, 0x78, 0x00, 0x03, 0x00, 0x00,
}
