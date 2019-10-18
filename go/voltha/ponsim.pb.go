// Code generated by protoc-gen-go. DO NOT EDIT.
// source: voltha_protos/ponsim.proto

package voltha

import (
	context "context"
	fmt "fmt"
	proto "github.com/golang/protobuf/proto"
	empty "github.com/golang/protobuf/ptypes/empty"
	openflow_13 "github.com/opencord/voltha-protos/v3/go/openflow_13"
	grpc "google.golang.org/grpc"
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

type PonSimOnuDeviceInfo struct {
	UniPort              int32    `protobuf:"varint,1,opt,name=uni_port,json=uniPort,proto3" json:"uni_port,omitempty"`
	SerialNumber         string   `protobuf:"bytes,2,opt,name=serial_number,json=serialNumber,proto3" json:"serial_number,omitempty"`
	XXX_NoUnkeyedLiteral struct{} `json:"-"`
	XXX_unrecognized     []byte   `json:"-"`
	XXX_sizecache        int32    `json:"-"`
}

func (m *PonSimOnuDeviceInfo) Reset()         { *m = PonSimOnuDeviceInfo{} }
func (m *PonSimOnuDeviceInfo) String() string { return proto.CompactTextString(m) }
func (*PonSimOnuDeviceInfo) ProtoMessage()    {}
func (*PonSimOnuDeviceInfo) Descriptor() ([]byte, []int) {
	return fileDescriptor_352253851b8ea7c0, []int{0}
}

func (m *PonSimOnuDeviceInfo) XXX_Unmarshal(b []byte) error {
	return xxx_messageInfo_PonSimOnuDeviceInfo.Unmarshal(m, b)
}
func (m *PonSimOnuDeviceInfo) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	return xxx_messageInfo_PonSimOnuDeviceInfo.Marshal(b, m, deterministic)
}
func (m *PonSimOnuDeviceInfo) XXX_Merge(src proto.Message) {
	xxx_messageInfo_PonSimOnuDeviceInfo.Merge(m, src)
}
func (m *PonSimOnuDeviceInfo) XXX_Size() int {
	return xxx_messageInfo_PonSimOnuDeviceInfo.Size(m)
}
func (m *PonSimOnuDeviceInfo) XXX_DiscardUnknown() {
	xxx_messageInfo_PonSimOnuDeviceInfo.DiscardUnknown(m)
}

var xxx_messageInfo_PonSimOnuDeviceInfo proto.InternalMessageInfo

func (m *PonSimOnuDeviceInfo) GetUniPort() int32 {
	if m != nil {
		return m.UniPort
	}
	return 0
}

func (m *PonSimOnuDeviceInfo) GetSerialNumber() string {
	if m != nil {
		return m.SerialNumber
	}
	return ""
}

type PonSimDeviceInfo struct {
	NniPort              int32                  `protobuf:"varint,1,opt,name=nni_port,json=nniPort,proto3" json:"nni_port,omitempty"`
	Onus                 []*PonSimOnuDeviceInfo `protobuf:"bytes,2,rep,name=onus,proto3" json:"onus,omitempty"`
	XXX_NoUnkeyedLiteral struct{}               `json:"-"`
	XXX_unrecognized     []byte                 `json:"-"`
	XXX_sizecache        int32                  `json:"-"`
}

func (m *PonSimDeviceInfo) Reset()         { *m = PonSimDeviceInfo{} }
func (m *PonSimDeviceInfo) String() string { return proto.CompactTextString(m) }
func (*PonSimDeviceInfo) ProtoMessage()    {}
func (*PonSimDeviceInfo) Descriptor() ([]byte, []int) {
	return fileDescriptor_352253851b8ea7c0, []int{1}
}

func (m *PonSimDeviceInfo) XXX_Unmarshal(b []byte) error {
	return xxx_messageInfo_PonSimDeviceInfo.Unmarshal(m, b)
}
func (m *PonSimDeviceInfo) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	return xxx_messageInfo_PonSimDeviceInfo.Marshal(b, m, deterministic)
}
func (m *PonSimDeviceInfo) XXX_Merge(src proto.Message) {
	xxx_messageInfo_PonSimDeviceInfo.Merge(m, src)
}
func (m *PonSimDeviceInfo) XXX_Size() int {
	return xxx_messageInfo_PonSimDeviceInfo.Size(m)
}
func (m *PonSimDeviceInfo) XXX_DiscardUnknown() {
	xxx_messageInfo_PonSimDeviceInfo.DiscardUnknown(m)
}

var xxx_messageInfo_PonSimDeviceInfo proto.InternalMessageInfo

func (m *PonSimDeviceInfo) GetNniPort() int32 {
	if m != nil {
		return m.NniPort
	}
	return 0
}

func (m *PonSimDeviceInfo) GetOnus() []*PonSimOnuDeviceInfo {
	if m != nil {
		return m.Onus
	}
	return nil
}

type FlowTable struct {
	Port                 int32                       `protobuf:"varint,1,opt,name=port,proto3" json:"port,omitempty"`
	Flows                []*openflow_13.OfpFlowStats `protobuf:"bytes,2,rep,name=flows,proto3" json:"flows,omitempty"`
	XXX_NoUnkeyedLiteral struct{}                    `json:"-"`
	XXX_unrecognized     []byte                      `json:"-"`
	XXX_sizecache        int32                       `json:"-"`
}

func (m *FlowTable) Reset()         { *m = FlowTable{} }
func (m *FlowTable) String() string { return proto.CompactTextString(m) }
func (*FlowTable) ProtoMessage()    {}
func (*FlowTable) Descriptor() ([]byte, []int) {
	return fileDescriptor_352253851b8ea7c0, []int{2}
}

func (m *FlowTable) XXX_Unmarshal(b []byte) error {
	return xxx_messageInfo_FlowTable.Unmarshal(m, b)
}
func (m *FlowTable) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	return xxx_messageInfo_FlowTable.Marshal(b, m, deterministic)
}
func (m *FlowTable) XXX_Merge(src proto.Message) {
	xxx_messageInfo_FlowTable.Merge(m, src)
}
func (m *FlowTable) XXX_Size() int {
	return xxx_messageInfo_FlowTable.Size(m)
}
func (m *FlowTable) XXX_DiscardUnknown() {
	xxx_messageInfo_FlowTable.DiscardUnknown(m)
}

var xxx_messageInfo_FlowTable proto.InternalMessageInfo

func (m *FlowTable) GetPort() int32 {
	if m != nil {
		return m.Port
	}
	return 0
}

func (m *FlowTable) GetFlows() []*openflow_13.OfpFlowStats {
	if m != nil {
		return m.Flows
	}
	return nil
}

type PonSimFrame struct {
	Id                   string   `protobuf:"bytes,1,opt,name=id,proto3" json:"id,omitempty"`
	Payload              []byte   `protobuf:"bytes,2,opt,name=payload,proto3" json:"payload,omitempty"`
	OutPort              int32    `protobuf:"varint,3,opt,name=out_port,json=outPort,proto3" json:"out_port,omitempty"`
	XXX_NoUnkeyedLiteral struct{} `json:"-"`
	XXX_unrecognized     []byte   `json:"-"`
	XXX_sizecache        int32    `json:"-"`
}

func (m *PonSimFrame) Reset()         { *m = PonSimFrame{} }
func (m *PonSimFrame) String() string { return proto.CompactTextString(m) }
func (*PonSimFrame) ProtoMessage()    {}
func (*PonSimFrame) Descriptor() ([]byte, []int) {
	return fileDescriptor_352253851b8ea7c0, []int{3}
}

func (m *PonSimFrame) XXX_Unmarshal(b []byte) error {
	return xxx_messageInfo_PonSimFrame.Unmarshal(m, b)
}
func (m *PonSimFrame) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	return xxx_messageInfo_PonSimFrame.Marshal(b, m, deterministic)
}
func (m *PonSimFrame) XXX_Merge(src proto.Message) {
	xxx_messageInfo_PonSimFrame.Merge(m, src)
}
func (m *PonSimFrame) XXX_Size() int {
	return xxx_messageInfo_PonSimFrame.Size(m)
}
func (m *PonSimFrame) XXX_DiscardUnknown() {
	xxx_messageInfo_PonSimFrame.DiscardUnknown(m)
}

var xxx_messageInfo_PonSimFrame proto.InternalMessageInfo

func (m *PonSimFrame) GetId() string {
	if m != nil {
		return m.Id
	}
	return ""
}

func (m *PonSimFrame) GetPayload() []byte {
	if m != nil {
		return m.Payload
	}
	return nil
}

func (m *PonSimFrame) GetOutPort() int32 {
	if m != nil {
		return m.OutPort
	}
	return 0
}

type PonSimPacketCounter struct {
	Name                 string   `protobuf:"bytes,1,opt,name=name,proto3" json:"name,omitempty"`
	Value                int64    `protobuf:"varint,2,opt,name=value,proto3" json:"value,omitempty"`
	XXX_NoUnkeyedLiteral struct{} `json:"-"`
	XXX_unrecognized     []byte   `json:"-"`
	XXX_sizecache        int32    `json:"-"`
}

func (m *PonSimPacketCounter) Reset()         { *m = PonSimPacketCounter{} }
func (m *PonSimPacketCounter) String() string { return proto.CompactTextString(m) }
func (*PonSimPacketCounter) ProtoMessage()    {}
func (*PonSimPacketCounter) Descriptor() ([]byte, []int) {
	return fileDescriptor_352253851b8ea7c0, []int{4}
}

func (m *PonSimPacketCounter) XXX_Unmarshal(b []byte) error {
	return xxx_messageInfo_PonSimPacketCounter.Unmarshal(m, b)
}
func (m *PonSimPacketCounter) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	return xxx_messageInfo_PonSimPacketCounter.Marshal(b, m, deterministic)
}
func (m *PonSimPacketCounter) XXX_Merge(src proto.Message) {
	xxx_messageInfo_PonSimPacketCounter.Merge(m, src)
}
func (m *PonSimPacketCounter) XXX_Size() int {
	return xxx_messageInfo_PonSimPacketCounter.Size(m)
}
func (m *PonSimPacketCounter) XXX_DiscardUnknown() {
	xxx_messageInfo_PonSimPacketCounter.DiscardUnknown(m)
}

var xxx_messageInfo_PonSimPacketCounter proto.InternalMessageInfo

func (m *PonSimPacketCounter) GetName() string {
	if m != nil {
		return m.Name
	}
	return ""
}

func (m *PonSimPacketCounter) GetValue() int64 {
	if m != nil {
		return m.Value
	}
	return 0
}

type PonSimPortMetrics struct {
	PortName             string                 `protobuf:"bytes,1,opt,name=port_name,json=portName,proto3" json:"port_name,omitempty"`
	Packets              []*PonSimPacketCounter `protobuf:"bytes,2,rep,name=packets,proto3" json:"packets,omitempty"`
	XXX_NoUnkeyedLiteral struct{}               `json:"-"`
	XXX_unrecognized     []byte                 `json:"-"`
	XXX_sizecache        int32                  `json:"-"`
}

func (m *PonSimPortMetrics) Reset()         { *m = PonSimPortMetrics{} }
func (m *PonSimPortMetrics) String() string { return proto.CompactTextString(m) }
func (*PonSimPortMetrics) ProtoMessage()    {}
func (*PonSimPortMetrics) Descriptor() ([]byte, []int) {
	return fileDescriptor_352253851b8ea7c0, []int{5}
}

func (m *PonSimPortMetrics) XXX_Unmarshal(b []byte) error {
	return xxx_messageInfo_PonSimPortMetrics.Unmarshal(m, b)
}
func (m *PonSimPortMetrics) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	return xxx_messageInfo_PonSimPortMetrics.Marshal(b, m, deterministic)
}
func (m *PonSimPortMetrics) XXX_Merge(src proto.Message) {
	xxx_messageInfo_PonSimPortMetrics.Merge(m, src)
}
func (m *PonSimPortMetrics) XXX_Size() int {
	return xxx_messageInfo_PonSimPortMetrics.Size(m)
}
func (m *PonSimPortMetrics) XXX_DiscardUnknown() {
	xxx_messageInfo_PonSimPortMetrics.DiscardUnknown(m)
}

var xxx_messageInfo_PonSimPortMetrics proto.InternalMessageInfo

func (m *PonSimPortMetrics) GetPortName() string {
	if m != nil {
		return m.PortName
	}
	return ""
}

func (m *PonSimPortMetrics) GetPackets() []*PonSimPacketCounter {
	if m != nil {
		return m.Packets
	}
	return nil
}

type PonSimMetrics struct {
	Device               string               `protobuf:"bytes,1,opt,name=device,proto3" json:"device,omitempty"`
	Metrics              []*PonSimPortMetrics `protobuf:"bytes,2,rep,name=metrics,proto3" json:"metrics,omitempty"`
	XXX_NoUnkeyedLiteral struct{}             `json:"-"`
	XXX_unrecognized     []byte               `json:"-"`
	XXX_sizecache        int32                `json:"-"`
}

func (m *PonSimMetrics) Reset()         { *m = PonSimMetrics{} }
func (m *PonSimMetrics) String() string { return proto.CompactTextString(m) }
func (*PonSimMetrics) ProtoMessage()    {}
func (*PonSimMetrics) Descriptor() ([]byte, []int) {
	return fileDescriptor_352253851b8ea7c0, []int{6}
}

func (m *PonSimMetrics) XXX_Unmarshal(b []byte) error {
	return xxx_messageInfo_PonSimMetrics.Unmarshal(m, b)
}
func (m *PonSimMetrics) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	return xxx_messageInfo_PonSimMetrics.Marshal(b, m, deterministic)
}
func (m *PonSimMetrics) XXX_Merge(src proto.Message) {
	xxx_messageInfo_PonSimMetrics.Merge(m, src)
}
func (m *PonSimMetrics) XXX_Size() int {
	return xxx_messageInfo_PonSimMetrics.Size(m)
}
func (m *PonSimMetrics) XXX_DiscardUnknown() {
	xxx_messageInfo_PonSimMetrics.DiscardUnknown(m)
}

var xxx_messageInfo_PonSimMetrics proto.InternalMessageInfo

func (m *PonSimMetrics) GetDevice() string {
	if m != nil {
		return m.Device
	}
	return ""
}

func (m *PonSimMetrics) GetMetrics() []*PonSimPortMetrics {
	if m != nil {
		return m.Metrics
	}
	return nil
}

type PonSimMetricsRequest struct {
	Port                 int32    `protobuf:"varint,1,opt,name=port,proto3" json:"port,omitempty"`
	XXX_NoUnkeyedLiteral struct{} `json:"-"`
	XXX_unrecognized     []byte   `json:"-"`
	XXX_sizecache        int32    `json:"-"`
}

func (m *PonSimMetricsRequest) Reset()         { *m = PonSimMetricsRequest{} }
func (m *PonSimMetricsRequest) String() string { return proto.CompactTextString(m) }
func (*PonSimMetricsRequest) ProtoMessage()    {}
func (*PonSimMetricsRequest) Descriptor() ([]byte, []int) {
	return fileDescriptor_352253851b8ea7c0, []int{7}
}

func (m *PonSimMetricsRequest) XXX_Unmarshal(b []byte) error {
	return xxx_messageInfo_PonSimMetricsRequest.Unmarshal(m, b)
}
func (m *PonSimMetricsRequest) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	return xxx_messageInfo_PonSimMetricsRequest.Marshal(b, m, deterministic)
}
func (m *PonSimMetricsRequest) XXX_Merge(src proto.Message) {
	xxx_messageInfo_PonSimMetricsRequest.Merge(m, src)
}
func (m *PonSimMetricsRequest) XXX_Size() int {
	return xxx_messageInfo_PonSimMetricsRequest.Size(m)
}
func (m *PonSimMetricsRequest) XXX_DiscardUnknown() {
	xxx_messageInfo_PonSimMetricsRequest.DiscardUnknown(m)
}

var xxx_messageInfo_PonSimMetricsRequest proto.InternalMessageInfo

func (m *PonSimMetricsRequest) GetPort() int32 {
	if m != nil {
		return m.Port
	}
	return 0
}

func init() {
	proto.RegisterType((*PonSimOnuDeviceInfo)(nil), "voltha.PonSimOnuDeviceInfo")
	proto.RegisterType((*PonSimDeviceInfo)(nil), "voltha.PonSimDeviceInfo")
	proto.RegisterType((*FlowTable)(nil), "voltha.FlowTable")
	proto.RegisterType((*PonSimFrame)(nil), "voltha.PonSimFrame")
	proto.RegisterType((*PonSimPacketCounter)(nil), "voltha.PonSimPacketCounter")
	proto.RegisterType((*PonSimPortMetrics)(nil), "voltha.PonSimPortMetrics")
	proto.RegisterType((*PonSimMetrics)(nil), "voltha.PonSimMetrics")
	proto.RegisterType((*PonSimMetricsRequest)(nil), "voltha.PonSimMetricsRequest")
}

func init() { proto.RegisterFile("voltha_protos/ponsim.proto", fileDescriptor_352253851b8ea7c0) }

var fileDescriptor_352253851b8ea7c0 = []byte{
	// 563 bytes of a gzipped FileDescriptorProto
	0x1f, 0x8b, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0xff, 0x7c, 0x94, 0x5f, 0x6f, 0xd3, 0x30,
	0x14, 0xc5, 0xdb, 0x6e, 0xeb, 0x9f, 0xbb, 0x15, 0x98, 0x3b, 0xa6, 0xae, 0x7d, 0xa0, 0x32, 0x2f,
	0x15, 0x12, 0x09, 0x5b, 0xc5, 0x0b, 0x48, 0x80, 0x18, 0xdb, 0xc4, 0x03, 0xa3, 0x72, 0xd9, 0x0b,
	0x42, 0x44, 0x69, 0xe2, 0x66, 0x11, 0x89, 0x6f, 0x48, 0xec, 0x4e, 0xfb, 0x86, 0x7c, 0x2c, 0x14,
	0x3b, 0xa1, 0xcd, 0xd4, 0xf2, 0x66, 0x5f, 0x9f, 0xfe, 0xce, 0x3d, 0x37, 0x57, 0x85, 0xc1, 0x12,
	0x23, 0x79, 0xeb, 0x3a, 0x49, 0x8a, 0x12, 0x33, 0x3b, 0x41, 0x91, 0x85, 0xb1, 0xa5, 0x6f, 0xa4,
	0x69, 0xde, 0x06, 0xc3, 0x00, 0x31, 0x88, 0xb8, 0xad, 0xab, 0x73, 0xb5, 0xb0, 0x79, 0x9c, 0xc8,
	0x7b, 0x23, 0x1a, 0x3c, 0xab, 0x02, 0x30, 0xe1, 0x62, 0x11, 0xe1, 0x9d, 0x73, 0x3a, 0x31, 0x02,
	0x7a, 0x03, 0xbd, 0x29, 0x8a, 0x59, 0x18, 0x7f, 0x15, 0xea, 0x13, 0x5f, 0x86, 0x1e, 0xff, 0x2c,
	0x16, 0x48, 0x4e, 0xa0, 0xad, 0x44, 0xe8, 0x24, 0x98, 0xca, 0x7e, 0x7d, 0x54, 0x1f, 0xef, 0xb1,
	0x96, 0x12, 0xe1, 0x14, 0x53, 0x49, 0x9e, 0x43, 0x37, 0xe3, 0x69, 0xe8, 0x46, 0x8e, 0x50, 0xf1,
	0x9c, 0xa7, 0xfd, 0xc6, 0xa8, 0x3e, 0xee, 0xb0, 0x03, 0x53, 0xbc, 0xd6, 0x35, 0xfa, 0x13, 0x9e,
	0x18, 0x6c, 0x95, 0x29, 0x1e, 0x30, 0x45, 0xc1, 0xb4, 0x61, 0x17, 0x85, 0xca, 0xfa, 0x8d, 0xd1,
	0xce, 0x78, 0xff, 0x6c, 0x68, 0x99, 0xae, 0xad, 0x0d, 0x9d, 0x31, 0x2d, 0xa4, 0x0c, 0x3a, 0x97,
	0x11, 0xde, 0x7d, 0x73, 0xe7, 0x11, 0x27, 0x04, 0x76, 0xd7, 0xa0, 0xfa, 0x4c, 0x4e, 0x61, 0x2f,
	0x0f, 0xba, 0x42, 0xae, 0x47, 0xc7, 0x45, 0xe2, 0xe8, 0x73, 0x26, 0x5d, 0x99, 0x31, 0xa3, 0xa4,
	0x0c, 0xf6, 0x8d, 0xe1, 0x65, 0xea, 0xc6, 0x9c, 0x3c, 0x82, 0x46, 0xe8, 0x6b, 0x66, 0x87, 0x35,
	0x42, 0x9f, 0xf4, 0xa1, 0x95, 0xb8, 0xf7, 0x11, 0xba, 0xbe, 0x4e, 0x7c, 0xc0, 0xca, 0x6b, 0x1e,
	0x0c, 0x95, 0x34, 0xc1, 0x76, 0x4c, 0x30, 0x54, 0x32, 0x0f, 0x46, 0xdf, 0x97, 0xe3, 0x9d, 0xba,
	0xde, 0x2f, 0x2e, 0xcf, 0x51, 0x09, 0xc9, 0xd3, 0xbc, 0x63, 0xe1, 0xc6, 0xbc, 0xa0, 0xeb, 0x33,
	0x39, 0x82, 0xbd, 0xa5, 0x1b, 0x29, 0xae, 0xe9, 0x3b, 0xcc, 0x5c, 0x68, 0x00, 0x87, 0x05, 0x00,
	0x53, 0xf9, 0x85, 0xcb, 0x34, 0xf4, 0x32, 0x32, 0x84, 0x4e, 0x6e, 0xe6, 0xac, 0x31, 0xda, 0x79,
	0xe1, 0x3a, 0xe7, 0xbc, 0xce, 0xfb, 0xcc, 0xcd, 0xb6, 0x8c, 0xb3, 0xd2, 0x09, 0x2b, 0xb5, 0xf4,
	0x07, 0x74, 0xcd, 0x7b, 0x69, 0x72, 0x0c, 0x4d, 0x5f, 0x8f, 0xbd, 0x70, 0x28, 0x6e, 0x64, 0x02,
	0xad, 0xd8, 0x48, 0x0a, 0xfe, 0xc9, 0x03, 0xfe, 0xaa, 0x51, 0x56, 0x2a, 0xe9, 0x0b, 0x38, 0xaa,
	0xd0, 0x19, 0xff, 0xad, 0x78, 0x26, 0x37, 0x7d, 0xba, 0xb3, 0x3f, 0x0d, 0x68, 0x1a, 0x31, 0x79,
	0x03, 0x9d, 0x19, 0x17, 0xbe, 0xf9, 0x20, 0xbd, 0xaa, 0x8f, 0x2e, 0x0e, 0x8e, 0x2d, 0xb3, 0xfe,
	0x56, 0xb9, 0xfe, 0xd6, 0x45, 0xbe, 0xfe, 0xb4, 0x46, 0x3e, 0x40, 0x97, 0x71, 0x8f, 0x87, 0x4b,
	0xae, 0x95, 0x19, 0xd9, 0x22, 0x1d, 0x6c, 0xe2, 0xd2, 0xda, 0xab, 0x3a, 0x39, 0x87, 0xee, 0x15,
	0x97, 0x6b, 0x1b, 0xbc, 0x8d, 0xd0, 0xaf, 0x12, 0x56, 0xbf, 0xa0, 0x35, 0xf2, 0x0e, 0x1e, 0xdf,
	0x24, 0xbe, 0x2b, 0xf9, 0x6a, 0x5f, 0x0f, 0x4b, 0xf9, 0xbf, 0xd2, 0x7f, 0x62, 0xbc, 0x85, 0xf6,
	0x15, 0x97, 0xb3, 0x7c, 0x51, 0xb7, 0xfa, 0x3f, 0xad, 0xfa, 0x17, 0x33, 0xa6, 0xb5, 0x8f, 0x17,
	0xd0, 0xc3, 0x34, 0xd0, 0xbb, 0xef, 0x61, 0xea, 0x17, 0xb2, 0xef, 0x56, 0x10, 0xca, 0x5b, 0x35,
	0xb7, 0x3c, 0x8c, 0xed, 0xf2, 0xcd, 0x36, 0x6f, 0x2f, 0x8b, 0x7f, 0x8a, 0xe5, 0xc4, 0x0e, 0xb0,
	0xa8, 0xcd, 0x9b, 0xba, 0x38, 0xf9, 0x1b, 0x00, 0x00, 0xff, 0xff, 0xb2, 0x72, 0x9e, 0xcb, 0x8f,
	0x04, 0x00, 0x00,
}

// Reference imports to suppress errors if they are not otherwise used.
var _ context.Context
var _ grpc.ClientConn

// This is a compile-time assertion to ensure that this generated file
// is compatible with the grpc package it is being compiled against.
const _ = grpc.SupportPackageIsVersion4

// PonSimClient is the client API for PonSim service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://godoc.org/google.golang.org/grpc#ClientConn.NewStream.
type PonSimClient interface {
	SendFrame(ctx context.Context, in *PonSimFrame, opts ...grpc.CallOption) (*empty.Empty, error)
	ReceiveFrames(ctx context.Context, in *empty.Empty, opts ...grpc.CallOption) (PonSim_ReceiveFramesClient, error)
	GetDeviceInfo(ctx context.Context, in *empty.Empty, opts ...grpc.CallOption) (*PonSimDeviceInfo, error)
	UpdateFlowTable(ctx context.Context, in *FlowTable, opts ...grpc.CallOption) (*empty.Empty, error)
	GetStats(ctx context.Context, in *empty.Empty, opts ...grpc.CallOption) (*PonSimMetrics, error)
}

type ponSimClient struct {
	cc *grpc.ClientConn
}

func NewPonSimClient(cc *grpc.ClientConn) PonSimClient {
	return &ponSimClient{cc}
}

func (c *ponSimClient) SendFrame(ctx context.Context, in *PonSimFrame, opts ...grpc.CallOption) (*empty.Empty, error) {
	out := new(empty.Empty)
	err := c.cc.Invoke(ctx, "/voltha.PonSim/SendFrame", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *ponSimClient) ReceiveFrames(ctx context.Context, in *empty.Empty, opts ...grpc.CallOption) (PonSim_ReceiveFramesClient, error) {
	stream, err := c.cc.NewStream(ctx, &_PonSim_serviceDesc.Streams[0], "/voltha.PonSim/ReceiveFrames", opts...)
	if err != nil {
		return nil, err
	}
	x := &ponSimReceiveFramesClient{stream}
	if err := x.ClientStream.SendMsg(in); err != nil {
		return nil, err
	}
	if err := x.ClientStream.CloseSend(); err != nil {
		return nil, err
	}
	return x, nil
}

type PonSim_ReceiveFramesClient interface {
	Recv() (*PonSimFrame, error)
	grpc.ClientStream
}

type ponSimReceiveFramesClient struct {
	grpc.ClientStream
}

func (x *ponSimReceiveFramesClient) Recv() (*PonSimFrame, error) {
	m := new(PonSimFrame)
	if err := x.ClientStream.RecvMsg(m); err != nil {
		return nil, err
	}
	return m, nil
}

func (c *ponSimClient) GetDeviceInfo(ctx context.Context, in *empty.Empty, opts ...grpc.CallOption) (*PonSimDeviceInfo, error) {
	out := new(PonSimDeviceInfo)
	err := c.cc.Invoke(ctx, "/voltha.PonSim/GetDeviceInfo", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *ponSimClient) UpdateFlowTable(ctx context.Context, in *FlowTable, opts ...grpc.CallOption) (*empty.Empty, error) {
	out := new(empty.Empty)
	err := c.cc.Invoke(ctx, "/voltha.PonSim/UpdateFlowTable", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *ponSimClient) GetStats(ctx context.Context, in *empty.Empty, opts ...grpc.CallOption) (*PonSimMetrics, error) {
	out := new(PonSimMetrics)
	err := c.cc.Invoke(ctx, "/voltha.PonSim/GetStats", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

// PonSimServer is the server API for PonSim service.
type PonSimServer interface {
	SendFrame(context.Context, *PonSimFrame) (*empty.Empty, error)
	ReceiveFrames(*empty.Empty, PonSim_ReceiveFramesServer) error
	GetDeviceInfo(context.Context, *empty.Empty) (*PonSimDeviceInfo, error)
	UpdateFlowTable(context.Context, *FlowTable) (*empty.Empty, error)
	GetStats(context.Context, *empty.Empty) (*PonSimMetrics, error)
}

func RegisterPonSimServer(s *grpc.Server, srv PonSimServer) {
	s.RegisterService(&_PonSim_serviceDesc, srv)
}

func _PonSim_SendFrame_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(PonSimFrame)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(PonSimServer).SendFrame(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/voltha.PonSim/SendFrame",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(PonSimServer).SendFrame(ctx, req.(*PonSimFrame))
	}
	return interceptor(ctx, in, info, handler)
}

func _PonSim_ReceiveFrames_Handler(srv interface{}, stream grpc.ServerStream) error {
	m := new(empty.Empty)
	if err := stream.RecvMsg(m); err != nil {
		return err
	}
	return srv.(PonSimServer).ReceiveFrames(m, &ponSimReceiveFramesServer{stream})
}

type PonSim_ReceiveFramesServer interface {
	Send(*PonSimFrame) error
	grpc.ServerStream
}

type ponSimReceiveFramesServer struct {
	grpc.ServerStream
}

func (x *ponSimReceiveFramesServer) Send(m *PonSimFrame) error {
	return x.ServerStream.SendMsg(m)
}

func _PonSim_GetDeviceInfo_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(empty.Empty)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(PonSimServer).GetDeviceInfo(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/voltha.PonSim/GetDeviceInfo",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(PonSimServer).GetDeviceInfo(ctx, req.(*empty.Empty))
	}
	return interceptor(ctx, in, info, handler)
}

func _PonSim_UpdateFlowTable_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(FlowTable)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(PonSimServer).UpdateFlowTable(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/voltha.PonSim/UpdateFlowTable",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(PonSimServer).UpdateFlowTable(ctx, req.(*FlowTable))
	}
	return interceptor(ctx, in, info, handler)
}

func _PonSim_GetStats_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(empty.Empty)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(PonSimServer).GetStats(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/voltha.PonSim/GetStats",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(PonSimServer).GetStats(ctx, req.(*empty.Empty))
	}
	return interceptor(ctx, in, info, handler)
}

var _PonSim_serviceDesc = grpc.ServiceDesc{
	ServiceName: "voltha.PonSim",
	HandlerType: (*PonSimServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "SendFrame",
			Handler:    _PonSim_SendFrame_Handler,
		},
		{
			MethodName: "GetDeviceInfo",
			Handler:    _PonSim_GetDeviceInfo_Handler,
		},
		{
			MethodName: "UpdateFlowTable",
			Handler:    _PonSim_UpdateFlowTable_Handler,
		},
		{
			MethodName: "GetStats",
			Handler:    _PonSim_GetStats_Handler,
		},
	},
	Streams: []grpc.StreamDesc{
		{
			StreamName:    "ReceiveFrames",
			Handler:       _PonSim_ReceiveFrames_Handler,
			ServerStreams: true,
		},
	},
	Metadata: "voltha_protos/ponsim.proto",
}
