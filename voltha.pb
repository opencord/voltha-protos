
�,
google/protobuf/any.protogoogle.protobuf"6
Any
type_url (	RtypeUrl
value (RvalueBo
com.google.protobufBAnyProtoPZ%github.com/golang/protobuf/ptypes/any�GPB�Google.Protobuf.WellKnownTypesJ�+
 �
�
 2� Protocol Buffers - Google's data interchange format
 Copyright 2008 Google Inc.  All rights reserved.
 https://developers.google.com/protocol-buffers/

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are
 met:

     * Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
     * Redistributions in binary form must reproduce the above
 copyright notice, this list of conditions and the following disclaimer
 in the documentation and/or other materials provided with the
 distribution.
     * Neither the name of Google Inc. nor the names of its
 contributors may be used to endorse or promote products derived from
 this software without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


  

" ;
	
%" ;

# <
	
# <

$ ,
	
$ ,

% )
	
% )

& "
	

& "

' !
	
$' !
�
 y �� `Any` contains an arbitrary serialized protocol buffer message along with a
 URL that describes the type of the serialized message.

 Protobuf library provides support to pack/unpack Any values in the form
 of utility functions or additional generated methods of the Any type.

 Example 1: Pack and unpack a message in C++.

     Foo foo = ...;
     Any any;
     any.PackFrom(foo);
     ...
     if (any.UnpackTo(&foo)) {
       ...
     }

 Example 2: Pack and unpack a message in Java.

     Foo foo = ...;
     Any any = Any.pack(foo);
     ...
     if (any.is(Foo.class)) {
       foo = any.unpack(Foo.class);
     }

  Example 3: Pack and unpack a message in Python.

     foo = Foo(...)
     any = Any()
     any.Pack(foo)
     ...
     if any.Is(Foo.DESCRIPTOR):
       any.Unpack(foo)
       ...

  Example 4: Pack and unpack a message in Go

      foo := &pb.Foo{...}
      any, err := ptypes.MarshalAny(foo)
      ...
      foo := &pb.Foo{}
      if err := ptypes.UnmarshalAny(any, foo); err != nil {
        ...
      }

 The pack methods provided by protobuf library will by default use
 'type.googleapis.com/full.type.name' as the type URL and the unpack
 methods only use the fully qualified type name after the last '/'
 in the type URL, for example "foo.bar.com/x/y.z" will yield type
 name "y.z".


 JSON
 ====
 The JSON representation of an `Any` value uses the regular
 representation of the deserialized, embedded message, with an
 additional field `@type` which contains the type URL. Example:

     package google.profile;
     message Person {
       string first_name = 1;
       string last_name = 2;
     }

     {
       "@type": "type.googleapis.com/google.profile.Person",
       "firstName": <string>,
       "lastName": <string>
     }

 If the embedded message type is well-known and has a custom JSON
 representation, that representation will be embedded adding a field
 `value` which holds the custom JSON in addition to the `@type`
 field. Example (for message [google.protobuf.Duration][]):

     {
       "@type": "type.googleapis.com/google.protobuf.Duration",
       "value": "1.212s"
     }




 y
�

  ��
 A URL/resource name that uniquely identifies the type of the serialized
 protocol buffer message. This string must contain at least
 one "/" character. The last segment of the URL's path must represent
 the fully qualified name of the type (as in
 `path/google.protobuf.Duration`). The name should be in a canonical form
 (e.g., leading "." is not accepted).

 In practice, teams usually precompile into the binary all types that they
 expect it to use in the context of Any. However, for URLs which use the
 scheme `http`, `https`, or no scheme, one can optionally set up a type
 server that maps type URLs to message definitions as follows:

 * If no scheme is provided, `https` is assumed.
 * An HTTP GET on the URL must yield a [google.protobuf.Type][]
   value in binary format, or produce an error.
 * Applications are allowed to cache lookup results based on the
   URL, or have them precompiled into a binary to avoid any
   lookup. Therefore, binary compatibility needs to be preserved
   on changes to types. (Use versioned type names to manage
   breaking changes.)

 Note: this functionality is not currently available in the official
 protobuf release, and it is not used for type URLs beginning with
 type.googleapis.com.

 Schemes other than `http`, `https` (or the empty scheme) might be
 used with implementation specific semantics.



  �y

  �

  �	

  �
W
 �I Must be a valid serialized protocol buffer of the above specified type.


 ��

 �

 �

 �bproto3
�
voltha_protos/adapter.protoadaptergoogle/protobuf/any.proto"R
AdapterConfigA
additional_config@ (2.google.protobuf.AnyRadditionalConfig"�
Adapter
id (	Rid
vendor (	Rvendor
version (	Rversion.
config (2.adapter.AdapterConfigRconfigK
additional_description@ (2.google.protobuf.AnyRadditionalDescription,
logical_device_ids (	RlogicalDeviceIds-
last_communication (RlastCommunication&
currentReplica (RcurrentReplica$
totalReplicas (RtotalReplicas
endpoint (	Rendpoint
type	 (	Rtype"2
Adapters&
items (2.adapter.AdapterRitemsB\
org.opencord.voltha.adapterBVolthaAdapterZ.github.com/opencord/voltha-protos/v5/go/volthaJ�
  0

  

 E
	
 E

 4
	
 4

 .
	
 .

 
	
  #


 
 


 

@
  /3 Custom (vendor-specific) configuration attributes


  


  

  )

  ,.
'
 , Adapter (software plugin)




^
 Q the adapter ID has to be unique,
 it will be generated as Type + CurrentReplica


 

 


 

 






















$
 Adapter configuration









:
4- Custom descriptors and custom configuration






.

13
&
 +" Logical devices "owned"


 

 

 &

 )*
I
#!< timestamp when the adapter last sent a message to the core


# +

#	

#


# 

%

%#!

%	

%


%

&

&%

&	

&


&

	'

	'&

	'


	'

	'
w

*j all replicas of the same adapter will have the same type
 it is used to associate a device to an adapter



*'


*



*


*


. 0


.

 /

 /

 /

 /

 /bproto3
�
google/protobuf/empty.protogoogle.protobuf"
EmptyBv
com.google.protobufB
EmptyProtoPZ'github.com/golang/protobuf/ptypes/empty��GPB�Google.Protobuf.WellKnownTypesJ�
 3
�
 2� Protocol Buffers - Google's data interchange format
 Copyright 2008 Google Inc.  All rights reserved.
 https://developers.google.com/protocol-buffers/

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are
 met:

     * Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
     * Redistributions in binary form must reproduce the above
 copyright notice, this list of conditions and the following disclaimer
 in the documentation and/or other materials provided with the
 distribution.
     * Neither the name of Google Inc. nor the names of its
 contributors may be used to endorse or promote products derived from
 this software without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


  

" ;
	
%" ;

# >
	
# >

$ ,
	
$ ,

% +
	
% +

& "
	

& "

' !
	
$' !

( 
	
( 
�
 3 � A generic empty message that you can re-use to avoid defining duplicated
 empty messages in your APIs. A typical example is to use it as the request
 or the response type of an API method. For instance:

     service Foo {
       rpc Bar(google.protobuf.Empty) returns (google.protobuf.Empty);
     }

 The JSON representation for `Empty` is empty JSON object `{}`.



 3bproto3
�!
voltha_protos/common.protocommon"
Key
key (	Rkey"
ID
id (	Rid"'
IDs 
items (2
.common.IDRitems"z

Connection
endpoint (	Rendpoint 
contextInfo (	RcontextInfo.
keep_alive_interval (RkeepAliveInterval"h

AdminState"Z
Types
UNKNOWN 
PREPROVISIONED
ENABLED
DISABLED
DOWNLOADING_IMAGE"�

OperStatus"�
Types
UNKNOWN 

DISCOVERED

ACTIVATING
TESTING

ACTIVE

FAILED
RECONCILING
RECONCILING_FAILED
REBOOTED"E
ConnectStatus"4
Types
UNKNOWN 
UNREACHABLE
	REACHABLE"�
OperationResp=
code (2).common.OperationResp.OperationReturnCodeRcode'
additional_info (	RadditionalInfo"y
OperationReturnCode
OPERATION_SUCCESS 
OPERATION_FAILURE
OPERATION_UNSUPPORTED
OPERATION_IN_PROGRESS*
TestModeKeys
api_test BE
org.opencord.volthaZ.github.com/opencord/voltha-protos/v5/go/commonJ�
  y

  

 E
	
 E

 

 ,
	
 ,
$
 	  Full path for KV store



 	

  


  
	

  



  


  

*
  Convey a resource identifier






 

 

 


 

 
&
  Represents a list of IDs





 

 

 

 

 


  


 

  

  

  


 %



;
 . endpoint is the endpoint sending the request


 

 


 

 
G
 : contextInfo represents additional contextual information


 

 


 

 

$"r keep_alive_interval is used to indicate to the remote endpoint how often it 
 will get a keep alive notification


$ 

$	

$


$ !


' ;


'
$
 ): Administrative State


 )	
B
  ,3 The administrative state of the device is unknown


  ,

  ,
S
 /D The device is pre-provisioned into Voltha, but not contacted by it


 /

 /
C
 24 The device is enabled for activation and operation


 2

 2
�
 6 The device is disabled and shall not perform its intended forwarding
 functions other than being available for re-activation.


 6

 6
=
 9. The device is in the state of image download


 9

 9


= \


=
"
 ?[ Operational Status


 ?	
B
  B3 The status of the device is unknown at this point


  B

  B
F
 E7 The device has been discovered, but not yet activated


 E

 E
Q
 HB The device is being activated (booted, rebooted, upgraded, etc.)


 H

 H
<
 K- Service impacting tests are being conducted


 K

 K
,
 N The device is up and active


 N

 N
K
 Q< The device has failed and cannot fulfill its intended role


 Q

 Q
*
 T The device is reconciling


 T

 T
4
 W% The device is in reconciling failed


 W

 W
(
 Z The device has rebooted


 Z

 Z


^ k


^
#
 `j Connectivity Status


 `	
:
  c+ The device connectivity status is unknown


  c

  c
7
 f( The device cannot be reached by Voltha


 f

 f
F
 i7 There is live communication between device and Voltha


 i

 i


m y


m

 ns

 n	

  o

  o

  o

 p

 p

 p

 q"

 q

 q !

 r"

 r

 r !

 u! Return code


 us

 u

 u

 u 

x Additional Info


xu!

x


x

xbproto3
�y
google/api/http.proto
google.api"y
Http*
rules (2.google.api.HttpRuleRrulesE
fully_decode_reserved_expansion (RfullyDecodeReservedExpansion"�
HttpRule
selector (	Rselector
get (	H Rget
put (	H Rput
post (	H Rpost
delete (	H Rdelete
patch (	H Rpatch7
custom (2.google.api.CustomHttpPatternH Rcustom
body (	Rbody#
response_body (	RresponseBodyE
additional_bindings (2.google.api.HttpRuleRadditionalBindingsB	
pattern";
CustomHttpPattern
kind (	Rkind
path (	RpathBj
com.google.apiB	HttpProtoPZAgoogle.golang.org/genproto/googleapis/api/annotations;annotations��GAPIJ�t
 �
�
 2� Copyright 2018 Google LLC.

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.



 

 
	
 

 X
	
 X

 "
	

 "

 *
	
 *

 '
	
 '

 "
	
$ "
�
  *� Defines the HTTP configuration for an API service. It contains a list of
 [HttpRule][google.api.HttpRule], each specifying the mapping of an RPC method
 to one or more HTTP REST API methods.



 
�
  !� A list of HTTP configuration rules that apply to individual API methods.

 **NOTE:** All service configuration rules follow "last one wins" order.


  !


  !

  !

  !
�
 )+� When set to true, URL path parmeters will be fully URI-decoded except in
 cases of single segment matches in reserved expansion, where "%2F" will be
 left encoded.

 The default behavior is to not decode RFC 6570 reserved characters in multi
 segment matches.


 )!

 )

 )&

 ))*
�S
� ��S # gRPC Transcoding

 gRPC Transcoding is a feature for mapping between a gRPC method and one or
 more HTTP REST endpoints. It allows developers to build a single API service
 that supports both gRPC APIs and REST APIs. Many systems, including [Google
 APIs](https://github.com/googleapis/googleapis),
 [Cloud Endpoints](https://cloud.google.com/endpoints), [gRPC
 Gateway](https://github.com/grpc-ecosystem/grpc-gateway),
 and [Envoy](https://github.com/envoyproxy/envoy) proxy support this feature
 and use it for large scale production services.

 `HttpRule` defines the schema of the gRPC/REST mapping. The mapping specifies
 how different portions of the gRPC request message are mapped to the URL
 path, URL query parameters, and HTTP request body. It also controls how the
 gRPC response message is mapped to the HTTP response body. `HttpRule` is
 typically specified as an `google.api.http` annotation on the gRPC method.

 Each mapping specifies a URL path template and an HTTP method. The path
 template may refer to one or more fields in the gRPC request message, as long
 as each field is a non-repeated field with a primitive (non-message) type.
 The path template controls how fields of the request message are mapped to
 the URL path.

 Example:

     service Messaging {
       rpc GetMessage(GetMessageRequest) returns (Message) {
         option (google.api.http) = {
             get: "/v1/{name=messages/*}"
         };
       }
     }
     message GetMessageRequest {
       string name = 1; // Mapped to URL path.
     }
     message Message {
       string text = 1; // The resource content.
     }

 This enables an HTTP REST to gRPC mapping as below:

 HTTP | gRPC
 -----|-----
 `GET /v1/messages/123456`  | `GetMessage(name: "messages/123456")`

 Any fields in the request message which are not bound by the path template
 automatically become HTTP query parameters if there is no HTTP request body.
 For example:

     service Messaging {
       rpc GetMessage(GetMessageRequest) returns (Message) {
         option (google.api.http) = {
             get:"/v1/messages/{message_id}"
         };
       }
     }
     message GetMessageRequest {
       message SubMessage {
         string subfield = 1;
       }
       string message_id = 1; // Mapped to URL path.
       int64 revision = 2;    // Mapped to URL query parameter `revision`.
       SubMessage sub = 3;    // Mapped to URL query parameter `sub.subfield`.
     }

 This enables a HTTP JSON to RPC mapping as below:

 HTTP | gRPC
 -----|-----
 `GET /v1/messages/123456?revision=2&sub.subfield=foo` |
 `GetMessage(message_id: "123456" revision: 2 sub: SubMessage(subfield:
 "foo"))`

 Note that fields which are mapped to URL query parameters must have a
 primitive type or a repeated primitive type or a non-repeated message type.
 In the case of a repeated type, the parameter can be repeated in the URL
 as `...?param=A&param=B`. In the case of a message type, each field of the
 message is mapped to a separate parameter, such as
 `...?foo.a=A&foo.b=B&foo.c=C`.

 For HTTP methods that allow a request body, the `body` field
 specifies the mapping. Consider a REST update method on the
 message resource collection:

     service Messaging {
       rpc UpdateMessage(UpdateMessageRequest) returns (Message) {
         option (google.api.http) = {
           patch: "/v1/messages/{message_id}"
           body: "message"
         };
       }
     }
     message UpdateMessageRequest {
       string message_id = 1; // mapped to the URL
       Message message = 2;   // mapped to the body
     }

 The following HTTP JSON to RPC mapping is enabled, where the
 representation of the JSON in the request body is determined by
 protos JSON encoding:

 HTTP | gRPC
 -----|-----
 `PATCH /v1/messages/123456 { "text": "Hi!" }` | `UpdateMessage(message_id:
 "123456" message { text: "Hi!" })`

 The special name `*` can be used in the body mapping to define that
 every field not bound by the path template should be mapped to the
 request body.  This enables the following alternative definition of
 the update method:

     service Messaging {
       rpc UpdateMessage(Message) returns (Message) {
         option (google.api.http) = {
           patch: "/v1/messages/{message_id}"
           body: "*"
         };
       }
     }
     message Message {
       string message_id = 1;
       string text = 2;
     }


 The following HTTP JSON to RPC mapping is enabled:

 HTTP | gRPC
 -----|-----
 `PATCH /v1/messages/123456 { "text": "Hi!" }` | `UpdateMessage(message_id:
 "123456" text: "Hi!")`

 Note that when using `*` in the body mapping, it is not possible to
 have HTTP parameters, as all fields not bound by the path end in
 the body. This makes this option more rarely used in practice when
 defining REST APIs. The common usage of `*` is in custom methods
 which don't use the URL at all for transferring data.

 It is possible to define multiple HTTP methods for one RPC by using
 the `additional_bindings` option. Example:

     service Messaging {
       rpc GetMessage(GetMessageRequest) returns (Message) {
         option (google.api.http) = {
           get: "/v1/messages/{message_id}"
           additional_bindings {
             get: "/v1/users/{user_id}/messages/{message_id}"
           }
         };
       }
     }
     message GetMessageRequest {
       string message_id = 1;
       string user_id = 2;
     }

 This enables the following two alternative HTTP JSON to RPC mappings:

 HTTP | gRPC
 -----|-----
 `GET /v1/messages/123456` | `GetMessage(message_id: "123456")`
 `GET /v1/users/me/messages/123456` | `GetMessage(user_id: "me" message_id:
 "123456")`

 ## Rules for HTTP mapping

 1. Leaf request fields (recursive expansion nested messages in the request
    message) are classified into three categories:
    - Fields referred by the path template. They are passed via the URL path.
    - Fields referred by the [HttpRule.body][google.api.HttpRule.body]. They
    are passed via the HTTP
      request body.
    - All other fields are passed via the URL query parameters, and the
      parameter name is the field path in the request message. A repeated
      field can be represented as multiple query parameters under the same
      name.
  2. If [HttpRule.body][google.api.HttpRule.body] is "*", there is no URL
  query parameter, all fields
     are passed via URL path and HTTP request body.
  3. If [HttpRule.body][google.api.HttpRule.body] is omitted, there is no HTTP
  request body, all
     fields are passed via URL path and URL query parameters.

 ### Path template syntax

     Template = "/" Segments [ Verb ] ;
     Segments = Segment { "/" Segment } ;
     Segment  = "*" | "**" | LITERAL | Variable ;
     Variable = "{" FieldPath [ "=" Segments ] "}" ;
     FieldPath = IDENT { "." IDENT } ;
     Verb     = ":" LITERAL ;

 The syntax `*` matches a single URL path segment. The syntax `**` matches
 zero or more URL path segments, which must be the last part of the URL path
 except the `Verb`.

 The syntax `Variable` matches part of the URL path as specified by its
 template. A variable template must not contain other variables. If a variable
 matches a single path segment, its template may be omitted, e.g. `{var}`
 is equivalent to `{var=*}`.

 The syntax `LITERAL` matches literal text in the URL path. If the `LITERAL`
 contains any reserved character, such characters should be percent-encoded
 before the matching.

 If a variable contains exactly one path segment, such as `"{var}"` or
 `"{var=*}"`, when such a variable is expanded into a URL path on the client
 side, all characters except `[-_.~0-9a-zA-Z]` are percent-encoded. The
 server side does the reverse decoding. Such variables show up in the
 [Discovery
 Document](https://developers.google.com/discovery/v1/reference/apis) as
 `{var}`.

 If a variable contains multiple path segments, such as `"{var=foo/*}"`
 or `"{var=**}"`, when such a variable is expanded into a URL path on the
 client side, all characters except `[-_.~/0-9a-zA-Z]` are percent-encoded.
 The server side does the reverse decoding, except "%2F" and "%2f" are left
 unchanged. Such variables show up in the
 [Discovery
 Document](https://developers.google.com/discovery/v1/reference/apis) as
 `{+var}`.

 ## Using gRPC API Service Configuration

 gRPC API Service Configuration (service config) is a configuration language
 for configuring a gRPC service to become a user-facing product. The
 service config is simply the YAML representation of the `google.api.Service`
 proto message.

 As an alternative to annotating your proto file, you can configure gRPC
 transcoding in your service config YAML files. You do this by specifying a
 `HttpRule` that maps the gRPC method to a REST endpoint, achieving the same
 effect as the proto annotation. This can be particularly useful if you
 have a proto that is reused in multiple services. Note that any transcoding
 specified in the service config will override any matching transcoding
 configuration in the proto.

 Example:

     http:
       rules:
         # Selects a gRPC method and applies HttpRule to it.
         - selector: example.v1.Messaging.GetMessage
           get: /v1/messages/{message_id}/{sub.subfield}

 ## Special notes

 When gRPC Transcoding is used to map a gRPC to JSON REST endpoints, the
 proto to JSON conversion must follow the [proto3
 specification](https://developers.google.com/protocol-buffers/docs/proto3#json).

 While the single segment variable follows the semantics of
 [RFC 6570](https://tools.ietf.org/html/rfc6570) Section 3.2.2 Simple String
 Expansion, the multi segment variable **does not** follow RFC 6570 Section
 3.2.3 Reserved Expansion. The reason is that the Reserved Expansion
 does not expand special characters like `?` and `#`, which would lead
 to invalid URLs. As the result, gRPC Transcoding uses a custom encoding
 for multi segment variables.

 The path variables **must not** refer to any repeated or mapped field,
 because client libraries are not capable of handling such variable expansion.

 The path variables **must not** capture the leading "/" character. The reason
 is that the most common use case "{var}" does not capture the leading "/"
 character. For consistency, all path variables must share the same behavior.

 Repeated message fields must not be mapped to URL query parameters, because
 no client library can support such complicated mapping.

 If an API needs to use a JSON array for request or response body, it can map
 the request or response body to a repeated field. However, some gRPC
 Transcoding implementations may not support this feature.


�
�
 �� Selects a method to which this rule applies.

 Refer to [selector][google.api.DocumentationRule.selector] for syntax
 details.


 ��

 �

 �	

 �
�
 ��� Determines the URL pattern is matched by this rules. This pattern can be
 used with any of the {get|put|post|delete|patch} methods. A custom method
 can be defined using the 'custom' field.


 �
\
�N Maps to HTTP GET. Used for listing and getting information about
 resources.


�


�

�
@
�2 Maps to HTTP PUT. Used for replacing a resource.


�


�

�
X
�J Maps to HTTP POST. Used for creating a resource or performing an action.


�


�

�
B
�4 Maps to HTTP DELETE. Used for deleting a resource.


�


�

�
A
�3 Maps to HTTP PATCH. Used for updating a resource.


�


�

�
�
�!� The custom pattern is used for specifying an HTTP method that is not
 included in the `pattern` field, such as HEAD, or "*" to leave the
 HTTP method unspecified for this rule. The wild-card rule is useful
 for services that provide content to Web (HTML) clients.


�

�

� 
�
�� The name of the request field whose value is mapped to the HTTP request
 body, or `*` for mapping all request fields not captured by the path
 pattern to the HTTP body, or omitted for not having any HTTP request body.

 NOTE: the referred field must be present at the top-level of the request
 message type.


��

�

�	

�
�
�� Optional. The name of the response field whose value is mapped to the HTTP
 response body. When omitted, the entire response message will be used
 as the HTTP response body.

 NOTE: The referred field must be present at the top-level of the response
 message type.


��

�

�	

�
�
	�-� Additional HTTP bindings for the selector. Nested bindings must
 not contain an `additional_bindings` field themselves (that is,
 the nesting may only be one level deep).


	�


	�

	�'

	�*,
G
� �9 A custom pattern is used for defining custom HTTP verb.


�
2
 �$ The name of this custom HTTP verb.


 ��

 �

 �	

 �
5
�' The path matched by this custom verb.


��

�

�	

�bproto3
��
 google/protobuf/descriptor.protogoogle.protobuf"M
FileDescriptorSet8
file (2$.google.protobuf.FileDescriptorProtoRfile"�
FileDescriptorProto
name (	Rname
package (	Rpackage

dependency (	R
dependency+
public_dependency
 (RpublicDependency'
weak_dependency (RweakDependencyC
message_type (2 .google.protobuf.DescriptorProtoRmessageTypeA
	enum_type (2$.google.protobuf.EnumDescriptorProtoRenumTypeA
service (2'.google.protobuf.ServiceDescriptorProtoRserviceC
	extension (2%.google.protobuf.FieldDescriptorProtoR	extension6
options (2.google.protobuf.FileOptionsRoptionsI
source_code_info	 (2.google.protobuf.SourceCodeInfoRsourceCodeInfo
syntax (	Rsyntax"�
DescriptorProto
name (	Rname;
field (2%.google.protobuf.FieldDescriptorProtoRfieldC
	extension (2%.google.protobuf.FieldDescriptorProtoR	extensionA
nested_type (2 .google.protobuf.DescriptorProtoR
nestedTypeA
	enum_type (2$.google.protobuf.EnumDescriptorProtoRenumTypeX
extension_range (2/.google.protobuf.DescriptorProto.ExtensionRangeRextensionRangeD

oneof_decl (2%.google.protobuf.OneofDescriptorProtoR	oneofDecl9
options (2.google.protobuf.MessageOptionsRoptionsU
reserved_range	 (2..google.protobuf.DescriptorProto.ReservedRangeRreservedRange#
reserved_name
 (	RreservedNamez
ExtensionRange
start (Rstart
end (Rend@
options (2&.google.protobuf.ExtensionRangeOptionsRoptions7
ReservedRange
start (Rstart
end (Rend"|
ExtensionRangeOptionsX
uninterpreted_option� (2$.google.protobuf.UninterpretedOptionRuninterpretedOption*	�����"�
FieldDescriptorProto
name (	Rname
number (RnumberA
label (2+.google.protobuf.FieldDescriptorProto.LabelRlabel>
type (2*.google.protobuf.FieldDescriptorProto.TypeRtype
	type_name (	RtypeName
extendee (	Rextendee#
default_value (	RdefaultValue
oneof_index	 (R
oneofIndex
	json_name
 (	RjsonName7
options (2.google.protobuf.FieldOptionsRoptions"�
Type
TYPE_DOUBLE

TYPE_FLOAT

TYPE_INT64
TYPE_UINT64

TYPE_INT32
TYPE_FIXED64
TYPE_FIXED32
	TYPE_BOOL
TYPE_STRING	

TYPE_GROUP

TYPE_MESSAGE

TYPE_BYTES
TYPE_UINT32
	TYPE_ENUM
TYPE_SFIXED32
TYPE_SFIXED64
TYPE_SINT32
TYPE_SINT64"C
Label
LABEL_OPTIONAL
LABEL_REQUIRED
LABEL_REPEATED"c
OneofDescriptorProto
name (	Rname7
options (2.google.protobuf.OneofOptionsRoptions"�
EnumDescriptorProto
name (	Rname?
value (2).google.protobuf.EnumValueDescriptorProtoRvalue6
options (2.google.protobuf.EnumOptionsRoptions]
reserved_range (26.google.protobuf.EnumDescriptorProto.EnumReservedRangeRreservedRange#
reserved_name (	RreservedName;
EnumReservedRange
start (Rstart
end (Rend"�
EnumValueDescriptorProto
name (	Rname
number (Rnumber;
options (2!.google.protobuf.EnumValueOptionsRoptions"�
ServiceDescriptorProto
name (	Rname>
method (2&.google.protobuf.MethodDescriptorProtoRmethod9
options (2.google.protobuf.ServiceOptionsRoptions"�
MethodDescriptorProto
name (	Rname

input_type (	R	inputType
output_type (	R
outputType8
options (2.google.protobuf.MethodOptionsRoptions0
client_streaming (:falseRclientStreaming0
server_streaming (:falseRserverStreaming"�	
FileOptions!
java_package (	RjavaPackage0
java_outer_classname (	RjavaOuterClassname5
java_multiple_files
 (:falseRjavaMultipleFilesD
java_generate_equals_and_hash (BRjavaGenerateEqualsAndHash:
java_string_check_utf8 (:falseRjavaStringCheckUtf8S
optimize_for	 (2).google.protobuf.FileOptions.OptimizeMode:SPEEDRoptimizeFor

go_package (	R	goPackage5
cc_generic_services (:falseRccGenericServices9
java_generic_services (:falseRjavaGenericServices5
py_generic_services (:falseRpyGenericServices7
php_generic_services* (:falseRphpGenericServices%

deprecated (:falseR
deprecated/
cc_enable_arenas (:falseRccEnableArenas*
objc_class_prefix$ (	RobjcClassPrefix)
csharp_namespace% (	RcsharpNamespace!
swift_prefix' (	RswiftPrefix(
php_class_prefix( (	RphpClassPrefix#
php_namespace) (	RphpNamespace4
php_metadata_namespace, (	RphpMetadataNamespace!
ruby_package- (	RrubyPackageX
uninterpreted_option� (2$.google.protobuf.UninterpretedOptionRuninterpretedOption":
OptimizeMode	
SPEED
	CODE_SIZE
LITE_RUNTIME*	�����J&'"�
MessageOptions<
message_set_wire_format (:falseRmessageSetWireFormatL
no_standard_descriptor_accessor (:falseRnoStandardDescriptorAccessor%

deprecated (:falseR
deprecated
	map_entry (RmapEntryX
uninterpreted_option� (2$.google.protobuf.UninterpretedOptionRuninterpretedOption*	�����J	J	
"�
FieldOptionsA
ctype (2#.google.protobuf.FieldOptions.CType:STRINGRctype
packed (RpackedG
jstype (2$.google.protobuf.FieldOptions.JSType:	JS_NORMALRjstype
lazy (:falseRlazy%

deprecated (:falseR
deprecated
weak
 (:falseRweakX
uninterpreted_option� (2$.google.protobuf.UninterpretedOptionRuninterpretedOption"/
CType

STRING 
CORD
STRING_PIECE"5
JSType
	JS_NORMAL 
	JS_STRING
	JS_NUMBER*	�����J"s
OneofOptionsX
uninterpreted_option� (2$.google.protobuf.UninterpretedOptionRuninterpretedOption*	�����"�
EnumOptions
allow_alias (R
allowAlias%

deprecated (:falseR
deprecatedX
uninterpreted_option� (2$.google.protobuf.UninterpretedOptionRuninterpretedOption*	�����J"�
EnumValueOptions%

deprecated (:falseR
deprecatedX
uninterpreted_option� (2$.google.protobuf.UninterpretedOptionRuninterpretedOption*	�����"�
ServiceOptions%

deprecated! (:falseR
deprecatedX
uninterpreted_option� (2$.google.protobuf.UninterpretedOptionRuninterpretedOption*	�����"�
MethodOptions%

deprecated! (:falseR
deprecatedq
idempotency_level" (2/.google.protobuf.MethodOptions.IdempotencyLevel:IDEMPOTENCY_UNKNOWNRidempotencyLevelX
uninterpreted_option� (2$.google.protobuf.UninterpretedOptionRuninterpretedOption"P
IdempotencyLevel
IDEMPOTENCY_UNKNOWN 
NO_SIDE_EFFECTS

IDEMPOTENT*	�����"�
UninterpretedOptionA
name (2-.google.protobuf.UninterpretedOption.NamePartRname)
identifier_value (	RidentifierValue,
positive_int_value (RpositiveIntValue,
negative_int_value (RnegativeIntValue!
double_value (RdoubleValue!
string_value (RstringValue'
aggregate_value (	RaggregateValueJ
NamePart
	name_part (	RnamePart!
is_extension (RisExtension"�
SourceCodeInfoD
location (2(.google.protobuf.SourceCodeInfo.LocationRlocation�
Location
path (BRpath
span (BRspan)
leading_comments (	RleadingComments+
trailing_comments (	RtrailingComments:
leading_detached_comments (	RleadingDetachedComments"�
GeneratedCodeInfoM

annotation (2-.google.protobuf.GeneratedCodeInfo.AnnotationR
annotationm

Annotation
path (BRpath
source_file (	R
sourceFile
begin (Rbegin
end (RendB�
com.google.protobufBDescriptorProtosHZ>github.com/golang/protobuf/protoc-gen-go/descriptor;descriptor��GPB�Google.Protobuf.ReflectionJ��
' �
�
' 2� Protocol Buffers - Google's data interchange format
 Copyright 2008 Google Inc.  All rights reserved.
 https://developers.google.com/protocol-buffers/

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are
 met:

     * Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
     * Redistributions in binary form must reproduce the above
 copyright notice, this list of conditions and the following disclaimer
 in the documentation and/or other materials provided with the
 distribution.
     * Neither the name of Google Inc. nor the names of its
 contributors may be used to endorse or promote products derived from
 this software without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
2� Author: kenton@google.com (Kenton Varda)
  Based on original Protocol Buffers design by
  Sanjay Ghemawat, Jeff Dean, and others.

 The messages in this file describe the definitions found in .proto files.
 A valid .proto file can be translated directly to a FileDescriptorProto
 without any other information (e.g. without reading its imports).


) 

* U
	
* U

+ ,
	
+ ,

, 1
	
, 1

- 7
	
%- 7

. !
	
$. !

/ 
	
/ 

3 

	3 t descriptor.proto must be optimized for speed because reflection-based
 algorithms don't work during bootstrapping.

j
 7 9^ The protocol compiler can output a FileDescriptorSet containing the .proto
 files it parses.



 7

  8(

  8


  8

  8#

  8&'
/
< Y# Describes a complete .proto file.



<
9
 =", file name, relative to root of source tree


 =


 =

 =

 =
*
>" e.g. "foo", "foo.bar", etc.


>


>

>

>
4
A!' Names of files imported by this file.


A


A

A

A 
Q
C(D Indexes of the public imported files in the dependency list above.


C


C

C"

C%'
z
F&m Indexes of the weak imported files in the dependency list.
 For Google-internal migration only. Do not use.


F


F

F 

F#%
6
I,) All top-level definitions in this file.


I


I

I'

I*+

J-

J


J

J(

J+,

K.

K


K!

K")

K,-

L.

L


L

L )

L,-

	N#

	N


	N

	N

	N!"
�

T/� This field contains optional information about the original source code.
 You may safely remove this entire field without harming runtime
 functionality of the descriptors -- the information is needed only by
 development tools.



T



T


T*


T-.
]
XP The syntax of the proto file.
 The supported values are "proto2" and "proto3".


X


X

X

X
'
\ | Describes a message type.



\

 ]

 ]


 ]

 ]

 ]

_*

_


_

_ %

_()

`.

`


`

` )

`,-

b+

b


b

b&

b)*

c-

c


c

c(

c+,

 ej

 e


  f

  f

  f

  f

  f

 g

 g

 g

 g

 g

 i/

 i

 i"

 i#*

 i-.

k.

k


k

k)

k,-

m/

m


m

m *

m-.

o&

o


o

o!

o$%
�
tw� Range of reserved tag numbers. Reserved tag numbers may not be used by
 fields or extension ranges in the same message. Reserved ranges may
 not overlap.


t


 u" Inclusive.


 u

 u

 u

 u

v" Exclusive.


v

v

v

v

x,

x


x

x'

x*+
�
	{%u Reserved field names, which may not be used by fields in the same message.
 A given name may only be reserved once.


	{


	{

	{

	{"$

~ �


~
O
 �:A The parser stores options it doesn't recognize here. See above.


 �


 �

 �3

 �69
Z
�M Clients can define custom options in extensions of this message. See above.


 �

 �

 �
3
� �% Describes a field within a message.


�

 ��

 �
S
  �C 0 is reserved for errors.
 Order is weird for historical reasons.


  �

  �

 �

 �

 �
w
 �g Not ZigZag encoded.  Negative numbers take 10 bytes.  Use TYPE_SINT64 if
 negative values are likely.


 �

 �

 �

 �

 �
w
 �g Not ZigZag encoded.  Negative numbers take 10 bytes.  Use TYPE_SINT32 if
 negative values are likely.


 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �
�
 	�� Tag-delimited aggregate.
 Group type is deprecated and not supported in proto3. However, Proto3
 implementations should still be able to parse the group wire format and
 treat group fields as unknown fields.


 	�

 	�
-
 
�" Length-delimited aggregate.


 
�

 
�
#
 � New in version 2.


 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �
'
 �" Uses ZigZag encoding.


 �

 �
'
 �" Uses ZigZag encoding.


 �

 �

��

�
*
 � 0 is reserved for errors


 �

 �

�

�

�

�

�

�

 �

 �


 �

 �

 �

�

�


�

�

�

�

�


�

�

�
�
�� If type_name is set, this need not be set.  If both this and type_name
 are set, this must be one of TYPE_ENUM, TYPE_MESSAGE or TYPE_GROUP.


�


�

�

�
�
� � For message and enum types, this is the name of the type.  If the name
 starts with a '.', it is fully-qualified.  Otherwise, C++-like scoping
 rules are used to find the type (i.e. first the nested types within this
 message are searched, then within the parent, on up to the root
 namespace).


�


�

�

�
~
�p For extensions, this is the name of the type being extended.  It is
 resolved in the same manner as type_name.


�


�

�

�
�
�$� For numeric types, contains the original text representation of the value.
 For booleans, "true" or "false".
 For strings, contains the default text contents (not escaped in any way).
 For bytes, contains the C escaped value.  All bytes >= 128 are escaped.
 TODO(kenton):  Base-64 encode?


�


�

�

�"#
�
�!v If set, gives the index of a oneof in the containing type's oneof_decl
 list.  This field is a member of that oneof.


�


�

�

� 
�
�!� JSON name of this field. The value is set by protocol compiler. If the
 user has set a "json_name" option on this field, that option's value
 will be used. Otherwise, it's deduced from the field's name by converting
 it to camelCase.


�


�

�

� 

	�$

	�


	�

	�

	�"#
"
� � Describes a oneof.


�

 �

 �


 �

 �

 �

�$

�


�

�

�"#
'
� � Describes an enum type.


�

 �

 �


 �

 �

 �

�.

�


�#

�$)

�,-

�#

�


�

�

�!"
�
 ��� Range of reserved numeric values. Reserved values may not be used by
 entries in the same enum. Reserved ranges may not overlap.

 Note that this is distinct from DescriptorProto.ReservedRange in that it
 is inclusive such that it can appropriately represent the entire int32
 domain.


 �


  �" Inclusive.


  �

  �

  �

  �

 �" Inclusive.


 �

 �

 �

 �
�
�0� Range of reserved numeric values. Reserved numeric values may not be used
 by enum values in the same enum declaration. Reserved ranges may not
 overlap.


�


�

�+

�./
l
�$^ Reserved enum value names, which may not be reused. A given name may only
 be reserved once.


�


�

�

�"#
1
� �# Describes a value within an enum.


� 

 �

 �


 �

 �

 �

�

�


�

�

�

�(

�


�

�#

�&'
$
� � Describes a service.


�

 �

 �


 �

 �

 �

�,

�


� 

�!'

�*+

�&

�


�

�!

�$%
0
	� �" Describes a method of a service.


	�

	 �

	 �


	 �

	 �

	 �
�
	�!� Input and output type names.  These are resolved in the same way as
 FieldDescriptorProto.type_name, but must refer to a message type.


	�


	�

	�

	� 

	�"

	�


	�

	�

	� !

	�%

	�


	�

	� 

	�#$
E
	�57 Identifies if client streams multiple client messages


	�


	�

	� 

	�#$

	�%4

	�.3
E
	�57 Identifies if server streams multiple server messages


	�


	�

	� 

	�#$

	�%4

	�.3
�

� �2N ===================================================================
 Options
2� Each of the definitions above may have "options" attached.  These are
 just annotations which may cause code to be generated slightly differently
 or may contain hints for code that manipulates protocol messages.

 Clients may define custom options as extensions of the *Options messages.
 These extensions may not yet be known at parsing time, so the parser cannot
 store the values in them.  Instead it stores them in a field in the *Options
 message called uninterpreted_option. This field must have the same name
 across all *Options messages. We then use this field to populate the
 extensions when we build a descriptor, at which point all protos have been
 parsed and so all extensions are known.

 Extension numbers for custom options may be chosen as follows:
 * For options which will only be used within a single application or
   organization, or for experimental options, use field numbers 50000
   through 99999.  It is up to you to ensure that you do not use the
   same number for multiple options.
 * For options which will be published and used publicly by multiple
   independent entities, e-mail protobuf-global-extension-registry@google.com
   to reserve extension numbers. Simply provide your project name (e.g.
   Objective-C plugin) and your project website (if available) -- there's no
   need to explain how you intend to use them. Usually you only need one
   extension number. You can declare multiple options with only one extension
   number by putting them in a sub-message. See the Custom Options section of
   the docs for examples:
   https://developers.google.com/protocol-buffers/docs/proto#options
   If this turns out to be popular, a web service will be set up
   to automatically assign option numbers.



�
�

 �#� Sets the Java package where classes generated from this .proto will be
 placed.  By default, the proto package is used, but this is often
 inappropriate because proto packages do not normally start with backwards
 domain names.



 �



 �


 �


 �!"
�

�+� If set, all the classes from the .proto file are wrapped in a single
 outer class with the given name.  This applies to both Proto1
 (equivalent to the old "--one_java_file" option) and Proto2 (where
 a .proto always translates to a single class, but you may want to
 explicitly choose the class name).



�



�


�&


�)*
�

�9� If set true, then the Java code generator will generate a separate .java
 file for each top-level message, enum, and service defined in the .proto
 file.  Thus, these types will *not* be nested inside the outer class
 named by java_outer_classname.  However, the outer class will still be
 generated to contain the file's getDescriptor() method as well as any
 top-level extensions defined in the file.



�



�


�#


�&(


�)8


�27
)

�E This option does nothing.



�



�


�-


�02


�3D


�4C
�

�<� If set true, then the Java2 code generator will generate code that
 throws an exception whenever an attempt is made to assign a non-UTF-8
 byte sequence to a string field.
 Message reflection will do the same.
 However, an extension field still accepts non-UTF-8 byte sequences.
 This option has no effect on when used with the lite runtime.



�



�


�&


�)+


�,;


�5:
L

 ��< Generated classes can be optimized for speed or code size.



 �
D

  �"4 Generate complete code for parsing, serialization,



  �	


  �
G

 � etc.
"/ Use ReflectionOps to implement these methods.



 �


 �
G

 �"7 Generate code using MessageLite and the lite runtime.



 �


 �


�9


�



�


�$


�'(


�)8


�27
�

�"� Sets the Go package where structs generated from this .proto will be
 placed. If omitted, the Go package will be derived from the following:
   - The basename of the package import path, if provided.
   - Otherwise, the package statement in the .proto file, if present.
   - Otherwise, the basename of the .proto file, without extension.



�



�


�


�!
�

�9� Should generic services be generated in each language?  "Generic" services
 are not specific to any particular RPC system.  They are generated by the
 main code generators in each language (without additional plugins).
 Generic services were the only kind of service generation supported by
 early versions of google.protobuf.

 Generic services are now considered deprecated in favor of using plugins
 that generate code specific to your particular RPC system.  Therefore,
 these default to false.  Old code which depends on generic services should
 explicitly set them to true.



�



�


�#


�&(


�)8


�27


�;


�



�


�%


�(*


�+:


�49


	�9


	�



	�


	�#


	�&(


	�)8


	�27



�:



�




�



�$



�')



�*9



�38
�

�0� Is this file deprecated?
 Depending on the target platform, this can emit Deprecated annotations
 for everything in the file, or it will be completely ignored; in the very
 least, this is a formalization for deprecating files.



�



�


�


�


� /


�).


�6q Enables the use of arenas for the proto messages in this file. This applies
 only to generated classes for C++.



�



�


� 


�#%


�&5


�/4
�

�)� Sets the objective c class prefix which is prepended to all objective c
 generated classes from this .proto. There is no default.



�



�


�#


�&(
I

�(; Namespace for generated classes; defaults to the package.



�



�


�"


�%'
�

�$� By default Swift generators will take the proto package and CamelCase it
 replacing '.' with underscore and use that to prefix the types/symbols
 defined. When this options is provided, they will use this value instead
 to prefix the types/symbols defined.



�



�


�


�!#
~

�(p Sets the php class prefix which is prepended to all php generated classes
 from this .proto. Default is empty.



�



�


�"


�%'
�

�%� Use this option to change the namespace of php generated classes. Default
 is empty. When this option is empty, the package name will be used for
 determining the namespace.



�



�


�


�"$
�

�.� Use this option to change the namespace of php generated metadata classes.
 Default is empty. When this option is empty, the proto file name will be used
 for determining the namespace.



�



�


�(


�+-
�

�$� Use this option to change the package of ruby generated classes. Default
 is empty. When this option is not set, the package name will be used for
 determining the ruby package.



�



�


�


�!#
|

�:n The parser stores options it doesn't recognize here.
 See the documentation for the "Options" section above.



�



�


�3


�69
�

�z Clients can define custom options in extensions of this message.
 See the documentation for the "Options" section above.



 �


 �


 �


	�


	 �


	 �


	 �

� �

�
�
 �<� Set true to use the old proto1 MessageSet wire format for extensions.
 This is provided for backwards-compatibility with the MessageSet wire
 format.  You should not use this for any other reason:  It's less
 efficient, has fewer features, and is more complicated.

 The message must be defined exactly as follows:
   message Foo {
     option message_set_wire_format = true;
     extensions 4 to max;
   }
 Note that the message cannot have any defined fields; MessageSets only
 have extensions.

 All extensions of your type must be singular messages; e.g. they cannot
 be int32s, enums, or repeated messages.

 Because this is an option, the above two restrictions are not enforced by
 the protocol compiler.


 �


 �

 �'

 �*+

 �,;

 �5:
�
�D� Disables the generation of the standard "descriptor()" accessor, which can
 conflict with a field of the same name.  This is meant to make migration
 from proto1 easier; new code should avoid fields named "descriptor".


�


�

�/

�23

�4C

�=B
�
�/� Is this message deprecated?
 Depending on the target platform, this can emit Deprecated annotations
 for the message, or it will be completely ignored; in the very least,
 this is a formalization for deprecating messages.


�


�

�

�

�.

�(-
�
�� Whether the message is an automatically generated map entry type for the
 maps field.

 For maps fields:
     map<KeyType, ValueType> map_field = 1;
 The parsed descriptor looks like:
     message MapFieldEntry {
         option map_entry = true;
         optional KeyType key = 1;
         optional ValueType value = 2;
     }
     repeated MapFieldEntry map_field = 1;

 Implementations may choose not to generate the map_entry=true message, but
 use a native map in the target language to hold the keys and values.
 The reflection APIs in such implementions still need to work as
 if the field is a repeated message field.

 NOTE: Do not set the option in .proto files. Always use the maps syntax
 instead. The option should only be implicitly set by the proto compiler
 parser.


�


�

�

�
$
	�" javalite_serializable


	 �

	 �

	 �

	�" javanano_as_lite


	�

	�

	�
O
�:A The parser stores options it doesn't recognize here. See above.


�


�

�3

�69
Z
�M Clients can define custom options in extensions of this message. See above.


 �

 �

 �

� �

�
�
 �.� The ctype option instructs the C++ code generator to use a different
 representation of the field than it normally would.  See the specific
 options below.  This option is not yet implemented in the open source
 release -- sorry, we'll try to include it in a future version!


 �


 �

 �

 �

 �-

 �&,

 ��

 �

  � Default mode.


  �


  �

 �

 �

 �

 �

 �

 �
�
�� The packed option can be enabled for repeated primitive fields to enable
 a more efficient representation on the wire. Rather than repeatedly
 writing the tag and type for each element, the entire array is encoded as
 a single length-delimited blob. In proto3, only explicit setting it to
 false will avoid using packed encoding.


�


�

�

�
�
�3� The jstype option determines the JavaScript type used for values of the
 field.  The option is permitted only for 64 bit integral and fixed types
 (int64, uint64, sint64, fixed64, sfixed64).  A field with jstype JS_STRING
 is represented as JavaScript string, which avoids loss of precision that
 can happen when a large value is converted to a floating point JavaScript.
 Specifying JS_NUMBER for the jstype causes the generated JavaScript code to
 use the JavaScript "number" type.  The behavior of the default option
 JS_NORMAL is implementation dependent.

 This option is an enum to permit additional types to be added, e.g.
 goog.math.Integer.


�


�

�

�

�2

�(1

��

�
'
 � Use the default type.


 �

 �
)
� Use JavaScript strings.


�

�
)
� Use JavaScript numbers.


�

�
�
�)� Should this field be parsed lazily?  Lazy applies only to message-type
 fields.  It means that when the outer message is initially parsed, the
 inner message's contents will not be parsed but instead stored in encoded
 form.  The inner message will actually be parsed when it is first accessed.

 This is only a hint.  Implementations are free to choose whether to use
 eager or lazy parsing regardless of the value of this option.  However,
 setting this option true suggests that the protocol author believes that
 using lazy parsing on this field is worth the additional bookkeeping
 overhead typically needed to implement it.

 This option does not affect the public interface of any generated code;
 all method signatures remain the same.  Furthermore, thread-safety of the
 interface is not affected by this option; const methods remain safe to
 call from multiple threads concurrently, while non-const methods continue
 to require exclusive access.


 Note that implementations may choose not to check required fields within
 a lazy sub-message.  That is, calling IsInitialized() on the outer message
 may return true even if the inner message has missing required fields.
 This is necessary because otherwise the inner message would have to be
 parsed in order to perform the check, defeating the purpose of lazy
 parsing.  An implementation which chooses not to check required fields
 must be consistent about it.  That is, for any particular sub-message, the
 implementation must either *always* check its required fields, or *never*
 check its required fields, regardless of whether or not the message has
 been parsed.


�


�

�

�

�(

�"'
�
�/� Is this field deprecated?
 Depending on the target platform, this can emit Deprecated annotations
 for accessors, or it will be completely ignored; in the very least, this
 is a formalization for deprecating fields.


�


�

�

�

�.

�(-
?
�*1 For Google-internal migration only. Do not use.


�


�

�

�

�)

�#(
O
�:A The parser stores options it doesn't recognize here. See above.


�


�

�3

�69
Z
�M Clients can define custom options in extensions of this message. See above.


 �

 �

 �

	�" removed jtype


	 �

	 �

	 �

� �

�
O
 �:A The parser stores options it doesn't recognize here. See above.


 �


 �

 �3

 �69
Z
�M Clients can define custom options in extensions of this message. See above.


 �

 �

 �

� �

�
`
 � R Set this option to true to allow mapping different tag names to the same
 value.


 �


 �

 �

 �
�
�/� Is this enum deprecated?
 Depending on the target platform, this can emit Deprecated annotations
 for the enum, or it will be completely ignored; in the very least, this
 is a formalization for deprecating enums.


�


�

�

�

�.

�(-

	�" javanano_as_lite


	 �

	 �

	 �
O
�:A The parser stores options it doesn't recognize here. See above.


�


�

�3

�69
Z
�M Clients can define custom options in extensions of this message. See above.


 �

 �

 �

� �

�
�
 �/� Is this enum value deprecated?
 Depending on the target platform, this can emit Deprecated annotations
 for the enum value, or it will be completely ignored; in the very least,
 this is a formalization for deprecating enum values.


 �


 �

 �

 �

 �.

 �(-
O
�:A The parser stores options it doesn't recognize here. See above.


�


�

�3

�69
Z
�M Clients can define custom options in extensions of this message. See above.


 �

 �

 �

� �

�
�
 �0� Is this service deprecated?
 Depending on the target platform, this can emit Deprecated annotations
 for the service, or it will be completely ignored; in the very least,
 this is a formalization for deprecating services.
2� Note:  Field numbers 1 through 32 are reserved for Google's internal RPC
   framework.  We apologize for hoarding these numbers to ourselves, but
   we were already using them long before we decided to release Protocol
   Buffers.


 �


 �

 �

 �

 � /

 �).
O
�:A The parser stores options it doesn't recognize here. See above.


�


�

�3

�69
Z
�M Clients can define custom options in extensions of this message. See above.


 �

 �

 �

� �

�
�
 �0� Is this method deprecated?
 Depending on the target platform, this can emit Deprecated annotations
 for the method, or it will be completely ignored; in the very least,
 this is a formalization for deprecating methods.
2� Note:  Field numbers 1 through 32 are reserved for Google's internal RPC
   framework.  We apologize for hoarding these numbers to ourselves, but
   we were already using them long before we decided to release Protocol
   Buffers.


 �


 �

 �

 �

 � /

 �).
�
 ��� Is this method side-effect-free (or safe in HTTP parlance), or idempotent,
 or neither? HTTP based RPC implementation may choose GET verb for safe
 methods, and PUT verb for idempotent methods instead of the default POST.


 �

  �

  �

  �
$
 �" implies idempotent


 �

 �
7
 �"' idempotent, but may have side effects


 �

 �

��'

�


�

�-

�

�	&

�%
O
�:A The parser stores options it doesn't recognize here. See above.


�


�

�3

�69
Z
�M Clients can define custom options in extensions of this message. See above.


 �

 �

 �
�
� �� A message representing a option the parser does not recognize. This only
 appears in options protos created by the compiler::Parser class.
 DescriptorPool resolves these when building Descriptor objects. Therefore,
 options protos in descriptor objects (e.g. returned by Descriptor::options(),
 or produced by Descriptor::CopyTo()) will never have UninterpretedOptions
 in them.


�
�
 ��� The name of the uninterpreted option.  Each string represents a segment in
 a dot-separated name.  is_extension is true iff a segment represents an
 extension (denoted with parentheses in options specs in .proto files).
 E.g.,{ ["foo", false], ["bar.baz", true], ["qux", false] } represents
 "foo.(bar.baz).qux".


 �


  �"

  �

  �

  �

  � !

 �#

 �

 �

 �

 �!"

 �

 �


 �

 �

 �
�
�'� The value of the uninterpreted option, in whatever type the tokenizer
 identified it as during parsing. Exactly one of these should be set.


�


�

�"

�%&

�)

�


�

�$

�'(

�(

�


�

�#

�&'

�#

�


�

�

�!"

�"

�


�

�

� !

�&

�


�

�!

�$%
�
� �j Encapsulates information about the original source file from which a
 FileDescriptorProto was generated.
2` ===================================================================
 Optional source code info


�
�
 �!� A Location identifies a piece of source code in a .proto file which
 corresponds to a particular definition.  This information is intended
 to be useful to IDEs, code indexers, documentation generators, and similar
 tools.

 For example, say we have a file like:
   message Foo {
     optional string foo = 1;
   }
 Let's look at just the field definition:
   optional string foo = 1;
   ^       ^^     ^^  ^  ^^^
   a       bc     de  f  ghi
 We have the following locations:
   span   path               represents
   [a,i)  [ 4, 0, 2, 0 ]     The whole field definition.
   [a,b)  [ 4, 0, 2, 0, 4 ]  The label (optional).
   [c,d)  [ 4, 0, 2, 0, 5 ]  The type (string).
   [e,f)  [ 4, 0, 2, 0, 1 ]  The name (foo).
   [g,h)  [ 4, 0, 2, 0, 3 ]  The number (1).

 Notes:
 - A location may refer to a repeated field itself (i.e. not to any
   particular index within it).  This is used whenever a set of elements are
   logically enclosed in a single code segment.  For example, an entire
   extend block (possibly containing multiple extension definitions) will
   have an outer location whose path refers to the "extensions" repeated
   field without an index.
 - Multiple locations may have the same path.  This happens when a single
   logical declaration is spread out across multiple places.  The most
   obvious example is the "extend" block again -- there may be multiple
   extend blocks in the same scope, each of which will have the same path.
 - A location's span is not always a subset of its parent's span.  For
   example, the "extendee" of an extension declaration appears at the
   beginning of the "extend" block and is shared by all extensions within
   the block.
 - Just because a location's span is a subset of some other location's span
   does not mean that it is a descendent.  For example, a "group" defines
   both a type and a field in a single declaration.  Thus, the locations
   corresponding to the type and field and their components will overlap.
 - Code which tries to interpret locations should probably be designed to
   ignore those that it doesn't understand, as more types of locations could
   be recorded in the future.


 �


 �

 �

 � 

 ��

 �

�
  �*� Identifies which part of the FileDescriptorProto was defined at this
 location.

 Each element is a field number or an index.  They form a path from
 the root FileDescriptorProto to the place where the definition.  For
 example, this path:
   [ 4, 3, 2, 7, 1 ]
 refers to:
   file.message_type(3)  // 4, 3
       .field(7)         // 2, 7
       .name()           // 1
 This is because FileDescriptorProto.message_type has field number 4:
   repeated DescriptorProto message_type = 4;
 and DescriptorProto.field has field number 2:
   repeated FieldDescriptorProto field = 2;
 and FieldDescriptorProto.name has field number 1:
   optional string name = 1;

 Thus, the above path gives the location of a field name.  If we removed
 the last element:
   [ 4, 3, 2, 7 ]
 this path refers to the whole field declaration (from the beginning
 of the label to the terminating semicolon).


  �

  �

  �

  �

  �)

  �(
�
 �*� Always has exactly three or four elements: start line, start column,
 end line (optional, otherwise assumed same as start line), end column.
 These are packed into a single field for efficiency.  Note that line
 and column numbers are zero-based -- typically you will want to add
 1 to each before displaying to a user.


 �

 �

 �

 �

 �)

 �(
�
 �)� If this SourceCodeInfo represents a complete declaration, these are any
 comments appearing before and after the declaration which appear to be
 attached to the declaration.

 A series of line comments appearing on consecutive lines, with no other
 tokens appearing on those lines, will be treated as a single comment.

 leading_detached_comments will keep paragraphs of comments that appear
 before (but not connected to) the current element. Each paragraph,
 separated by empty lines, will be one comment element in the repeated
 field.

 Only the comment content is provided; comment markers (e.g. //) are
 stripped out.  For block comments, leading whitespace and an asterisk
 will be stripped from the beginning of each line other than the first.
 Newlines are included in the output.

 Examples:

   optional int32 foo = 1;  // Comment attached to foo.
   // Comment attached to bar.
   optional int32 bar = 2;

   optional string baz = 3;
   // Comment attached to baz.
   // Another line attached to baz.

   // Comment attached to qux.
   //
   // Another line attached to qux.
   optional double qux = 4;

   // Detached comment for corge. This is not leading or trailing comments
   // to qux or corge because there are blank lines separating it from
   // both.

   // Detached comment for corge paragraph 2.

   optional string corge = 5;
   /* Block comment attached
    * to corge.  Leading asterisks
    * will be removed. */
   /* Block comment attached to
    * grault. */
   optional int32 grault = 6;

   // ignored detached comments.


 �

 �

 �$

 �'(

 �*

 �

 �

 �%

 �()

 �2

 �

 �

 �-

 �01
�
� �� Describes the relationship between generated code and its original source
 file. A GeneratedCodeInfo message is associated with only one generated
 source file, but may contain references to different source .proto files.


�
x
 �%j An Annotation connects some span of text in generated code to an element
 of its generating .proto file.


 �


 �

 � 

 �#$

 ��

 �

�
  �* Identifies the element in the original source .proto file. This field
 is formatted the same as SourceCodeInfo.Location.path.


  �

  �

  �

  �

  �)

  �(
O
 �$? Identifies the filesystem path to the original source .proto.


 �

 �

 �

 �"#
w
 �g Identifies the starting offset in bytes in the generated code
 that relates to the identified object.


 �

 �

 �

 �
�
 �� Identifies the ending offset in bytes in the generated code that
 relates to the identified offset. The end offset should be one past
 the last relevant byte (so the length of the text = end - begin).


 �

 �

 �

 �
�
google/api/annotations.proto
google.apigoogle/api/http.proto google/protobuf/descriptor.proto:K
http.google.protobuf.MethodOptions�ʼ" (2.google.api.HttpRuleRhttpBn
com.google.apiBAnnotationsProtoPZAgoogle.golang.org/genproto/googleapis/api/annotations;annotations�GAPIJ�
 
�
 2� Copyright (c) 2015, Google Inc.

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.


 
	
  
	
 *

 X
	
 X

 "
	

 "

 1
	
 1

 '
	
 '

 "
	
$ "
	
 

  See `HttpRule`.



 $

 &


 



 


 bproto3
�	
voltha_protos/health.protohealthgoogle/api/annotations.protogoogle/protobuf/empty.proto"}
HealthStatus6
state (2 .health.HealthStatus.HealthStateRstate"5
HealthState
HEALTHY 

OVERLOADED	
DYING2a
HealthServiceP
GetHealthStatus.google.protobuf.Empty.health.HealthStatus"���	/healthBL
org.opencord.voltha.healthZ.github.com/opencord/voltha-protos/v5/go/healthJ�
  "

  

 E
	
 E

 3
	
 3

 
	
  &
	
 %
7
  + Encode health status of a Voltha instance



 

   Health states


  	
(
   " The instance is healthy


   

   
@
  "1 The instance is overloaded, decrease query rate


  

  
G
  "8 The instance is in a critical condition, do not use it


  

  
>
  1 Current state of health of this Voltha instance


  

  

  

  
%
  " Health related services



 
A
   3 Return current health status of a Voltha instance


  

  -

  8D

  


	  �ʼ"
bproto3
��
voltha_protos/openflow_13.protoopenflow_13google/api/annotations.proto"c

ofp_header
version (Rversion)
type (2.openflow_13.ofp_typeRtype
xid (Rxid"�
ofp_hello_elem_header4
type (2 .openflow_13.ofp_hello_elem_typeRtypeQ
versionbitmap (2).openflow_13.ofp_hello_elem_versionbitmapH RversionbitmapB	
element"8
ofp_hello_elem_versionbitmap
bitmaps (Rbitmaps"K
	ofp_hello>
elements (2".openflow_13.ofp_hello_elem_headerRelements"M
ofp_switch_config
flags (Rflags"
miss_send_len (RmissSendLen"B
ofp_table_mod
table_id (RtableId
config (Rconfig"�
ofp_port
port_no (RportNo
hw_addr (RhwAddr
name (	Rname
config (Rconfig
state (Rstate
curr (Rcurr

advertised (R
advertised
	supported (R	supported
peer	 (Rpeer

curr_speed
 (R	currSpeed
	max_speed (RmaxSpeed"�
ofp_switch_features
datapath_id (R
datapathId
	n_buffers (RnBuffers
n_tables (RnTables!
auxiliary_id (RauxiliaryId"
capabilities (Rcapabilities"r
ofp_port_status4
reason (2.openflow_13.ofp_port_reasonRreason)
desc (2.openflow_13.ofp_portRdesc"O
ofp_device_status:
status (2".openflow_13.ofp_device_connectionRstatus"�
ofp_port_mod
port_no (RportNo
hw_addr (RhwAddr
config (Rconfig
mask (Rmask
	advertise (R	advertise"w
	ofp_match/
type (2.openflow_13.ofp_match_typeRtype9

oxm_fields (2.openflow_13.ofp_oxm_fieldR	oxmFields"�
ofp_oxm_field7
	oxm_class (2.openflow_13.ofp_oxm_classRoxmClass=
	ofb_field (2.openflow_13.ofp_oxm_ofb_fieldH RofbFieldX
experimenter_field (2'.openflow_13.ofp_oxm_experimenter_fieldH RexperimenterFieldB
field"�
ofp_oxm_ofb_field4
type (2 .openflow_13.oxm_ofb_field_typesRtype
has_mask (RhasMask
port (H Rport%
physical_port (H RphysicalPort'
table_metadata (H RtableMetadata
eth_dst (H RethDst
eth_src (H RethSrc
eth_type (H RethType
vlan_vid	 (H RvlanVid
vlan_pcp
 (H RvlanPcp
ip_dscp (H RipDscp
ip_ecn (H RipEcn
ip_proto (H RipProto
ipv4_src (H Ripv4Src
ipv4_dst (H Ripv4Dst
tcp_src (H RtcpSrc
tcp_dst (H RtcpDst
udp_src (H RudpSrc
udp_dst (H RudpDst
sctp_src (H RsctpSrc
sctp_dst (H RsctpDst!
icmpv4_type (H R
icmpv4Type!
icmpv4_code (H R
icmpv4Code
arp_op (H RarpOp
arp_spa (H RarpSpa
arp_tpa (H RarpTpa
arp_sha (H RarpSha
arp_tha (H RarpTha
ipv6_src (H Ripv6Src
ipv6_dst (H Ripv6Dst!
ipv6_flabel (H R
ipv6Flabel!
icmpv6_type  (H R
icmpv6Type!
icmpv6_code! (H R
icmpv6Code&
ipv6_nd_target" (H Ripv6NdTarget 
ipv6_nd_ssl# (H R	ipv6NdSsl 
ipv6_nd_tll$ (H R	ipv6NdTll

mpls_label% (H R	mplsLabel
mpls_tc& (H RmplsTc
mpls_bos' (H RmplsBos
pbb_isid( (H RpbbIsid
	tunnel_id) (H RtunnelId!
ipv6_exthdr* (H R
ipv6Exthdr0
table_metadata_maski (HRtableMetadataMask"
eth_dst_maskj (HR
ethDstMask"
eth_src_maskk (HR
ethSrcMask$
vlan_vid_maskm (HRvlanVidMask$
ipv4_src_maskr (HRipv4SrcMask$
ipv4_dst_masks (HRipv4DstMask"
arp_spa_mask} (HR
arpSpaMask"
arp_tpa_mask~ (HR
arpTpaMask%
ipv6_src_mask� (HRipv6SrcMask%
ipv6_dst_mask� (HRipv6DstMask+
ipv6_flabel_mask� (HRipv6FlabelMask%
pbb_isid_mask� (HRpbbIsidMask'
tunnel_id_mask� (HRtunnelIdMask+
ipv6_exthdr_mask� (HRipv6ExthdrMaskB
valueB
mask"_
ofp_oxm_experimenter_field

oxm_header (R	oxmHeader"
experimenter (Rexperimenter"�

ofp_action0
type (2.openflow_13.ofp_action_typeRtype8
output (2.openflow_13.ofp_action_outputH Routput=
mpls_ttl (2 .openflow_13.ofp_action_mpls_ttlH RmplsTtl2
push (2.openflow_13.ofp_action_pushH Rpush=
pop_mpls (2 .openflow_13.ofp_action_pop_mplsH RpopMpls5
group (2.openflow_13.ofp_action_groupH Rgroup7
nw_ttl (2.openflow_13.ofp_action_nw_ttlH RnwTtl@
	set_field (2!.openflow_13.ofp_action_set_fieldH RsetFieldJ
experimenter	 (2$.openflow_13.ofp_action_experimenterH RexperimenterB
action"@
ofp_action_output
port (Rport
max_len (RmaxLen"0
ofp_action_mpls_ttl
mpls_ttl (RmplsTtl"/
ofp_action_push
	ethertype (R	ethertype"3
ofp_action_pop_mpls
	ethertype (R	ethertype"-
ofp_action_group
group_id (RgroupId"*
ofp_action_nw_ttl
nw_ttl (RnwTtl"H
ofp_action_set_field0
field (2.openflow_13.ofp_oxm_fieldRfield"Q
ofp_action_experimenter"
experimenter (Rexperimenter
data (Rdata"�
ofp_instruction
type (RtypeH

goto_table (2'.openflow_13.ofp_instruction_goto_tableH R	gotoTableT
write_metadata (2+.openflow_13.ofp_instruction_write_metadataH RwriteMetadata@
actions (2$.openflow_13.ofp_instruction_actionsH Ractions:
meter (2".openflow_13.ofp_instruction_meterH RmeterO
experimenter (2).openflow_13.ofp_instruction_experimenterH RexperimenterB
data"7
ofp_instruction_goto_table
table_id (RtableId"a
ofp_instruction_write_metadata
metadata (Rmetadata#
metadata_mask (RmetadataMask"L
ofp_instruction_actions1
actions (2.openflow_13.ofp_actionRactions"2
ofp_instruction_meter
meter_id (RmeterId"V
ofp_instruction_experimenter"
experimenter (Rexperimenter
data (Rdata"�
ofp_flow_mod
cookie (Rcookie
cookie_mask (R
cookieMask
table_id (RtableId;
command (2!.openflow_13.ofp_flow_mod_commandRcommand!
idle_timeout (RidleTimeout!
hard_timeout (RhardTimeout
priority (Rpriority
	buffer_id (RbufferId
out_port	 (RoutPort
	out_group
 (RoutGroup
flags (Rflags,
match (2.openflow_13.ofp_matchRmatch@
instructions (2.openflow_13.ofp_instructionRinstructions"�

ofp_bucket
weight (Rweight

watch_port (R	watchPort
watch_group (R
watchGroup1
actions (2.openflow_13.ofp_actionRactions"�
ofp_group_mod<
command (2".openflow_13.ofp_group_mod_commandRcommand/
type (2.openflow_13.ofp_group_typeRtype
group_id (RgroupId1
buckets (2.openflow_13.ofp_bucketRbuckets"�
ofp_packet_out
	buffer_id (RbufferId
in_port (RinPort1
actions (2.openflow_13.ofp_actionRactions
data (Rdata"�
ofp_packet_in
	buffer_id (RbufferId9
reason (2!.openflow_13.ofp_packet_in_reasonRreason
table_id (RtableId
cookie (Rcookie,
match (2.openflow_13.ofp_matchRmatch
data (Rdata"�
ofp_flow_removed
cookie (Rcookie
priority (Rpriority<
reason (2$.openflow_13.ofp_flow_removed_reasonRreason
table_id (RtableId!
duration_sec (RdurationSec#
duration_nsec (RdurationNsec!
idle_timeout (RidleTimeout!
hard_timeout (RhardTimeout!
packet_count	 (RpacketCount

byte_count
 (R	byteCount,
matchy (2.openflow_13.ofp_matchRmatch"�
ofp_meter_band_header4
type (2 .openflow_13.ofp_meter_band_typeRtype
rate (Rrate

burst_size (R	burstSize6
drop (2 .openflow_13.ofp_meter_band_dropH RdropJ
dscp_remark (2'.openflow_13.ofp_meter_band_dscp_remarkH R
dscpRemarkN
experimenter (2(.openflow_13.ofp_meter_band_experimenterH RexperimenterB
data"
ofp_meter_band_drop";
ofp_meter_band_dscp_remark

prec_level (R	precLevel"A
ofp_meter_band_experimenter"
experimenter (Rexperimenter"�
ofp_meter_mod<
command (2".openflow_13.ofp_meter_mod_commandRcommand
flags (Rflags
meter_id (RmeterId8
bands (2".openflow_13.ofp_meter_band_headerRbands"|
ofp_error_msg/
header (2.openflow_13.ofp_headerRheader
type (Rtype
code (Rcode
data (Rdata"�
ofp_error_experimenter_msg
type (Rtype
exp_type (RexpType"
experimenter (Rexperimenter
data (Rdata"v
ofp_multipart_request3
type (2.openflow_13.ofp_multipart_typeRtype
flags (Rflags
body (Rbody"t
ofp_multipart_reply3
type (2.openflow_13.ofp_multipart_typeRtype
flags (Rflags
body (Rbody"�
ofp_desc
mfr_desc (	RmfrDesc
hw_desc (	RhwDesc
sw_desc (	RswDesc

serial_num (	R	serialNum
dp_desc (	RdpDesc"�
ofp_flow_stats_request
table_id (RtableId
out_port (RoutPort
	out_group (RoutGroup
cookie (Rcookie
cookie_mask (R
cookieMask,
match (2.openflow_13.ofp_matchRmatch"�
ofp_flow_stats
id (Rid
table_id (RtableId!
duration_sec (RdurationSec#
duration_nsec (RdurationNsec
priority (Rpriority!
idle_timeout (RidleTimeout!
hard_timeout (RhardTimeout
flags (Rflags
cookie (Rcookie!
packet_count	 (RpacketCount

byte_count
 (R	byteCount,
match (2.openflow_13.ofp_matchRmatch@
instructions (2.openflow_13.ofp_instructionRinstructions"�
ofp_aggregate_stats_request
table_id (RtableId
out_port (RoutPort
	out_group (RoutGroup
cookie (Rcookie
cookie_mask (R
cookieMask,
match (2.openflow_13.ofp_matchRmatch"|
ofp_aggregate_stats_reply!
packet_count (RpacketCount

byte_count (R	byteCount

flow_count (R	flowCount"�
ofp_table_feature_property<
type (2(.openflow_13.ofp_table_feature_prop_typeRtypeV
instructions (20.openflow_13.ofp_table_feature_prop_instructionsH RinstructionsR
next_tables (2/.openflow_13.ofp_table_feature_prop_next_tablesH R
nextTablesG
actions (2+.openflow_13.ofp_table_feature_prop_actionsH Ractions;
oxm (2'.openflow_13.ofp_table_feature_prop_oxmH RoxmV
experimenter (20.openflow_13.ofp_table_feature_prop_experimenterH RexperimenterB
value"g
#ofp_table_feature_prop_instructions@
instructions (2.openflow_13.ofp_instructionRinstructions"J
"ofp_table_feature_prop_next_tables$
next_table_ids (RnextTableIds"S
ofp_table_feature_prop_actions1
actions (2.openflow_13.ofp_actionRactions"5
ofp_table_feature_prop_oxm
oxm_ids (RoxmIds"�
#ofp_table_feature_prop_experimenter"
experimenter (Rexperimenter
exp_type (RexpType+
experimenter_data (RexperimenterData"�
ofp_table_features
table_id (RtableId
name (	Rname%
metadata_match (RmetadataMatch%
metadata_write (RmetadataWrite
config (Rconfig
max_entries (R
maxEntriesG

properties (2'.openflow_13.ofp_table_feature_propertyR
properties"�
ofp_table_stats
table_id (RtableId!
active_count (RactiveCount!
lookup_count (RlookupCount#
matched_count (RmatchedCount"1
ofp_port_stats_request
port_no (RportNo"�
ofp_port_stats
port_no (RportNo

rx_packets (R	rxPackets

tx_packets (R	txPackets
rx_bytes (RrxBytes
tx_bytes (RtxBytes

rx_dropped (R	rxDropped

tx_dropped (R	txDropped
	rx_errors (RrxErrors
	tx_errors	 (RtxErrors 
rx_frame_err
 (R
rxFrameErr
rx_over_err (R	rxOverErr

rx_crc_err (RrxCrcErr

collisions (R
collisions!
duration_sec (RdurationSec#
duration_nsec (RdurationNsec"4
ofp_group_stats_request
group_id (RgroupId"V
ofp_bucket_counter!
packet_count (RpacketCount

byte_count (R	byteCount"�
ofp_group_stats
group_id (RgroupId
	ref_count (RrefCount!
packet_count (RpacketCount

byte_count (R	byteCount!
duration_sec (RdurationSec#
duration_nsec (RdurationNsecB
bucket_stats (2.openflow_13.ofp_bucket_counterRbucketStats"�
ofp_group_desc/
type (2.openflow_13.ofp_group_typeRtype
group_id (RgroupId1
buckets (2.openflow_13.ofp_bucketRbuckets"v
ofp_group_entry/
desc (2.openflow_13.ofp_group_descRdesc2
stats (2.openflow_13.ofp_group_statsRstats"�
ofp_group_features
types (Rtypes"
capabilities (Rcapabilities

max_groups (R	maxGroups
actions (Ractions"8
ofp_meter_multipart_request
meter_id (RmeterId"j
ofp_meter_band_stats*
packet_band_count (RpacketBandCount&
byte_band_count (RbyteBandCount"�
ofp_meter_stats
meter_id (RmeterId

flow_count (R	flowCount&
packet_in_count (RpacketInCount"
byte_in_count (RbyteInCount!
duration_sec (RdurationSec#
duration_nsec (RdurationNsec@

band_stats (2!.openflow_13.ofp_meter_band_statsR	bandStats"}
ofp_meter_config
flags (Rflags
meter_id (RmeterId8
bands (2".openflow_13.ofp_meter_band_headerRbands"�
ofp_meter_features
	max_meter (RmaxMeter

band_types (R	bandTypes"
capabilities (Rcapabilities
	max_bands (RmaxBands
	max_color (RmaxColor"|
ofp_meter_entry5
config (2.openflow_13.ofp_meter_configRconfig2
stats (2.openflow_13.ofp_meter_statsRstats"v
!ofp_experimenter_multipart_header"
experimenter (Rexperimenter
exp_type (RexpType
data (Rdata"l
ofp_experimenter_header"
experimenter (Rexperimenter
exp_type (RexpType
data (Rdata"E
ofp_queue_prop_header
property (Rproperty
len (Rlen"r
ofp_queue_prop_min_rateC
prop_header (2".openflow_13.ofp_queue_prop_headerR
propHeader
rate (Rrate"r
ofp_queue_prop_max_rateC
prop_header (2".openflow_13.ofp_queue_prop_headerR
propHeader
rate (Rrate"�
ofp_queue_prop_experimenterC
prop_header (2".openflow_13.ofp_queue_prop_headerR
propHeader"
experimenter (Rexperimenter
data (Rdata"�
ofp_packet_queue
queue_id (RqueueId
port (RportB

properties (2".openflow_13.ofp_queue_prop_headerR
properties"2
ofp_queue_get_config_request
port (Rport"g
ofp_queue_get_config_reply
port (Rport5
queues (2.openflow_13.ofp_packet_queueRqueues"E
ofp_action_set_queue
type (Rtype
queue_id (RqueueId"M
ofp_queue_stats_request
port_no (RportNo
queue_id (RqueueId"�
ofp_queue_stats
port_no (RportNo
queue_id (RqueueId
tx_bytes (RtxBytes

tx_packets (R	txPackets
	tx_errors (RtxErrors!
duration_sec (RdurationSec#
duration_nsec (RdurationNsec"m
ofp_role_request4
role (2 .openflow_13.ofp_controller_roleRrole#
generation_id (RgenerationId"�
ofp_async_config$
packet_in_mask (RpacketInMask(
port_status_mask (RportStatusMask*
flow_removed_mask (RflowRemovedMask"k
MeterModUpdate
id (	Rid7
	meter_mod (2.openflow_13.ofp_meter_modRmeterMod
xid (Rxid"P
MeterStatsReply=
meter_stats (2.openflow_13.ofp_meter_statsR
meterStats"i
FlowTableUpdate
id (	Rid4
flow_mod (2.openflow_13.ofp_flow_modRflowMod
xid (Rxid"q
FlowGroupTableUpdate
id (	Rid7
	group_mod (2.openflow_13.ofp_group_modRgroupMod
xid (Rxid":
Flows1
items (2.openflow_13.ofp_flow_statsRitems"<
Meters2
items (2.openflow_13.ofp_meter_entryRitems"@

FlowGroups2
items (2.openflow_13.ofp_group_entryRitems"i
FlowChanges)
to_add (2.openflow_13.FlowsRtoAdd/
	to_remove (2.openflow_13.FlowsRtoRemove"�
FlowGroupChanges.
to_add (2.openflow_13.FlowGroupsRtoAdd4
	to_remove (2.openflow_13.FlowGroupsRtoRemove4
	to_update (2.openflow_13.FlowGroupsRtoUpdate"S
PacketIn
id (	Rid7
	packet_in (2.openflow_13.ofp_packet_inRpacketIn"W
	PacketOut
id (	Rid:

packet_out (2.openflow_13.ofp_packet_outR	packetOut"�
ChangeEvent
id (	Rid?
port_status (2.openflow_13.ofp_port_statusH R
portStatus2
error (2.openflow_13.ofp_error_msgH RerrorE
device_status (2.openflow_13.ofp_device_statusH RdeviceStatusB
event"E
FlowMetadata5
meters (2.openflow_13.ofp_meter_configRmeters*�
ofp_port_no
OFPP_INVALID 
OFPP_MAX����
OFPP_IN_PORT����

OFPP_TABLE����
OFPP_NORMAL����

OFPP_FLOOD����
OFPP_ALL����
OFPP_CONTROLLER����

OFPP_LOCAL����
OFPP_ANY����*�
ofp_type

OFPT_HELLO 

OFPT_ERROR
OFPT_ECHO_REQUEST
OFPT_ECHO_REPLY
OFPT_EXPERIMENTER
OFPT_FEATURES_REQUEST
OFPT_FEATURES_REPLY
OFPT_GET_CONFIG_REQUEST
OFPT_GET_CONFIG_REPLY
OFPT_SET_CONFIG	
OFPT_PACKET_IN

OFPT_FLOW_REMOVED
OFPT_PORT_STATUS
OFPT_PACKET_OUT
OFPT_FLOW_MOD
OFPT_GROUP_MOD
OFPT_PORT_MOD
OFPT_TABLE_MOD
OFPT_MULTIPART_REQUEST
OFPT_MULTIPART_REPLY
OFPT_BARRIER_REQUEST
OFPT_BARRIER_REPLY!
OFPT_QUEUE_GET_CONFIG_REQUEST
OFPT_QUEUE_GET_CONFIG_REPLY
OFPT_ROLE_REQUEST
OFPT_ROLE_REPLY
OFPT_GET_ASYNC_REQUEST
OFPT_GET_ASYNC_REPLY
OFPT_SET_ASYNC
OFPT_METER_MOD*C
ofp_hello_elem_type
OFPHET_INVALID 
OFPHET_VERSIONBITMAP*e
ofp_config_flags
OFPC_FRAG_NORMAL 
OFPC_FRAG_DROP
OFPC_FRAG_REASM
OFPC_FRAG_MASK*@
ofp_table_config
OFPTC_INVALID 
OFPTC_DEPRECATED_MASK*>
	ofp_table
OFPTT_INVALID 
	OFPTT_MAX�
	OFPTT_ALL�*�
ofp_capabilities
OFPC_INVALID 
OFPC_FLOW_STATS
OFPC_TABLE_STATS
OFPC_PORT_STATS
OFPC_GROUP_STATS
OFPC_IP_REASM 
OFPC_QUEUE_STATS@
OFPC_PORT_BLOCKED�*v
ofp_port_config
OFPPC_INVALID 
OFPPC_PORT_DOWN
OFPPC_NO_RECV
OFPPC_NO_FWD 
OFPPC_NO_PACKET_IN@*[
ofp_port_state
OFPPS_INVALID 
OFPPS_LINK_DOWN
OFPPS_BLOCKED

OFPPS_LIVE*�
ofp_port_features
OFPPF_INVALID 
OFPPF_10MB_HD
OFPPF_10MB_FD
OFPPF_100MB_HD
OFPPF_100MB_FD
OFPPF_1GB_HD
OFPPF_1GB_FD 
OFPPF_10GB_FD@
OFPPF_40GB_FD�
OFPPF_100GB_FD�
OFPPF_1TB_FD�
OFPPF_OTHER�
OFPPF_COPPER�
OFPPF_FIBER� 
OFPPF_AUTONEG�@
OFPPF_PAUSE��
OFPPF_PAUSE_ASYM��*D
ofp_port_reason
	OFPPR_ADD 
OFPPR_DELETE
OFPPR_MODIFY*F
ofp_device_connection
OFPDEV_CONNECTED 
OFPDEV_DISCONNECTED*3
ofp_match_type
OFPMT_STANDARD 
	OFPMT_OXM*k
ofp_oxm_class
OFPXMC_NXM_0 
OFPXMC_NXM_1
OFPXMC_OPENFLOW_BASIC��
OFPXMC_EXPERIMENTER��*�
oxm_ofb_field_types
OFPXMT_OFB_IN_PORT 
OFPXMT_OFB_IN_PHY_PORT
OFPXMT_OFB_METADATA
OFPXMT_OFB_ETH_DST
OFPXMT_OFB_ETH_SRC
OFPXMT_OFB_ETH_TYPE
OFPXMT_OFB_VLAN_VID
OFPXMT_OFB_VLAN_PCP
OFPXMT_OFB_IP_DSCP
OFPXMT_OFB_IP_ECN	
OFPXMT_OFB_IP_PROTO

OFPXMT_OFB_IPV4_SRC
OFPXMT_OFB_IPV4_DST
OFPXMT_OFB_TCP_SRC
OFPXMT_OFB_TCP_DST
OFPXMT_OFB_UDP_SRC
OFPXMT_OFB_UDP_DST
OFPXMT_OFB_SCTP_SRC
OFPXMT_OFB_SCTP_DST
OFPXMT_OFB_ICMPV4_TYPE
OFPXMT_OFB_ICMPV4_CODE
OFPXMT_OFB_ARP_OP
OFPXMT_OFB_ARP_SPA
OFPXMT_OFB_ARP_TPA
OFPXMT_OFB_ARP_SHA
OFPXMT_OFB_ARP_THA
OFPXMT_OFB_IPV6_SRC
OFPXMT_OFB_IPV6_DST
OFPXMT_OFB_IPV6_FLABEL
OFPXMT_OFB_ICMPV6_TYPE
OFPXMT_OFB_ICMPV6_CODE
OFPXMT_OFB_IPV6_ND_TARGET
OFPXMT_OFB_IPV6_ND_SLL 
OFPXMT_OFB_IPV6_ND_TLL!
OFPXMT_OFB_MPLS_LABEL"
OFPXMT_OFB_MPLS_TC#
OFPXMT_OFB_MPLS_BOS$
OFPXMT_OFB_PBB_ISID%
OFPXMT_OFB_TUNNEL_ID&
OFPXMT_OFB_IPV6_EXTHDR'*3
ofp_vlan_id
OFPVID_NONE 
OFPVID_PRESENT� *�
ofp_ipv6exthdr_flags
OFPIEH_INVALID 
OFPIEH_NONEXT

OFPIEH_ESP
OFPIEH_AUTH
OFPIEH_DEST
OFPIEH_FRAG
OFPIEH_ROUTER 

OFPIEH_HOP@
OFPIEH_UNREP�
OFPIEH_UNSEQ�*�
ofp_action_type
OFPAT_OUTPUT 
OFPAT_COPY_TTL_OUT
OFPAT_COPY_TTL_IN
OFPAT_SET_MPLS_TTL
OFPAT_DEC_MPLS_TTL
OFPAT_PUSH_VLAN
OFPAT_POP_VLAN
OFPAT_PUSH_MPLS
OFPAT_POP_MPLS
OFPAT_SET_QUEUE
OFPAT_GROUP
OFPAT_SET_NW_TTL
OFPAT_DEC_NW_TTL
OFPAT_SET_FIELD
OFPAT_PUSH_PBB
OFPAT_POP_PBB
OFPAT_EXPERIMENTER��*V
ofp_controller_max_len
OFPCML_INVALID 

OFPCML_MAX��
OFPCML_NO_BUFFER��*�
ofp_instruction_type
OFPIT_INVALID 
OFPIT_GOTO_TABLE
OFPIT_WRITE_METADATA
OFPIT_WRITE_ACTIONS
OFPIT_APPLY_ACTIONS
OFPIT_CLEAR_ACTIONS
OFPIT_METER
OFPIT_EXPERIMENTER��*{
ofp_flow_mod_command
	OFPFC_ADD 
OFPFC_MODIFY
OFPFC_MODIFY_STRICT
OFPFC_DELETE
OFPFC_DELETE_STRICT*�
ofp_flow_mod_flags
OFPFF_INVALID 
OFPFF_SEND_FLOW_REM
OFPFF_CHECK_OVERLAP
OFPFF_RESET_COUNTS
OFPFF_NO_PKT_COUNTS
OFPFF_NO_BYT_COUNTS*S
	ofp_group
OFPG_INVALID 
OFPG_MAX����
OFPG_ALL����
OFPG_ANY����*J
ofp_group_mod_command
	OFPGC_ADD 
OFPGC_MODIFY
OFPGC_DELETE*S
ofp_group_type
	OFPGT_ALL 
OFPGT_SELECT
OFPGT_INDIRECT
OFPGT_FF*P
ofp_packet_in_reason
OFPR_NO_MATCH 
OFPR_ACTION
OFPR_INVALID_TTL*�
ofp_flow_removed_reason
OFPRR_IDLE_TIMEOUT 
OFPRR_HARD_TIMEOUT
OFPRR_DELETE
OFPRR_GROUP_DELETE
OFPRR_METER_DELETE*n
	ofp_meter
	OFPM_ZERO 
OFPM_MAX����
OFPM_SLOWPATH����
OFPM_CONTROLLER����
OFPM_ALL����*m
ofp_meter_band_type
OFPMBT_INVALID 
OFPMBT_DROP
OFPMBT_DSCP_REMARK
OFPMBT_EXPERIMENTER��*J
ofp_meter_mod_command
	OFPMC_ADD 
OFPMC_MODIFY
OFPMC_DELETE*g
ofp_meter_flags
OFPMF_INVALID 

OFPMF_KBPS
OFPMF_PKTPS
OFPMF_BURST
OFPMF_STATS*�
ofp_error_type
OFPET_HELLO_FAILED 
OFPET_BAD_REQUEST
OFPET_BAD_ACTION
OFPET_BAD_INSTRUCTION
OFPET_BAD_MATCH
OFPET_FLOW_MOD_FAILED
OFPET_GROUP_MOD_FAILED
OFPET_PORT_MOD_FAILED
OFPET_TABLE_MOD_FAILED
OFPET_QUEUE_OP_FAILED	
OFPET_SWITCH_CONFIG_FAILED

OFPET_ROLE_REQUEST_FAILED
OFPET_METER_MOD_FAILED
OFPET_TABLE_FEATURES_FAILED
OFPET_EXPERIMENTER��*B
ofp_hello_failed_code
OFPHFC_INCOMPATIBLE 
OFPHFC_EPERM*�
ofp_bad_request_code
OFPBRC_BAD_VERSION 
OFPBRC_BAD_TYPE
OFPBRC_BAD_MULTIPART
OFPBRC_BAD_EXPERIMENTER
OFPBRC_BAD_EXP_TYPE
OFPBRC_EPERM
OFPBRC_BAD_LEN
OFPBRC_BUFFER_EMPTY
OFPBRC_BUFFER_UNKNOWN
OFPBRC_BAD_TABLE_ID	
OFPBRC_IS_SLAVE

OFPBRC_BAD_PORT
OFPBRC_BAD_PACKET$
 OFPBRC_MULTIPART_BUFFER_OVERFLOW*�
ofp_bad_action_code
OFPBAC_BAD_TYPE 
OFPBAC_BAD_LEN
OFPBAC_BAD_EXPERIMENTER
OFPBAC_BAD_EXP_TYPE
OFPBAC_BAD_OUT_PORT
OFPBAC_BAD_ARGUMENT
OFPBAC_EPERM
OFPBAC_TOO_MANY
OFPBAC_BAD_QUEUE
OFPBAC_BAD_OUT_GROUP	
OFPBAC_MATCH_INCONSISTENT

OFPBAC_UNSUPPORTED_ORDER
OFPBAC_BAD_TAG
OFPBAC_BAD_SET_TYPE
OFPBAC_BAD_SET_LEN
OFPBAC_BAD_SET_ARGUMENT*�
ofp_bad_instruction_code
OFPBIC_UNKNOWN_INST 
OFPBIC_UNSUP_INST
OFPBIC_BAD_TABLE_ID
OFPBIC_UNSUP_METADATA
OFPBIC_UNSUP_METADATA_MASK
OFPBIC_BAD_EXPERIMENTER
OFPBIC_BAD_EXP_TYPE
OFPBIC_BAD_LEN
OFPBIC_EPERM*�
ofp_bad_match_code
OFPBMC_BAD_TYPE 
OFPBMC_BAD_LEN
OFPBMC_BAD_TAG
OFPBMC_BAD_DL_ADDR_MASK
OFPBMC_BAD_NW_ADDR_MASK
OFPBMC_BAD_WILDCARDS
OFPBMC_BAD_FIELD
OFPBMC_BAD_VALUE
OFPBMC_BAD_MASK
OFPBMC_BAD_PREREQ	
OFPBMC_DUP_FIELD

OFPBMC_EPERM*�
ofp_flow_mod_failed_code
OFPFMFC_UNKNOWN 
OFPFMFC_TABLE_FULL
OFPFMFC_BAD_TABLE_ID
OFPFMFC_OVERLAP
OFPFMFC_EPERM
OFPFMFC_BAD_TIMEOUT
OFPFMFC_BAD_COMMAND
OFPFMFC_BAD_FLAGS*�
ofp_group_mod_failed_code
OFPGMFC_GROUP_EXISTS 
OFPGMFC_INVALID_GROUP
OFPGMFC_WEIGHT_UNSUPPORTED
OFPGMFC_OUT_OF_GROUPS
OFPGMFC_OUT_OF_BUCKETS 
OFPGMFC_CHAINING_UNSUPPORTED
OFPGMFC_WATCH_UNSUPPORTED
OFPGMFC_LOOP
OFPGMFC_UNKNOWN_GROUP
OFPGMFC_CHAINED_GROUP	
OFPGMFC_BAD_TYPE

OFPGMFC_BAD_COMMAND
OFPGMFC_BAD_BUCKET
OFPGMFC_BAD_WATCH
OFPGMFC_EPERM*�
ofp_port_mod_failed_code
OFPPMFC_BAD_PORT 
OFPPMFC_BAD_HW_ADDR
OFPPMFC_BAD_CONFIG
OFPPMFC_BAD_ADVERTISE
OFPPMFC_EPERM*]
ofp_table_mod_failed_code
OFPTMFC_BAD_TABLE 
OFPTMFC_BAD_CONFIG
OFPTMFC_EPERM*Z
ofp_queue_op_failed_code
OFPQOFC_BAD_PORT 
OFPQOFC_BAD_QUEUE
OFPQOFC_EPERM*^
ofp_switch_config_failed_code
OFPSCFC_BAD_FLAGS 
OFPSCFC_BAD_LEN
OFPSCFC_EPERM*Z
ofp_role_request_failed_code
OFPRRFC_STALE 
OFPRRFC_UNSUP
OFPRRFC_BAD_ROLE*�
ofp_meter_mod_failed_code
OFPMMFC_UNKNOWN 
OFPMMFC_METER_EXISTS
OFPMMFC_INVALID_METER
OFPMMFC_UNKNOWN_METER
OFPMMFC_BAD_COMMAND
OFPMMFC_BAD_FLAGS
OFPMMFC_BAD_RATE
OFPMMFC_BAD_BURST
OFPMMFC_BAD_BAND
OFPMMFC_BAD_BAND_DETAIL	
OFPMMFC_OUT_OF_METERS

OFPMMFC_OUT_OF_BANDS*�
ofp_table_features_failed_code
OFPTFFC_BAD_TABLE 
OFPTFFC_BAD_METADATA
OFPTFFC_BAD_TYPE
OFPTFFC_BAD_LEN
OFPTFFC_BAD_ARGUMENT
OFPTFFC_EPERM*�
ofp_multipart_type

OFPMP_DESC 

OFPMP_FLOW
OFPMP_AGGREGATE
OFPMP_TABLE
OFPMP_PORT_STATS
OFPMP_QUEUE
OFPMP_GROUP
OFPMP_GROUP_DESC
OFPMP_GROUP_FEATURES
OFPMP_METER	
OFPMP_METER_CONFIG

OFPMP_METER_FEATURES
OFPMP_TABLE_FEATURES
OFPMP_PORT_DESC
OFPMP_EXPERIMENTER��*J
ofp_multipart_request_flags
OFPMPF_REQ_INVALID 
OFPMPF_REQ_MORE*L
ofp_multipart_reply_flags
OFPMPF_REPLY_INVALID 
OFPMPF_REPLY_MORE*�
ofp_table_feature_prop_type
OFPTFPT_INSTRUCTIONS 
OFPTFPT_INSTRUCTIONS_MISS
OFPTFPT_NEXT_TABLES
OFPTFPT_NEXT_TABLES_MISS
OFPTFPT_WRITE_ACTIONS
OFPTFPT_WRITE_ACTIONS_MISS
OFPTFPT_APPLY_ACTIONS
OFPTFPT_APPLY_ACTIONS_MISS
OFPTFPT_MATCH
OFPTFPT_WILDCARDS

OFPTFPT_WRITE_SETFIELD
OFPTFPT_WRITE_SETFIELD_MISS
OFPTFPT_APPLY_SETFIELD
OFPTFPT_APPLY_SETFIELD_MISS
OFPTFPT_EXPERIMENTER��
OFPTFPT_EXPERIMENTER_MISS��*�
ofp_group_capabilities
OFPGFC_INVALID 
OFPGFC_SELECT_WEIGHT
OFPGFC_SELECT_LIVENESS
OFPGFC_CHAINING
OFPGFC_CHAINING_CHECKS*k
ofp_queue_properties
OFPQT_INVALID 
OFPQT_MIN_RATE
OFPQT_MAX_RATE
OFPQT_EXPERIMENTER��*q
ofp_controller_role
OFPCR_ROLE_NOCHANGE 
OFPCR_ROLE_EQUAL
OFPCR_ROLE_MASTER
OFPCR_ROLE_SLAVEBU
org.opencord.voltha.openflow13Z3github.com/opencord/voltha-protos/v5/go/openflow_13J��
9 �
�
9 �
 This is a relatively straightforward rendering of OpenFlow message
 definitions into protocol buffer messages. We preserved the snake
 case syntax, and made the following changes:
 - all pad fields dropped
 - for each enum value above 0x7fffffff the MSB is dropped. For example,
   0xffffffff is now 0x7fffffff.
 - '<type> thing[...]' is replaced with 'repeated <type> thing'
 - 'char thing[...]' is replaced with 'string thing'
 - 'uint8_t data[...]' is replaced with 'bytes data'
 - the following systematic changes are done to various integer types:
   uint8_t  -> uint32
   uint16_t -> uint32
   uint32_t -> uint32
   uint64_t -> uint64
 - removed most length, len, size fields where these values can be determined
   from the explicitly encoded length of "repeated" protobuf fields.
 - explicit use of enum types whereever it is unambigous (and not used as
   bitmask/flags value.

2� Copyright (c) 2008 The Board of Trustees of The Leland Stanford
 Junior University
 Copyright 2011-2024 Open Networking Foundation (ONF) and the ONF Contributors

 We are making the OpenFlow specification and associated documentation
 (Software) available for public use and benefit with the expectation
 that others will use, modify and enhance the Software and contribute
 those enhancements back to the community. However, since we would
 like to make the Software available for broadest use, with as few
 restrictions as possible permission is hereby granted, free of
 charge, to any person obtaining a copy of this Software to deal in
 the Software under the copyrights without restriction, including
 without limitation the rights to use, copy, modify, merge, publish,
 distribute, sublicense, and/or sell copies of the Software, and to
 permit persons to whom the Software is furnished to do so, subject to
 the following conditions:

 The above copyright notice and this permission notice shall be
 included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 NONINFRINGEMENT.  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
 BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.

 The name and trademarks of copyright holder(s) may NOT be used in
 advertising or publicity pertaining to the Software or any
 derivatives without specific, written prior permission.
25 OpenFlow: protocol between controller and datapath. 

; J
	
; J

< 7
	
< 7

> 
	
 @ &
�
 T i5 Port numbering. Ports are numbered starting from 1. 2c Version number:
 OpenFlow versions released: 0x01 = 1.0 ; 0x02 = 1.1 ; 0x03 = 1.2
     0x04 = 1.3
2U The most significant bit in the version field is reserved and must
 be set to zero.
2z#define OFP_VERSION   0x04
#define PIPELINE_TABLES 64
#define OFP_MAX_TABLE_NAME_LEN 32
#define OFP_MAX_PORT_NAME_LEN  16
2- Official IANA registered port for OpenFlow. 26#define OFP_TCP_PORT  6653
#define OFP_SSL_PORT  6653
2D#define OFP_ETH_ALEN 6          /* Bytes in an Ethernet address. */



 T

  U

  U

  U
C
 X!6 Maximum number of physical and logical switch ports. 

 X

 X 
�
 [!/ Reserved OpenFlow Port (fake output "ports"). "~ Send the packet out the input port.  This
reserved port must be explicitly used
in order to send back out of the input
port. 

 [

 [ 
{
 _!"n Submit the packet to the first flow table
NB: This destination port can only be
used in packet-out messages. 

 _

 _ 
3
 b!"& Forward using non-OpenFlow pipeline. 

 b

 b 
1
 c!"$ Flood using non-OpenFlow pipeline. 

 c

 c 
4
 d!"' All standard ports except input port. 

 d

 d 
"
 e!" Send to controller. 

 e

 e 
%
 f!" Local openflow "port". 

 f

 f 
^
 	g!"Q Special value used in some requests when
no port is specified (i.e. wildcarded).

 	g

 	g 

k �


k
7
 n( Immutable messages. " Symmetric message 

 n

 n&'
 
o(" Symmetric message 

o

o&'
 
p(" Symmetric message 

p

p&'
 
q(" Symmetric message 

q

q&'
 
r(" Symmetric message 

r

r&'
J
u(  Switch configuration messages. " Controller/switch message 

u

u&'
(
v(" Controller/switch message 

v

v&'
(
w(" Controller/switch message 

w

w&'
(
x(" Controller/switch message 

x

x&'
(
	y(" Controller/switch message 

	y

	y&'
6

|) Asynchronous messages. " Async message 


|


|&(

})" Async message 

}

}&(

~)" Async message 

~

~&(
I
�) Controller command messages. " Controller/switch message 

�

�&(
)
�)" Controller/switch message 

�

�&(
)
�)" Controller/switch message 

�

�&(
)
�)" Controller/switch message 

�

�&(
)
�)" Controller/switch message 

�

�&(
@
�) Multipart messages. " Controller/switch message 

�

�&(
)
�)" Controller/switch message 

�

�&(
>
�) Barrier messages. " Controller/switch message 

�

�&(
)
�)" Controller/switch message 

�

�&(
J
�) Queue Configuration messages. " Controller/switch message 

�!

�&(
)
�)" Controller/switch message 

�

�&(
U
�)* Controller role change request messages. " Controller/switch message 

�

�&(
)
�)" Controller/switch message 

�

�&(
P
�)% Asynchronous message configuration. " Controller/switch message 

�

�&(
)
�)" Controller/switch message 

�

�&(
)
�)" Controller/switch message 

�

�&(
]
�)2 Meters and rate limiters configuration messages. " Controller/switch message 

�

�&(
/
 � �! Header on all OpenFlow packets. 

 �

  �" OFP_VERSION. 

  ��

  �


  �

  �
+
 �" One of the OFPT_ constants. 

 ��

 �

 �

 �
�
 �"r Transaction id associated with this packet.
Replies use the same id as was in the request
to facilitate pairing. 

 ��

 �


 �

 �
%
� � Hello elements types.


�

 �&

 �

 �$%
,
�&" Bitmap of version supported. 

�

�$%
4
� �& Common header for all Hello Elements 

�
 
 �!" One of OFPHET_*. 

 ��

 �

 �

 � 

 ��

 �


�7

�$

�%2

�56
,
� � Version bitmap Hello Element 

�$
4
 � "& List of bitmaps - supported versions 

 �

 �

 �

 �
�
� �� OFPT_HELLO.  This message includes zero or more hello elements having
 variable size. Unknown elements types must be ignored/skipped, to allow
 for future extensions. "ofp_header header;


�
/
 �0 Hello element list " 0 or more 

 �

 �"

 �#+

 �./
6
� �2(#define OFP_DEFAULT_MISS_SEND_LEN   128


�
O
 � Handling of IP fragments. "$ No special handling for fragments. 

 �

 �

�" Drop fragments. 

�

�
7
�") Reassemble (only if OFPC_IP_REASM set). 

�

�
3
�"% Bitmask of flags dealing with frag. 

�

�
%
� � Switch configuration. 

�
<
 �ofp_header header;
" Bitmap of OFPC_* flags. 

 ��

 �


 �

 �
}
�"o Max bytes of packet that datapath
should send to the controller. See
ofp_controller_max_len for valid values.


��

�


�

�
F
� �8 Flags to configure the table. Reserved for future use. 

�

 �

 �

 �

�" Deprecated bits 

�

�
J
� �< Table numbering. Tables can use any number up to OFPT_MAX. 

�

 �

 �

 �
)
� Last usable table number. 

�

�
b
� Fake tables. "D Wildcard table used for table config,
flow stats and flow deletes. 

�

�
9
� �+ Configure/Modify behavior of a flow table 

�
T
 �ofp_header header;
"1 ID of the table, OFPTT_ALL indicates all tables 

 ��

 �


 �

 �
'
�" Bitmap of OFPTC_* flags 

��

�


�

�
7
� �) Capabilities supported by the datapath. 

�

 �

 �

 �
 
�" Flow statistics. 

�

�
!
�" Table statistics. 

�

�
 
�" Port statistics. 

�

�
!
�" Group statistics. 

�

�
,
�" Can reassemble IP fragments. 

�

�
!
�" Queue statistics. 

�

�
0
�"" Switch will block looping ports. 

�

�
�
� �� Flags to indicate behavior of the physical port.  These flags are
 used in ofp_port to describe the current configuration.  They are
 used in the ofp_port_mod message to configure the port's behavior.


�

 �

 �

 �
.
�"  Port is administratively down. 

�

�
2
�"$ Drop all packets received by port. 

�

�
/
�"! Drop packets forwarded to port. 

�

�
4
�"& Do not send packet-in msgs for port. 

�

�
e
� �W Current state of the physical port.  These are not configurable from
 the controller.


�

 �

 �

 �
)
�" No physical link present. 

�

�

�" Port is blocked 

�

�
-
�" Live for Fast Failover Group. 

�

�
:
	� �, Features of ports available in a datapath. 

	�

	 �

	 �

	 �
/
	�"! 10 Mb half-duplex rate support. 

	�

	�
/
	�"! 10 Mb full-duplex rate support. 

	�

	�
0
	�"" 100 Mb half-duplex rate support. 

	�

	�
0
	�"" 100 Mb full-duplex rate support. 

	�

	�
.
	�"  1 Gb half-duplex rate support. 

	�

	�
.
	�"  1 Gb full-duplex rate support. 

	�

	�
/
	�"! 10 Gb full-duplex rate support. 

	�

	�
/
	�"! 40 Gb full-duplex rate support. 

	�

	�
0
		�"" 100 Gb full-duplex rate support. 

		�

		�
.
	
�"  1 Tb full-duplex rate support. 

	
�

	
�
,
	�" Other rate, not in the list. 

	�

	�

	�" Copper medium. 

	�

	�

	�" Fiber medium. 

	�

	�
!
	�" Auto-negotiation. 

	�

	�

	�" Pause. 

	�

	�
!
	�" Asymmetric pause. 

	�

	�
%
� � Description of a port 

�

 �

 ��

 �


 �

 �

� " [OFP_ETH_ALEN];


�

�

�

�

�" Null-terminated 

�� 

�


�

�
(
�" Bitmap of OFPPC_* flags. 

��

�


�

�
(
�" Bitmap of OFPPS_* flags. 

��

�


�

�
�
�] Bitmaps of OFPPF_* that describe features.  All bits zeroed if
 unsupported or unavailable. " Current features. 

��

�


�

�
6
�"( Features being advertised by the port. 

��

�


�

�
/
�"! Features supported by the port. 

��

�


�

�
,
�" Features advertised by peer. 

��

�


�

�
-
	�" Current port bitrate in kbps. 

	��

	�


	�

	�
(

�" Max port bitrate in kbps 


��


�



�


�
 
� � Switch features. 

�
�
 �ofp_header header;
"p Datapath unique ID.  The lower 48-bits are for
a MAC address, while the upper 16-bits are
implementer-defined. 

 ��

 �


 �

 �
-
�" Max packets buffered at once. 

��

�


�

�
7
�") Number of tables supported by datapath. 

��

�


�

�
.
�"  Identify auxiliary connections 

��

�


�

�
B
� Features. "' Bitmap of support "ofp_capabilities". 

��

�


�

�
4

� �& What changed about the physical port 


�
#

 �" The port was added. 


 �


 �
%

�" The port was removed. 


�


�
7

�") Some attribute of the port has changed. 


�


�
6
� �( What changed about the physical device 

�
%
 �" The device connected. 

 �

 �
(
�" The device disconnected. 

�

�
;
� �- A physical port has changed in the datapath 

�
4
 �ofp_header header;
" One of OFPPR_*. 

 ��

 �

 �

 �

�

��

�

�

�
=
	� �/ A physical device has changed in the datapath 

	�
5
	 �%ofp_header header;
" One of OFPDEV_*. 

	 ��

	 �

	 � 

	 �#$
4

� �& Modify behavior of the physical port 


�
!

 �ofp_header header;



 ��


 �



 �


 �


� "[OFP_ETH_ALEN];



�


�


�


�
�

�� The hardware address is not
configurable.  This is used to
sanity-check the request, so it must
be the same as returned in an
ofp_port struct. " Bitmap of OFPPC_* flags. 


�� 


�



�


�
6

�"( Bitmap of OFPPC_* flags to be changed. 


��


�



�


�
U

�"G Bitmap of OFPPF_*.  Zero all bits to prevent
any action taking place. 


��


�



�


�
�
� �� The match type indicates the match structure (set of fields that compose the
 match) in use. The match type is placed in the type field at the beginning
 of all match structures. The "OpenFlow Extensible Match" type corresponds
 to OXM TLV format described below and must be supported by all OpenFlow
 switches. Extensions that define other match types may be published on the
 ONF wiki. Support for extensions is optional.
2" ## -------------------------- ## 2" ## OpenFlow Extensible Match. ## 2" ## -------------------------- ## 

�

 �" Deprecated. 

 �

 �
)
�" OpenFlow Extensible Match 

�

�
-
� � Fields to match against flows 

�

 �" One of OFPMT_* 

 ��

 �

 �

 �

�*" 0 or more 

�

�

�%

�()
�
� �� OXM Class IDs.
 The high order bit differentiate reserved classes from member classes.
 Classes 0x0000 to 0x7FFF are member classes, allocated by ONF.
 Classes 0x8000 to 0xFFFE are reserved classes, reserved for standardisation.
2� Components of a OXM TLV header.
 Those macros are not valid for the experimenter class, macros for the
 experimenter class will depend on the experimenter header used. 2�#define OXM_HEADER__(CLASS, FIELD, HASMASK, LENGTH) \
    (((CLASS) << 16) | ((FIELD) << 9) | ((HASMASK) << 8) | (LENGTH))
#define OXM_HEADER(CLASS, FIELD, LENGTH) \
    OXM_HEADER__(CLASS, FIELD, 0, LENGTH)
#define OXM_HEADER_W(CLASS, FIELD, LENGTH) \
    OXM_HEADER__(CLASS, FIELD, 1, (LENGTH) * 2)
#define OXM_CLASS(HEADER) ((HEADER) >> 16)
#define OXM_FIELD(HEADER) (((HEADER) >> 9) & 0x7f)
#define OXM_TYPE(HEADER) (((HEADER) >> 9) & 0x7fffff)
#define OXM_HASMASK(HEADER) (((HEADER) >> 8) & 1)
#define OXM_LENGTH(HEADER) ((HEADER) & 0xff)

#define OXM_MAKE_WILD_HEADER(HEADER) \
    OXM_HEADER_W(OXM_CLASS(HEADER), OXM_FIELD(HEADER), OXM_LENGTH(HEADER))


�
/
 �#"! Backward compatibility with NXM 

 �

 �"
/
�#"! Backward compatibility with NXM 

�

�"
(
�#" Basic class for OpenFlow 

�

�"
"
�#" Experimenter class 

�

�"
>
� �0 OXM Flow field types for OpenFlow basic class. 

�
"
 �"" Switch input port. 

 �

 � !
+
�"" Switch physical input port. 

�

� !
/
�""! Metadata passed between tables. 

�

� !
-
�"" Ethernet destination address. 

�

� !
(
�"" Ethernet source address. 

�

� !
$
�"" Ethernet frame type. 

�

� !

�""
 VLAN id. 

�

� !

�"" VLAN priority. 

�

� !
.
�""  IP DSCP (6 bits in ToS field). 

�

� !
-
	�"" IP ECN (2 bits in ToS field). 

	�

	� !


�#" IP protocol. 


�


� "
$
�#" IPv4 source address. 

�

� "
)
�#" IPv4 destination address. 

�

� "
 
�#" TCP source port. 

�

� "
%
�#" TCP destination port. 

�

� "
 
�#" UDP source port. 

�

� "
%
�#" UDP destination port. 

�

� "
!
�#" SCTP source port. 

�

� "
&
�#" SCTP destination port. 

�

� "

�#" ICMP type. 

�

� "

�#" ICMP code. 

�

� "

�#" ARP opcode. 

�

� "
(
�#" ARP source IPv4 address. 

�

� "
(
�#" ARP target IPv4 address. 

�

� "
,
�#" ARP source hardware address. 

�

� "
,
�#" ARP target hardware address. 

�

� "
$
�#" IPv6 source address. 

�

� "
)
�#" IPv6 destination address. 

�

� "

�#" IPv6 Flow Label 

�

� "

�#" ICMPv6 type. 

�

� "

�#" ICMPv6 code. 

�

� "
&
�#" Target address for ND. 

�

� "
)
 �#" Source link-layer for ND. 

 �

 � "
)
!�#" Target link-layer for ND. 

!�

!� "

"�#" MPLS label. 

"�

"� "

#�#"
 MPLS TC. 

#�

#� "

$�#" MPLS BoS bit. 

$�

$� "

%�#" PBB I-SID. 

%�

%� "
&
&�#" Logical Port Metadata. 

&�

&� "
2
'�#"$ IPv6 Extension Header pseudo-field 

'�

'� "
%
� � OXM Flow match fields 

�

 � 

 ��

 �

 �

 �

 ��

 �

@
�(2 2 and 3 reserved for NXM_0 and NXM-1 OXM classes 

�

�#

�&'

�:

�"

�#5

�89
.
� �  OXM OpenFlow Basic Match Field 

�

 �!

 ��

 �

 �

 � 

�

��!

�

�	

�

 ��

 �

�
�F#define OXM_OF_IN_PORT    OXM_HEADER  (0x8000, OFPXMT_OFB_IN_PORT, 4)
" Used for OFPXMT_OFB_IN_PORT 2� OpenFlow port on which the packet was received.
 May be a physical port, a logical port, or the reserved port OFPP_LOCAL

 Prereqs: None.

 Format: 32-bit integer in network byte order.

 Masking: Not maskable. 

�

�

�
�
�!K#define OXM_OF_IN_PHY_PORT OXM_HEADER  (0x8000, OFPXMT_OFB_IN_PHY_PORT, 4)
"  Used for OFPXMT_OF_IN_PHY_PORT 2� Physical port on which the packet was received.

 Consider a packet received on a tunnel interface defined over a link
 aggregation group (LAG) with two physical port members.  If the tunnel
 interface is the logical port bound to OpenFlow.  In this case,
 OFPXMT_OF_IN_PORT is the tunnel's port number and OFPXMT_OF_IN_PHY_PORT is
 the physical port number of the LAG on which the tunnel is configured.

 When a packet is received directly on a physical port and not processed by a
 logical port, OFPXMT_OF_IN_PORT and OFPXMT_OF_IN_PHY_PORT have the same
 value.

 This field is usually not available in a regular match and only available
 in ofp_packet_in messages when it's different from OXM_OF_IN_PORT.

 Prereqs: OXM_OF_IN_PORT must be present.

 Format: 32-bit integer in network byte order.

 Masking: Not maskable. 

�

�

� 
�
�"�#define OXM_OF_METADATA   OXM_HEADER  (0x8000, OFPXMT_OFB_METADATA, 8)
#define OXM_OF_METADATA_W OXM_HEADER_W(0x8000, OFPXMT_OFB_METADATA, 8)
" Used for OFPXMT_OFB_METADATA 2n Table metadata.

 Prereqs: None.

 Format: 64-bit integer in network byte order.

 Masking: Arbitrary masks.


�

�

� !
�
��#define OXM_OF_ETH_DST    OXM_HEADER  (0x8000, OFPXMT_OFB_ETH_DST, 6)
#define OXM_OF_ETH_DST_W  OXM_HEADER_W(0x8000, OFPXMT_OFB_ETH_DST, 6)
#define OXM_OF_ETH_SRC    OXM_HEADER  (0x8000, OFPXMT_OFB_ETH_SRC, 6)
#define OXM_OF_ETH_SRC_W  OXM_HEADER_W(0x8000, OFPXMT_OFB_ETH_SRC, 6)
"/ Used for OFPXMT_OFB_ETH_DST (exactly 6 bytes) 2� Source or destination address in Ethernet header.

 Prereqs: None.

 Format: 48-bit Ethernet MAC address.

 Masking: Arbitrary masks. 

�

�

�
=
�"/ Used for OFPXMT_OFB_ETH_SRC (exactly 6 bytes) 

�

�

�
�
�F#define OXM_OF_ETH_TYPE   OXM_HEADER  (0x8000, OFPXMT_OFB_ETH_TYPE,2)
" Used for OFPXMT_OFB_ETH_TYPE 2s Packet's Ethernet type.

 Prereqs: None.

 Format: 16-bit integer in network byte order.

 Masking: Not maskable. 

�

�

�
�
��#define OXM_OF_VLAN_VID   OXM_HEADER  (0x8000, OFPXMT_OFB_VLAN_VID, 2)
#define OXM_OF_VLAN_VID_W OXM_HEADER_W(0x8000, OFPXMT_OFB_VLAN_VID, 2)
" Used for OFPXMT_OFB_VLAN_VID 2�	 802.1Q VID.

 For a packet with an 802.1Q header, this is the VLAN-ID (VID) from the
 outermost tag, with the CFI bit forced to 1. For a packet with no 802.1Q
 header, this has value OFPVID_NONE.

 Prereqs: None.

 Format: 16-bit integer in network byte order with bit 13 indicating
 presence of VLAN header and 3 most-significant bits forced to 0.
 Only the lower 13 bits have meaning.

 Masking: Arbitrary masks.

 This field can be used in various ways:

   - If it is not constrained at all, the nx_match matches packets without
     an 802.1Q header or with an 802.1Q header that has any VID value.

   - Testing for an exact match with 0x0 matches only packets without
     an 802.1Q header.

   - Testing for an exact match with a VID value with CFI=1 matches packets
     that have an 802.1Q header with a specified VID.

   - Testing for an exact match with a nonzero VID value with CFI=0 does
     not make sense.  The switch may reject this combination.

   - Testing with nxm_value=0, nxm_mask=0x0fff matches packets with no 802.1Q
     header or with an 802.1Q header with a VID of 0.

   - Testing with nxm_value=0x1000, nxm_mask=0x1000 matches packets with
     an 802.1Q header that has any VID value.


�

�

�
�
	�G#define OXM_OF_VLAN_PCP   OXM_HEADER  (0x8000, OFPXMT_OFB_VLAN_PCP, 1)
" Used for OFPXMT_OFB_VLAN_PCP 2� 802.1Q PCP.

 For a packet with an 802.1Q header, this is the VLAN-PCP from the
 outermost tag.  For a packet with no 802.1Q header, this has value
 0.

 Prereqs: OXM_OF_VLAN_VID must be different from OFPVID_NONE.

 Format: 8-bit integer with 5 most-significant bits forced to 0.
 Only the lower 3 bits have meaning.

 Masking: Not maskable.


	�

	�

	�
�

�G#define OXM_OF_IP_DSCP     OXM_HEADER  (0x8000, OFPXMT_OFB_IP_DSCP, 1)
" Used for OFPXMT_OFB_IP_DSCP 2� The Diff Serv Code Point (DSCP) bits of the IP header.
 Part of the IPv4 ToS field or the IPv6 Traffic Class field.

 Prereqs: OXM_OF_ETH_TYPE must be either 0x0800 or 0x86dd.

 Format: 8-bit integer with 2 most-significant bits forced to 0.
 Only the lower 6 bits have meaning.

 Masking: Not maskable. 


�


�


�
�
�E#define OXM_OF_IP_ECN     OXM_HEADER  (0x8000, OFPXMT_OFB_IP_ECN, 1)
" Used for OFPXMT_OFB_IP_ECN 2� The ECN bits of the IP header.
 Part of the IPv4 ToS field or the IPv6 Traffic Class field.

 Prereqs: OXM_OF_ETH_TYPE must be either 0x0800 or 0x86dd.

 Format: 8-bit integer with 6 most-significant bits forced to 0.
 Only the lower 2 bits have meaning.

 Masking: Not maskable. 

�

�

�
�
�G#define OXM_OF_IP_PROTO   OXM_HEADER  (0x8000, OFPXMT_OFB_IP_PROTO, 1)
" Used for OFPXMT_OFB_IP_PROTO 2� The "protocol" byte in the IP header.

 Prereqs: OXM_OF_ETH_TYPE must be either 0x0800 or 0x86dd.

 Format: 8-bit integer.

 Masking: Not maskable. 

�

�

�
�
��#define OXM_OF_IPV4_SRC     OXM_HEADER  (0x8000, OFPXMT_OFB_IPV4_SRC, 4)
#define OXM_OF_IPV4_SRC_W   OXM_HEADER_W(0x8000, OFPXMT_OFB_IPV4_SRC, 4)
#define OXM_OF_IPV4_DST     OXM_HEADER  (0x8000, OFPXMT_OFB_IPV4_DST, 4)
#define OXM_OF_IPV4_DST_W   OXM_HEADER_W(0x8000, OFPXMT_OFB_IPV4_DST, 4)
" Used for OFPXMT_OFB_IPV4_SRC 2� The source or destination address in the IP header.

 Prereqs: OXM_OF_ETH_TYPE must match 0x0800 exactly.

 Format: 32-bit integer in network byte order.

 Masking: Arbitrary masks.


�

�

�
,
�" Used for OFPXMT_OFB_IPV4_DST 

�

�

�
�
��#define OXM_OF_TCP_SRC    OXM_HEADER  (0x8000, OFPXMT_OFB_TCP_SRC, 2)
#define OXM_OF_TCP_DST    OXM_HEADER  (0x8000, OFPXMT_OFB_TCP_DST, 2)
" Used for OFPXMT_OFB_TCP_SRC 2� The source or destination port in the TCP header.

 Prereqs:
   OXM_OF_ETH_TYPE must be either 0x0800 or 0x86dd.
   OXM_OF_IP_PROTO must match 6 exactly.

 Format: 16-bit integer in network byte order.

 Masking: Not maskable. 

�

�

�
+
�" Used for OFPXMT_OFB_TCP_DST 

�

�

�
�
��#define OXM_OF_UDP_SRC    OXM_HEADER  (0x8000, OFPXMT_OFB_UDP_SRC, 2)
#define OXM_OF_UDP_DST    OXM_HEADER  (0x8000, OFPXMT_OFB_UDP_DST, 2)
" Used for OFPXMT_OFB_UDP_SRC 2� The source or destination port in the UDP header.

 Prereqs:
   OXM_OF_ETH_TYPE must match either 0x0800 or 0x86dd.
   OXM_OF_IP_PROTO must match 17 exactly.

 Format: 16-bit integer in network byte order.

 Masking: Not maskable. 

�

�

�
+
�" Used for OFPXMT_OFB_UDP_DST 

�

�

�
�
��#define OXM_OF_SCTP_SRC   OXM_HEADER  (0x8000, OFPXMT_OFB_SCTP_SRC, 2)
#define OXM_OF_SCTP_DST   OXM_HEADER  (0x8000, OFPXMT_OFB_SCTP_DST, 2)
" Used for OFPXMT_OFB_SCTP_SRC 2� The source or destination port in the SCTP header.

 Prereqs:
   OXM_OF_ETH_TYPE must match either 0x0800 or 0x86dd.
   OXM_OF_IP_PROTO must match 132 exactly.

 Format: 16-bit integer in network byte order.

 Masking: Not maskable. 

�

�

�
,
�" Used for OFPXMT_OFB_SCTP_DST 

�

�

�
�
� �#define OXM_OF_ICMPV4_TYPE  OXM_HEADER  (0x8000, OFPXMT_OFB_ICMPV4_TYPE, 1)
#define OXM_OF_ICMPV4_CODE  OXM_HEADER  (0x8000, OFPXMT_OFB_ICMPV4_CODE, 1)
"! Used for OFPXMT_OFB_ICMPV4_TYPE 2� The type or code in the ICMP header.

 Prereqs:
   OXM_OF_ETH_TYPE must match 0x0800 exactly.
   OXM_OF_IP_PROTO must match 1 exactly.

 Format: 8-bit integer.

 Masking: Not maskable. 

�

�

�
/
� "! Used for OFPXMT_OFB_ICMPV4_CODE 

�

�

�
�
�E#define OXM_OF_ARP_OP     OXM_HEADER  (0x8000, OFPXMT_OFB_ARP_OP, 2)
" Used for OFPXMT_OFB_ARP_OP 2� ARP opcode.

 For an Ethernet+IP ARP packet, the opcode in the ARP header.  Always 0
 otherwise.

 Prereqs: OXM_OF_ETH_TYPE must match 0x0806 exactly.

 Format: 16-bit integer in network byte order.

 Masking: Not maskable. 

�

�

�
�
��#define OXM_OF_ARP_SPA    OXM_HEADER  (0x8000, OFPXMT_OFB_ARP_SPA, 4)
#define OXM_OF_ARP_SPA_W  OXM_HEADER_W(0x8000, OFPXMT_OFB_ARP_SPA, 4)
#define OXM_OF_ARP_TPA    OXM_HEADER  (0x8000, OFPXMT_OFB_ARP_TPA, 4)
#define OXM_OF_ARP_TPA_W  OXM_HEADER_W(0x8000, OFPXMT_OFB_ARP_TPA, 4)
" For OFPXMT_OFB_ARP_SPA 2� For an Ethernet+IP ARP packet, the source or target protocol address
 in the ARP header.  Always 0 otherwise.

 Prereqs: OXM_OF_ETH_TYPE must match 0x0806 exactly.

 Format: 32-bit integer in network byte order.

 Masking: Arbitrary masks.


�

�

�
&
�" For OFPXMT_OFB_ARP_TPA 

�

�

�
�
��#define OXM_OF_ARP_SHA    OXM_HEADER   (0x8000, OFPXMT_OFB_ARP_SHA, 6)
#define OXM_OF_ARP_SHA_W  OXM_HEADER_W (0x8000, OFPXMT_OFB_ARP_SHA, 6)
#define OXM_OF_ARP_THA    OXM_HEADER   (0x8000, OFPXMT_OFB_ARP_THA, 6)
#define OXM_OF_ARP_THA_W  OXM_HEADER_W (0x8000, OFPXMT_OFB_ARP_THA, 6)
"" For OFPXMT_OFB_ARP_SHA (6 bytes) 2� For an Ethernet+IP ARP packet, the source or target hardware address
 in the ARP header.  Always 0 otherwise.

 Prereqs: OXM_OF_ETH_TYPE must match 0x0806 exactly.

 Format: 48-bit Ethernet MAC address.

 Masking: Not maskable. 

�

�

�
0
�"" For OFPXMT_OFB_ARP_THA (6 bytes) 

�

�

�
�
��#define OXM_OF_IPV6_SRC    OXM_HEADER  (0x8000, OFPXMT_OFB_IPV6_SRC, 16)
#define OXM_OF_IPV6_SRC_W  OXM_HEADER_W(0x8000, OFPXMT_OFB_IPV6_SRC, 16)
#define OXM_OF_IPV6_DST    OXM_HEADER  (0x8000, OFPXMT_OFB_IPV6_DST, 16)
#define OXM_OF_IPV6_DST_W  OXM_HEADER_W(0x8000, OFPXMT_OFB_IPV6_DST, 16)
" For OFPXMT_OFB_IPV6_SRC 2� The source or destination address in the IPv6 header.

 Prereqs: OXM_OF_ETH_TYPE must match 0x86dd exactly.

 Format: 128-bit IPv6 address.

 Masking: Arbitrary masks.


�

�

�
'
�" For OFPXMT_OFB_IPV6_DST 

�

�

�
�
� �#define OXM_OF_IPV6_FLABEL   OXM_HEADER  (0x8000, OFPXMT_OFB_IPV6_FLABEL, 4)
#define OXM_OF_IPV6_FLABEL_W OXM_HEADER_W(0x8000, OFPXMT_OFB_IPV6_FLABEL, 4)
" For OFPXMT_OFB_IPV6_FLABEL 2� The IPv6 Flow Label

 Prereqs:
   OXM_OF_ETH_TYPE must match 0x86dd exactly

 Format: 32-bit integer with 12 most-significant bits forced to 0.
 Only the lower 20 bits have meaning.

 Masking: Arbitrary masks.


�

�

�
�
� �#define OXM_OF_ICMPV6_TYPE OXM_HEADER  (0x8000, OFPXMT_OFB_ICMPV6_TYPE, 1)
#define OXM_OF_ICMPV6_CODE OXM_HEADER  (0x8000, OFPXMT_OFB_ICMPV6_CODE, 1)
" For OFPXMT_OFB_ICMPV6_TYPE 2� The type or code in the ICMPv6 header.

 Prereqs:
   OXM_OF_ETH_TYPE must match 0x86dd exactly.
   OXM_OF_IP_PROTO must match 58 exactly.

 Format: 8-bit integer.

 Masking: Not maskable. 

�

�

�
*
 � " For OFPXMT_OFB_ICMPV6_CODE 

 �

 �

 �
�
!�"W#define OXM_OF_IPV6_ND_TARGET OXM_HEADER \
    (0x8000, OFPXMT_OFB_IPV6_ND_TARGET, 16)
" For OFPXMT_OFB_IPV6_ND_TARGET 2� The target address in an IPv6 Neighbor Discovery message.

 Prereqs:
   OXM_OF_ETH_TYPE must match 0x86dd exactly.
   OXM_OF_IP_PROTO must match 58 exactly.
   OXM_OF_ICMPV6_TYPE must be either 135 or 136.

 Format: 128-bit IPv6 address.

 Masking: Not maskable. 

!�

!�

!�!
�
"�L#define OXM_OF_IPV6_ND_SLL  OXM_HEADER  (0x8000, OFPXMT_OFB_IPV6_ND_SLL, 6)
" For OFPXMT_OFB_IPV6_ND_SLL 2� The source link-layer address option in an IPv6 Neighbor Discovery
 message.

 Prereqs:
   OXM_OF_ETH_TYPE must match 0x86dd exactly.
   OXM_OF_IP_PROTO must match 58 exactly.
   OXM_OF_ICMPV6_TYPE must be exactly 135.

 Format: 48-bit Ethernet MAC address.

 Masking: Not maskable. 

"�

"�

"�
�
#�L#define OXM_OF_IPV6_ND_TLL  OXM_HEADER  (0x8000, OFPXMT_OFB_IPV6_ND_TLL, 6)
" For OFPXMT_OFB_IPV6_ND_TLL 2� The target link-layer address option in an IPv6 Neighbor Discovery
 message.

 Prereqs:
   OXM_OF_ETH_TYPE must match 0x86dd exactly.
   OXM_OF_IP_PROTO must match 58 exactly.
   OXM_OF_ICMPV6_TYPE must be exactly 136.

 Format: 48-bit Ethernet MAC address.

 Masking: Not maskable. 

#�

#�

#�
�
$�J#define OXM_OF_MPLS_LABEL  OXM_HEADER  (0x8000, OFPXMT_OFB_MPLS_LABEL, 4)
" For OFPXMT_OFB_MPLS_LABEL 2� The LABEL in the first MPLS shim header.

 Prereqs:
   OXM_OF_ETH_TYPE must match 0x8847 or 0x8848 exactly.

 Format: 32-bit integer in network byte order with 12 most-significant
 bits forced to 0. Only the lower 20 bits have meaning.

 Masking: Not maskable. 

$�

$�

$�
�
%�G#define OXM_OF_MPLS_TC     OXM_HEADER  (0x8000, OFPXMT_OFB_MPLS_TC, 1)
" For OFPXMT_OFB_MPLS_TC 2� The TC in the first MPLS shim header.

 Prereqs:
   OXM_OF_ETH_TYPE must match 0x8847 or 0x8848 exactly.

 Format: 8-bit integer with 5 most-significant bits forced to 0.
 Only the lower 3 bits have meaning.

 Masking: Not maskable. 

%�

%�

%�
�
&�I#define OXM_OF_MPLS_BOS     OXM_HEADER  (0x8000, OFPXMT_OFB_MPLS_BOS, 1)
" For OFPXMT_OFB_MPLS_BOS 2� The BoS bit in the first MPLS shim header.

 Prereqs:
   OXM_OF_ETH_TYPE must match 0x8847 or 0x8848 exactly.

 Format: 8-bit integer with 7 most-significant bits forced to 0.
 Only the lowest bit have a meaning.

 Masking: Not maskable. 

&�

&�

&�
�
'��#define OXM_OF_PBB_ISID   OXM_HEADER  (0x8000, OFPXMT_OFB_PBB_ISID, 3)
#define OXM_OF_PBB_ISID_W OXM_HEADER_W(0x8000, OFPXMT_OFB_PBB_ISID, 3)
" For OFPXMT_OFB_PBB_ISID 2� IEEE 802.1ah I-SID.

 For a packet with a PBB header, this is the I-SID from the
 outermost service tag.

 Prereqs:
   OXM_OF_ETH_TYPE must match 0x88E7 exactly.

 Format: 24-bit integer in network byte order.

 Masking: Arbitrary masks. 

'�

'�

'�
�
(��#define OXM_OF_TUNNEL_ID    OXM_HEADER  (0x8000, OFPXMT_OFB_TUNNEL_ID, 8)
#define OXM_OF_TUNNEL_ID_W  OXM_HEADER_W(0x8000, OFPXMT_OFB_TUNNEL_ID, 8)
" For OFPXMT_OFB_TUNNEL_ID 2� Logical Port Metadata.

 Metadata associated with a logical port.
 If the logical port performs encapsulation and decapsulation, this
 is the demultiplexing field from the encapsulation header.
 For example, for a packet received via GRE tunnel including a (32-bit) key,
 the key is stored in the low 32-bits and the high bits are zeroed.
 For a MPLS logical port, the low 20 bits represent the MPLS Label.
 For a VxLAN logical port, the low 24 bits represent the VNI.
 If the packet is not received through a logical port, the value is 0.

 Prereqs: None.

 Format: 64-bit integer in network byte order.

 Masking: Arbitrary masks. 

(�

(�

(�
�
)� �#define OXM_OF_IPV6_EXTHDR   OXM_HEADER  (0x8000, OFPXMT_OFB_IPV6_EXTHDR, 2)
#define OXM_OF_IPV6_EXTHDR_W OXM_HEADER_W(0x8000, OFPXMT_OFB_IPV6_EXTHDR, 2)
" For OFPXMT_OFB_IPV6_EXTHDR 2� The IPv6 Extension Header pseudo-field.

 Prereqs:
   OXM_OF_ETH_TYPE must match 0x86dd exactly

 Format: 16-bit integer with 7 most-significant bits forced to 0.
 Only the lower 9 bits have meaning.

 Masking: Maskable. 

)�

)�

)�
M
��= Optional mask values (must be present when has_mask is true 

�

'
*�)" For OFPXMT_OFB_METADATA 

*�

*�"

*�%(
7
+�!") For OFPXMT_OFB_ETH_DST (exactly 6 bytes)

+�

+�

+� 
7
,�!") For OFPXMT_OFB_ETH_SRC (exactly 6 bytes)

,�

,�

,� 
'
-�#" For OFPXMT_OFB_VLAN_VID 

-�

-�

-�"
'
.�#" For OFPXMT_OFB_IPV4_SRC 

.�

.�

.�"
'
/�#" For OFPXMT_OFB_IPV4_DST 

/�

/�

/�"
&
0�"" For OFPXMT_OFB_ARP_SPA 

0�

0�

0�!
&
1�"" For OFPXMT_OFB_ARP_TPA 

1�

1�

1�!
'
2�"" For OFPXMT_OFB_IPV6_SRC 

2�

2�

2�!
'
3�"" For OFPXMT_OFB_IPV6_DST 

3�

3�

3�!
*
4�&" For OFPXMT_OFB_IPV6_FLABEL 

4�

4�

4�"%
'
5�#" For OFPXMT_OFB_PBB_ISID 

5�

5�

5�"
(
6�$" For OFPXMT_OFB_TUNNEL_ID 

6�

6�

6� #
*
7�&" For OFPXMT_OFB_IPV6_EXTHDR 

7�

7�

7�"%
i
� �[ The VLAN id is 12-bits, so we can use the entire 16 bits to indicate
 special conditions.


�
#
 �" No VLAN id was set. 

 �

 �
7
�") Bit that indicate that a VLAN id is set 

�

�
p
� �9 Bit definitions for IPv6 Extension Header pseudo-field. 2'#define OFP_VLAN_NONE      OFPVID_NONE


�

 �

 �

 �
-
�" "No next header" encountered. 

�

�
5
�"' Encrypted Sec Payload header present. 

�

�
.
�"  Authentication header present. 

�

�
,
�" 1 or 2 dest headers present. 

�

�
(
�" Fragment header present. 

�

�
&
�" Router header present. 

�

�
*
�" Hop-by-hop header present. 

�

�
/
�"! Unexpected repeats encountered. 

�

�
2
	�"$ Unexpected sequencing encountered. 

	�

	�
�
� �� Header for OXM experimenter match fields.
 The experimenter class should not use OXM_HEADER() macros for defining
 fields due to this extra header. 

�"
/
 �"! oxm_class = OFPXMC_EXPERIMENTER 

 ��$

 �


 �

 �
_
�"Q Experimenter ID which takes the same
form as in struct ofp_experimenter_header. 

��

�


�

�
]
� �2 ## ----------------- ## 2 ## OpenFlow Actions. ## 2 ## ----------------- ## 

�
&
 �" Output to switch port. 

 �

 �
J
�"< Copy TTL "outwards" -- from next-to-outermost
to outermost 

�

�
I
�"; Copy TTL "inwards" -- from outermost to
next-to-outermost 

�

�

�"
 MPLS TTL 

�

�
"
�" Decrement MPLS TTL 

�

�
#
�" Push a new VLAN tag 

�

�
&
�" Pop the outer VLAN tag 

�

�
#
�" Push a new MPLS tag 

�

�
&
�" Pop the outer MPLS tag 

�

�
6
	�"( Set queue id when outputting to a port 

	�

	�


�" Apply group. 


�


�

�"	 IP TTL. 

�

�
!
�" Decrement IP TTL. 

�

�
8
�"* Set a header field using OXM TLV format. 

�

�
2
�"$ Push a new PBB service tag (I-TAG) 

�

�
5
�"' Pop the outer PBB service tag (I-TAG) 

�

�

� 

�

�
�
� �� Action header that is common to all actions.  The length includes the
 header and any padding used to make the action 64-bit aligned.
 NB: The length of an action *must* always be a multiple of eight. 

�

 �" One of OFPAT_*. 

 ��

 �

 �

 �

 ��

 �


�%

�

� 

�#$

�)

�

�$

�'(

�!

�

�

� 

�)

�

�$

�'(

�#

�

�

�!"

�%

�

� 

�#$

�+

�

�&

�)*

�1

�

� ,

�/0

� �

�

 �

 �

 �
Z
�"L maximum max_len value which can be used
to request a specific byte length. 

�

�
s
�"e indicates that no buffering should be
applied and the whole packet is to be
sent to the controller. 

�

�
�
� �� Action structure for OFPAT_OUTPUT, which sends packets out 'port'.
 When the 'port' is the OFPP_CONTROLLER, 'max_len' indicates the max
 number of bytes to send.  A 'max_len' of zero means no bytes of the
 packet should be sent. A 'max_len' of OFPCML_NO_BUFFER means that
 the packet is not buffered and the complete packet is to be sent to
 the controller. 

�

 �" Output port. 

 ��

 �


 �

 �
1
�"# Max length to send to controller. 

��

�


�

�
8
� �* Action structure for OFPAT_SET_MPLS_TTL. 

�

 �"
 MPLS TTL 

 ��

 �


 �

 �
>
� �0 Action structure for OFPAT_PUSH_VLAN/MPLS/PBB. 

�

 �" Ethertype 

 ��

 �


 �

 �
4
� �& Action structure for OFPAT_POP_MPLS. 

�

 �" Ethertype 

 ��

 �


 �

 �
1
� �# Action structure for OFPAT_GROUP. 

�
!
 �" Group identifier. 

 ��

 �


 �

 �
6
� �( Action structure for OFPAT_SET_NW_TTL. 

�

 �" IP TTL 

 ��

 �


 �

 �
5
� �' Action structure for OFPAT_SET_FIELD. 

�

 �

 ��

 �

 �

 �
d
� �V Action header for OFPAT_EXPERIMENTER.
 The rest of the body is experimenter-defined. 

�
_
 �"Q Experimenter ID which takes the same
form as in struct
ofp_experimenter_header. 

 ��!

 �


 �

 �

�

��

�	

�


�
l
� �2 ## ---------------------- ## 2 ## OpenFlow Instructions. ## 2 ## ---------------------- ## 

�

 �

 �

 �
;
�"- Setup the next table in the lookup
pipeline 

�

�
B
�"4 Setup the metadata field for use later in
pipeline 

�

�
@
�"2 Write the action(s) onto the datapath action
set 

�

�
1
�"# Applies the action(s) immediately 

�

�
?
�"1 Clears all actions from the datapath
action set 

�

�
*
�" Apply meter (rate limiter) 

�

�
(
� " Experimenter instruction 

�

�
�
� �� Instruction header that is common to all instructions.  The length includes
 the header and any padding used to make the instruction 64-bit aligned.
 NB: The length of an instruction *must* always be a multiple of eight. 

�
 
 �" Instruction type 

 ��

 �


 �

 �

 ��

 �


�2

�"

�#-

�01

�:

�&

�'5

�89

�,

�

� '

�*+

�(

�

�#

�&'

�6

�$

�%1

�45
:
� �, Instruction structure for OFPIT_GOTO_TABLE 

�"
5
 �"' Set next table in the lookup pipeline 

 ��$

 �


 �

 �
>
� �0 Instruction structure for OFPIT_WRITE_METADATA 

�&
'
 �" Metadata value to write 

 ��(

 �


 �

 �
&
�" Metadata write bitmask 

��

�


�

�
I
� �	; Instruction structure for OFPIT_WRITE/APPLY/CLEAR_ACTIONS 

�
]
 �$"O 0 or more actions associated
with OFPIT_WRITE_ACTIONS and
OFPIT_APPLY_ACTIONS 

 �

 �

 �

 �"#
5
�	 �	' Instruction structure for OFPIT_METER 

�	

 �	" Meter instance. 

 �	�	

 �	


 �	

 �	
C
�	 �	5 Instruction structure for experimental instructions 

�	$
_
 �	"Q Experimenter ID which takes the same form
as in struct ofp_experimenter_header. 

 �	�	&

 �	


 �	

 �	
?
�	1 Experimenter-defined arbitrary additional data. 

�	�	

�		

�	


�	
{
�	 �	2# ## --------------------------- ## 2# ## OpenFlow Flow Modification. ## 2# ## --------------------------- ## 

�	

 �	" New flow. 

 �	

 �	
*
�	" Modify all matching flows. 

�	

�	
F
�	"8 Modify entry strictly matching wildcards and
priority. 

�	

�	
*
�	" Delete all matching flows. 

�	

�	
F
�	"8 Delete entry strictly matching wildcards and
priority. 

�	

�	
�
�	 �	2[ Value used in "idle_timeout" and "hard_timeout" to indicate that the entry
 is permanent. 2#define OFP_FLOW_PERMANENT 0
2. By default, choose a priority in the middle. 2$#define OFP_DEFAULT_PRIORITY 0x8000


�	

 �	

 �	

 �	
K
�	"= Send flow removed message when flow
 expires or is deleted. 

�	

�	
4
�	"& Check for overlapping entries first. 

�	

�	
2
�	"$ Reset flow packet and byte counts. 

�	

�	
1
�	"# Don't keep track of packet count. 

�	

�	
/
�	"! Don't keep track of byte count. 

�	

�	
A
�	 �	3 Flow setup and teardown (controller -> datapath). 

�	
I
 �	ofp_header header;
"& Opaque controller-issued identifier. 

 �	�	

 �	


 �	

 �	
�
�	"� Mask used to restrict the cookie bits
that must match when the command is
OFPFC_MODIFY* or OFPFC_DELETE*. A value
of 0 indicates no restriction. 

�	�	

�	


�	

�	
�
�	"� ID of the table to put the flow in.
For OFPFC_DELETE_* commands, OFPTT_ALL
can also be used to delete matching
flows from all tables. 

�	�	

�	


�	

�	

�	%" One of OFPFC_*. 

�	�	

�	

�	 

�	#$
6
�	"( Idle time before discarding (seconds). 

�	�	%

�	


�	

�	
5
�	"' Max time before discarding (seconds). 

�	�	

�	


�	

�	
-
�	" Priority level of flow entry. 

�	�	

�	


�	

�	
`
�	"R Buffered packet to apply to, or
OFP_NO_BUFFER.
Not meaningful for OFPFC_DELETE*. 

�	�	

�	


�	

�	
�
�	"� For OFPFC_DELETE* commands, require
matching entries to include this as an
output port.  A value of OFPP_ANY
indicates no restriction. 

�	�	

�	


�	

�	
�
	�	"� For OFPFC_DELETE* commands, require
matching entries to include this as an
output group.  A value of OFPG_ANY
indicates no restriction. 

	�	�	

	�	


	�	

	�	
(

�	" Bitmap of OFPFF_* flags. 


�	�	


�	



�	


�	
/
�	"! Fields to match. Variable size. 

�	�	

�	

�	

�	

�	/" 0 or more. 

�	

�	

�	)

�	,.
J
�	 �	< Group numbering. Groups can use any number up to OFPG_MAX. 

�	

 �	

 �	

 �	
)
�	! Last usable group number. 

�	

�	 
P
�	! Fake groups. "2 Represents all groups for group delete
commands. 

�	

�	 
5
�	!"' Special wildcard: no group specified. 

�	

�	 

�	 �	 Group commands 

�	

 �	" New group. 

 �	

 �	
+
�	" Modify all matching groups. 

�	

�	
+
�	" Delete all matching groups. 

�	

�	
)
�	 �	 Bucket for use in groups. 

�	
K
 �	"= Relative weight of bucket.  Only
defined for select groups. 

 �	�	

 �	


 �	

 �	
n
�	"` Port whose state affects whether this
bucket is live.  Only required for fast
failover groups. 

�	�	

�	


�	

�	
o
�	"a Group whose state affects whether this
bucket is live.  Only required for fast
failover groups. 

�	�	

�	


�	

�	

�	$

�	

�	

�	

�	"#
B
 �	 �	4 Group setup and teardown (controller -> datapath). 

 �	
4
  �	&ofp_header header;
" One of OFPGC_*. 

  �	�	

  �	

  �	!

  �	$%

 �	" One of OFPGT_*. 

 �	�	&

 �	

 �	

 �	
!
 �	" Group identifier. 

 �	�	

 �	


 �	

 �	

 �	$

 �	

 �	

 �	

 �	"#
`
�	 �
R Group types.  Values in the range [128; 255] are reserved for experimental
 use. 

�	
1
 �	"# All (multicast/broadcast) group.  

 �	

 �	

�	" Select group. 

�	

�	

�	" Indirect group. 

�	

�	
$
�	" Fast failover group. 

�	

�	
�
!�
 �
' Send packet (controller -> datapath). 2+ Special buffer-id to indicate 'no buffer' 2!#define OFP_NO_BUFFER 0xffffffff


!�

U
! �
ofp_header header;
"2 ID assigned by datapath (OFP_NO_BUFFER
if none). 

! �
�


! �



! �


! �

6
!�
"( Packet's input port or OFPP_CONTROLLER.

!�
�


!�



!�


!�

(
!�
$" Action list - 0 or more. 

!�


!�


!�


!�
"#
�
!�
� The variable size action list is optionally followed by packet data.
 This data is only present and meaningful if buffer_id == -1. " Packet data. 

!�
�
$

!�
	

!�



!�

@
�
 �
2 Why is this packet being sent to the controller? 

�

9
 �
"+ No matching flow (table-miss flow entry). 

 �


 �

7
�
") Action explicitly output to controller. 

�


�

&
�
" Packet has invalid TTL 

�


�

A
"�
 �
3 Packet received on port (datapath -> controller). 

"�

=
" �
ofp_header header;
" ID assigned by datapath. 

" �
�


" �



" �


" �

+
"�
$" Reason packet is being sent 

"�
�


"�


"�


"�
"#
2
"�
"$ ID of the table that was looked up 

"�
�
$

"�



"�


"�

<
"�
". Cookie of the flow entry that was looked up. 

"�
�


"�



"�


"�

/
"�
"! Packet metadata. Variable size. 

"�
�


"�


"�


"�


"�
" Ethernet frame 

"�
�


"�
	

"�



"�

*
�
 �
 Why was this flow removed? 

�

5
 �
"' Flow idle time exceeded idle_timeout. 

 �


 �

+
�
" Time exceeded hard_timeout. 

�


�

-
�
" Evicted by a DELETE flow mod. 

�


�

"
�
" Group was removed. 

�


�

!
�
" Meter was removed 

�


�

6
#�
 �
( Flow removed (datapath -> controller). 

#�

I
# �
ofp_header header;
"& Opaque controller-issued identifier. 

# �
�


# �



# �


# �

-
#�
" Priority level of flow entry. 

#�
�


#�



#�


#�


#�
'" One of OFPRR_*. 

#�
�


#�


#�
"

#�
%&

#�
" ID of the table 

#�
�
'

#�



#�


#�

/
#�
"! Time flow was alive in seconds. 

#�
�


#�



#�


#�

G
#�
"9 Time flow was alive in nanoseconds beyond
duration_sec. 

#�
�


#�



#�


#�

4
#�
"& Idle timeout from original flow mod. 

#�
�


#�



#�


#�

4
#�
"& Hard timeout from original flow mod. 

#�
�


#�



#�


#�


#�


#�
�


#�



#�


#�


#	�


#	�
�


#	�



#	�


#	�

5
#
�
"' Description of fields. Variable size. 

#
�
�


#
�


#
�


#
�

O
�
 �
A Meter numbering. Flow meters can use any number up to OFPM_MAX. 

�


 �


 �


 �

"
�
! Last usable meter. 

�


�
 
;
�
! Virtual meters. " Meter for slow datapath. 

�


�
 
0
�
!"" Meter for controller connection. 

�


�
 
A
�
!"3 Represents all meters for stat requests
commands. 

�


�
 
 
�
 �
 Meter band types 

�


 �


 �


 �


�
" Drop packet. 

�


�

-
�
" Remark DSCP in the IP header. 

�


�

(
�
$" Experimenter meter band. 

�


�
#
1
$�
 �
# Common header for all meter bands 

$�

 
$ �
!" One of OFPMBT_*. 

$ �
�


$ �


$ �


$ �
 
#
$�
!" Rate for this band. 

$�
�
!

$�



$�


$�
 

$�
'" Size of bursts. 

$�
�
!

$�



$�
"

$�
%&

$ �
�


$ �



$�
%

$�


$�
 

$�
#$

$�
3

$�
"

$�
#.

$�
12

$�
5

$�
#

$�
$0

$�
34
?
%�
 �
! OFPMBT_DROP band - drop packets "Empty payload


%�

F
&�
 �
8 OFPMBT_DSCP_REMARK band - Remark DSCP in the IP header 

&�
"
7
& �
!") Number of drop precedence level to add. 

& �
�
$

& �



& �


& �
 
l
'�
 �
^ OFPMBT_EXPERIMENTER band - Experimenter type.
 The rest of the band is experimenter-defined. 

'�
#
_
' �
)"Q Experimenter ID which takes the
same form as in struct
ofp_experimenter_header. 

' �
�
%

' �



' �
$

' �
'(

�
 �
 Meter commands 

�


 �
" New meter. 

 �


 �

'
�
" Modify specified meter. 

�


�

'
�
" Delete specified meter. 

�


�

)
�
 � Meter configuration flags 

�


 �


 �


 �

9
�
"+ Rate value in kb/s (kilo-bit per second). 

�


�

)
�
" Rate value in packet/sec. 

�


�


�
" Do burst size. 

�


�

#
�
" Collect statistics. 

�


�

4
(� �& Meter configuration. OFPT_METER_MOD. 

(�

( �&" One of OFPMC_*. 

( ��

( �

( �!

( �$%
(
(�$" Bitmap of OFPMF_* flags. 

(��&

(�


(�

(�"#

(�'" Meter instance. 

(��$

(�


(�"

(�%&
U
(�-"G The band list length is
inferred from the length field
in the header. 

(�

(�"

(�#(

(�+,
�
� �� Values for 'type' in ofp_error_message.  These values are immutable: they
 will not change in future versions of the protocol (although new values may
 be added). 

�
&
 �#" Hello protocol failed. 

 �

 �!"
+
�#" Request was not understood. 

�

�!"
,
�#" Error in action description. 

�

�!"
*
�#" Error in instruction list. 

�

�!"

�#" Error in match. 

�

�!"
-
�#" Problem modifying flow entry. 

�

�!"
.
�#"  Problem modifying group entry. 

�

�!"
(
�#" Port mod request failed. 

�

�!"
)
�#" Table mod request failed. 

�

�!"
'
	�#" Queue operation failed. 

	�

	�!"
-

�$" Switch config request failed. 


�


�!#
/
�$"! Controller Role request failed. 

�

�!#

�$" Error in meter. 

�

�!#
.
�%"  Setting table features failed. 

�

�"$
,
� " Experimenter error messages. 

�

�
�
 � �{ ofp_error_msg 'code' values for OFPET_HELLO_FAILED.  'data' contains an
 ASCII text string that may give failure details. 

 �
&
  �" No compatible version. 

  �

  �
"
 �" Permissions error. 

 �

 �
�
!� �y ofp_error_msg 'code' values for OFPET_BAD_REQUEST.  'data' contains at least
 the first 64 bytes of the failed request. 

!�
1
! � "# ofp_header.version not supported. 

! �

! �
.
!� "  ofp_header.type not supported. 

!�

!�
9
!� "+ ofp_multipart_request.type not supported.


!�

!�
~
!� "p Experimenter id not supported
 (in ofp_experimenter_header or
 ofp_multipart_request or
 ofp_multipart_reply). 

!�

!�
0
!� "" Experimenter type not supported. 

!�

!�
"
!� " Permissions error. 

!�

!�
.
!� "  Wrong request length for type. 

!�

!�
7
!� ") Specified buffer has already been used. 

!�

!�
0
!� "" Specified buffer does not exist. 

!�

!�
>
!	� "0 Specified table-id invalid or does not
 exist. 

!	�

!	�
3
!
�!"% Denied because controller is slave. 

!
�

!
� 

!�!" Invalid port. 

!�

!� 
-
!�!" Invalid packet in packet-out. 

!�

!� 
E
!�-"7 ofp_multipart_request
overflowed the assigned buffer. 

!�$

!�*,
�
"� �x ofp_error_msg 'code' values for OFPET_BAD_ACTION.  'data' contains at least
 the first 64 bytes of the failed request. 

"�
3
" �""% Unknown or unsupported action type. 

" �

" � !
*
"�"" Length problem in actions. 

"�

"� !
2
"�""$ Unknown experimenter id specified. 

"�

"� !
3
"�""% Unknown action for experimenter id. 

"�

"� !
/
"�""! Problem validating output port. 

"�

"� !
$
"�"" Bad action argument. 

"�

"� !
"
"�"" Permissions error. 

"�

"� !
/
"�""! Can't handle this many actions. 

"�

"� !
0
"�""" Problem validating output queue. 

"�

"� !
3
"	�""% Invalid group id in forward action. 

"	�

"	� !
U
"
�#"G Action can't apply for this match,
or Set-Field missing prerequisite. 

"
�

"
� "
_
"�#"Q Action order is unsupported for the
action list in an Apply-Actions instruction 

"�

"� "
6
"�#"( Actions uses an unsupported
tag/encap. 

"�

"� "
5
"�#"' Unsupported type in SET_FIELD action. 

"�

"� "
3
"�#"% Length problem in SET_FIELD action. 

"�

"� "
1
"�#"# Bad argument in SET_FIELD action. 

"�

"� "
�
#� �} ofp_error_msg 'code' values for OFPET_BAD_INSTRUCTION.  'data' contains at
 least the first 64 bytes of the failed request. 

#�
$
# � " Unknown instruction. 

# �

# �
A
#� "3 Switch or table does not support the
instruction. 

#�

#�
+
#� " Invalid Table-ID specified. 

#�

#�
7
#� ") Metadata value unsupported by datapath. 

#�

#�
<
#�#". Metadata mask value unsupported by
datapath. 

#�

#�!"
2
#� "$ Unknown experimenter id specified. 

#�

#�
8
#� "* Unknown instruction for experimenter id. 

#�

#�
/
#� "! Length problem in instructions. 

#�

#�
"
#� " Permissions error. 

#�

#�
�
$� �w ofp_error_msg 'code' values for OFPET_BAD_MATCH.  'data' contains at least
 the first 64 bytes of the failed request. 

$�
=
$ � "/ Unsupported match type specified by the
match 

$ �

$ �
(
$� " Length problem in match. 

$�

$�
4
$� "& Match uses an unsupported tag/encap. 

$�

$�
i
$� "[ Unsupported datalink addr mask - switch
does not support arbitrary datalink
address mask. 

$�

$�
g
$� "Y Unsupported network addr mask - switch
does not support arbitrary network
address mask. 

$�

$�
Q
$� "C Unsupported combination of fields masked
or omitted in the match. 

$�

$�
4
$� "& Unsupported field type in the match. 

$�

$�
3
$� "% Unsupported value in a match field. 

$�

$�
_
$� "Q Unsupported mask specified in the match,
field is not dl-address or nw-address. 

$�

$�
+
$	� " A prerequisite was not met. 

$	�

$	�
,
$
�!" A field type was duplicated. 

$
�

$
� 
"
$�!" Permissions error. 

$�

$� 
�
%� �} ofp_error_msg 'code' values for OFPET_FLOW_MOD_FAILED.  'data' contains
 at least the first 64 bytes of the failed request. 

%�
"
% �" Unspecified error. 

% �

% �
6
%�"( Flow not added because table was full. 

%�

%�
$
%�" Table does not exist 

%�

%�
N
%�"@ Attempted to add overlapping flow with
CHECK_OVERLAP flag set. 

%�

%�
"
%�" Permissions error. 

%�

%�
H
%�": Flow not added because of unsupported
idle/hard timeout. 

%�

%�
/
%�"! Unsupported or unknown command. 

%�

%�
-
%�" Unsupported or unknown flags. 

%�

%�
�
&� �~ ofp_error_msg 'code' values for OFPET_GROUP_MOD_FAILED.  'data' contains
 at least the first 64 bytes of the failed request. 

&�
b
& �%"T Group not added because a group ADD
attempted to replace an
already-present group. 

& �

& �#$
C
&�%"5 Group not added because Group
specified is invalid. 

&�

&�#$
P
&�%"B Switch does not support unequal load
sharing with select groups. 

&�

&�#$
(
&�%" The group table is full. 

&�

&�#$
S
&�%"E The maximum number of action buckets
for a group has been exceeded. 

&�

&�#$
F
&�%"8 Switch does not support groups that
forward to groups. 

&� 

&�#$
P
&�%"B This group cannot watch the
watch_port or watch_group specified.


&�

&�#$
/
&�%"! Group entry would cause a loop. 

&�

&�#$
c
&�%"U Group not modified because a group
MODIFY attempted to modify a
non-existent group. 

&�

&�#$
L
&	�%"> Group not deleted because another
group is forwarding to it. 

&	�

&	�#$
2
&
�&"$ Unsupported or unknown group type. 

&
�

&
�#%
/
&�&"! Unsupported or unknown command. 

&�

&�#%
 
&�&" Error in bucket. 

&�

&�#%
*
&�&" Error in watch port/group. 

&�

&�#%
"
&�&" Permissions error. 

&�

&�#%
�
'� �} ofp_error_msg 'code' values for OFPET_PORT_MOD_FAILED.  'data' contains
 at least the first 64 bytes of the failed request. 

'�
5
' �"' Specified port number does not exist. 

' �

' �
K
'�"= Specified hardware address does not
 match the port number. 

'�

'�
,
'�" Specified config is invalid. 

'�

'�
/
'�"! Specified advertise is invalid. 

'�

'�
"
'�" Permissions error. 

'�

'�
�
(� �~ ofp_error_msg 'code' values for OFPET_TABLE_MOD_FAILED.  'data' contains
 at least the first 64 bytes of the failed request. 

(�
/
( �"! Specified table does not exist. 

( �

( �
,
(�" Specified config is invalid. 

(�

(�
"
(�" Permissions error. 

(�

(�
�
)� �{ ofp_error msg 'code' values for OFPET_QUEUE_OP_FAILED. 'data' contains
 at least the first 64 bytes of the failed request 

)�
6
) �"( Invalid port (or port does not exist). 

) �

) �
%
)�" Queue does not exist. 

)�

)�
"
)�" Permissions error. 

)�

)�
�
*� �� ofp_error_msg 'code' values for OFPET_SWITCH_CONFIG_FAILED. 'data' contains
 at least the first 64 bytes of the failed request. 

*�"
+
* �" Specified flags is invalid. 

* �

* �
)
*�" Specified len is invalid. 

*�

*�
"
*�" Permissions error. 

*�

*�
�
+� �� ofp_error_msg 'code' values for OFPET_ROLE_REQUEST_FAILED. 'data' contains
 at least the first 64 bytes of the failed request. 

+�!
1
+ �"# Stale Message: old generation_id. 

+ �

+ �
3
+�"% Controller role change unsupported. 

+�

+�

+�" Invalid role. 

+�

+�
�
,� �~ ofp_error_msg 'code' values for OFPET_METER_MOD_FAILED.  'data' contains
 at least the first 64 bytes of the failed request. 

,�
"
, �" Unspecified error. 

, �

, �
\
,�"N Meter not added because a Meter ADD
 attempted to replace an existing Meter. 

,�

,�
g
,�"Y Meter not added because Meter specified
 is invalid,
 or invalid meter in meter action. 

,�

,�
�
,�"u Meter not modified because a Meter MODIFY
 attempted to modify a non-existent Meter,
 or bad meter in meter action. 

,�

,�
/
,�"! Unsupported or unknown command. 

,�

,�
/
,�"! Flag configuration unsupported. 

,�

,�
!
,�" Rate unsupported. 

,�

,�
'
,�" Burst size unsupported. 

,�

,�
!
,�" Band unsupported. 

,�

,�
'
,	� " Band value unsupported. 

,	�

,	�
)
,
�" No more meters available. 

,
�

,
�
P
,�"B The maximum number of properties
 for a meter has been exceeded. 

,�

,�
�
-� �� ofp_error_msg 'code' values for OFPET_TABLE_FEATURES_FAILED. 'data' contains
 at least the first 64 bytes of the failed request. 

-�#
/
- �"! Specified table does not exist. 

- �

- �
&
-�" Invalid metadata mask. 

-�

-�
&
-�" Unknown property type. 

-�

-�
-
-�" Length problem in properties. 

-�

-�
+
-�" Unsupported property value. 

-�

-�
"
-�" Permissions error. 

-�

-�
C
)� �5 OFPT_ERROR: Error message (datapath -> controller). 

)�

) �

) ��

) �

) �

) �

)�

)��

)�


)�

)�

)�

)��

)�


)�

)�
[
)�"M Variable-length data.  Interpreted based
on the type and code.  No padding. 

)��

)�	

)�


)�
`
*� �= OFPET_EXPERIMENTER: Error message (datapath -> controller). "ofp_header header;


*�"
#
* �" OFPET_EXPERIMENTER. 

* ��$

* �


* �

* �
%
*�" Experimenter defined. 

*��

*�


*�

*�
_
*�"Q Experimenter ID which takes the same form
as in struct ofp_experimenter_header. 

*��

*�


*�

*�
[
*�"M Variable-length data.  Interpreted based
on the type and code.  No padding. 

*��

*�	

*�


*�

.� �

.�
t
. �f Description of this OpenFlow switch.
 The request body is empty.
 The reply body is struct ofp_desc. 

. �

. �
�
.�� Individual flow statistics.
 The request body is struct ofp_flow_stats_request.
 The reply body is an array of struct ofp_flow_stats. 

.�

.�
�
.�� Aggregate flow statistics.
 The request body is struct ofp_aggregate_stats_request.
 The reply body is struct ofp_aggregate_stats_reply. 

.�

.�
y
.�k Flow table statistics.
 The request body is empty.
 The reply body is an array of struct ofp_table_stats. 

.�

.�
�
.�| Port statistics.
 The request body is struct ofp_port_stats_request.
 The reply body is an array of struct ofp_port_stats. 

.�

.�
�
.�� Queue statistics for a port
 The request body is struct ofp_queue_stats_request.
 The reply body is an array of struct ofp_queue_stats 

.�

.�
�
.�� Group counter statistics.
 The request body is struct ofp_group_stats_request.
 The reply is an array of struct ofp_group_stats. 

.�

.�
t
.�f Group description.
 The request body is empty.
 The reply body is an array of struct ofp_group_desc. 

.�

.�
i
.�[ Group features.
 The request body is empty.
 The reply body is struct ofp_group_features. 

.�

.�
�
.	�� Meter statistics.
 The request body is struct ofp_meter_multipart_requests.
 The reply body is an array of struct ofp_meter_stats. 

.	�

.	�
�
.
�� Meter configuration.
 The request body is struct ofp_meter_multipart_requests.
 The reply body is an array of struct ofp_meter_config. 

.
�

.
�
i
.�[ Meter features.
 The request body is empty.
 The reply body is struct ofp_meter_features. 

.�

.�
�
.�� Table features.
 The request body is either empty or contains an array of
 struct ofp_table_features containing the controller's
 desired view of the switch. If the switch is unable to
 set the specified view an error is returned.
 The reply body is an array of struct ofp_table_features. 

.�

.�
m
.�_ Port description.
 The request body is empty.
 The reply body is an array of struct ofp_port. 

.�

.�
�
.� � Experimenter extension.
 The request and reply bodies begin with
 struct ofp_experimenter_multipart_header.
 The request and reply bodies are otherwise experimenter-defined. 

.�

.�
|
/� �2= Backward compatibility with 1.3.1 - avoid breaking the API. 2/#define ofp_multipart_types ofp_multipart_type


/� 

/ �

/ �

/ �
(
/�" More requests to follow. 

/�

/�

+� �

+�
B
+ � ofp_header header;
" One of the OFPMP_* constants. 

+ ��

+ �

+ �

+ �
#
+�" OFPMPF_REQ_* flags. 

+�� 

+�


+�

+�
5
+�"' Body of the request. 0 or more bytes. 

+��

+�	

+�


+�

0� �

0�

0 �

0 �

0 �
'
0�" More replies to follow. 

0�

0�

,� �

,�
B
, � ofp_header header;
" One of the OFPMP_* constants. 

, ��

, �

, �

, �
%
,�" OFPMPF_REPLY_* flags. 

,�� 

,�


,�

,�
3
,�"% Body of the reply. 0 or more bytes. 

,��

,�	

,�


,�
�
-� �V Body of reply to OFPMP_DESC request.  Each entry is a NULL-terminated
 ASCII string. 25#define DESC_STR_LEN   256
#define SERIAL_NUM_LEN 32


-�
)
- �" Manufacturer description. 

- ��

- �


- �

- �
%
-�" Hardware description. 

-��

-�


-�

-�
%
-�" Software description. 

-��

-�


-�

-�

-�" Serial number. 

-��

-�


-�

-�
7
-�") Human readable description of datapath. 

-��

-�


-�

-�
B
.� �4 Body for ofp_multipart_request of type OFPMP_FLOW. 

.�
U
. �"G ID of table to read (from ofp_table_stats),
OFPTT_ALL for all tables. 

. �� 

. �


. �

. �
z
.�"l Require matching entries to include this
as an output port.  A value of OFPP_ANY
indicates no restriction. 

.��

.�


.�

.�
{
.�"m Require matching entries to include this
as an output group.  A value of OFPG_ANY
indicates no restriction. 

.��

.�


.�

.�
E
.�"7 Require matching entries to contain this
cookie value 

.��

.�


.�

.�
m
.�"_ Mask used to restrict the cookie bits that
must match. A value of 0 indicates
no restriction. 

.��

.�


.�

.�
/
.�"! Fields to match. Variable size. 

.��

.�

.�

.�
4
/� �& Body of reply to OFPMP_FLOW request. 

/�
0
/ �"" Unique ID of flow within device. 

/ ��

/ �


/ �

/ �
+
/�" ID of table flow came from. 

/��

/�


/�

/�
4
/�"& Time flow has been alive in seconds. 

/��

/�


/�

/�
L
/�"> Time flow has been alive in nanoseconds
beyond duration_sec. 

/��

/�


/�

/�
&
/�" Priority of the entry. 

/��

/�


/�

/�
9
/�"+ Number of seconds idle before expiration. 

/��

/�


/�

/�
4
/�"& Number of seconds before expiration. 

/��

/�


/�

/�
(
/�" Bitmap of OFPFF_* flags. 

/��

/�


/�

/�
4
/�"& Opaque controller-issued identifier. 

/��

/�


/�

/�
*
/	�" Number of packets in flow. 

/	��

/	�


/	�

/	�
(
/
�" Number of bytes in flow. 

/
��

/
�


/
�

/
�
5
/�"' Description of fields. Variable size. 

/��

/�

/�

/�
+
/�/" Instruction set
(0 or more) 

/�

/�

/�)

/�,.
G
0� �9 Body for ofp_multipart_request of type OFPMP_AGGREGATE. 

0�#
T
0 �"F ID of table to read (from ofp_table_stats)
OFPTT_ALL for all tables. 

0 ��%

0 �


0 �

0 �
z
0�"l Require matching entries to include this
as an output port.  A value of OFPP_ANY
indicates no restriction. 

0��

0�


0�

0�
{
0�"m Require matching entries to include this
as an output group.  A value of OFPG_ANY
indicates no restriction. 

0��

0�


0�

0�
E
0�"7 Require matching entries to contain this
cookie value 

0��

0�


0�

0�
m
0�"_ Mask used to restrict the cookie bits that
must match. A value of 0 indicates
no restriction. 

0��

0�


0�

0�
/
0�"! Fields to match. Variable size. 

0��

0�

0�

0�
9
1� �+ Body of reply to OFPMP_AGGREGATE request. 

1�!
+
1 �" Number of packets in flows. 

1 ��#

1 �


1 �

1 �
)
1�" Number of bytes in flows. 

1��

1�


1�

1�
 
1�" Number of flows. 

1��

1�


1�

1�
�
1� �� Table Feature property types.
 Low order bit cleared indicates a property for a regular Flow Entry.
 Low order bit set indicates a property for the Table-Miss Flow Entry.


1� 
&
1 �'" Instructions property. 

1 �

1 �%&
,
1�'" Instructions for table-miss. 

1�

1�%&
$
1�'" Next Table property. 

1�

1�%&
*
1�'" Next Table for table-miss. 

1�

1�%&
'
1�'" Write Actions property. 

1�

1�%&
-
1�'" Write Actions for table-miss. 

1�

1�%&
'
1�'" Apply Actions property. 

1�

1�%&
-
1�'" Apply Actions for table-miss. 

1�

1�%&

1�'" Match property. 

1�

1�%&
#
1	�(" Wildcards property. 

1	�

1	�%'
)
1
�(" Write Set-Field property. 

1
�

1
�%'
/
1�("! Write Set-Field for table-miss. 

1�

1�%'
)
1�(" Apply Set-Field property. 

1�

1�%'
/
1�("! Apply Set-Field for table-miss. 

1�

1�%'
&
1�," Experimenter property. 

1�

1�%+
,
1�," Experimenter for table-miss. 

1�

1�%+
>
2� �0 Common header for all Table Feature Properties 

2�"
!
2 �)" One of OFPTFPT_*. 

2 ��$

2 �

2 � $

2 �'(

2 ��

2 �


2�=

2�+

2�,8

2�;<

2�;

2�*

2�+6

2�9:

2�3

2�&

2�'.

2�12

2�+

2�"

2�#&

2�)*

2�=

2�+

2�,8

2�;<
%
3� � Instructions property 

3�+
_
3 �.9 One of OFPTFPT_INSTRUCTIONS,
OFPTFPT_INSTRUCTIONS_MISS. " List of instructions 

3 �

3 �

3 �)

3 �,-
$
4� � Next Tables property 

4�*
[
4 �'7 One of OFPTFPT_NEXT_TABLES,
OFPTFPT_NEXT_TABLES_MISS. " List of table ids. 

4 �

4 �

4 �"

4 �%&
 
5� � Actions property 

5�&
�
5 �$n One of OFPTFPT_WRITE_ACTIONS,
OFPTFPT_WRITE_ACTIONS_MISS,
OFPTFPT_APPLY_ACTIONS,
OFPTFPT_APPLY_ACTIONS_MISS. " List of actions 

5 �

5 �

5 �

5 �"#
�
6� �' Match, Wildcard or Set-Field property "� One of OFPTFPT_MATCH,
OFPTFPT_WILDCARDS,
OFPTFPT_WRITE_SETFIELD,
OFPTFPT_WRITE_SETFIELD_MISS,
OFPTFPT_APPLY_SETFIELD,
OFPTFPT_APPLY_SETFIELD_MISS. 

6�"
@
6 �  TODO is this a uint32??? " Array of OXM headers 

6 �

6 �

6 �

6 �
3
7� �% Experimenter table feature property 

7�+
�
7 �$9 One of OFPTFPT_EXPERIMENTER,
OFPTFPT_EXPERIMENTER_MISS. "Q Experimenter ID which takes the same
form as in struct
ofp_experimenter_header. 

7 ��-

7 �


7 �

7 �"#
%
7� " Experimenter defined. 

7��$

7�


7�

7�

7�*

7�

7�

7�%

7�()
}
8� �o Body for ofp_multipart_request of type OFPMP_TABLE_FEATURES./
 Body of reply to OFPMP_TABLE_FEATURES request. 

8�
P
8 �"B Identifier of table.  Lower numbered tables
are consulted first. 

8 ��

8 �


8 �

8 �

8�

8��

8�


8�

8�
1
8�"# Bits of metadata table can match. 

8��

8�


8�

8�
1
8�"# Bits of metadata table can write. 

8��

8�


8�

8�
(
8�" Bitmap of OFPTC_* values 

8��

8�


8�

8�
0
8�"" Max number of entries supported. 

8��

8�


8�

8�
+
8�7 Table Feature Property list 

8�

8�'

8�(2

8�56
5
9� �' Body of reply to OFPMP_TABLE request. 

9�
P
9 �"B Identifier of table.  Lower numbered tables
are consulted first. 

9 ��

9 �


9 �

9 �
)
9�" Number of active entries. 

9��

9�


9�

9�
5
9�"' Number of packets looked up in table. 

9��

9�


9�

9�
1
9�"# Number of packets that hit table. 

9��

9�


9�

9�
B
:� �4 Body for ofp_multipart_request of type OFPMP_PORT. 

:�
�
: �"� OFPMP_PORT message must request statistics
 either for a single port (specified in
 port_no) or for all ports (if port_no ==
 OFPP_ANY). 

: �� 

: �


: �

: �
m
;� �_ Body of reply to OFPMP_PORT request. If a counter is unsupported, set
 the field to all ones. 

;�

; �

; ��

; �


; �

; �
+
;�" Number of received packets. 

;��

;�


;�

;�
.
;�"  Number of transmitted packets. 

;��

;�


;�

;�
)
;�" Number of received bytes. 

;��

;�


;�

;�
,
;�" Number of transmitted bytes. 

;��

;�


;�

;�
0
;�"" Number of packets dropped by RX. 

;��

;�


;�

;�
0
;�"" Number of packets dropped by TX. 

;��

;�


;�

;�
�
;�"� Number of receive errors.  This is a super-set
of more specific receive errors and should be
greater than or equal to the sum of all
rx_*_err values. 

;��

;�


;�

;�
�
;�"� Number of transmit errors.  This is a super-set
of more specific transmit errors and should be
greater than or equal to the sum of all
tx_*_err values (none currently defined.) 

;��

;�


;�

;�
1
;	�"# Number of frame alignment errors. 

;	��

;	�


;	�

;	�
2
;
�"$ Number of packets with RX overrun. 

;
��

;
�


;
�

;
�
%
;�" Number of CRC errors. 

;��

;�


;�

;�
%
;�" Number of collisions. 

;��

;�


;�

;�
4
;�"& Time port has been alive in seconds. 

;��

;�


;�

;�
L
;�"> Time port has been alive in nanoseconds
beyond duration_sec. 

;��

;�


;�

;�
,
<� � Body of OFPMP_GROUP request. 

<�
'
< �" All groups if OFPG_ALL. 

< ��!

< �


< �

< �
,
=� � Used in group stats replies. 

=�
6
= �"( Number of packets processed by bucket. 

= ��

= �


= �

= �
4
=�"& Number of bytes processed by bucket. 

=��

=�


=�

=�
5
>� �' Body of reply to OFPMP_GROUP request. 

>�
!
> �" Group identifier. 

> ��

> �


> �

> �
N
>�"@ Number of flows or groups that directly
forward to this group. 

>��

>�


>�

>�
5
>�"' Number of packets processed by group. 

>��

>�


>�

>�
3
>�"% Number of bytes processed by group. 

>��

>�


>�

>�
5
>�"' Time group has been alive in seconds. 

>��

>�


>�

>�
M
>�"? Time group has been alive in nanoseconds
beyond duration_sec. 

>��

>�


>�

>�
+
>�1" One counter set per
bucket. 

>�

>�

>� ,

>�/0
:
?� �, Body of reply to OFPMP_GROUP_DESC request. 

?�

? �" One of OFPGT_*. 

? ��

? �

? �

? �
!
?�" Group identifier. 

?��

?�


?�

?�
,
?�$" List of buckets - 0 or more. 

?�

?�

?�

?�"#

@� �

@�

@ �

@ ��

@ �

@ �

@ �

@�

@��

@�

@�

@�
�
2� � Group configuration flags 2= Backward compatibility with 1.3.1 - avoid breaking the API. 2,#define ofp_group_desc_stats ofp_group_desc


2�

2 �

2 �

2 �
0
2�"" Support weight for select groups 

2�

2�
2
2�"$ Support liveness for select groups 

2�

2�
'
2�" Support chaining groups 

2�

2�
3
2�"% Check chaining for loops and delete 

2�

2�
N
A� �@ Body of reply to OFPMP_GROUP_FEATURES request. Group features. 

A�
:
A �", Bitmap of (1 << OFPGT_*) values supported. 

A ��

A �


A �

A �
8
A�"* Bitmap of OFPGFC_* capability supported. 

A��

A�


A�

A�
7
A�#") Maximum number of groups for each type.


A�

A�

A�

A�!"
;
A� "- Bitmaps of (1 << OFPAT_*) values
supported. 

A�

A�

A�

A�
D
B� �6 Body of OFPMP_METER and OFPMP_METER_CONFIG requests. 

B�#
,
B �" Meter instance, or OFPM_ALL. 

B ��%

B �


B �

B �
.
C� �  Statistics for each meter band 

C�
*
C �(" Number of packets in band. 

C ��

C �


C �#

C �&'
(
C�&" Number of bytes in band. 

C��(

C�


C�!

C�$%
G
D� �9 Body of reply to OFPMP_METER request. Meter statistics. 

D�

D �" Meter instance. 

D ��

D �


D �

D �
/
D�!"! Number of flows bound to meter. 

D��

D�


D�

D� 
+
D�&" Number of packets in input. 

D��!

D�


D�!

D�$%
)
D�$" Number of bytes in input. 

D��&

D�


D�

D�"#
5
D�#"' Time meter has been alive in seconds. 

D��$

D�


D�

D�!"
M
D�$"? Time meter has been alive in nanoseconds
beyond duration_sec. 

D��#

D�


D�

D�"#
H
D�1": The band_stats length is
inferred from the length field. 

D�

D�!

D�",

D�/0
Q
E� �C Body of reply to OFPMP_METER_CONFIG request. Meter configuration. 

E�
'
E �" All OFPMF_* that apply. 

E ��

E �


E �

E �

E�" Meter instance. 

E��

E�


E�

E�
C
E�-"5 The bands length is
inferred from the length field. 

E�

E�"

E�#(

E�+,
N
F� �@ Body of reply to OFPMP_METER_FEATURES request. Meter features. 

F�
)
F �" Maximum number of meters. 

F ��

F �


F �

F �
<
F�". Bitmaps of (1 << OFPMBT_*) values supported.


F��

F�


F�

F�
-
F�" Bitmaps of "ofp_meter_flags". 

F��

F�


F�

F�
(
F�" Maximum bands per meters 

F��

F�


F�

F�
#
F�" Maximum color value 

F��

F�


F�

F�

G� �

G�

G �

G ��

G �

G �

G �

G�

G��

G�

G�

G�
P
H� �B Body for ofp_multipart_request/reply of type OFPMP_EXPERIMENTER. 

H�)
_
H �"Q Experimenter ID which takes the same form
as in struct ofp_experimenter_header. 

H ��+

H �


H �

H �
%
H�" Experimenter defined. 

H��

H�


H�

H�
?
H�"1 Experimenter-defined arbitrary additional data. 

H��

H�	

H�


H�
'
I� � Experimenter extension. 

I�
�
I �2ofp_header header;  /* Type OFPT_EXPERIMENTER. */
"W Experimenter ID:
 - MSB 0: low-order bytes are IEEE OUI.
 - MSB != 0: defined by ONF. 

I ��!

I �


I �

I �
%
I�" Experimenter defined. 

I��

I�


I�

I�
?
I�"1 Experimenter-defined arbitrary additional data. 

I��

I�	

I�


I�
�
3� �2J All ones is used to indicate all queues in a port (for stats retrieval). 2!#define OFPQ_ALL      0xffffffff
2' Min rate > 1000 means not configured. 2(#define OFPQ_MIN_RATE_UNCFG      0xffff
2' Max rate > 1000 means not configured. 2(#define OFPQ_MAX_RATE_UNCFG      0xffff


3�

3 �

3 �

3 �
,
3�" Minimum datarate guaranteed. 

3�

3�
!
3�" Maximum datarate. 

3�

3�
.
3�!"  Experimenter defined property. 

3�

3� 
/
J� �! Common description for a queue. 

J�

J �" One of OFPQT_. 

J ��

J �


J �

J �
:
J�", Length of property, including this header. 

J��

J�


J�

J�
4
K� �& Min-Rate queue property description. 

K�
)
K �*" prop: OFPQT_MIN, len: 16. 

K ��!

K �

K �%

K �()
;
K�"- In 1/10 of a percent = 0;>1000 -> disabled. 

K��*

K�


K�

K�
4
L� �& Max-Rate queue property description. 

L�
)
L �*" prop: OFPQT_MAX, len: 16. 

L ��!

L �

L �%

L �()
;
L�"- In 1/10 of a percent = 0;>1000 -> disabled. 

L��*

L�


L�

L�
8
M� �* Experimenter queue property description. 

M�#
(
M �*" prop: OFPQT_EXPERIMENTER 

M ��%

M �

M �%

M �()
_
M�"Q Experimenter ID which takes the same
form as in struct
ofp_experimenter_header. 

M��*

M�


M�

M�
*
M�" Experimenter defined data. 

M��

M�	

M�


M�
-
N� � Full description for a queue. 

N�
*
N �" id for the specific queue. 

N ��

N �


N �

N �
/
N�"! Port this queue is attached to. 

N��

N�


N�

N�
#
N�2" List of properties. 

N�

N�"

N�#-

N�01
3
O� �% Query for port queue configuration. 

O�$
�
O �ofp_header header;
"| Port to be queried. Should refer
to a valid physical port (i.e. <= OFPP_MAX),
or OFPP_ANY to request all configured
queues.

O ��&

O �


O �

O �
5
P� �' Queue configuration for a given port. 

P�"
!
P �ofp_header header;


P ��$

P �


P �

P �
*
P�)" List of configured queues. 

P�

P�

P�$

P�'(
S
Q� �E OFPAT_SET_QUEUE action struct: send packets to given queue on port. 

Q�
 
Q �" OFPAT_SET_QUEUE. 

Q ��

Q �


Q �

Q �
)
Q�" Queue id for the packets. 

Q��

Q�


Q�

Q�

R� �

R�
&
R �" All ports if OFPP_ANY. 

R ��!

R �


R �

R �
'
R�" All queues if OFPQ_ALL. 

R��

R�


R�

R�

S� �

S�

S �

S ��

S �


S �

S �

S�" Queue i.d 

S��

S�


S�

S�
,
S�" Number of transmitted bytes. 

S��

S�


S�

S�
.
S�"  Number of transmitted packets. 

S��

S�


S�

S�
9
S�"+ Number of packets dropped due to overrun. 

S��

S�


S�

S�
5
S�"' Time queue has been alive in seconds. 

S��

S�


S�

S�
M
S�"? Time queue has been alive in nanoseconds
beyond duration_sec. 

S��

S�


S�

S�
�
4� � Controller roles. 2� Configures the "role" of the sending controller.  The default role is:

    - Equal (OFPCR_ROLE_EQUAL), which allows the controller access to all
      OpenFlow features. All controllers have equal responsibility.

 The other possible roles are a related pair:

    - Master (OFPCR_ROLE_MASTER) is equivalent to Equal, except that there
      may be at most one Master controller at a time: when a controller
      configures itself as Master, any existing Master is demoted to the
      Slave role.

    - Slave (OFPCR_ROLE_SLAVE) allows the controller read-only access to
      OpenFlow features.  In particular attempts to modify the flow table
      will be rejected with an OFPBRC_EPERM error.

      Slave controllers do not receive OFPT_PACKET_IN or OFPT_FLOW_REMOVED
      messages, but they do receive OFPT_PORT_STATUS messages.


4�
*
4 �" Don't change current role. 

4 �

4 �
*
4�" Default role, full access. 

4�

4�
0
4�"" Full access, at most one master. 

4�

4�
!
4�" Read-only access. 

4�

4�
/
T� �! Role request and reply message. 

T�
n
T �!Hofp_header header;        /* Type OFPT_ROLE_REQUEST/OFPT_ROLE_REPLY. */
" One of OFPCR_ROLE_*. 

T ��

T �

T �

T � 
-
T�" Master Election Generation Id 

T��!

T�


T�

T�
3
U� �% Asynchronous message configuration. 

U�
p
U �'Dofp_header header;    /* OFPT_GET_ASYNC_REPLY or OFPT_SET_ASYNC. */
" Bitmasks of OFPR_* values. 

U �

U �

U �"

U �%&
+
U�)" Bitmasks of OFPPR_* values. 

U�

U�

U�$

U�'(
+
U�*" Bitmasks of OFPRR_* values. 

U�

U�

U�%

U�()
J
V� �2< ADDITIONAL VOLTHA SPECIFIC MESSAGE TYPES, AIDING RPC CALLS 

V�
-
V �" Device.id or LogicalDevice.id


V ��

V �


V �

V �

V� 

V��

V�

V�

V�
;
V�"-Transaction id associated with this request.


V�� 

V�


V�

V�

W� �

W�

W �-

W �

W �

W �(

W �+,

X� �

X�
-
X �" Device.id or LogicalDevice.id


X ��

X �


X �

X �

X�

X��

X�

X�

X�
;
X�"-Transaction id associated with this request.


X��

X�


X�

X�

Y� �

Y�
-
Y �" Device.id or LogicalDevice.id


Y ��

Y �


Y �

Y �

Y� 

Y��

Y�

Y�

Y�
;
Y�"-Transaction id associated with this request.


Y�� 

Y�


Y�

Y�

Z� �

Z�

Z �&

Z �

Z �

Z �!

Z �$%

[� �

[�

[ �'

[ �

[ �

[ �"

[ �%&

\� �

\�

\ �'

\ �

\ �

\ �"

\ �%&

]� �

]�

] �

] ��

] �	

] �


] �

]�

]��

]�	

]�


]�

^� �

^�

^ �

^ ��

^ �

^ �

^ �

^�

^��

^�

^�

^�

^�

^��

^�

^�

^�

_� �

_�
 
_ �" LogicalDevice.id


_ ��

_ �


_ �

_ �

_� 

_��

_�

_�

_�

`� �

`�
 
` �" LogicalDevice.id


` ��

` �


` �

` �

`�"

`��

`�

`�

`� !

a� �

a�
 
a �" LogicalDevice.id


a ��

a �


a �

a �

a ��

a �


a�(

a�

a�#

a�&'

a� 

a�

a�

a�

a�,

a�

a�'

a�*+
R
b� �D Additional information required to process flow at device adapters


b�
=
b �5/ Meters associated with flow-update to adapter


b �

b �)

b �*0

b �34bproto3
�
"voltha_protos/logical_device.protological_devicegoogle/api/annotations.protovoltha_protos/openflow_13.proto"8
LogicalPortId
id (	Rid
port_id (	RportId"�
LogicalPort
id (	Rid0
ofp_port (2.openflow_13.ofp_portRofpPort
	device_id (	RdeviceId$
device_port_no (RdevicePortNo
	root_port (RrootPortA
ofp_port_stats (2.openflow_13.ofp_port_statsRofpPortStats"A
LogicalPorts1
items (2.logical_device.LogicalPortRitems"�
LogicalDevice
id (	Rid
datapath_id (R
datapathId)
desc (2.openflow_13.ofp_descRdescI
switch_features (2 .openflow_13.ofp_switch_featuresRswitchFeatures$
root_device_id (	RrootDeviceId"E
LogicalDevices3
items (2.logical_device.LogicalDeviceRitemsBe
"org.opencord.voltha.logical_deviceBOFLogicalDeviceZ.github.com/opencord/voltha-protos/v5/go/volthaJ�
  4

  

 E
	
 E

 ;
	
 ;

 0
	
 0

 
	
  &
	
	 )


  


 
*
   unique id of logical device


  

  


  

  
3
 & id of the port on the logical device


 

 


 

 


 




 

 

 


 

 

&





!

$%



&

























	



2





-

01


 




 #

 

 

 

 !"


  0


 
*
 # unique id of logical device


 # 

 #


 #

 #
U
&H unique datapath id for the logical device (used by the SDN controller)


&#

&


&

&
!
)" device description


)&

)

)

) !

,8 device features


,)"

,#

,$3

,67
?
/2 name of the root device anchoring logical device


/,8

/


/

/


2 4


2

 3%

 3

 3

 3 

 3#$bproto3
��
voltha_protos/device.protodevicegoogle/protobuf/any.protovoltha_protos/common.protovoltha_protos/openflow_13.proto"�

DeviceType
id (	Rid
	vendor_id (	RvendorId

vendor_ids (	R	vendorIds
adapter (	Radapter7
accepts_bulk_flow_update (RacceptsBulkFlowUpdateD
accepts_add_remove_flow_updates (RacceptsAddRemoveFlowUpdatesL
#accepts_direct_logical_flows_update (RacceptsDirectLogicalFlowsUpdate!
adapter_type (	RadapterType"7
DeviceTypes(
items (2.device.DeviceTypeRitems"�
PmConfig
name (	Rname+
type (2.device.PmConfig.PmTypeRtype
enabled (Renabled
sample_freq (R
sampleFreq"8
PmType
COUNTER 	
GAUGE	
STATE
CONTEXT"�
PmGroupConfig

group_name (	R	groupName

group_freq (R	groupFreq
enabled (Renabled*
metrics (2.device.PmConfigRmetrics"�
	PmConfigs
id (	Rid!
default_freq (RdefaultFreq
grouped (Rgrouped#
freq_override (RfreqOverride-
groups (2.device.PmGroupConfigRgroups*
metrics (2.device.PmConfigRmetrics
max_skew (RmaxSkew"�
Image
name (	Rname
version (	Rversion
hash (Rhash)
install_datetime (	RinstallDatetime
	is_active (RisActive!
is_committed (RisCommitted
is_valid (RisValid
url (	Rurl
vendor	 (	Rvendor
crc32
 (Rcrc32"�
ImageDownload
id (	Rid
name (	Rname
url (	Rurl
crc (RcrcO
download_state (2(.device.ImageDownload.ImageDownloadStateRdownloadState#
image_version (	RimageVersion)
downloaded_bytes (RdownloadedBytesH
reason (20.device.ImageDownload.ImageDownloadFailureReasonRreason'
additional_info	 (	RadditionalInfo
save_config
 (R
saveConfig
	local_dir (	RlocalDirI
image_state (2(.device.ImageDownload.ImageActivateStateR
imageState
	file_size (RfileSize"�
ImageDownloadState
DOWNLOAD_UNKNOWN 
DOWNLOAD_SUCCEEDED
DOWNLOAD_REQUESTED
DOWNLOAD_STARTED
DOWNLOAD_FAILED
DOWNLOAD_UNSUPPORTED
DOWNLOAD_CANCELLED"�
ImageDownloadFailureReason
NO_ERROR 
INVALID_URL
DEVICE_BUSY
INSUFFICIENT_SPACE
UNKNOWN_ERROR
	CANCELLED"�
ImageActivateState
IMAGE_UNKNOWN 
IMAGE_INACTIVE
IMAGE_ACTIVATING
IMAGE_ACTIVE
IMAGE_REVERTING
IMAGE_REVERTED:"A
ImageDownloads+
items (2.device.ImageDownloadRitems:"-
Images#
image (2.device.ImageRimage"�
OnuImage
version (	Rversion

isCommited (R
isCommited
isActive (RisActive
isValid (RisValid 
productCode (	RproductCode
hash (	Rhash"3
	OnuImages&
items (2.device.OnuImageRitems"c
DeviceImageState
	device_id (	RdeviceId2

imageState (2.device.ImageStateR
imageState"�

ImageState
version (	RversionL
download_state (2%.device.ImageState.ImageDownloadStateRdownloadState=
reason (2%.device.ImageState.ImageFailureReasonRreasonH
image_state (2'.device.ImageState.ImageActivationStateR
imageState"�
ImageDownloadState
DOWNLOAD_UNKNOWN 
DOWNLOAD_SUCCEEDED
DOWNLOAD_REQUESTED
DOWNLOAD_STARTED
DOWNLOAD_FAILED
DOWNLOAD_UNSUPPORTED
DOWNLOAD_CANCELLING
DOWNLOAD_CANCELLED"�
ImageFailureReason
NO_ERROR 
INVALID_URL
DEVICE_BUSY
INSUFFICIENT_SPACE
UNKNOWN_ERROR
CANCELLED_ON_REQUEST
CANCELLED_ON_ONU_STATE
VENDOR_DEVICE_MISMATCH
OMCI_TRANSFER_ERROR
IMAGE_REFUSED_BY_ONU	"�
ImageActivationState
IMAGE_UNKNOWN 
IMAGE_INACTIVE
IMAGE_ACTIVATING
IMAGE_ACTIVE
IMAGE_COMMITTING
IMAGE_COMMITTED
IMAGE_ACTIVATION_ABORTING
IMAGE_ACTIVATION_ABORTED
IMAGE_COMMIT_ABORTING
IMAGE_COMMIT_ABORTED	
IMAGE_DOWNLOADING

IMAGE_DOWNLOADING_ABORTED"�
Port
port_no (RportNo
label (	Rlabel)
type (2.device.Port.PortTypeRtype9
admin_state (2.common.AdminState.TypesR
adminState9
oper_status (2.common.OperStatus.TypesR
operStatus
	device_id (	RdeviceId+
peers (2.device.Port.PeerPortRpeers

rx_packets	 (R	rxPackets
rx_bytes
 (RrxBytes
	rx_errors (RrxErrors

tx_packets (R	txPackets
tx_bytes (RtxBytes
	tx_errors (RtxErrors0
ofp_port (2.openflow_13.ofp_portRofpPort@
PeerPort
	device_id (	RdeviceId
port_no (RportNo"s
PortType
UNKNOWN 
ETHERNET_NNI
ETHERNET_UNI
PON_OLT
PON_ONU
	VENET_OLT
	VENET_ONU"+
Ports"
items (2.device.PortRitems"�

Device
id (	Rid
type (	Rtype
root (Rroot
	parent_id (	RparentId$
parent_port_no (RparentPortNo
vendor (	Rvendor
model (	Rmodel)
hardware_version (	RhardwareVersion)
firmware_version (	RfirmwareVersion&
images	 (2.device.ImagesRimages#
serial_number
 (	RserialNumber
	vendor_id (	RvendorId)
adapter_endpoint (	RadapterEndpoint
vlan (Rvlan
mac_address (	R
macAddress#
ipv4_address (	H Ripv4Address#
ipv6_address (	H Ripv6Address$
host_and_port (	H RhostAndPort

extra_args (	R	extraArgs@
proxy_address (2.device.Device.ProxyAddressRproxyAddress9
admin_state (2.common.AdminState.TypesR
adminState9
oper_status (2.common.OperStatus.TypesR
operStatus
reason (	RreasonB
connect_status (2.common.ConnectStatus.TypesRconnectStatus,
custom@ (2.google.protobuf.AnyRcustom1

pm_configs� (2.device.PmConfigsR	pmConfigs?
image_downloads� (2.device.ImageDownloadRimageDownloads�
ProxyAddress
	device_id (	RdeviceId
device_type (	R
deviceType

channel_id (R	channelId(
channel_group_id (RchannelGroupId/
channel_termination (	RchannelTermination
onu_id (RonuId$
onu_session_id (RonuSessionId)
adapter_endpoint (	RadapterEndpointB	
addressJ"�
DeviceImageDownloadRequest'
	device_id (2
.common.IDRdeviceId#
image (2.device.ImageRimage,
activateOnSuccess (RactivateOnSuccess(
commitOnSuccess (RcommitOnSuccess"�
DeviceImageRequest'
	device_id (2
.common.IDRdeviceId
version (	Rversion(
commitOnSuccess (RcommitOnSuccess"_
DeviceImageResponseH
device_image_states (2.device.DeviceImageStateRdeviceImageStates"�
SelfTestResponse?
result (2'.device.SelfTestResponse.SelfTestResultRresult"P
SelfTestResult
SUCCESS 
FAILURE
NOT_SUPPORTED
UNKNOWN_ERROR"/
Devices$
items (2.device.DeviceRitems"�
SimulateAlarmRequest
id (	Rid
	indicator (	R	indicator
intf_id (	RintfId$
port_type_name (	RportTypeName"
onu_device_id (	RonuDeviceId3
inverse_bit_error_rate (RinverseBitErrorRate
drift (Rdrift
new_eqd (RnewEqd*
onu_serial_number	 (	RonuSerialNumberH
	operation
 (2*.device.SimulateAlarmRequest.OperationTypeR	operation"%
OperationType	
RAISE 	
CLEARBZ
org.opencord.voltha.deviceBVolthaDeviceZ.github.com/opencord/voltha-protos/v5/go/volthaJϡ
  �

  

 E
	
 E

 3
	
 3

 -
	
 -

 
	
  #
	

 $
	
 )

  % A Device Type



 
.
  ! Unique name for the device type


  

  


  

  
r
 e Unique vendor id for the device type applicable to ONU
 4 bytes of vendor id from ONU serial number


 

 


 

 

 #

 

 

 

 !"
c
 V Name of the adapter that handles device type
 Deprecated and replaced by adapterType


 #

 


 

 

 & Capabilities


 

 

 	!

 $%

 -

 &

 

 	(

 +,

  1

  -

  

  	,

  /0
?
 #2 Type of adapter that can handle this device type


 # 1

 #


 #

 #
)
( * A plurality of device types



(

 )"

 )

 )

 )

 ) !


, 7


,

 -2

 -	

  .

  .

  .

 /

 /

 /

 0

 0

 0

 1

 1

 1

 3

 32

 3


 3

 3

4

43

4


4

4
;
5". Whether or not this metric makes it to Kafka


54

5

5	

5
/
6"" Sample rate in 10ths of a second


65

6


6

6


9 >


9

 :

 :9

 :


 :

 :
/
;"" Frequency applicable to the grop


;:

;


;

;
.
<"! Enable/disable group level only


<;

<

<	

<

="

=

=

=

= !


@ J


@
2
 A"% To work around a chameleon POST bug


 A@

 A


 A

 A
"
B" Default sample rate


BA

B


B

B
5
D( Forces group names and group semantics


DB

D

D	

D
>
F1 Allows Pm to set an individual sample frequency


FD

F

F	

F
,
G&" The groups if grouped is true


G

G

G!

G$%
:
H""- The metrics themselves if grouped is false.


H

H

H

H !
/
I""Default value is set to 5 seconds


IH"

I


I

I
*
M �Object representing an image



M
"
 O" software patch name


 OM

 O


 O

 O
�
S� Version, this is the sole identifier of the image. it's the vendor specified OMCI version
 must be known at the time of initiating a download, activate, commit image on an onu.


SO

S


S

S
b
WU hash of the image to be verified against
 Deprecated in voltha 2.8, will be removed


WS

W


W

W
d
Z + Deprecated in voltha 2.8, will be removed
"* combined date and time expressed in UTC.


ZW

Z


Z

Z
�
b� The active software image is one that is currently loaded and executing
 in the ONU or circuit pack. Under normal operation, one software image
 is always active while the other is inactive. Under no circumstances are
 both software images allowed to be active at the same time
 Deprecated in voltha 2.8, will be removed
" True if the image is active
2' use ISO 8601 format for date and time


bZ 

b

b	

b
�
h� The committed software image is loaded and executed upon reboot of the
 ONU and/or circuit pack. During normal operation, one software image is
 always committed, while the other is uncommitted.
 Deprecated in voltha 2.8, will be removed
"  True if the image is committed


hb

h

h	

h
�
o� A software image is valid if it has been verified to be an executable
 code image. The verification mechanism is not subject to standardization;
 however, it should include at least a data integrity (e.g., CRC) check of
 the entire code image.
 Deprecated in voltha 2.8, will be removed
" True if the image is valid


oh

o

o	

o
x
tk URL where the image is available
 URL MUST be fully qualified,
 including filename, username and password


to

t


t

t
�
y� Represents the vendor/device mfr
 Needs to match the vendor of the device the image will be installed on
 optional, if not matched no check will be performed


yt

y


y

y
�
	� Represents the ONU Image CRC value.
 Default to value 0 if not specified.
 If different then 0 it's used to verify the image retrieved from outside before sending it to the ONU.
 Calculation of this needs to be done according to ITU-T I.363.5 as per OMCI spec (section A.2.27)


	y

	


	

	
y
� �k Older version of the API please see DeviceImageDownloadRequest
 Deprecated in voltha 2.8, will be removed


�

�

�

 ��

 �	

  �

  �

  �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �!

 �

 � 

 �

 �

 �

��

�	#

 �

 �

 �

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�

��

�	

 �

 �

 �

�

�

�

�

�

�

�

�

�

�

�

�

�

�

�
!
 � Device Identifier


 ��

 �


 �

 �
'
� Image unique identifier


��

�


�

�
R
�D URL where the image is available
 should include username password


��

�


�

�
6
�( CRC of the image to be verified aginst


��

�


�

�

�* Download state


��

�

�%

�()
"
� Downloaded version


��*

�


�

�
 
�  Bytes downloaded


��

�


�

�
'
�) Download failure reason


�� 

�

�%

�'(

� Additional info


��)

�


�

�
*
	� Save current configuration


	��

	�

	�	

	�
$

� Image local location



��


�



�


�
&
�( Image activation state


��

�

�"

�%'

� Image file size


��(

�


�

�
9
� �+ Deprecated in voltha 2.8, will be removed


�

�

�

 �%

 �

 �

 � 

 �#$

� �

�

 �

 �

 �

 �

 �
�
	� �� OnuImage represents the OMCI information as per OMCI spec
 the information will be populates exactly as extracted from the device.


	�

	 �image version


	 ��

	 �


	 �

	 �

	�

	��

	�

	�	

	�

	�

	��

	�

	�	

	�

	�

	��

	�

	�	

	�

	�

	��

	�


	�

	�
�
	�� Hash is computed by the ONU and is optional as per OMCI spec (paragraph 9.1.4)
 No assumption should be made on the existence of this attribute at any time.


	��

	�


	�

	�


� �


�


 � 


 �


 �


 �


 �

� �

�

 �

 ��

 �


 �

 �

�

��

�

�

�

� �

�

 ��

 �	

  �

  �

  �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �!

 �

 � 

 � 

 �

 �

 �

 �

 �

��

�	

 �

 �

 �

�

�

�

�

�

�
F
�"6 VOLTHA ONU ADAPTER has no more space to store images


�

�
7
�"' Used also for Checksum failure on ONU


�

�

�!

�

� 

�#

�

�!"

�#

�

�!"

� 

�

�

	�!

	�

	� 

��

�	

 �

 �

 �

�

�

�
G
�"7 Happens during Reboot of the ONU after activate call.


�

�

�

�

�

�

�

�

�

�

�

�&

�!

�$%

�%

� 

�#$

�"

�

� !

	�!

	�

	� 


�


�


�

�'

�!

�$&

 � image version


 ��

 �


 �

 �

�* Download state


��

�

�%

�()
S
�!E Image Operation Failure reason (use for both Download and Activate)


��*

�

�

� 
&
�) Image activation state


��!

�

�$

�'(

� �

�

 ��

 �	

  �

  �

  �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �
)
 �" Device-unique port number


 ��

 �


 �

 �
$
�" Arbitrary port label


��

�


�

�

�"  Type of port


��

�

�

�

�,

��

�

�'

�*+

�,

��,

�

�'

�*+
8
�"* Unique .id of device that owns this port


��,

�


�

�

 ��

 �

  �

  ��

  �

  �

  �

 �

 ��

 �

 �

 �

� 

�

�

�

�

�

�� 

�

�

�

�

��

�

�

�

	�

	��

	�

	�

	�


�


��


�


�


�

�

��

�

�

�

�

��

�

�

�
�
�'� ofp_port represents the characteristics of a port, e.g. hardware
 address and supported features.  This field is relevant only for
 UNI and NNI ports.   For PON ports, it can be left empty.


��

�

�!

�$&

� �

�

 �

 �

 �

 �

 �
*
� � A Physical Device instance


�
*
 � Voltha's device identifier


 ��

 �


 �

 �
I
�; Device type, refers to one of the registered device types


��

�


�

�
�
�y Is this device a root device. Each logical switch has one root
 device that is associated with the logical flow switch.


��

�

�	

�
q
�c Parent device id, in the device tree (for a root device, the parent_id
 is the logical_device.id)


��

�


�

�

�

��

�


�

�
4
�& Vendor, version, serial number, etc.


��

�


�

�

�

��

�


�

�

� 

��

�


�

�

� 

�� 

�


�

�
.
	�  List of software on the device


	�� 

	�


	�

	�


�


��


�



�


�

�

��

�


�

�
\
	�8 adapter is deprecated and replaced by adapter_endpoint
"string adapter = 11;


	 �

	 �

	 �
T
�!F Indicates how to reach the adapter instance that manages this device


��

�


�

� 
6
�( Device contact on vlan (if 0, no vlan)


��!

�


�

�

 ��

 �
=
  �"- Which device to use as proxy to this device


  ��

  �

  �

  �
P
 �"@ The device type of the proxy device to use as the adapter name


 ��

 �

 �

 �
*
 �" Sub-address within proxy


 ��

 �

 �

 �
%
 �$" Channel Group index


 ��

 �

 �

 �"#
*
 �'" Channel Termination name


 ��$

 �

 �"

 �%&
*
 �" onu identifier; optional


 ��'

 �

 �

 �
:
 �""* session identifier for the ONU; optional


 ��

 �

 �

 � !
G
 �$"7 endpoint of the adapter that handles the proxy device


 ��"

 �

 �

 �"#
H
�: Device contact MAC address (format: "xx:xx:xx:xx:xx:xx")


��

�


�

�

 ��

 �

W
�!I Device contact IPv4 address (format: "a.b.c.d" or can use hostname too)


�

�

� 
x
�!j Device contact IPv6 address using the canonical string form
 ("xxxx:xxxx:xxxx:xxxx:xxxx:xxxx:xxxx:xxxx")


�

�

� 

�"

�

�

�!
A
�"3 Used to pass additional device specific arguments


��

�


�

�

�$

��

�

�

�!#

�-

��$

�

�'

�*,

�.

��-

�

�'

�*,
%
�"  Used in FAILED state


��.

�


�

�

�4

��

�

�-

�02
X
�$! Device type specific attributes
2' TODO additional common attribute here


��4

�

�

�!#

�  PmConfigs type


��$

�

�

�

�1

�

�

�*

�-0

� �

�"
E
 �%7 Device Id
 allows for operations on multiple devices.


 �

 �

 � 

 �#$
F
�8The image for the device containing all the information


��%

�	

�


�
M
�?Activate the image if the download to the device is successful


��

�

�	

�
[
�MAutomatically commit the image if the activation on the device is successful


��

�

�	

�

� �

�
D
 �%6Device Id
allows for operations on multiple adapters.


 �

 �

 � 

 �#$
�
�� Image Version, this is the sole identifier of the image. it's the vendor specified OMCI version
 must be known at the time of initiating a download, activate, commit image on an onu.


��%

�


�

�
[
�MAutomatically commit the image if the activation on the device is successful


��

�

�	

�

� �

�
4
 �6&Image state for the different devices


 �

 �

 �1

 �45
)
� � Device Self Test Response


�

 ��

 �

  �

  �

  �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 ��

 �

 �

 �

� �

�

 �

 �

 �

 �

 �

� �

�

 ��

 �	

  �

  �

  �

 �

 �

 �
!
 � Device Identifier


 ��

 �


 �

 �

�

��

�


�

�

�

��

�


�

�

�

��

�


�

�

�

��

�


�

�

�%

��

�	

�
 

�#$

�

��%

�	

�


�

�

��

�	

�


�

�!

��

�


�

� 

	�!

	��!

	�

	�

	� bproto3
�/
google/protobuf/timestamp.protogoogle.protobuf";
	Timestamp
seconds (Rseconds
nanos (RnanosB~
com.google.protobufBTimestampProtoPZ+github.com/golang/protobuf/ptypes/timestamp��GPB�Google.Protobuf.WellKnownTypesJ�-
 �
�
 2� Protocol Buffers - Google's data interchange format
 Copyright 2008 Google Inc.  All rights reserved.
 https://developers.google.com/protocol-buffers/

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are
 met:

     * Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
     * Redistributions in binary form must reproduce the above
 copyright notice, this list of conditions and the following disclaimer
 in the documentation and/or other materials provided with the
 distribution.
     * Neither the name of Google Inc. nor the names of its
 contributors may be used to endorse or promote products derived from
 this software without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


  

" ;
	
%" ;

# 
	
# 

$ B
	
$ B

% ,
	
% ,

& /
	
& /

' "
	

' "

( !
	
$( !
�
 | �� A Timestamp represents a point in time independent of any time zone or local
 calendar, encoded as a count of seconds and fractions of seconds at
 nanosecond resolution. The count is relative to an epoch at UTC midnight on
 January 1, 1970, in the proleptic Gregorian calendar which extends the
 Gregorian calendar backwards to year one.

 All minutes are 60 seconds long. Leap seconds are "smeared" so that no leap
 second table is needed for interpretation, using a [24-hour linear
 smear](https://developers.google.com/time/smear).

 The range is from 0001-01-01T00:00:00Z to 9999-12-31T23:59:59.999999999Z. By
 restricting to that range, we ensure that we can convert to and from [RFC
 3339](https://www.ietf.org/rfc/rfc3339.txt) date strings.

 # Examples

 Example 1: Compute Timestamp from POSIX `time()`.

     Timestamp timestamp;
     timestamp.set_seconds(time(NULL));
     timestamp.set_nanos(0);

 Example 2: Compute Timestamp from POSIX `gettimeofday()`.

     struct timeval tv;
     gettimeofday(&tv, NULL);

     Timestamp timestamp;
     timestamp.set_seconds(tv.tv_sec);
     timestamp.set_nanos(tv.tv_usec * 1000);

 Example 3: Compute Timestamp from Win32 `GetSystemTimeAsFileTime()`.

     FILETIME ft;
     GetSystemTimeAsFileTime(&ft);
     UINT64 ticks = (((UINT64)ft.dwHighDateTime) << 32) | ft.dwLowDateTime;

     // A Windows tick is 100 nanoseconds. Windows epoch 1601-01-01T00:00:00Z
     // is 11644473600 seconds before Unix epoch 1970-01-01T00:00:00Z.
     Timestamp timestamp;
     timestamp.set_seconds((INT64) ((ticks / 10000000) - 11644473600LL));
     timestamp.set_nanos((INT32) ((ticks % 10000000) * 100));

 Example 4: Compute Timestamp from Java `System.currentTimeMillis()`.

     long millis = System.currentTimeMillis();

     Timestamp timestamp = Timestamp.newBuilder().setSeconds(millis / 1000)
         .setNanos((int) ((millis % 1000) * 1000000)).build();


 Example 5: Compute Timestamp from current time in Python.

     timestamp = Timestamp()
     timestamp.GetCurrentTime()

 # JSON Mapping

 In JSON format, the Timestamp type is encoded as a string in the
 [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) format. That is, the
 format is "{year}-{month}-{day}T{hour}:{min}:{sec}[.{frac_sec}]Z"
 where {year} is always expressed using four digits while {month}, {day},
 {hour}, {min}, and {sec} are zero-padded to two digits each. The fractional
 seconds, which can go up to 9 digits (i.e. up to 1 nanosecond resolution),
 are optional. The "Z" suffix indicates the timezone ("UTC"); the timezone
 is required. A proto3 JSON serializer should always use UTC (as indicated by
 "Z") when printing the Timestamp type and a proto3 JSON parser should be
 able to accept both UTC and other timezones (as indicated by an offset).

 For example, "2017-01-15T01:30:15.01Z" encodes 15.01 seconds past
 01:30 UTC on January 15, 2017.

 In JavaScript, one can convert a Date object to this format using the
 standard [toISOString()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/toISOString)
 method. In Python, a standard `datetime.datetime` object can be converted
 to this format using [`strftime`](https://docs.python.org/2/library/time.html#time.strftime)
 with the time format spec '%Y-%m-%dT%H:%M:%S.%fZ'. Likewise, in Java, one
 can use the Joda Time's [`ISODateTimeFormat.dateTime()`](
 http://www.joda.org/joda-time/apidocs/org/joda/time/format/ISODateTimeFormat.html#dateTime%2D%2D
 ) to obtain a formatter capable of generating timestamps in this format.





 |
�
  �� Represents seconds of UTC time since Unix epoch
 1970-01-01T00:00:00Z. Must be from 0001-01-01T00:00:00Z to
 9999-12-31T23:59:59Z inclusive.


  �|

  �

  �

  �
�
 �� Non-negative fractions of a second at nanosecond resolution. Negative
 second values with fractions must still have non-negative nanos values
 that count forward in time. Must be from 0 to 999,999,999
 inclusive.


 ��

 �

 �

 �bproto3
�h
voltha_protos/events.protoeventgoogle/api/annotations.protogoogle/protobuf/timestamp.protovoltha_protos/common.proto"�
EventFilterRuleKey"�
EventFilterRuleType

filter_all 
category
sub_category
kpi_event_type
config_event_type
device_event_type"h
EventFilterRule?
key (2-.event.EventFilterRuleKey.EventFilterRuleTypeRkey
value (	Rvalue"�
EventFilter
id (	Rid
enable (Renable
	device_id (	RdeviceId

event_type (	R	eventType,
rules (2.event.EventFilterRuleRrules"<
EventFilters,
filters (2.event.EventFilterRfilters";
ConfigEventType"(
Types
add 

remove

update"g
ConfigEvent0
type (2.event.ConfigEventType.TypesRtype
hash (	Rhash
data (	Rdata"*
KpiEventType"
Types	
slice 
ts"�
MetricMetaData
title (	Rtitle
ts (Rts*
logical_device_id (	RlogicalDeviceId
	serial_no (	RserialNo
	device_id (	RdeviceId<
context (2".event.MetricMetaData.ContextEntryRcontext
uuid (	Ruuid:
ContextEntry
key (	Rkey
value (	Rvalue:8"�
MetricValuePairs>
metrics (2$.event.MetricValuePairs.MetricsEntryRmetrics:
MetricsEntry
key (	Rkey
value (Rvalue:8"�
MetricInformation1
metadata (2.event.MetricMetaDataRmetadata?
metrics (2%.event.MetricInformation.MetricsEntryRmetrics:
MetricsEntry
key (	Rkey
value (Rvalue:8"�
KpiEvent-
type (2.event.KpiEventType.TypesRtype
ts (Rts9
prefixes (2.event.KpiEvent.PrefixesEntryRprefixesT
PrefixesEntry
key (	Rkey-
value (2.event.MetricValuePairsRvalue:8"�
	KpiEvent2-
type (2.event.KpiEventType.TypesRtype
ts (Rts7

slice_data (2.event.MetricInformationR	sliceData"�
DeviceEvent
resource_id (	R
resourceId*
device_event_name (	RdeviceEventName 
description (	Rdescription9
context (2.event.DeviceEvent.ContextEntryRcontext:
ContextEntry
key (	Rkey
value (	Rvalue:8"�
RPCEvent
rpc (	Rrpc!
operation_id (	RoperationId
service (	Rservice
stack_id (	RstackId
resource_id (	R
resourceId 
description (	Rdescription6
context (2.event.RPCEvent.ContextEntryRcontext-
status (2.common.OperationRespRstatus:
ContextEntry
key (	Rkey
value (	Rvalue:8"v
EventCategory"e
Types
COMMUNICATION 
ENVIRONMENT
	EQUIPMENT
SERVICE

PROCESSING
SECURITY"R
EventSubCategory">
Types
PON 
OLT
ONT
ONU
NNI
NONE"f
	EventType"Y
Types
CONFIG_EVENT 
	KPI_EVENT

KPI_EVENT2
DEVICE_EVENT
	RPC_EVENT"�
EventHeader
id (	Rid6
category (2.event.EventCategory.TypesRcategory@
sub_category (2.event.EventSubCategory.TypesRsubCategory*
type (2.event.EventType.TypesRtype!
type_version (	RtypeVersion7
	raised_ts (2.google.protobuf.TimestampRraisedTs;
reported_ts (2.google.protobuf.TimestampR
reportedTs"�
Event*
header (2.event.EventHeaderRheader7
config_event (2.event.ConfigEventH RconfigEvent.
	kpi_event (2.event.KpiEventH RkpiEvent1

kpi_event2 (2.event.KpiEvent2H R	kpiEvent27
device_event (2.event.DeviceEventH RdeviceEvent.
	rpc_event (2.event.RPCEventH RrpcEventB

event_typeBL
org.opencord.voltha.eventsZ.github.com/opencord/voltha-protos/v5/go/volthaJ�L
  �

  

 E
	
 E

 3
	
 3

 
	
  &
	
 )
	
	 $


  


 

  

  	

   

   

   

  

  

  

  

  

  

  

  

  

  

  

  

  

  

  


 




 3

 

 *

 +.

 12



3









 "




 

 

 


 

 







	














 

 

 


 

 

!'

!

!

!"

!%&


$ &


$

 %%

 %

 %

 % 

 %#$


( .


(

 )-

 )	
,
  *" A new config has been added


  *

  *
*
 +" A config has been removed


 +

 +
*
 ," A config has been updated


 ,

 ,


0 5


0

 1#

 10

 1

 1

 1!"
A
3"4 hash for this change, can be used for quick lookup


31#

3


3

3
2
4"% the actual new data, in json format


43

4


4

4


7 <


7

 8;

 8	
E
  9"6 slice: a set of path/metric data for same time-stamp


  9

  9
;
 :", time-series: array of data for same metric


 :


 :
@
A V4
 Struct to convey a dictionary of metric metadata.



A
5
 B"( Metric group or individual metric name


 BA

 B


 B

 B
>
C"1 UTC time-stamp of data (seconds since epoch) of


CB

C


C

C
�
I!"% The logical device ID of the VOLTHA
2� when the metric or metric group was collected.
 If this is a 15-min historical group, it is the
 time of the collection and reporting, not the
 start or end of the 15-min group interval.


IC

I


I

I 
�
MY (equivalent to the DPID that ONOS has
 for the VOLTHA device without the
  'of:' prefix
"( The OLT, ONU, ... device serial number


MI!

M


M

M
3
N"& The OLT, ONU, ... physical device ID


NM

N


N

N
7
P$"* Name value pairs that provide additional


PN

P

P

P"#
m
T") Transaction identifier used to match On
25 context information on the metrics being
 reported.


TP$

T


T

T
�
\ a�
 Struct to convey a dictionary of metric->value pairs. Typically used in
 pure shared-timestamp or shared-timestamp + shared object prefix situations.



\
$
 _# Metric / value pairs.


 _\

 _

 _

 _!"
y
	g jm
 Struct to group metadata for a metric (or group of metrics) with the key-value
 pairs of collected metrics



	g

	 h 

	 hg

	 h

	 h

	 h

	i#

	ih 

	i

	i

	i!"
�

q {�
 Legacy KPI Event structured.  In mid-August, the KPI event format was updated
                               to a more easily parsable format. See VOL-1140
                               for more information.




q


 s 


 sq


 s


 s


 s
g

w"; UTC time-stamp of data in slice mode (seconds since epoc)
2 Fields used when for slice:



ws 


w	


w



w


y/


yw


y!


y"*


y-.

} �


}
 
   Type of KPI Event


 }

 

 

 
i
� Fields used when for slice:
"< UTC time-stamp of data in slice mode (seconds since epoch)


� 

�


�

�
O
�.2A of the time this entire KpiEvent was published to the kafka bus


�

�

�)

�,-
8
� �*
 Describes the events specific to device


�
V
 �H Identifier of the originating resource of the event, for ex: device_id


 ��

 �


 �

 �
P
�!B device_event_name indicates clearly the name of the device event


��

�


�

� 
7
�) Textual explanation of the device event


��!

�


�

�
Z
�$L Key/Value storage for extra information that may give context to the event


��

�

�

�"#
@
� �2
 Describes the events specific to an RPC request


�

 �
 RPC name


 ��

 �


 �

 �
N
�@ The operation id of that request.  Can be a log correlation ID


��

�


�

�
A
�3 Identifies the service name originating the event


��

�


�

�
:
�, Identifies the stack originating the event


��

�


�

�
V
�H Identifies the resource upon which the action is taken, e.g. device_id


��

�


�

�
0
�" Textual explanation of the event


��

�


�

�
Z
�$L Key/Value storage for extra information that may give context to the event


��

�

�

�"#
'
�$ Status of the RPC Event


��$

�

�

�"#
G
� �9
 Identify the area of the system impacted by the event.


�

 ��

 �	

  �

  �

  �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �
*
 �" Add new event areas here


 �

 �
G
� �9
 Identify the functional category originating the event


�

 ��

 �	

  �

  �

  �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �
+
 �"Adding None for RPC Events


 �

 �
+
� �
 Identify the type of event


�

 ��

 �	

  �

  �

  �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �
G
� �9
 Identify the functional category originating the event


�
D
 �6 Unique ID for this event.  e.g. voltha.some_olt.1234


 ��

 �


 �

 �
A
�%3 Refers to the functional area affect by the event


��

�

� 

�#$
:
�,, Refers to functional category of the event


��%

�

�'

�*+
/
�! Refers to the type of the event


��,

�

�

�
�
�� The version identifier for this event type, thus allowing each
 event type to evolve independently. The version should be in the
 format “MAJOR.MINOR” format and minor changes must only be additive
 and non-breaking.


��

�


�

�
�
�,� Timestamp at which the event was first raised.
 This represents the UTC time stamp since epoch (in seconds) when the
 the event was first raised from the source entity.
 If the source entity doesn't send the raised_ts, this shall be set
 to timestamp when the event was received.


��

�

�'

�*+
�
�.� Timestamp at which the event was reported.
 This represents the UTC time stamp since epoch (in seconds) when the
 the event was reported (this time stamp is >= raised_ts).
 If the source entity that reported this event doesn't send the 
 reported_ts, this shall be set to the same value as raised_ts.


��,

�

�)

�,-
 
� �
 Event Structure


�

 � event header


 ��

 �

 �

 �
:
 ��* oneof event types referred by EventType.


 �

%
�% Refers to ConfigEvent


�

� 

�#$
"
� Refers to KpiEvent


�

�

�
#
�! Refers to KpiEvent2


�

�

� 
%
�% Refers to DeviceEvent


�

� 

�#$
&
� Refers to an RPC Event


�

�

�bproto3
�!
voltha_protos/ext_config.protoconfig"i
AlarmConfigP
onu_itu_pon_alarm_config (2.config.OnuItuPonAlarmH RonuItuPonAlarmConfigB
config"�	
OnuItuPonAlarm
pon_ni (RponNi
onu_id (RonuId9
alarm_id (2.config.OnuItuPonAlarm.AlarmIDRalarmIdj
alarm_reporting_condition (2..config.OnuItuPonAlarm.AlarmReportingConditionRalarmReportingCondition`
rate_threshold_config (2*.config.OnuItuPonAlarm.RateThresholdConfigH RrateThresholdConfigT
rate_range_config (2&.config.OnuItuPonAlarm.RateRangeConfigH RrateRangeConfigc
value_threshold_config (2+.config.OnuItuPonAlarm.ValueThresholdConfigH RvalueThresholdConfig\
SoakTime(
active_soak_time (RactiveSoakTime&
clear_soak_time (RclearSoakTime�
RateThresholdConfig2
rate_threshold_rising (RrateThresholdRising4
rate_threshold_falling (RrateThresholdFalling<
	soak_time (2.config.OnuItuPonAlarm.SoakTimeRsoakTime�
RateRangeConfig(
rate_range_lower (RrateRangeLower(
rate_range_upper (RrateRangeUpper<
	soak_time (2.config.OnuItuPonAlarm.SoakTimeRsoakTime}
ValueThresholdConfig'
threshold_limit (RthresholdLimit<
	soak_time (2.config.OnuItuPonAlarm.SoakTimeRsoakTime"
AlarmID

RDI_ERRORS "R
AlarmReportingCondition
RATE_THRESHOLD 

RATE_RANGE
VALUE_THRESHOLDB
configBI
org.opencord.volthaZ2github.com/opencord/voltha-protos/v5/go/ext/configJ�
 E
�
 � Copyright 2020-2024 Open Networking Foundation (ONF) and the ONF Contributors

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at:

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.


 I
	
 I

 

 ,
	
 ,


  


 

  

  


  3

  

  .

  12


 E




 

 

  " RDI errors


  

  

 $

 
z
 !"k The alarm is triggered if the stats delta value between samples crosses the configured threshold boundary


 !

 !
s
""d The alarm is triggered if the stats delta value between samples deviates from the configured range


"

"
�
#"� The alarm is raised if the stats sample value becomes greater than this level.  The alarm is cleared when the host read the stats


#

#

 &)

 &

  '$

  '&

  '

  '

  '"#

 (#

 ('$

 (

 (

 (!"

+/

+

 ,)

 ,+ 

 ,

 ,$

 ,'(

-*

-,)

-

-%

-()

.

.-*

.

.

.

15

1

 2$

 21

 2

 2

 2"#

3$

32$

3

3

3"#

4

43$

4

4

4

7:

7

 8#

 87!

 8

 8

 8!"

9

98#

9

9

9

 <

 <:

 <


 <

 <

=

=<

=


=

=

>

>=

>


>

>

?9

?>

?

?4

?78

 @D

 @	

A5

A

A0

A34

B-

B

B(

B+,

C7

C

C2

C56bproto3
Ƕ
voltha_protos/extensions.proto	extensionvoltha_protos/ext_config.protogoogle/protobuf/empty.proto"]
ValueSet
id (	Rid8
alarm_config (2.config.AlarmConfigH RalarmConfigB
value",
	ValueType"
Type	
EMPTY 
DISTANCE"Q
ValueSpecifier
id (	Rid/
value (2.extension.ValueType.TypeRvalue"t
ReturnValues
Set (RSet 
Unsupported (RUnsupported
Error (RError
Distance (RDistance"6
GetDistanceRequest 
onuDeviceId (	RonuDeviceId"1
GetDistanceResponse
distance (Rdistance"2
GetOnuUniInfoRequest
uniIndex (RuniIndex"�
GetOnuUniInfoResponseP
admState (24.extension.GetOnuUniInfoResponse.AdministrativeStateRadmStateO
	operState (21.extension.GetOnuUniInfoResponse.OperationalStateR	operStateO
	configInd (21.extension.GetOnuUniInfoResponse.ConfigurationIndR	configInd"�
ConfigurationInd

UNKOWN 
TEN_BASE_T_FDX
HUNDRED_BASE_T_FDX
GIGABIT_ETHERNET_FDX
TEN_G_ETHERNET_FDX
TEN_BASE_T_HDX
HUNDRED_BASE_T_HDX
GIGABIT_ETHERNET_HDX"G
AdministrativeState
ADMSTATE_UNDEFINED 

LOCKED
UNLOCKED"F
OperationalState
OPERSTATE_UNDEFINED 
ENABLED
DISABLED"�
GetOltPortCounters
portNo (RportNoB
portType (2&.extension.GetOltPortCounters.PortTypeRportType"E
PortType
Port_UNKNOWN 
Port_ETHERNET_NNI
Port_PON_OLT"�
GetOltPortCountersResponse
txBytes (RtxBytes
rxBytes (RrxBytes
	txPackets (R	txPackets
	rxPackets (R	rxPackets&
txErrorPackets (RtxErrorPackets&
rxErrorPackets (RrxErrorPackets&
txBcastPackets (RtxBcastPackets&
rxBcastPackets (RrxBcastPackets&
txUcastPackets	 (RtxUcastPackets&
rxUcastPackets
 (RrxUcastPackets&
txMcastPackets (RtxMcastPackets&
rxMcastPackets (RrxMcastPackets"D
GetOnuPonOpticalInfo,
empty (2.google.protobuf.EmptyRempty"�
GetOnuPonOpticalInfoResponse*
powerFeedVoltage (RpowerFeedVoltage2
receivedOpticalPower (RreceivedOpticalPower6
meanOpticalLaunchPower (RmeanOpticalLaunchPower*
laserBiasCurrent (RlaserBiasCurrent 
temperature (Rtemperature"�
GetOnuEthernetBridgePortHistoryR
	direction (24.extension.GetOnuEthernetBridgePortHistory.DirectionR	direction"8
	Direction
	UNDEFINED 
UPSTREAM

DOWNSTREAM"�
'GetOnuEthernetBridgePortHistoryResponse

dropEvents (R
dropEvents
octets (Roctets
packets (Rpackets*
broadcastPackets (RbroadcastPackets*
multicastPackets (RmulticastPackets,
crcErroredPackets (RcrcErroredPackets*
undersizePackets (RundersizePackets(
oversizePackets (RoversizePackets(
packets64octets	 (Rpackets64octets2
packets65To127octets
 (Rpackets65To127octets4
packets128To255Octets (Rpackets128To255Octets4
packets256To511octets (Rpackets256To511octets6
packets512To1023octets (Rpackets512To1023octets8
packets1024To1518octets (Rpackets1024To1518octets"@
GetOnuFecHistory,
empty (2.google.protobuf.EmptyRempty"�
GetOnuFecHistoryResponse&
correctedBytes (RcorrectedBytes.
correctedCodeWords (RcorrectedCodeWords

fecSeconds (R
fecSeconds&
totalCodeWords (RtotalCodeWords6
uncorrectableCodeWords (RuncorrectableCodeWords"G
GetOnuCountersRequest
intf_id (RintfId
onu_id (RonuId"�
%GetOmciEthernetFrameExtendedPmRequest 
onuDeviceId (	RonuDeviceId
uniIndex (H RuniIndex
reset (RresetB
is_uni_index"C
GetRxPowerRequest
intf_id (RintfId
onu_id (RonuId"L
GetOltRxPowerRequest

port_label (	R	portLabel
onu_sn (	RonuSn"�
GetOnuCountersResponse
intf_id (H RintfId
onu_id (HRonuId'
positive_drift (HRpositiveDrift'
negative_drift (HRnegativeDrift:
delimiter_miss_detection (HRdelimiterMissDetection

bip_errors (HR	bipErrors
	bip_units (HRbipUnits4
fec_corrected_symbols (HRfecCorrectedSymbols8
fec_codewords_corrected	 (HRfecCodewordsCorrected@
fec_codewords_uncorrectable
 (H	RfecCodewordsUncorrectable%
fec_codewords (H
RfecCodewords0
fec_corrected_units (HRfecCorrectedUnits(
xgem_key_errors (HRxgemKeyErrors
	xgem_loss (HRxgemLoss(
rx_ploams_error (HRrxPloamsError-
rx_ploams_non_idle (HRrxPloamsNonIdle
rx_omci (HRrxOmci
tx_omci (HRtxOmci:
rx_omci_packets_crc_error (HRrxOmciPacketsCrcError
rx_bytes (HRrxBytes

rx_packets (HR	rxPackets
tx_bytes (HRtxBytes

tx_packets (HR	txPackets#
ber_reported (HRberReported!
lcdg_errors (HR
lcdgErrors

rdi_errors (HR	rdiErrors
	timestamp (HR	timestampB

is_intf_idB
	is_onu_idB
is_positive_driftB
is_negative_driftB
is_delimiter_miss_detectionB
is_bip_errorsB
is_bip_unitsB
is_fec_corrected_symbolsB
is_fec_codewords_correctedB 
is_fec_codewords_uncorrectableB
is_fec_codewordsB
is_fec_corrected_unitsB
is_xgem_key_errorsB
is_xgem_lossB
is_rx_ploams_errorB
is_rx_ploams_non_idleB

is_rx_omciB

is_tx_omciB
is_rx_omci_packets_crc_errorB
is_rx_bytesB
is_rx_packetsB
is_tx_bytesB
is_tx_packetsB
is_ber_reportedB
is_lcdg_errorsB
is_rdi_errorsB
is_timestamp"�
OmciEthernetFrameExtendedPm
drop_events (R
dropEvents
octets (Roctets
frames (Rframes)
broadcast_frames (RbroadcastFrames)
multicast_frames (RmulticastFrames,
crc_errored_frames (RcrcErroredFrames)
undersize_frames (RundersizeFrames'
oversize_frames (RoversizeFrames(
frames_64_octets	 (Rframes64Octets4
frames_65_to_127_octets
 (Rframes65To127Octets6
frames_128_to_255_octets (Rframes128To255Octets6
frames_256_to_511_octets (Rframes256To511Octets8
frames_512_to_1023_octets (Rframes512To1023Octets:
frames_1024_to_1518_octets (Rframes1024To1518Octets"�
&GetOmciEthernetFrameExtendedPmResponseB
upstream (2&.extension.OmciEthernetFrameExtendedPmRupstreamF

downstream (2&.extension.OmciEthernetFrameExtendedPmR
downstream�
&omci_ethernet_frame_extended_pm_format (28.extension.GetOmciEthernetFrameExtendedPmResponse.FormatR!omciEthernetFrameExtendedPmFormat"0
Format
THIRTY_TWO_BIT 
SIXTY_FOUR_BIT"t
RxPower
onu_sn (	RonuSn
status (	Rstatus
fail_reason (	R
failReason
rx_power (RrxPower"e
GetOltRxPowerResponse

port_label (	R	portLabel-
rx_power (2.extension.RxPowerRrxPower"�
GetRxPowerResponse
intf_id (RintfId
onu_id (RonuId
status (	Rstatus
fail_reason (	R
failReason
rx_power (RrxPower"J
GetOnuOmciTxRxStatsRequest,
empty (2.google.protobuf.EmptyRempty"�
GetOnuOmciTxRxStatsResponse)
base_tx_ar_frames (RbaseTxArFrames)
base_rx_ak_frames (RbaseRxAkFrames.
base_tx_no_ar_frames (RbaseTxNoArFrames.
base_rx_no_ak_frames (RbaseRxNoAkFrames'
ext_tx_ar_frames (RextTxArFrames'
ext_rx_ak_frames (RextRxAkFrames,
ext_tx_no_ar_frames (RextTxNoArFrames,
ext_rx_no_ak_frames (RextRxNoAkFrames5
tx_omci_counter_retries	 (RtxOmciCounterRetries7
tx_omci_counter_timeouts
 (RtxOmciCounterTimeouts"M
GetOnuOmciActiveAlarmsRequest,
empty (2.google.protobuf.EmptyRempty"}
	AlarmData
class_id (RclassId
instance_id (R
instanceId
name (	Rname 
description (	Rdescription"[
GetOnuOmciActiveAlarmsResponse9
active_alarms (2.extension.AlarmDataRactiveAlarms"�
!GetOffloadedAppsStatisticsRequestU
statsFor (29.extension.GetOffloadedAppsStatisticsRequest.OffloadedAppRstatsFor"F
OffloadedApp
	UNDEFINED 
PPPoeIA
DHCPv4RA
DHCPv6RA"�
"GetOffloadedAppsStatisticsResponsec
dhcpv4RaStats (2;.extension.GetOffloadedAppsStatisticsResponse.DHCPv4RAStatsH Rdhcpv4RaStatsc
dhcpv6RaStats (2;.extension.GetOffloadedAppsStatisticsResponse.DHCPv6RAStatsH Rdhcpv6RaStats`
pppoeIaStats (2:.extension.GetOffloadedAppsStatisticsResponse.PPPoeIAStatsH RpppoeIaStats�
DHCPv4RAStats:
in_bad_packets_from_client (RinBadPacketsFromClient:
in_bad_packets_from_server (RinBadPacketsFromServer3
in_packets_from_client (RinPacketsFromClient3
in_packets_from_server (RinPacketsFromServer1
out_packets_to_server (RoutPacketsToServer1
out_packets_to_client (RoutPacketsToClientM
$option_82_inserted_packets_to_server (Roption82InsertedPacketsToServerK
#option_82_removed_packets_to_client (Roption82RemovedPacketsToClientE
 option_82_not_inserted_to_server	 (Roption82NotInsertedToServer{
additional_stats
 (2P.extension.GetOffloadedAppsStatisticsResponse.DHCPv4RAStats.AdditionalStatsEntryRadditionalStatsB
AdditionalStatsEntry
key (	Rkey
value (	Rvalue:8�
DHCPv6RAStats:
in_bad_packets_from_client (RinBadPacketsFromClient:
in_bad_packets_from_server (RinBadPacketsFromServerM
$option_17_inserted_packets_to_server (Roption17InsertedPacketsToServerK
#option_17_removed_packets_to_client (Roption17RemovedPacketsToClientM
$option_18_inserted_packets_to_server (Roption18InsertedPacketsToServerK
#option_18_removed_packets_to_client (Roption18RemovedPacketsToClientM
$option_37_inserted_packets_to_server (Roption37InsertedPacketsToServerK
#option_37_removed_packets_to_client (Roption37RemovedPacketsToClientW
)outgoing_mtu_exceeded_packets_from_client	 (R$outgoingMtuExceededPacketsFromClient{
additional_stats
 (2P.extension.GetOffloadedAppsStatisticsResponse.DHCPv6RAStats.AdditionalStatsEntryRadditionalStatsB
AdditionalStatsEntry
key (	Rkey
value (	Rvalue:8�
PPPoeIAStats>
in_error_packets_from_client (RinErrorPacketsFromClient>
in_error_packets_from_server (RinErrorPacketsFromServer3
in_packets_from_client (RinPacketsFromClient3
in_packets_from_server (RinPacketsFromServer1
out_packets_to_server (RoutPacketsToServer1
out_packets_to_client (RoutPacketsToClient`
.vendor_specific_tag_inserted_packets_to_server (R(vendorSpecificTagInsertedPacketsToServer^
-vendor_specific_tag_removed_packets_to_client (R'vendorSpecificTagRemovedPacketsToClientW
)outgoing_mtu_exceeded_packets_from_client	 (R$outgoingMtuExceededPacketsFromClientz
additional_stats
 (2O.extension.GetOffloadedAppsStatisticsResponse.PPPoeIAStats.AdditionalStatsEntryRadditionalStatsB
AdditionalStatsEntry
key (	Rkey
value (	Rvalue:8B
stats"�
GetValueRequest;
distance (2.extension.GetDistanceRequestH Rdistance;
uniInfo (2.extension.GetOnuUniInfoRequestH RuniInfoA
oltPortInfo (2.extension.GetOltPortCountersH RoltPortInfoI
onuOpticalInfo (2.extension.GetOnuPonOpticalInfoH RonuOpticalInfoR
ethBridgePort (2*.extension.GetOnuEthernetBridgePortHistoryH RethBridgePort=

fecHistory (2.extension.GetOnuFecHistoryH R
fecHistoryB

onuPonInfo (2 .extension.GetOnuCountersRequestH R
onuPonInfoL
onuInfo (20.extension.GetOmciEthernetFrameExtendedPmRequestH RonuInfo8
rxPower	 (2.extension.GetRxPowerRequestH RrxPowerK
onuOmciStats
 (2%.extension.GetOnuOmciTxRxStatsRequestH RonuOmciStatsA

oltRxPower (2.extension.GetOltRxPowerRequestH R
oltRxPowerT
onuActiveAlarms (2(.extension.GetOnuOmciActiveAlarmsRequestH RonuActiveAlarms^
offloadedAppsStats (2,.extension.GetOffloadedAppsStatisticsRequestH RoffloadedAppsStatsB	
request"�

GetValueResponse:
status (2".extension.GetValueResponse.StatusRstatusE
	errReason (2'.extension.GetValueResponse.ErrorReasonR	errReason<
distance (2.extension.GetDistanceResponseH Rdistance<
uniInfo (2 .extension.GetOnuUniInfoResponseH RuniInfoK
portCoutners (2%.extension.GetOltPortCountersResponseH RportCoutnersQ
onuOpticalInfo (2'.extension.GetOnuPonOpticalInfoResponseH RonuOpticalInfob
ethBridgePortInfo (22.extension.GetOnuEthernetBridgePortHistoryResponseH RethBridgePortInfoE

fecHistory (2#.extension.GetOnuFecHistoryResponseH R
fecHistoryK
onuPonCounters	 (2!.extension.GetOnuCountersResponseH RonuPonCountersU
onuCounters
 (21.extension.GetOmciEthernetFrameExtendedPmResponseH RonuCounters9
rxPower (2.extension.GetRxPowerResponseH RrxPowerL
onuOmciStats (2&.extension.GetOnuOmciTxRxStatsResponseH RonuOmciStatsB

oltRxPower (2 .extension.GetOltRxPowerResponseH R
oltRxPowerU
onuActiveAlarms (2).extension.GetOnuOmciActiveAlarmsResponseH RonuActiveAlarms_
offloadedAppsStats (2-.extension.GetOffloadedAppsStatisticsResponseH RoffloadedAppsStats"1
Status
STATUS_UNDEFINED 
OK	
ERROR"�
ErrorReason
REASON_UNDEFINED 
UNSUPPORTED
INVALID_DEVICE_ID
INVALID_PORT_TYPE
TIMEOUT
INVALID_REQ_TYPE
INTERNAL_ERROR
INVALID_DEVICEB

response"�
AppOffloadConfig&
enableDHCPv4RA (RenableDHCPv4RA&
enableDHCPv6RA (RenableDHCPv6RA$
enablePPPoEIA (RenablePPPoEIA"
accessNodeID (	RaccessNodeID"�
AppOffloadOnuConfig 
onuDeviceId (	RonuDeviceIdK

perUniInfo (2+.extension.AppOffloadOnuConfig.PerUniConfigR
perUniInfox
PerUniConfig$
agentRemoteID (	RagentRemoteID&
agentCircuitID (	RagentCircuitID
onuUniId (RonuUniId"�
SetValueRequest8
alarm_config (2.config.AlarmConfigH RalarmConfigK
app_offload_config (2.extension.AppOffloadConfigH RappOffloadConfigU
app_offload_onu_config (2.extension.AppOffloadOnuConfigH RappOffloadOnuConfigB	
request"�
SetValueResponse:
status (2".extension.SetValueResponse.StatusRstatusE
	errReason (2'.extension.SetValueResponse.ErrorReasonR	errReason"1
Status
STATUS_UNDEFINED 
OK	
ERROR"z
ErrorReason
REASON_UNDEFINED 
UNSUPPORTED
INVALID_DEVICE_ID
INVALID_ONU_DEVICE_ID
INVALID_UNI_ID"i
SingleGetValueRequest
targetId (	RtargetId4
request (2.extension.GetValueRequestRrequest"Q
SingleGetValueResponse7
response (2.extension.GetValueResponseRresponse"i
SingleSetValueRequest
targetId (	RtargetId4
request (2.extension.SetValueRequestRrequest"Q
SingleSetValueResponse7
response (2.extension.SetValueResponseRresponse2�
	ExtensionR
GetExtValue .extension.SingleGetValueRequest!.extension.SingleGetValueResponseR
SetExtValue .extension.SingleSetValueRequest!.extension.SingleSetValueResponseBR
org.opencord.voltha.extensionZ1github.com/opencord/voltha-protos/v5/go/extensionJ��
 �
�
 2� Copyright 2018-2024 Open Networking Foundation (ONF) and the ONF Contributors

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at:

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.


 H
	
 H

 6
	
 6

 
	
  (
	
 %


  


 

  

  

  


  

  

  

  


 ,

 

 '

 *+


 $




  #

  	

  !

  !

  !

 "

 "

 "


& )


&

 '

 '&

 '


 '

 '

(

('

(

(

(


+ 8


+
(
 ," Specifies what values are


 ,+

 ,


 ,

 ,
D
/"  Specifies requested values not
2 set/valid in return


/,

/


/

/
H
2"  Specifies requested values not
2 supported by the device


2/

2


2

2
I
5"  Value of distance Set includes
2 fetched because of error


52

5


5

5


: <


:

 ;

 ;:

 ;


 ;

 ;


> @


>
!
 ?" distance in meters


 ?>

 ?


 ?

 ?


B D


B
/
 C"" Index of the uni starting from 0


 CB

 C


 C

 C


F a


F

 GP

 G	

  H

  H

  H

 I

 I

 I

 J

 J

 J

 K!

 K

 K 

 L

 L

 L

 M

 M

 M

 N

 N

 N

 O!

 O

 O 

RV

R	

 S

 S

 S

T

T

T

U

U

U

X\

X	

 Y 

 Y

 Y

Z

Z

Z

[

[

[

 ^%

 ^\

 ^

 ^ 

 ^#$

_#

_^%

_

_

_!"

`#

`_#

`

`

`!"


c k


c

 dh

 d	

  e

  e

  e

 f

 f

 f

 g

 g

 g
(
 i" Device-unique port number


 ih

 i


 i

 i

j

ji

j

j

j


	m z


	m"

	 n

	 nm$

	 n


	 n

	 n

	o

	on

	o


	o

	o

	p

	po

	p


	p

	p

	q

	qp

	q


	q

	q

	r

	rq

	r


	r

	r

	s

	sr

	s


	s

	s

	t

	ts

	t


	t

	t

	u

	ut

	u


	u

	u

	v

	vu

	v


	v

	v

		w

		wv

		w


		w

		w

	
x

	
xw

	
x


	
x

	
x

	y

	yx

	y


	y

	y



| ~



|


 }$


 }|


 }


 }


 }"#
�
� �� These values correspond to the Optical Line Supervision Test results
 described in section A3.39.5 of ITU-T G.988 (11/2017) specification.


�$
(
 �" unit of value is voltage


 ��%

 �	

 �


 �
$
�#" unit of value is dBm


��

�	

�


�!"
$
�%" unit of value is dBm


��#

�	

�
 

�#$
3
�"% unit of value is milli-amphere (mA)


��%

�	

�


�
/
�"! unit of value is degree celsius


��

�	

�


�

� �

�'

 ��

 �	

  �

  �

  �

 �

 �

 �

 �

 �

 �

 �

 ��

 �

 �

 �

� �

�/

 �

 ��1

 �

 �

 �

�

��

�

�

�

�

��

�

�

�

�!

��

�

�

� 

�!

��!

�

�

� 

�"

��!

�

�

� !

�!

��"

�

�

� 

� 

��!

�

�

�

� 

�� 

�

�

�

	�&

	�� 

	�

	� 

	�#%


�'


��&


�


�!


�$&

�'

��'

�

�!

�$&

�(

��'

�

�"

�%'

�)

��(

�

�#

�&(

� �

�

 �$

 ��

 �

 �

 �"#

� �

� 

 �

 ��"

 �


 �

 �

�"

��

�


�

� !

�

��"

�


�

�

�

��

�


�

�

�&

��

�


�!

�$%

� �

�

 �

 ��

 �

 �

 �

�

��

�

�

�

� �

�-

 �

 ��/

 �


 �

 �

 ��

 �

0
�"" Index of the uni starting from 0


�

�

�

�

��

�

�	

�

� � DEPRECATED


�

 �

 ��

 �

 �

 �

�

��

�

�

�

� �

�

 �

 ��

 �


 �

 �
�
�� onu_sn is optional and if onu_sn is an empty string and the label is 
 of a PON port then it means that the Rx Power corresponding to all 
 the ONUs on that PON port is requested. In case the port_label is not
 of a PON port, the onu_sn does not have any significance 


��

�


�

�

� �

�

 ��

 �


 �

 �

 �

 �

��

�


�

�

�

�

��

�


�#

�

�

�!"

��

�


�#

�

�

�!"

��

�
%

�-

�

�(

�+,

��

�


�

�

�

�

��

�


�

�

�

�

��

�
"

�*

�

�%

�()

��

�
$

�,

�

�'

�*+

	��

	�
(

	�1

	�

	�+

	�.0


��


�



�#


�


�


� "

��

�
 

�)

�

�#

�&(

��

�


�%

�

�

�"$

��

�


�

�

�

�

��

�


�%

�

�

�"$

��

�


�(

�

�"

�%'

��

�


�

�

�

�

��

�


�

�

�

�

��

�
&

�/

�

�)

�,.

��

�


�

�

�

�

��

�


� 

�

�

�

��

�


�

�

�

�

��

�


� 

�

�

�

��

�


�"

�

�

�!

��

�


�!

�

�

� 

��

�


� 

�

�

�

��

�

9
�+ reported timestamp in seconds since epoch


�

�

�

� �

�#

 � 

 ��%

 �

 �

 �

�

�� 

�

�

�

�

��

�

�

�

�%

��

�

� 

�#$

�%

��%

�

� 

�#$

�'

��%

�

�"

�%&

�%

��'

�

� 

�#$

�$

��%

�

�

�"#

�%

��$

�

� 

�#$

	�-

	��%

	�

	�'

	�*,


�.


��-


�


�(


�+-

�.

��.

�

�(

�+-

�/

��.

�

�)

�,.

�0

��/

�

�*

�-/

� �

�.

 ��

 �	

  �

  �

  �

 �

 �

 �

 �-

 ��

 �

 � (

 �+,

�/

��-

�

� *

�-.

�5

��/

�


�1

�34

� �

�
i
 �"[ if the port on which RxPower is measured is not a PON port this will be empty ("") string


 ��

 �


 �

 �

�

��

�


�

�

�

��

�


�

�

�

��

�


�

�

� �

�

 �

 ��

 �


 �

 �

�"

�

�

�

� !

� � DEPRECATED


�

 �

 ��

 �

 �

 �

�

��

�

�

�

�

��

�


�

�

�

��

�


�

�

�

��

�


�

�

� �

�"

 �$

 ��#

 �

 �

 �"#
.
� �  see ITU-T G.988 clause 11.2.2 


�#
7
 �!) OMCI baseline Tx frames with AR bit set


 ��%

 �


 �

 � 
7
�!) OMCI baseline Rx frames with AK bit set


��!

�


�

� 
9
�$+ OMCI baseline Tx frames with AR bit unset


��!

�


�

�"#
9
�$+ OMCI baseline Rx frames with AK bit unset


��$

�


�

�"#
7
� ) OMCI extended Tx frames with AR bit set


��$

�


�

�
7
� ) OMCI extended Rx frames with AK bit set


�� 

�


�

�
9
�#+ OMCI extended Tx frames with AR bit unset


�� 

�


�

�!"
9
�#+ OMCI extended Rx frames with AK bit unset


��#

�


�

�!"
U
�'G Number of retries of requests (tx) due to not received responses (Rx)


��#

�


�"

�%&
y
	�)k Number of timeouts of requests (tx) due to not received responses (Rx) after configured number of retries


	��'

	�


	�#

	�&(

� �

�%

 �$

 ��&

 �

 �

 �"#

� �

�

 �

 ��

 �


 �

 �

�

��

�


�

�

�

��

�


�

�

�

��

�


�

�

� �

�&

 �)

 �

 �

 �$

 �'(

� �

�)

 ��

 �	

  �

  �

  �

 �

 �

 �

 �

 �

 �

 �

 �

 �
H
 �: The offloaded application whose statistics are requested


 ��

 �

 �

 �

 � �

 �*

  ��

  �
v
   �.f From https://github.com/BroadbandForum/yang/blob/master/standard/networking/bbf-l2-dhcpv4-relay.yang


   ��

   �

   �)

   �,-

  �.

  ��.

  �

  �)

  �,-

  �*

  ��.

  �

  �%

  �()

  �*

  ��*

  �

  �%

  �()

  �)

  ��*

  �

  �$

  �'(

  �)

  ��)

  �

  �$

  �'(

  �8

  ��)

  �

  �3

  �67

  �7

  ��8

  �

  �2

  �56

  �4

  ��7

  �

  �/

  �23
|
  	�2l Name value pairs that gives the flexibility to report different statistics that implementations may choose


  	��4

  	�

  	�,

  	�/1

 ��

 �
k
  �.[ From https://github.com/BroadbandForum/yang/blob/master/standard/networking/bbf-ldra.yang


  ��

  �

  �)

  �,-

 �.

 ��.

 �

 �)

 �,-

 �8

 ��.

 �

 �3

 �67

 �7

 ��8

 �

 �2

 �56

 �8

 ��7

 �

 �3

 �67

 �7

 ��8

 �

 �2

 �56

 �8

 ��7

 �

 �3

 �67

 �7

 ��8

 �

 �2

 �56

 �=

 ��7

 �

 �8

 �;<
|
 	�2l Name value pairs that gives the flexibility to report different statistics that implementations may choose


 	��=

 	�

 	�,

 	�/1

 ��

 �

  �0o From https://github.com/BroadbandForum/yang/blob/master/standard/networking/bbf-pppoe-intermediate-agent.yang


  ��

  �

  �+

  �./

 �0

 ��0

 �

 �+

 �./

 �*

 ��0

 �

 �%

 �()

 �*

 ��*

 �

 �%

 �()

 �)

 ��*

 �

 �$

 �'(

 �)

 ��)

 �

 �$

 �'(

 �B

 ��)

 �

 �=

 �@A

 �A

 ��B

 �

 �<

 �?@

 �=

 ��A

 �

 �8

 �;<
|
 	�2l Name value pairs that gives the flexibility to report different statistics that implementations may choose


 	��=

 	�

 	�,

 	�/1

  ��

  �


  �(

  �

  �#

  �&'

 �(

 �

 �#

 �&'

 �&

 �

 �!

 �$%

!� �

!�

! ��

! �


! �(

! �

! �#

! �&'

!�)

!�

!�$

!�'(
Y
!�+K Corresponds to PmMetricId.PON_PORT_COUNTERS, PmMetricId.NNI_PORT_COUNTERS


!�

!�&

!�)*
5
!�0' Corresponds to PmMetricId.PON_OPTICAL


!�

!�+

!�./
F
!�:8 Corresponds to PmMetricId.ETHERNET_BRIDGE_PORT_HISTORY


!�'

!�(5

!�89
5
!�(' Corresponds to PmMetricId.FEC_HISTORY


!�

!�#

!�&'

!�-

!�

!�(

!�+,

!�:

!�-

!�.5

!�89
"
!�&" This is deprecated


!�

!�!

!�$%

!	�5

!	�"

!	�#/

!	�24

!
�-

!
�

!
�'

!
�*,

!�<

!�%

!�&5

!�9;

!�B

!�)

!�*<

!�?A

"� �

"�

" ��

" �	

"  �

"  �

"  �

" �

" �


" �

" �

" �

" �

"��

"�	

" �

" �

" �

"�

"�

"�

"�

"�

"�

"�

"�

"�

"�

"�

"�

"�

"�

"�

"�

"�

"�

"�

"�

"�

" �

" ��

" �


" �

" �

"�

"��

"�

"�

"�

" ��

" �


"�)

"�

"�$

"�'(

"�*

"�

"�%

"�()

"�4

"�"

"�#/

"�23

"�8

"�$

"�%3

"�67

"�F

"�/

"�0A

"�DE

"�0

"� 

"�!+

"�./

"�2

"�

"�-

"�01

"	�@

"	�.

"	�/:

"	�=?
"
"
�(" This is DEPRECATED


"
�

"
�"

"
�%'

"�6

"�#

"�$0

"�35

"�.

"�

"�(

"�+-

"�<

"�&

"�'6

"�9;

"�C

"�*

"�+=

"�@B
|
#� �n AppOffloadConfig is the configuration for offloading applications to the OLT and has OLT wide configuration.


#�

# �

# ��

# �

# �	

# �

#�

#��

#�

#�	

#�

#�

#��

#�

#�	

#�
�
#�� Follows the same as the BBF Access Node Id defined in https://github.com/BroadbandForum/yang/blob/master/standard/networking/bbf-subscriber-profiles.yang


#��

#�


#�

#�
|
$� �n AppOffloadOnuConfig has Onu specfic configuration which the OLT runs applications which have been offloaded.


$�

$ �

$ ��

$ �


$ �

$ �

$ ��

$ �
�
$  �!� As per the BBF Agent Remote Id defined in https://github.com/BroadbandForum/yang/blob/master/standard/networking/bbf-pppoe-intermediate-agent-profile-common.yang


$  ��

$  �

$  �

$  � 
�
$ �"� As per the BBF Agent Circuit Id defined in https://github.com/BroadbandForum/yang/blob/master/standard/networking/bbf-pppoe-intermediate-agent-profile-common.yang


$ ��!

$ �

$ �

$ � !
�
$ �� The id of the UNI on the Onu for which this configuration is relevant. The UNI ids are numbered from 0 to n depending on the number of UNI ports on the ONU.


$ ��"

$ �

$ �

$ �

$�)

$�

$�

$�$

$�'(

%� �

%�

% ��

% �


% �,

% �

% �'

% �*+

%�0

%�

%�+

%�./

%�7

%�

%�2

%�56

&� �

&�

& ��

& �	

&  �

&  �

&  �

& �

& �


& �

& �

& �

& �

&��

&�	

& �

& �

& �

&�

&�

&�

&�

&�

&�

&�"

&�

&� !

&�

&�

&�

& �

& ��

& �


& �

& �

&�

&��

&�

&�

&�

'� �

'�

' �

' ��

' �


' �

' �

'� 

'��

'�

'�

'�

(� �

(�

( �"

( ��

( �

( �

( � !

)� �

)�

) �

) ��

) �


) �

) �

)� 

)��

)�

)�

)�

*� �

*�

* �"

* �� 

* �

* �

* � !
I
 � �; Extension is a service to get and set specific attributes


 �
&
  �L Get a single attribute


  �

  �)

  �4J
&
 �L Set a single attribute


 �

 �)

 �4Jbproto3
�|
'voltha_protos/voip_system_profile.protovoip_system_profilegoogle/api/annotations.proto"�
VoipSystemProfileRequest
key (	RkeyT
voipSystemProfile (2&.voip_system_profile.VoipSystemProfileRvoipSystemProfile"�
VoipSystemProfile<
	sipConfig (2.voip_system_profile.SipConfigR	sipConfig?

voipConfig (2.voip_system_profile.VoipConfigR
voipConfig"�

VoipConfigE
ipHostConfig (2!.voip_system_profile.IpHostConfigRipHostConfigE
tcpUdpConfig (2!.voip_system_profile.TcpUdpConfigRtcpUdpConfigE
voipVoiceCtp (2!.voip_system_profile.VoipVoiceCtpRvoipVoiceCtpQ
voipMediaProfile (2%.voip_system_profile.VoipMediaProfileRvoipMediaProfileZ
voiceServiceProfile (2(.voip_system_profile.VoiceServiceProfileRvoiceServiceProfile?

rtpProfile (2.voip_system_profile.RtpProfileR
rtpProfileB
pptpPotsUni (2 .voip_system_profile.PptpPotsUniRpptpPotsUni"�
IpHostConfig
	ipOptions (R	ipOptions$
onuIdentifier (	RonuIdentifier
	ipAddress (	R	ipAddress
mask (	Rmask
gateway (	Rgateway

primaryDns (	R
primaryDns"
secondaryDns (	RsecondaryDns,
relayAgentOptions (	RrelayAgentOptions"F
TcpUdpConfig
protocol (Rprotocol
tosField (	RtosField"6
VoipVoiceCtp&
signallingCode (RsignallingCode"�
VoipMediaProfile
faxMode (RfaxMode(
codecSelection1 (RcodecSelection16
packetPeriodSelection1 (RpacketPeriodSelection10
silenceSuppression1 (RsilenceSuppression1(
codecSelection2 (RcodecSelection26
packetPeriodSelection2 (RpacketPeriodSelection20
silenceSuppression2 (RsilenceSuppression2(
codecSelection3 (RcodecSelection36
packetPeriodSelection3	 (RpacketPeriodSelection30
silenceSuppression3
 (RsilenceSuppression3(
codecSelection4 (RcodecSelection46
packetPeriodSelection4 (RpacketPeriodSelection40
silenceSuppression4 (RsilenceSuppression4
oobDtmf (RoobDtmf"�
VoiceServiceProfile*
announcementType (RannouncementType"
jitterTarget (RjitterTarget(
jitterBufferMax (RjitterBufferMax$
echoCancelInd (RechoCancelInd0
pstnProtocolVariant (RpstnProtocolVariant(
dtmfDigitLevels (RdtmfDigitLevels,
dtmfDigitDuration (RdtmfDigitDuration2
hookFlashMinimumTime (RhookFlashMinimumTime"�

RtpProfile"
localPortMin (RlocalPortMin"
localPortMax (RlocalPortMax
dscpMark (	RdscpMark(
piggyBackEvents (RpiggyBackEvents

toneEvents (R
toneEvents

dtmfEvents (R
dtmfEvents
	casEvents (R	casEvents"�
PptpPotsUni
arc (	Rarc 
arcInterval (	RarcInterval
	impedance (R	impedance*
transmissionPath (RtransmissionPath
rxGain (RrxGain
txGain (RtxGain*
potsHoldOverTime (RpotsHoldOverTime.
nominalFeedVoltage (RnominalFeedVoltage*
lossOfSoftSwitch	 (RlossOfSoftSwitch"�
	SipConfigB
sipUserData (2 .voip_system_profile.SipUserDataRsipUserDataK
sipAgentConfig (2#.voip_system_profile.SipAgentConfigRsipAgentConfigN
networkDialPlan (2$.voip_system_profile.NetworkDialPlanRnetworkDialPlanc
voipFeatureAccessCodes (2+.voip_system_profile.VoipFeatureAccessCodesRvoipFeatureAccessCodesx
voipApplicationServiceProfile (22.voip_system_profile.VoipApplicationServiceProfileRvoipApplicationServiceProfile"�
SipUserData 
userPartAor (	RuserPartAorZ
usernameAndPassword (2(.voip_system_profile.UsernameAndPasswordRusernameAndPassword4
voicemailServerSipUri (	RvoicemailServerSipUriP
#voicemailSubscriptionExpirationTime (R#voicemailSubscriptionExpirationTime"
releaseTimer (RreleaseTimer
rohTimer (RrohTimer"�
SipAgentConfig2
outboundProxyAddress (	RoutboundProxyAddress$
primarySipDns (	RprimarySipDns(
secondarySipDns (	RsecondarySipDns$
sipRegExpTime (RsipRegExpTime4
sipReregHeadStartTime (RsipReregHeadStartTime"
SipRegistrar (	RSipRegistrar

softSwitch (	R
softSwitchQ
sipResponseTable (2%.voip_system_profile.SipResponseTableRsipResponseTable:
sipOptionTransmitControl	 (RsipOptionTransmitControl"
sipUriFormat
 (	RsipUriFormat:
redundantSipAgentPointer (	RredundantSipAgentPointer"�
NetworkDialPlan0
criticalDialTimeout (RcriticalDialTimeout.
partialDialTimeout (RpartialDialTimeout&
dialPlanFormat (RdialPlanFormatH
dialPlanTable (2".voip_system_profile.DialPlanTableRdialPlanTable"A
UsernameAndPassword*
validationScheme (RvalidationScheme"r
SipResponseTable(
sipResponseCode (	RsipResponseCode
tone (	Rtone 
textMessage (	RtextMessage"�
DialPlanTable

dialPlanId (R
dialPlanId
action (Raction$
dialPlanToken (	RdialPlanToken2
dialPlanTableMaxSize (RdialPlanTableMaxSize"�
VoipFeatureAccessCodes,
cancelCallWaiting (	RcancelCallWaiting
callHold (	RcallHold
callPark (	RcallPark*
callerIdActivate (	RcallerIdActivate.
callerIdDeactivate (	RcallerIdDeactivate6
doNotDisturbActivation (	RdoNotDisturbActivation:
doNotDisturbDeactivation (	RdoNotDisturbDeactivation4
doNotDisturbPinChange (	RdoNotDisturbPinChange6
emergencyServiceNumber	 (	RemergencyServiceNumber(
intercomService
 (	RintercomService6
unattendedCallTransfer (	RunattendedCallTransfer2
attendedCallTransfer (	RattendedCallTransfer"�
VoipApplicationServiceProfile 
cidFeatures (RcidFeatures0
callWaitingFeatures (RcallWaitingFeaturesF
callProgressOrTransferFeatures (RcallProgressOrTransferFeatures:
callPresentationFeatures (RcallPresentationFeatures2
directConnectFeature (RdirectConnectFeature8
directConnectUriPointer (	RdirectConnectUriPointer>
bridgedLineAgentUriPointer (	RbridgedLineAgentUriPointer@
conferenceFactoryUriPointer (	RconferenceFactoryUriPointer.
dialToneDelayTimer	 (RdialToneDelayTimerBf
'org.opencord.voltha.voip_system_profileZ;github.com/opencord/voltha-protos/v5/go/voip_system_profileJ�L
 �
�
 2� Copyright 2018-2024 Open Networking Foundation (ONF) and the ONF Contributors

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at:

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.


 R
	
 R

 @
	
 @

 
	
  &


  


  

  

  "

  

  	

  

 *

 

 

 %

 ()
�
  � A system wide profile for voip service that can be stored into voltha KV anytime.
 Designed based on G988-2017 (also designed flexible to be able to be modified later on)





 

 

 

 

 










1
# +% Common voip fields are grouped here



#

 $ 

 $#

 $

 $

 $

% 

%$ 

%

%

%

& 

&% 

&

&

&

'(

'& 

'

'#

'&'

(.

('(

(

()

(,-

)

)(.

)

)

)

*

*)

*

*

*


- 6


-

 .

 .-

 .

 .	

 .

/

/.

/

/	

/

0

0/

0

0	

0

1

10

1

1	

1

2

21

2

2	

2

3

32

3

3	

3

4

43

4

4	

4

5

54

5

5	

5


8 ;


8

 9

 98

 9

 9	

 9

:

:9

:

:	

:


= ?


=

 >

 >=

 >

 >	

 >


A P


A

 B

 BA

 B

 B	

 B

C

CB

C

C	

C

D$

DC

D

D	

D"#

E!

ED$

E

E	

E 

F

FE!

F

F	

F

G$

GF

G

G	

G"#

H!

HG$

H

H	

H 

I

IH!

I

I	

I

J$

JI

J

J	

J"#

	K"

	KJ$

	K

	K	

	K!


L


LK"


L


L	


L

M%

ML

M

M	

M"$

N"

NM%

N

N	

N!

O

ON"

O

O	

O


R [


R

 S

 SR

 S

 S	

 S

T

TS

T

T	

T

U

UT

U

U	

U

V

VU

V

V

V

W!

WV

W

W	

W 

X

XW!

X

X	

X

Y

YX

Y

Y	

Y

Z"

ZY

Z

Z	

Z !


] e


]

 ^

 ^]

 ^

 ^	

 ^

_

_^

_

_	

_

`

`_

`

`	

`

a

a`

a

a	

a

b

ba

b

b	

b

c

cb

c

c	

c

d

dc

d

d	

d


	g q


	g

	 h

	 hg

	 h

	 h	

	 h

	i

	ih

	i

	i	

	i

	j

	ji

	j

	j	

	j

	k

	kj

	k

	k	

	k

	l

	lk

	l

	l	

	l

	m

	ml

	m

	m	

	m

	n

	nm

	n

	n	

	n

	o 

	on

	o

	o	

	o

	p

	po 

	p

	p	

	p
2

t z& Sip specific fields are grouped here




t


 u


 ut


 u


 u


 u


v$


vu


v


v


v"#


w'


wv$


w


w"


w%&


x4


xw'


x


x/


x23


yB


yx4


y


y =


y@A

| �


|

 }

 }|

 }

 }	

 }

~.

~}

~

~)

~,-

#

~.



	

!"

�0

�#

�

�+

�./

�

��0

�

�

�

�

��

�

�

�

� �

�

 �"

 ��

 �

 �	

 � !

�

��"

�

�	

�

�

��

�

�	

�

�

��

�

�

�

�"

��

�

�

� !

�

��"

�

�	

�

�

��

�

�	

�

�(

��

�

�#

�&'

�$

��(

�

�

�"#

	�

	��$

	�

	�	

	�


�'


��


�


�	!


�$&

� �

�

 �!

 ��

 �

 �	

 � 

� 

��!

�

�	

�

�

�� 

�

�	

�

�"

��

�

�

� !

� �

�

 �

 ��

 �

 �

 �

� �

�

 �

 ��

 �

 �	

 �

�

��

�

�	

�

�

��

�

�	

�

� �

�

 �

 ��

 �

 �	

 �

�

��

�

�	

�

�

��

�

�	

�

�"

��

�

�	

� !

� �

�

 �

 �� 

 �

 �	

 �

�

��

�

�	

�

�

��

�

�	

�

�

��

�

�	

�

� 

��

�

�	

�

�$

�� 

�

�	

�"#

�&

��$

�

�	!

�$%

�#

��&

�

�	

�!"

�$

��#

�

�	

�"#

	�

	��$

	�

	�	

	�


�%


��


�


�	


�"$

�#

��%

�

�	

� "

� �

�%

 �

 ��'

 �

 �	

 �

�!

��

�

�	

� 

�,

��!

�

�	'

�*+

�&

��,

�

�	!

�$%

�"

��&

�

�	

� !

�%

��"

�

�	 

�#$

�(

��%

�

�	#

�&'

�)

��(

�

�	$

�'(

� 

��)

�

�	

�bproto3
�
%voltha_protos/voip_user_profile.protovoip_user_profilegoogle/api/annotations.proto"x
VoipUserProfileRequest
key (	RkeyL
voipUserProfile (2".voip_user_profile.VoipUserProfileRvoipUserProfile"�
VoipUserProfile2
voipSystemProfileKey (	RvoipSystemProfileKey
username (	Rusername
password (	Rpassword
domain (	Rdomain
proxy (	Rproxy
port (Rport&
sipDisplayName (	RsipDisplayName
realm (	RrealmBb
%org.opencord.voltha.voip_user_profileZ9github.com/opencord/voltha-protos/v5/go/voip_user_profileJ�
 &
�
 2� Copyright 2018-2024 Open Networking Foundation (ONF) and the ONF Contributors

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at:

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.


 P
	
 P

 >
	
 >

 
	
  &
6
  * A user specific profile for voip service



 
'
   for the path in KV store


   

  

  	

  

 &

 

 

 !

 $%


 &




 "

 

 

 	

  !



"



	



 

 

 

 	

 

!

! 

!

!	

!

"

"!

"

"	

"

#

#"

#

#	

#

$

$#

$

$	

$

%

%$

%

%	

%bproto3
�
voltha_protos/omci_mib_db.protoomci"<
MibAttributeData
name (	Rname
value (	Rvalue"�
MibInstanceData
instance_id (R
instanceId
created (	Rcreated
modified (	Rmodified6

attributes (2.omci.MibAttributeDataR
attributes"^
MibClassData
class_id (RclassId3
	instances (2.omci.MibInstanceDataR	instances">
ManagedEntity
class_id (RclassId
name (	Rname"0
MessageType!
message_type (RmessageType"�
MibDeviceData
	device_id (	RdeviceId
created (	Rcreated$
last_sync_time (	RlastSyncTime"
mib_data_sync (RmibDataSync
version (Rversion,
classes (2.omci.MibClassDataRclasses>
managed_entities (2.omci.ManagedEntityRmanagedEntities6
message_types (2.omci.MessageTypeRmessageTypes".
OpenOmciEventType"
Types
state_change "V
OpenOmciEvent1
type (2.omci.OpenOmciEventType.TypesRtype
data (	RdataBH
org.opencord.voltha.omciZ,github.com/opencord/voltha-protos/v5/go/omciJ�
 I
�
 �
 Copyright 2018 - present the original author or authors.

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.



 C
	
 C

 1
	
 1

 


  


 

  

  

  


  

  

 

 

 


 

 


 !




  

 

 


 

 

 

 








 

 








 -

 

 

 (

 +,


# '


#

 $ 

 $#

 $


 $

 $

&*

&

&

&&

&()


) ,


)

 *

 *)

 *


 *

 *

+

+*

+


+

+


. 0


.

 /

 /.

 /


 /

 /


2 =


2

 3 

 32

 3


 3

 3

4 

43 

4


4

4

5 

54 

5


5

5

6 

65 

6


6

6

7 

76 

7


7

7

9&

9

9

9!

9$%

;0

;

;

;+

;./

<+

<

<

<&

<)*


? C


?

 @B

 @	
@
  A"1 A state machine has transitioned to a new state


  A

  A


E I


E

 F%

 FE

 F

 F 

 F#$
.
H"! associated data, in json format


HF%

H


H

Hbproto3
�
!voltha_protos/omci_alarm_db.protoomci">
AlarmAttributeData
name (	Rname
value (	Rvalue"�
AlarmInstanceData
instance_id (R
instanceId
created (	Rcreated
modified (	Rmodified8

attributes (2.omci.AlarmAttributeDataR
attributes"b
AlarmClassData
class_id (RclassId5
	instances (2.omci.AlarmInstanceDataR	instances"C
AlarmManagedEntity
class_id (RclassId
name (	Rname"5
AlarmMessageType!
message_type (RmessageType"�
AlarmDeviceData
	device_id (	RdeviceId
created (	Rcreated.
last_alarm_sequence (RlastAlarmSequence$
last_sync_time (	RlastSyncTime
version (Rversion.
classes (2.omci.AlarmClassDataRclassesC
managed_entities (2.omci.AlarmManagedEntityRmanagedEntities;
message_types (2.omci.AlarmMessageTypeRmessageTypes"?
AlarmOpenOmciEventType"%
OpenOmciEventType
state_change "l
AlarmOpenOmciEventB
type (2..omci.AlarmOpenOmciEventType.OpenOmciEventTypeRtype
data (	RdataBH
org.opencord.voltha.omciZ,github.com/opencord/voltha-protos/v5/go/omciJ�
 K
�
 �
 Copyright 2018 - present the original author or authors.

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.



 C
	
 C

 1
	
 1

 


  


 

  

  

  


  

  

 

 

 


 

 


 "




  

 

 


 

 

 

 








 

 








!/

!

!

! *

!-.


$ (


$

 % 

 %$

 %


 %

 %

',

'

'

'(

'*+


* -


*

 +

 +*

 +


 +

 +

,

,+

,


,

,


/ 1


/

 0

 0/

 0


 0

 0


3 ?


3

 4%

 43

 4


 4

 4#$

5%

54%

5


5

5#$

6%

65%

6


6

6#$

7%

76%

7


7

7#$

8%

87%

8


8

8#$

;(

;

;

;#

;&'

=5

=

=

= 0

=34

>0

>

>

>+

>./


A E


A

 BD

 B	
@
  C"1 A state machine has transitioned to a new state


  C

  C


G K


G

 H6

 HG

 H,

 H-1

 H45
.
J"! associated data, in json format


JH6

J


J

Jbproto3
�
voltha_protos/omci_test.protoomci"5
OmciTestRequest
id (	Rid
uuid (	Ruuid"}
TestResponse=
result (2%.omci.TestResponse.TestResponseResultRresult".
TestResponseResult
SUCCESS 
FAILUREBH
org.opencord.voltha.omciZ,github.com/opencord/voltha-protos/v5/go/omciJ�
  

  

 C
	
 C

 

 1
	
 1


  


 

  	

  	

  	


  	

  	

 


 
	

 



 


 



 




 

 	

  

  

  

 

 

 

 "

 

 

 

  !bproto3
��
voltha_protos/voltha.protovolthagoogle/api/annotations.protogoogle/protobuf/empty.protovoltha_protos/common.protovoltha_protos/health.proto"voltha_protos/logical_device.protovoltha_protos/device.protovoltha_protos/adapter.protovoltha_protos/openflow_13.protovoltha_protos/events.protovoltha_protos/extensions.proto'voltha_protos/voip_system_profile.proto%voltha_protos/voip_user_profile.protovoltha_protos/omci_mib_db.proto!voltha_protos/omci_alarm_db.protovoltha_protos/omci_test.proto"]
CoreInstance
instance_id (	R
instanceId,
health (2.health.HealthStatusRhealth";
CoreInstances*
items (2.voltha.CoreInstanceRitems"�
Voltha
version (	Rversion,
adapters (2.adapter.AdapterRadaptersF
logical_devices (2.logical_device.LogicalDeviceRlogicalDevices(
devices (2.device.DeviceRdevices5
device_types (2.device.DeviceTypeRdeviceTypes7
event_filters (2.event.EventFilterReventFilters?
omci_mib_database (2.omci.MibDeviceDataRomciMibDatabaseE
omci_alarm_database (2.omci.AlarmDeviceDataRomciAlarmDatabaseJ2�7
VolthaServiceD
	GetVoltha.google.protobuf.Empty.voltha.Voltha"���	/api/v1]
ListCoreInstances.google.protobuf.Empty.voltha.CoreInstances"���/api/v1/instancesS
GetCoreInstance
.common.ID.voltha.CoreInstance"���/api/v1/instances/{id}S
ListAdapters.google.protobuf.Empty.adapter.Adapters"���/api/v1/adaptersm
ListLogicalDevices.google.protobuf.Empty.logical_device.LogicalDevices"���/api/v1/logical_devicesc
GetLogicalDevice
.common.ID.logical_device.LogicalDevice"$���/api/v1/logical_devices/{id}n
ListLogicalDevicePorts
.common.ID.logical_device.LogicalPorts"*���$"/api/v1/logical_devices/{id}/ports�
GetLogicalDevicePort.logical_device.LogicalPortId.logical_device.LogicalPort"4���.,/api/v1/logical_devices/{id}/ports/{port_id}�
EnableLogicalDevicePort.logical_device.LogicalPortId.google.protobuf.Empty";���5"3/api/v1/logical_devices/{id}/ports/{port_id}/enable�
DisableLogicalDevicePort.logical_device.LogicalPortId.google.protobuf.Empty"<���6"4/api/v1/logical_devices/{id}/ports/{port_id}/disabled
ListLogicalDeviceFlows
.common.ID.openflow_13.Flows"*���$"/api/v1/logical_devices/{id}/flows�
UpdateLogicalDeviceFlowTable.openflow_13.FlowTableUpdate.google.protobuf.Empty"-���'""/api/v1/logical_devices/{id}/flows:*�
UpdateLogicalDeviceMeterTable.openflow_13.MeterModUpdate.google.protobuf.Empty".���("#/api/v1/logical_devices/{id}/meters:*g
ListLogicalDeviceMeters
.common.ID.openflow_13.Meters"+���%#/api/v1/logical_devices/{id}/meterst
ListLogicalDeviceFlowGroups
.common.ID.openflow_13.FlowGroups"0���*(/api/v1/logical_devices/{id}/flow_groups�
!UpdateLogicalDeviceFlowGroupTable!.openflow_13.FlowGroupTableUpdate.google.protobuf.Empty"3���-"(/api/v1/logical_devices/{id}/flow_groups:*O
ListDevices.google.protobuf.Empty.device.Devices"���/api/v1/devicesO
ListDeviceIds.google.protobuf.Empty.common.IDs"���/api/v1/deviceidsU
ReconcileDevices.common.IDs.google.protobuf.Empty"���"/api/v1/deviceids:*E
	GetDevice
.common.ID.device.Device"���/api/v1/devices/{id}J
CreateDevice.device.Device.device.Device"���"/api/v1/devices:*W
EnableDevice
.common.ID.google.protobuf.Empty"#���"/api/v1/devices/{id}/enableY
DisableDevice
.common.ID.google.protobuf.Empty"$���"/api/v1/devices/{id}/disableW
RebootDevice
.common.ID.google.protobuf.Empty"#���"/api/v1/devices/{id}/rebootW
DeleteDevice
.common.ID.google.protobuf.Empty"#���*/api/v1/devices/{id}/deleteb
ForceDeleteDevice
.common.ID.google.protobuf.Empty")���#*!/api/v1/devices/{id}/force_deletex
DownloadImage.device.ImageDownload.common.OperationResp"9����0"+/api/v1/devices/{id}/image_downloads/{name}:*�
GetImageDownloadStatus.device.ImageDownload.device.ImageDownload"=����42/api/v1/devices/{id}/image_downloads/{name}/statusx
GetImageDownload.device.ImageDownload.device.ImageDownload"6����-+/api/v1/devices/{id}/image_downloads/{name}i
ListImageDownloads
.common.ID.device.ImageDownloads"/����&$/api/v1/devices/{id}/image_downloads{
CancelImageDownload.device.ImageDownload.common.OperationResp"6����-*+/api/v1/devices/{id}/image_downloads/{name}�
ActivateImageUpdate.device.ImageDownload.common.OperationResp"F����="8/api/v1/devices/{id}/image_downloads/{name}/image_update:*�
RevertImageUpdate.device.ImageDownload.common.OperationResp"F����="8/api/v1/devices/{id}/image_downloads/{name}/image_revert:*�
DownloadImageToDevice".device.DeviceImageDownloadRequest.device.DeviceImageResponse".���(&/api/v1/devices/images/download_imagesw
GetImageStatus.device.DeviceImageRequest.device.DeviceImageResponse",���&$/api/v1/devices/images/images_status�
AbortImageUpgradeToDevice.device.DeviceImageRequest.device.DeviceImageResponse"3���-+/api/v1/devices/images/abort_upgrade_imagesV
GetOnuImages
.common.ID.device.OnuImages"'���!/api/v1/devices/{id}/onu_images{
ActivateImage.device.DeviceImageRequest.device.DeviceImageResponse"1���+"&/api/v1/devices/images/activate_images:*w
CommitImage.device.DeviceImageRequest.device.DeviceImageResponse"/���)"$/api/v1/devices/images/commit_images:*P
ListDevicePorts
.common.ID.device.Ports""���/api/v1/devices/{id}/ports]
ListDevicePmConfigs
.common.ID.device.PmConfigs"'���!/api/v1/devices/{id}/pm_configsn
UpdateDevicePmConfigs.device.PmConfigs.google.protobuf.Empty"*���$"/api/v1/devices/{id}/pm_configs:*U
ListDeviceFlows
.common.ID.openflow_13.Flows""���/api/v1/devices/{id}/flowse
ListDeviceFlowGroups
.common.ID.openflow_13.FlowGroups"(���" /api/v1/devices/{id}/flow_groups\
ListDeviceTypes.google.protobuf.Empty.device.DeviceTypes"���/api/v1/device_typesR
GetDeviceType
.common.ID.device.DeviceType"!���/api/v1/device_types/{id}F
StreamPacketsOut.openflow_13.PacketOut.google.protobuf.Empty" (E
ReceivePacketsIn.google.protobuf.Empty.openflow_13.PacketIn" 0K
ReceiveChangeEvents.google.protobuf.Empty.openflow_13.ChangeEvent" 0]
CreateEventFilter.event.EventFilter.event.EventFilter" ���"/api/v1/event_filters:*U
GetEventFilter
.common.ID.event.EventFilters""���/api/v1/event_filters/{id}b
UpdateEventFilter.event.EventFilter.event.EventFilter"%���/api/v1/event_filters/{id}:*c
DeleteEventFilter.event.EventFilter.google.protobuf.Empty""���*/api/v1/event_filters/{id}^
ListEventFilters.google.protobuf.Empty.event.EventFilters"���/api/v1/event_filtersL
	GetImages
.common.ID.device.Images"#���/api/v1/devices/{id}/imagesX
SelfTest
.common.ID.device.SelfTestResponse"&��� "/api/v1/devices/{id}/self_testV
GetMibDeviceData
.common.ID.omci.MibDeviceData"!���/api/v1/openomci/{id}/mib\
GetAlarmDeviceData
.common.ID.omci.AlarmDeviceData"#���/api/v1/openomci/{id}/alarms
SimulateAlarm.device.SimulateAlarmRequest.common.OperationResp"-���'""/api/v1/devices/{id}/simulate_larm:*M

EnablePort.device.Port.google.protobuf.Empty"���"/v1/EnablePort:*O
DisablePort.device.Port.google.protobuf.Empty"���"/v1/DisablePort:*^
GetExtValue.extension.ValueSpecifier.extension.ReturnValues"���/api/v1/GetExtValueW
SetExtValue.extension.ValueSet.google.protobuf.Empty"���/api/v1/SetExtValued
StartOmciTestAction.omci.OmciTestRequest.omci.TestResponse""���"/api/v1/start_omci_test:*�
PutVoipSystemProfile-.voip_system_profile.VoipSystemProfileRequest.google.protobuf.Empty"&��� "/api/v1/voip_system_profile:*p
DeleteVoipSystemProfile.common.Key.google.protobuf.Empty"0���**(/api/v1/voip_system_profile/{key}/delete}
PutVoipUserProfile).voip_user_profile.VoipUserProfileRequest.google.protobuf.Empty"$���"/api/v1/voip_user_profile:*l
DeleteVoipUserProfile.common.Key.google.protobuf.Empty".���(*&/api/v1/voip_user_profile/{key}/deleteBl
org.opencord.volthaBVolthaProtosZ.github.com/opencord/voltha-protos/v5/go/voltha�Opencord.Voltha.VolthaJ�e
 �
\
 2R
 Top-level Voltha API definition

 For details, see individual definition files.


 E
	
 E


 
	
  &
	
 %
	
 +
	

 
	
 $
	
 ,
	
 $
	
 %
	
 )
	
 $
	
	 (
	

 1
	
 /
	
 )
	
 +
	
 '

 ,
	
 ,

 -
	
 -

  3
	
%  3
�
 $ *| CoreInstance represents a core instance.  It is data held in memory when a core
 is running.  This data is not persistent.



 $

  &

  &$

  &


  &

  &

 (#

 (&

 (

 (

 (!"


, .


,

 -$

 -

 -

 -

 -"#
�
4 K� Voltha represents the Voltha cluster data.  Each Core instance will hold a subset of
 the entire cluster. However, some items (e.g. adapters) will be held by all cores
 for better performance



4

 6

 64

 6


 6

 6

8*

8

8

8%

8()

:>

:

:)

:*9

:<=

<'

<

<

<"

<%&

>0

>

>

>+

>./
P
	@"D device_groups is not used
 repeated DeviceGroup device_groups = 6;


	 @

	 @

	 @

D1

D

D

D,

D/0

FG2

F

G

G,

G/1

IJ6

I

J

J0

J35

 Q �
 Voltha APIs




 Q
@
  SW2 Get high level information on the Voltha cluster


  S

  S'

  S17

  TV


	  �ʼ"TV

6
 Z^( List all Voltha cluster core instances


 Z

 Z/

 Z9F

 []


	 �ʼ"[]

8
 ae* Get details on a Voltha cluster instance


 a

 a!

 a+7

 bd


	 �ʼ"bd

H
 hl: List all active adapters (plugins) in the Voltha cluster


 h

 h*

 h4D

 ik


	 �ʼ"ik

F
 pt8 List all logical devices managed by the Voltha cluster


 p

 p0

 p:W

 qs


	 �ʼ"qs

D
 w{6 Get additional information on a given logical device


 w

 w"

 w,H

 xz


	 �ʼ"xz

/
 ~�  List ports of a logical device


 ~

 ~(

 ~2M

 �


	 �ʼ"�

,
 �� Gets a logical device port


 �

 �9

 �C]

 ��


	 �ʼ"��

/
 �� Enables a logical device port


 �

 � <

 �F[

 ��


	 �ʼ"��

0
 	��  Disables a logical device port


 	� 

 	�!=

 	�G\

 	��


	 	�ʼ"��

4
 
��$ List all flows of a logical device


 
�

 
�(

 
�2C

 
��


	 
�ʼ"��

6
 ��& Update flow table for logical device


 �$

 �%@

 �)

 ��


	 �ʼ"��

7
 ��' Update meter table for logical device


 �%

 �&@

 �)

 ��


	 �ʼ"��

5
 ��% List all meters of a logical device


 �

 � )

 �4F

 ��


	 �ʼ"��

:
 ��* List all flow groups of a logical device


 �#

 �$-

 �7M

 ��


	 �ʼ"��

/
 �� Update group table for device


 �)

 �*J

 �)

 ��


	 �ʼ"��

L
 ��< List all physical devices controlled by the Voltha cluster


 �

 �)

 �3A

 ��


	 �ʼ"��

P
 ��@ List all physical devices IDs controlled by the Voltha cluster


 �

 �+

 �5?

 ��


	 �ʼ"��

[
 ��K Request to a voltha Core to reconcile a set of devices based on their IDs


 �

 �#

 �-B

 ��


	 �ʼ"��

A
 ��1 Get more information on a given physical device


 �

 �

 �%2

 ��


	 �ʼ"��

5
 ��% Pre-provision a new physical device


 �

 �"

 �,9

 ��


	 �ʼ"��

�
 ��� Enable a device.  If the device was in pre-provisioned state then it
 will transition to ENABLED state.  If it was is DISABLED state then it
 will transition to ENABLED state as well.


 �

 �

 �(=

 ��


	 �ʼ"��

"
 �� Disable a device


 �

 �

 �)>

 ��


	 �ʼ"��

!
 �� Reboot a device


 �

 �

 �(=

 ��


	 �ʼ"��

!
 �� Delete a device


 �

 �

 �*?

 ��


	 �ʼ"��

,
 �� Forcefully delete a device


 �

 �$

 �/D

 ��


	 �ʼ"��

�
 ��v Request an image download to the standby partition
 of a device.
 Note that the call is expected to be non-blocking.


 �

 �*

 �4H

 �!

 !�!

 ��


	 �ʼ"��

�
 ��� Get image download status on a device
 The request retrieves progress on device and updates db record
 Deprecated in voltha 2.8, will be removed


 �

 �3

 �=Q

 �!

 !�!

 ��


	 �ʼ"��

Y
 ��I Get image download db record
 Deprecated in voltha 2.8, will be removed


 �

 �-

 �7K

 �!

 !�!

 ��


	 �ʼ"��

n
 ��^ List image download db records for a given device
 Deprecated in voltha 2.8, will be removed


 �

 �$

 �.C

 �!

 !�!

 ��


	 �ʼ"��

r
 ��b Cancel an existing image download process on a device
 Deprecated in voltha 2.8, will be removed


 �

 �0

 �:N

 �!

 !�!

 ��


	 �ʼ"��

�
 ��� Activate the specified image at a standby partition
 to active partition.
 Depending on the device implementation, this call
 may or may not cause device reboot.
 If no reboot, then a reboot is required to make the
 activated image running on device
 Note that the call is expected to be non-blocking.
 Deprecated in voltha 2.8, will be removed


 �

 �0

 �:N

 �!

 !�!

 ��


	 �ʼ"��

�
  ��� Revert the specified image at standby partition
 to active partition, and revert to previous image
 Depending on the device implementation, this call
 may or may not cause device reboot.
 If no reboot, then a reboot is required to make the
 previous image running on device
 Note that the call is expected to be non-blocking.
 Deprecated in voltha 2.8, will be removed


  �

  �.

  �8L

  �!

  !�!

  ��


	  �ʼ"��

�
 !��w Downloads a certain image to the standby partition of the devices
 Note that the call is expected to be non-blocking.


 !�

 !�@

 !�Ke

 !��


	 !�ʼ"��

�
 "��z Get image status on a number of devices devices
 Polled from northbound systems to get state of download/activate/commit


 "�

 "�1

 "�<V

 "��


	 "�ʼ"��

�
 #��� Aborts the upgrade of an image on a device
 To be used carefully, stops any further operations for the Image on the given devices
 Might also stop if possible existing work, but no guarantees are given,
 depends on implementation and procedure status.


 #�!

 #�#<

 #�Ga

 #��


	 #�ʼ"��

F
 $��6 Get Both Active and Standby image for a given device


 $�

 $�

 $�*:

 $��


	 $�ʼ"��

�
 %��� Activate the specified image from a standby partition
 to active partition.
 Depending on the device implementation, this call
 may or may not cause device reboot.
 If no reboot, then a reboot is required to make the
 activated image running on device
 Note that the call is expected to be non-blocking.


 %�

 %�0

 %�;U

 %��


	 %�ʼ"��

�
 &��� Commit the specified image to be default.
 Depending on the device implementation, this call
 may or may not cause device reboot.
 If no reboot, then a reboot is required to make the
 activated image running on device upon next reboot
 Note that the call is expected to be non-blocking.


 &�

 &�.

 &�9S

 &��


	 &�ʼ"��

(
 '�� List ports of a device


 '�

 '�"

 '�-9

 '��


	 '�ʼ"��

,
 (�� List pm config of a device


 (�

 (�&

 (�1A

 (��


	 (�ʼ"��

2
 )��" Update the pm config of a device


 )�

 )�.

 )�8M

 )��


	 )�ʼ"��

,
 *�� List all flows of a device


 *�

 *�!

 *�+<

 *��


	 *�ʼ"��

2
 +��" List all flow groups of a device


 +�

 +�&

 +�0F

 +��


	 +�ʼ"��

3
 ,��# List device types known to Voltha


 ,�

 ,�-

 ,�7I

 ,��


	 ,�ʼ"��

=
 -��- Get additional information on a device type


 -�

 -�

 -�):

 -��


	 -�ʼ"��

f
 .��) Stream control packets to the dataplane
"+ This does not have an HTTP representation


 .�

 .�

 .� 5

 .�%
\
 /�� Receive control packet stream
"+ This does not have an HTTP representation


 /�

 /�.

 /�

 /�+
;
 0��"+ This does not have an HTTP representation


 0�

 0�1

 0�

 0�.

 1��

 1�

 1�+

 1�5F

 1��


	 1�ʼ"��

6
 2��& Get all filters present for a device


 2�

 2� 

 2�*<

 2��


	 2�ʼ"��


 3��

 3�

 3�+

 3�5F

 3��


	 3�ʼ"��


 4��

 4�

 4�+

 4�5J

 4��


	 4�ʼ"��

-
 5�� Get all the filters present


 5�

 5�.

 5�8J

 5��


	 5�ʼ"��


 6��

 6�

 6�

 6�%2

 6��


	 6�ʼ"��


 7��

 7�

 7�

 7�$;

 7��


	 7�ʼ"��

*
 8�� OpenOMCI MIB information


 8�

 8�"

 8�,>

 8��


	 8�ʼ"��

,
 9�� OpenOMCI ALARM information


 9�

 9�$

 9�.B

 9��


	 9�ʼ"��

#
 :�� Simulate an Alarm


 :�

 :�1

 :�;O

 :��


	 :�ʼ"��


 ;��

 ;�

 ;�

 ;�(=

 ;��


	 ;�ʼ"��


 <��

 <�

 <�

 <�)>

 <��


	 <�ʼ"��


 =��

 =�

 =�,

 =�6L

 =��


	 =�ʼ"��


 >��

 >�

 >�&

 >�0E

 >��


	 >�ʼ"��

8
 ?��( omci start and stop cli implementation


 ?�

 ?�0

 ?�:K

 ?��


	 ?�ʼ"��

K
 @��; Saves or updates system wide configuration into voltha KV


 @�

 @�I

 @�Sh

 @��


	 @�ʼ"��

:
 A��* Deletes the given profile from voltha KV


 A�

 A� *

 A�4I

 A��


	 A�ʼ"��

B
 B��2 Saves or updates a profile (VOIP) into voltha KV


 B�

 B�C

 B�Mb

 B��


	 B�ʼ"��

:
 C��* Deletes the given profile from voltha KV


 C�

 C�(

 C�2G

 C��


	 C�ʼ"��
Pbproto3
�=
 voltha_protos/core_adapter.protocore_adaptervoltha_protos/common.protovoltha_protos/voltha.protovoltha_protos/openflow_13.protovoltha_protos/adapter.protovoltha_protos/device.protovoltha_protos/extensions.protovoltha_protos/omci_test.proto"n
AdapterRegistration*
adapter (2.adapter.AdapterRadapter+
dTypes (2.device.DeviceTypesRdTypes"�
ChildDeviceFilter
	parent_id (	RparentId#
serial_number (	RserialNumber
onu_id (RonuId$
parent_port_no (RparentPortNo"q

PortFilter
	device_id (	RdeviceId
port (Rport2
	port_type (2.device.Port.PortTypeRportType"�
DeviceDiscovery
	parent_id (	RparentId$
parent_port_no (RparentPortNo*
child_device_type (	RchildDeviceType

channel_id (R	channelId
	vendor_id (	RvendorId#
serial_number (	RserialNumber
onu_id (RonuId"�
DeviceStateFilter
	device_id (	RdeviceId(
parent_device_id (	RparentDeviceId9
oper_status (2.common.OperStatus.TypesR
operStatus<
conn_status (2.common.ConnectStatus.TypesR
connStatus"�
	PortState
	device_id (	RdeviceId2
	port_type (2.device.Port.PortTypeRportType
port_no (RportNo9
oper_status (2.common.OperStatus.TypesR
operStatus"�
PortStateFilter
	device_id (	RdeviceId(
port_type_filter (RportTypeFilter9
oper_status (2.common.OperStatus.TypesR
operStatus"S
PacketIn
	device_id (	RdeviceId
port (Rport
packet (Rpacket"�
	PacketOut
	device_id (	RdeviceId$
egress_port_no (RegressPortNo3
packet (2.openflow_13.ofp_packet_outRpacket"C
DeviceReason
	device_id (	RdeviceId
reason (	Rreason"�
	BulkFlows&
device (2.device.DeviceRdevice(
flows (2.openflow_13.FlowsRflows/
groups (2.openflow_13.FlowGroupsRgroups>
flow_metadata (2.openflow_13.FlowMetadataRflowMetadata"�
IncrementalFlows&
device (2.device.DeviceRdevice.
flows (2.openflow_13.FlowChangesRflows5
groups (2.openflow_13.FlowGroupChangesRgroups>
flow_metadata (2.openflow_13.FlowMetadataRflowMetadata"^
PmConfigsInfo
	device_id (	RdeviceId0

pm_configs (2.device.PmConfigsR	pmConfigs"�
SwitchCapability)
desc (2.openflow_13.ofp_descRdescI
switch_features (2 .openflow_13.ofp_switch_featuresRswitchFeatures"k
ImageDownloadMessage&
device (2.device.DeviceRdevice+
image (2.device.ImageDownloadRimage"c
OMCITest&
device (2.device.DeviceRdevice/
request (2.omci.OmciTestRequestRrequest"v
SimulateAlarmMessage&
device (2.device.DeviceRdevice6
request (2.device.SimulateAlarmRequestRrequest"�
GetExtValueMessage3
parent_device (2.device.DeviceRparentDevice1
child_device (2.device.DeviceRchildDevice8

value_type (2.extension.ValueType.TypeR	valueType"g
SetExtValueMessage&
device (2.device.DeviceRdevice)
value (2.extension.ValueSetRvalueBX
 org.opencord.voltha.core_adapterZ4github.com/opencord/voltha-protos/v5/go/core_adapterJ�$
  �

  

 K
	
 K

 9
	
 9
	
  $
	
 $
	
 )
	
 %
	
	 $
	

 (
	
 '

 
#
  2 Core-Adapter messages



 

  !

  

  

  

   

 "

 !

 

 

  !


 




 

 

 


 

 



































 !




 

 

 


 

 












 '

 

 

 "

 %&


# +


#

 $

 $#

 $


 $

 $

%

%$

%


%

%

&!

&%

&


&

& 

'

'&!

'


'

'

(

('

(


(

(

)

)(

)


)

)

*

*)

*


*

*


- 2


-

 .

 .-

 .


 .

 .

/ 

/.

/


/

/

0,

0/ 

0

0'

0*+

1/

10,

1

1*

1-.


4 9


4

 5

 54

 5


 5

 5

6'

65

6

6"

6%&

7

76'

7


7

7

8,

87

8

8'

8*+


; ?


;

 <

 <;

 <


 <

 <

= 

=<

=


=

=

>,

>= 

>

>'

>*+


A E


A

 B

 BA

 B


 B

 B

C

CB

C


C

C

D

DC

D	

D


D


G K


G

 H

 HG

 H


 H

 H

I

IH

I


I

I

J*

JI

J

J%

J()


	M P


	M

	 N

	 NM

	 N


	 N

	 N

	O

	ON

	O


	O

	O



R W



R


 S


 SR


 S


 S


 S


T 


TS


T


T


T


U&


UT 


U


U!


U$%


V/


VU&


V


V*


V-.


Y ^


Y

 Z

 ZY

 Z

 Z

 Z

[&

[Z

[

[!

[$%

\,

\[&

\ 

\!'

\*+

]/

]\,

]

]*

]-.


` c


`

 a

 a`

 a


 a

 a

b$

ba

b

b

b"#


e h


e

 f"

 fe

 f

 f

 f !

g8

gf"

g#

g$3

g67


j m


j

 k

 kj

 k

 k

 k

l#

lk

l

l

l!"


o r


o

 p

 po

 p

 p

 p

q%

qp

q

q 

q#$


t w


t

 u

 ut

 u

 u

 u

v,

vu

v

v '

v*+


y }


y

 z$

 zy

 z

 z

 z"#

{#

{z$

{

{

{!"

|*

|{#

|

|'

|()

 �




 �

 �

 �

 �

 �

�

��

�

�

�bproto3
�+
#voltha_protos/adapter_service.protoadapter_servicegoogle/protobuf/empty.protovoltha_protos/common.proto voltha_protos/core_adapter.protovoltha_protos/device.protovoltha_protos/extensions.protovoltha_protos/health.protovoltha_protos/voltha.protovoltha_protos/omci_test.protovoltha_protos/events.proto2�
AdapterService?
GetHealthStatus.common.Connection.health.HealthStatus(05
AdoptDevice.device.Device.google.protobuf.Empty9
ReconcileDevice.device.Device.google.protobuf.Empty6
DeleteDevice.device.Device.google.protobuf.Empty7
DisableDevice.device.Device.google.protobuf.Empty8
ReEnableDevice.device.Device.google.protobuf.Empty6
RebootDevice.device.Device.google.protobuf.Empty8
SelfTestDevice.device.Device.google.protobuf.EmptyB
GetOfpDeviceInfo.device.Device.core_adapter.SwitchCapability9
ChildDeviceLost.device.Device.google.protobuf.Empty2

EnablePort.device.Port.google.protobuf.Empty3
DisablePort.device.Port.google.protobuf.EmptyB
UpdateFlowsBulk.core_adapter.BulkFlows.google.protobuf.EmptyR
UpdateFlowsIncrementally.core_adapter.IncrementalFlows.google.protobuf.Empty@
SendPacketOut.core_adapter.PacketOut.google.protobuf.EmptyE
UpdatePmConfig.core_adapter.PmConfigsInfo.google.protobuf.EmptyS
DownloadOnuImage".device.DeviceImageDownloadRequest.device.DeviceImageResponseL
GetOnuImageStatus.device.DeviceImageRequest.device.DeviceImageResponseO
AbortOnuImageUpgrade.device.DeviceImageRequest.device.DeviceImageResponse-
GetOnuImages
.common.ID.device.OnuImagesK
ActivateOnuImage.device.DeviceImageRequest.device.DeviceImageResponseI
CommitOnuImage.device.DeviceImageRequest.device.DeviceImageResponseO
DownloadImage".core_adapter.ImageDownloadMessage.device.ImageDownload"�X
GetImageDownloadStatus".core_adapter.ImageDownloadMessage.device.ImageDownload"�U
CancelImageDownload".core_adapter.ImageDownloadMessage.device.ImageDownload"�U
ActivateImageUpdate".core_adapter.ImageDownloadMessage.device.ImageDownload"�S
RevertImageUpdate".core_adapter.ImageDownloadMessage.device.ImageDownload"�;
StartOmciTest.core_adapter.OMCITest.omci.TestResponseJ
SimulateAlarm".core_adapter.SimulateAlarmMessage.common.OperationResp;
SuppressEvent.event.EventFilter.google.protobuf.Empty=
UnSuppressEvent.event.EventFilter.google.protobuf.EmptyH
GetExtValue .core_adapter.GetExtValueMessage.extension.ReturnValuesG
SetExtValue .core_adapter.SetExtValueMessage.google.protobuf.EmptyU
GetSingleValue .extension.SingleGetValueRequest!.extension.SingleGetValueResponseU
SetSingleValue .extension.SingleSetValueRequest!.extension.SingleSetValueResponseBt
#org.opencord.voltha.adapter_serviceBVolthaAdapterServiceZ7github.com/opencord/voltha-protos/v5/go/adapter_serviceJ�
  W

  

 N
	
 N

 <
	
 <

 5
	
 5

 
	
  %
	
	 $
	

 *
	
 $
	
 (
	
 $
	
 $
	
 '
	
 $
U
  WI AdapterService is a gRPC service to serve requests from Voltha RW_Core.



 
�
  W� GetHealthStatus is used by an AdapterService client to verify connectivity
 to the gRPC server hosting the AdapterService service


  

  

  0

  ;A

  BU

 B Device


 

 !

 +@

 F

 

 %

 /D

 C

 

 "

 ,A

 D

 

 #

 -B

 E

 

 $

 .C

 C

 

 "

 ,A

 E

 

 $

 .C

  O

  

  &

  0M

 	!F

 	!

 	!%

 	!/D

 
$? Ports


 
$

 
$

 
$(=

 %@

 %

 %

 %)>

 (O Flows


 (

 (.

 (8M

 )_

 ) 

 )!>

 )H]

 ,MPackets


 ,

 ,,

 ,6K

 /R PM


 /

 /1

 /;P

 2a Image


 2

 2:

 2E_

 3Z

 3

 33

 3>X

 4]

 4

 46

 4A[

 5;

 5

 5

 5)9

 6Y

 6

 62

 6=W

 7W

 7

 70

 7;U
%
 :< Deprecated Image APIs


 :

 :7

 :BV

 ;!

 !;!

 =?

 =

 =@

 =K_

 >!

 !>!

 @B

 @

 @=

 @H\

 A!

 !A!

 CE

 C

 C=

 CH\

 D!

 !D!

 FH

 F

 F;

 FFZ

 G!

 !G!

 KH Tests


 K

 K+

 K5F

 LX

 L

 L7

 LBV

 OH Events


 O

 O'

 O1F

 PJ

 P

 P)

 P3H

 SV	 Get/Set


 S

 S3

 S>T

  TU

  T

  T3

  T>S

 !Uc

 !U

 !U6

 !UAa

 "Vc

 "V

 "V6

 "VAabproto3
�

voltha_protos/core.protocore"�
DeviceTransientStateI
transient_state (2 .core.DeviceTransientState.TypesRtransientState"�
Types
NONE 
ANY
FORCE_DELETING
DELETING_FROM_ADAPTER"
DELETING_POST_ADAPTER_RESPONSE
DELETE_FAILED
RECONCILE_IN_PROGRESSBH
org.opencord.voltha.coreZ,github.com/opencord/voltha-protos/v5/go/coreJ�
  

  

 C
	
 C

 1
	
 1

 


  


 
+
  	 Transient State for devices


  		
=
   . The transient state of the device is not set


   

   
�
  � The state of the device in core is any state, i.e DELETING, DELETED, DELETE_FAILED, NONE.
 This state is only used for transitions.


  

  
6
  ' The device is in FORCE_DELETING state


  

  
A
  "2 The device is getting deleted from adapter state


  

   !
S
  +D The device is deleted from adapter and is getting deleted in core.


  &

  )*
F
  7 State to represent that the device deletion is failed


  

  
A
  2 State to represent that reconcile is in progress


  

  

  

  

  	

  


  bproto3
�
!voltha_protos/core_services.protocore_servicegoogle/protobuf/empty.proto voltha_protos/core_adapter.protovoltha_protos/common.protovoltha_protos/device.protovoltha_protos/health.proto2�
CoreService?
GetHealthStatus.common.Connection.health.HealthStatus(0L
RegisterAdapter!.core_adapter.AdapterRegistration.google.protobuf.Empty6
DeviceUpdate.device.Device.google.protobuf.Empty3
PortCreated.device.Port.google.protobuf.EmptyI
PortsStateUpdate.core_adapter.PortStateFilter.google.protobuf.Empty4
DeleteAllPorts
.common.ID.google.protobuf.Empty7
GetDevicePort.core_adapter.PortFilter.device.Port,
ListDevicePorts
.common.ID.device.PortsL
DeviceStateUpdate.core_adapter.DeviceStateFilter.google.protobuf.EmptyA
DevicePMConfigUpdate.device.PmConfigs.google.protobuf.EmptyD
ChildDeviceDetected.core_adapter.DeviceDiscovery.device.Device6
ChildDevicesLost
.common.ID.google.protobuf.Empty:
ChildDevicesDetected
.common.ID.google.protobuf.Empty'
	GetDevice
.common.ID.device.DeviceA
GetChildDevice.core_adapter.ChildDeviceFilter.device.Device.
GetChildDevices
.common.ID.device.Devices>
SendPacketIn.core_adapter.PacketIn.google.protobuf.EmptyH
DeviceReasonUpdate.core_adapter.DeviceReason.google.protobuf.EmptyB
PortStateUpdate.core_adapter.PortState.google.protobuf.Empty;
ReconcileChildDevices
.common.ID.google.protobuf.EmptyM
GetChildDeviceWithProxyAddress.device.Device.ProxyAddress.device.Device3
GetPorts.core_adapter.PortFilter.device.PortsN
ChildrenStateUpdate.core_adapter.DeviceStateFilter.google.protobuf.EmptyD
UpdateImageDownload.device.ImageDownload.google.protobuf.EmptyBk
 org.opencord.voltha.core_serviceBVolthaCoreServiceZ4github.com/opencord/voltha-protos/v5/go/core_serviceJ�
  .

  

 K
	
 K

 9
	
 9

 2
	
 2

 
	
  %
	
	 *
	

 $
	
 $
	
 $
�
  .� The CoreService is a gRPC service implemented by the Voltha RW-Core for the
 sole purpose of serving requests/updates from the Voltha adapters. 



 
�
  W| GetHealthStatus is used by a CoreService client to verify connectivity
 to the gRPC server hosting the CoreService service


  

  

  0

  ;A

  BU

 _

 

 =

 H]

 I

 

 '

 2G

 F

 

 $

 /D

 \

 

 :

 EZ

 G

 

 %

 0E

 J

 

 2

 =H

 ?

 

 &

 1=

 _

 

 =

 H]

 	T

 	 

 	"2

 	=R

 
W

 


 
!=

 
HU

 I

 

 '

 2G

  M

   

  "+

  6K

 !:

 !

 ! 

 !+8

 "T

 "

 ":

 "ER

 #A

 #

 #&

 #1?

 $Q

 $

 $/

 $:O

 %[

 %

 % 9

 %DY

 &U

 &

 &3

 &>S
9
 )N, Additional API found in the Core - unused?


 )!

 )#,

 )7L

 *`

 **

 *,F

 *Q^

 +F

 +

 +-

 +8D

 ,a

 ,

 ,!?

 ,J_

 -W

 -

 -!5

 -@Ubproto3
�
#voltha_protos/ietf_interfaces.protoietf"D

Interfaces6
all_interfaces (2.ietf.InterfaceRallInterfaces"�
	Interface
name (	Rname 
description (	Rdescription
type (	Rtype
enabled (Renabled`
link_up_down_trap_enable (2(.ietf.Interface.LinkUpDownTrapEnableTypeRlinkUpDownTrapEnable"?
LinkUpDownTrapEnableType
TRAP_DISABLED 
TRAP_ENABLED"L
InterfacesState9
all_interfacs (2.ietf.InterfaceStateRallInterfacs"�
InterfaceState
name (	Rname
type (	RtypeG
admin_status (2$.ietf.InterfaceState.AdminStatusTypeRadminStatusD
oper_status (2#.ietf.InterfaceState.OperStatusTypeR
operStatus
last_change (	R
lastChange
if_index (RifIndex!
phys_address (	RphysAddress&
higher_layer_if (	RhigherLayerIf$
lower_layer_if	 (	RlowerLayerIf
speed
 (Rspeed"B
AdminStatusType

ADMIN_DOWN 
ADMIN_TESTING
ADMIN_UP"p
OperStatusType
DORMANT 
LOWER_LAYER_DOWN
UNKNOWN
TESTING
UP
DOWN
NOT_PRESENTBH
org.opencord.voltha.ietfZ,github.com/opencord/voltha-protos/v5/go/ietfJ�
  5

  

 C
	
 C

 1
	
 1

 


  	


 

  *

  

  

  %

  ()



 





 

 


 


 

 





























	



 

 	!

  

  

  

 

 

 

:





5

89


 




 .

 

 

 )

 ,-


 5




 

 

 


 

 












 "

 	

  

  

  

  

  

  

 !

 !

 !

#%

#"

#

# 

##$

$-

$	

 &

 &

 &

'

'

'

(

(

(

)

)

)

*

*


*

+

+

+

,

,

,

.#

.-

.

.

.!"

/

/.#

/


/

/

0

0/

0	

0


0

1

10

1


1

1

2)

2

2

2#

2&'

3(

3

3

3"

3%&

	4

	43(

	4


	4

	4bproto3
��
 voltha_protos/tech_profile.prototech_profilegoogle/api/annotations.proto"�
SchedulerConfig5
	direction (2.tech_profile.DirectionR	direction?
additional_bw (2.tech_profile.AdditionalBWRadditionalBw
priority (Rpriority
weight (RweightA
sched_policy (2.tech_profile.SchedulingPolicyRschedPolicy"�
TrafficShapingInfo
cir (Rcir
cbs (Rcbs
pir (Rpir
pbs (Rpbs
gir (RgirH

add_bw_ind (2*.tech_profile.InferredAdditionBWIndicationRaddBwInd"�
TrafficScheduler5
	direction (2.tech_profile.DirectionR	direction
alloc_id (RallocId;
	scheduler (2.tech_profile.SchedulerConfigR	schedulerR
traffic_shaping_info (2 .tech_profile.TrafficShapingInfoRtrafficShapingInfo&
tech_profile_id (RtechProfileId"�
TrafficSchedulers
intf_id (RintfId
onu_id (RonuId
uni_id (RuniId
port_no (RportNoE
traffic_scheds (2.tech_profile.TrafficSchedulerRtrafficScheds"6
TailDropDiscardConfig

queue_size (R	queueSize"�
RedDiscardConfig#
min_threshold (RminThreshold#
max_threshold (RmaxThreshold'
max_probability (RmaxProbability"�
WRedDiscardConfig4
green (2.tech_profile.RedDiscardConfigRgreen6
yellow (2.tech_profile.RedDiscardConfigRyellow0
red (2.tech_profile.RedDiscardConfigRred"�
DiscardConfigB
discard_policy (2.tech_profile.DiscardPolicyRdiscardPolicy^
tail_drop_discard_config (2#.tech_profile.TailDropDiscardConfigH RtailDropDiscardConfigN
red_discard_config (2.tech_profile.RedDiscardConfigH RredDiscardConfigQ
wred_discard_config (2.tech_profile.WRedDiscardConfigH RwredDiscardConfigB
discard_config"�
TrafficQueue5
	direction (2.tech_profile.DirectionR	direction

gemport_id (R	gemportId
pbit_map (	RpbitMap%
aes_encryption (RaesEncryptionA
sched_policy (2.tech_profile.SchedulingPolicyRschedPolicy
priority (Rpriority
weight (RweightB
discard_policy (2.tech_profile.DiscardPolicyRdiscardPolicyB
discard_config	 (2.tech_profile.DiscardConfigRdiscardConfig"�
TrafficQueues
intf_id (RintfId
onu_id (RonuId
uni_id (RuniId
port_no (RportNoA
traffic_queues (2.tech_profile.TrafficQueueRtrafficQueues&
tech_profile_id (RtechProfileId"f
InstanceControl
onu (	Ronu
uni (	Runi/
max_gem_payload_size (	RmaxGemPayloadSize"�
QThresholds!
q_threshold1 (RqThreshold1!
q_threshold2 (RqThreshold2!
q_threshold3 (RqThreshold3!
q_threshold4 (RqThreshold4!
q_threshold5 (RqThreshold5!
q_threshold6 (RqThreshold6!
q_threshold7 (RqThreshold7"�
GemPortAttributes

gemport_id (R	gemportId

max_q_size (	RmaxQSize
pbit_map (	RpbitMap%
aes_encryption (	RaesEncryptionK
scheduling_policy (2.tech_profile.SchedulingPolicyRschedulingPolicy

priority_q (R	priorityQ
weight (RweightB
discard_policy (2.tech_profile.DiscardPolicyRdiscardPolicyE
discard_config	 (2.tech_profile.RedDiscardConfigRdiscardConfigG
discard_config_v2 (2.tech_profile.DiscardConfigRdiscardConfigV2!
is_multicast
 (	RisMulticast(
multicast_gem_id (RmulticastGemId=
dynamic_access_control_list (	RdynamicAccessControlList;
static_access_control_list (	RstaticAccessControlList"�
SchedulerAttributes5
	direction (2.tech_profile.DirectionR	direction
alloc_id (RallocId?
additional_bw (2.tech_profile.AdditionalBWRadditionalBw
priority (Rpriority
weight (RweightD
q_sched_policy (2.tech_profile.SchedulingPolicyRqSchedPolicy"�
EPONQueueAttributes

max_q_size (	RmaxQSize
pbit_map (	RpbitMap

gemport_id (R	gemportId%
aes_encryption (	RaesEncryption!
traffic_type (	RtrafficType4
unsolicited_grant_size (RunsolicitedGrantSize)
nominal_interval (RnominalInterval2
tolerated_poll_jitter (RtoleratedPollJitter>
request_transmission_policy	 (RrequestTransmissionPolicy

num_q_sets
 (RnumQSets<
q_thresholds (2.tech_profile.QThresholdsRqThresholdsK
scheduling_policy (2.tech_profile.SchedulingPolicyRschedulingPolicy

priority_q (R	priorityQ
weight (RweightB
discard_policy (2.tech_profile.DiscardPolicyRdiscardPolicyE
discard_config (2.tech_profile.RedDiscardConfigRdiscardConfigG
discard_config_v2 (2.tech_profile.DiscardConfigRdiscardConfigV2"�
TechProfile
name (	Rname
version (Rversion!
profile_type (	RprofileType"
num_gem_ports (RnumGemPortsH
instance_control (2.tech_profile.InstanceControlRinstanceControlD
us_scheduler (2!.tech_profile.SchedulerAttributesRusSchedulerD
ds_scheduler (2!.tech_profile.SchedulerAttributesRdsSchedulerg
 upstream_gem_port_attribute_list (2.tech_profile.GemPortAttributesRupstreamGemPortAttributeListk
"downstream_gem_port_attribute_list	 (2.tech_profile.GemPortAttributesRdownstreamGemPortAttributeList"�
EponTechProfile
name (	Rname
version (Rversion!
profile_type (	RprofileType"
num_gem_ports (RnumGemPortsH
instance_control (2.tech_profile.InstanceControlRinstanceControl!
package_type (	RpackageTyped
upstream_queue_attribute_list (2!.tech_profile.EPONQueueAttributesRupstreamQueueAttributeListh
downstream_queue_attribute_list (2!.tech_profile.EPONQueueAttributesRdownstreamQueueAttributeList"�
TechProfileInstance
name (	Rname
version (Rversion3
subscriber_identifier (	RsubscriberIdentifier!
profile_type (	RprofileType"
num_gem_ports (RnumGemPortsH
instance_control (2.tech_profile.InstanceControlRinstanceControlD
us_scheduler (2!.tech_profile.SchedulerAttributesRusSchedulerD
ds_scheduler (2!.tech_profile.SchedulerAttributesRdsSchedulerg
 upstream_gem_port_attribute_list	 (2.tech_profile.GemPortAttributesRupstreamGemPortAttributeListk
"downstream_gem_port_attribute_list
 (2.tech_profile.GemPortAttributesRdownstreamGemPortAttributeList"�
EponTechProfileInstance
name (	Rname
version (Rversion3
subscriber_identifier (	RsubscriberIdentifier!
profile_type (	RprofileType"
num_gem_ports (RnumGemPorts
alloc_id (RallocIdH
instance_control (2.tech_profile.InstanceControlRinstanceControl!
package_type (	RpackageTyped
upstream_queue_attribute_list	 (2!.tech_profile.EPONQueueAttributesRupstreamQueueAttributeListh
downstream_queue_attribute_list
 (2!.tech_profile.EPONQueueAttributesRdownstreamQueueAttributeList"�
ResourceInstance
tp_id (RtpId!
profile_type (	RprofileType3
subscriber_identifier (	RsubscriberIdentifier
alloc_id (RallocId
gemport_ids (R
gemportIds*<
	Direction
UPSTREAM 

DOWNSTREAM
BIDIRECTIONAL*;
SchedulingPolicy
WRR 
StrictPriority

Hybrid*n
AdditionalBW
AdditionalBW_None 
AdditionalBW_NA
AdditionalBW_BestEffort
AdditionalBW_Auto*?
DiscardPolicy
TailDrop 
	WTailDrop
Red
WRed*�
InferredAdditionBWIndication%
!InferredAdditionBWIndication_None (
$InferredAdditionBWIndication_Assured+
'InferredAdditionBWIndication_BestEffortBX
 org.opencord.voltha.tech_profileZ4github.com/opencord/voltha-protos/v5/go/tech_profileJ�d
 �
�
 2� Copyright 2018-2024 Open Networking Foundation (ONF) and the ONF Contributors

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at:

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.


 K
	
 K

 9
	
 9

 
	
  &


  


 

  

  

  

 

 

 

 

 

 


  




 

 

 
















" '


"

 #

 #

 #

$

$

$

% 

%

%

&

&

&


) .


)

 *

 *

 *

+

+

+

,

,

,


-

-

-


0 4


0!

 1*

 1%

 1()

2-

2(

2+,

30

3+

3./


 6 <


 6

  7

  76

  7

  7

  7
8
 8#"+ Valid on for “direction == Upstream”.


 87

 8

 8

 8!"

 9

 98#

 9

 9

 9

 :

 :9

 :

 :

 :

 ;&

 ;:

 ;

 ;!

 ;$%


> E


>

 ?

 ?>

 ?

 ?

 ?

@

@?

@

@

@

A

A@

A

A

A

B

BA

B

B

B
3
C"& only if “direction == Upstream ”


CB

C

C

C
2
D0"% only if “direction == Upstream”


DC

D 

D!+

D./


G M


G

 H

 HG

 H

 H

 H
9
I", valid only if “direction == Upstream ”


IH

I

I

I

J"

JI

J

J

J !

K0

KJ"

K

K+

K./

L 

LK0

L

L

L


O U


O

 P

 PO

 P

 P

 P

Q

QP

Q

Q

Q

R

RQ

R

R

R

S

SR

S

S

S

T1

T

T

T,

T/0


W Y


W

 X

 XW

 X

 X

 X


[ _


[

 \

 \[

 \

 \

 \

]

]\

]

]

]

^ 

^]

^

^

^


a e


a

 b

 ba

 b

 b

 b

c 

cb

c

c

c

d

dc 

d

d

d


g n


g

 h%

 hg

 h

 h 

 h#$

 im

 i


j;

j

j6

j9:

k0

k

k+

k./

l2

l

l-

l01


p z


p

 q

 qp

 q

 q

 q

r

rq

r

r

r

s

sr

s


s

s

t

ts

t

t	

t
$
u&" This can be SP or WRR


ut

u

u!

u$%

v

vu&

v

v

v

w

wv

w

w

w

x%

xw

x

x 

x#$

y%

yx%

y

y 

y#$

	| �


	|

	 }

	 }|

	 }

	 }

	 }

	~

	~}

	~

	~

	~

	

	~

	

	

	

	�

	�

	�

	�

	�

	�-

	�

	�

	�(

	�+,

	� 

	��-

	�

	�

	�


� �


�


 �


 ��


 �



 �


 �


�


��


�



�


�


�$


��


�



�


�"#

� �

�

 �

 ��

 �	

 �


 �

�

��

�	

�


�

�

��

�	

�


�

�

��

�	

�


�

�

��

�	

�


�

�

��

�	

�


�

�

��

�	

�


�

� �

�
G
 �"9 valid only when referenced in the tech profile instance


 ��

 �

 �

 �

�

��

�


�

�

�

��

�


�

�

�

��

�


�

�
%
�+" This can be SP or WRR


��

�

�&

�)*

�

��+

�

�

�

�

��

�

�

�

�%

��

�

� 

�#$
3
�("% used with version 1 of tech profile


��%

�

�#

�&'
3
	�)"% used with version 2 of tech profile


	��(

	�

	�#

	�&(


�


��)


�



�


�

�"

��

�

�

�!

�,

��"

�


�&

�)+

�+

��,

�


�%

�(*

� �

�

 �

 ��

 �

 �

 �
j
�"\  Valid on for “direction == Upstream” and when referenced in the tech profile instance


��

�


�

�
9
�#"+ Valid on for “direction == Upstream”.


��

�

�

�!"

�

��#

�

�

�

�

��

�

�

�

�(

��

�

�#

�&'

� �

�

 �

 ��

 �


 �

 �

�

��

�


�

�

�

��

�


�

�

�

��

�


�

�

�

��

�


�

�

�&

��

�


�!

�$%

� 

��&

�


�

�

�%

�� 

�


� 

�#$

�+

��%

�


�&

�)*

	�

	��+

	�


	�

	�


�"


��


�


�


�!

�,

��"

�

�&

�)+

�

��,

�


�

�

�

��

�


�

�

�&

��

�

� 

�#%
3
�)"% used with version 1 of tech profile


��&

�

�#

�&(
3
�)"% used with version 2 of tech profile


��)

�

�#

�&(
Z
� �L TechProfile definition (relevant for GPON, XGPON and XGS-PON technologies)


�

 �

 ��

 �


 �

 �

�

��

�


�

�

�

��

�


�

�

�

��

�


�

�

�)

��

�

�$

�'(

�)

��)

�

�$

�'(

�)

��)

�

�$

�'(

�D

�

�

�?

�BC

�F

�

�

�A

�DE
+
� � EPON TechProfile definition


�

 �

 ��

 �


 �

 �

�

��

�


�

�

�

��

�


�

�

�

��

�


�

�

�)

��

�

�$

�'(

�

��)

�


�

�

�B

�

� 

�!>

�@A

�E

�

� 

�!@

�CD
c
� �U TechProfile Instance definition (relevant for GPON, XGPON and XGS-PON technologies)


�

 �

 ��

 �


 �

 �

�

��

�


�

�

�%

��

�


� 

�#$

�

��%

�


�

�

�

��

�


�

�

�)

��

�

�$

�'(

�)

��)

�

�$

�'(

�)

��)

�

�$

�'(

�D

�

�

�?

�BC

	�G

	�

	�

	�A

	�DF
5
� �' EPON TechProfile Instance definition.


�

 �

 ��!

 �


 �

 �

�

��

�


�

�

�%

��

�


� 

�#$

�

��%

�


�

�

�

��

�


�

�

�

��

�


�

�

�)

��

�

�$

�'(

�

��)

�


�

�

�B

�

� 

�!>

�@A

	�F

	�

	� 

	�!@

	�CE
,
� � Resource Instance definition


�

 �

 ��

 �


 �

 �

�

��

�


�

�

�%

��

�


� 

�#$

�

��%

�


�

�

�$

�

�

�

�"#bproto3
��
voltha_protos/openolt.protoopenoltgoogle/api/annotations.proto voltha_protos/tech_profile.protovoltha_protos/ext_config.protovoltha_protos/extensions.proto"�

Indication1
olt_ind (2.openolt.OltIndicationH RoltInd4
intf_ind (2.openolt.IntfIndicationH RintfIndA
intf_oper_ind (2.openolt.IntfOperIndicationH RintfOperInd>
onu_disc_ind (2.openolt.OnuDiscIndicationH R
onuDiscInd1
onu_ind (2.openolt.OnuIndicationH RonuInd4
omci_ind (2.openolt.OmciIndicationH RomciInd4
pkt_ind (2.openolt.PacketIndicationH RpktInd8

port_stats (2.openolt.PortStatisticsH R	portStats8

flow_stats	 (2.openolt.FlowStatisticsH R	flowStats7
	alarm_ind
 (2.openolt.AlarmIndicationH RalarmIndB
data"�
AlarmIndication1
los_ind (2.openolt.LosIndicationH RlosIndD
dying_gasp_ind (2.openolt.DyingGaspIndicationH RdyingGaspIndA
onu_alarm_ind (2.openolt.OnuAlarmIndicationH RonuAlarmIndW
onu_startup_fail_ind (2$.openolt.OnuStartupFailureIndicationH RonuStartupFailIndZ
onu_signal_degrade_ind (2#.openolt.OnuSignalDegradeIndicationH RonuSignalDegradeInd[
onu_drift_of_window_ind (2#.openolt.OnuDriftOfWindowIndicationH RonuDriftOfWindowIndT
onu_loss_omci_ind (2'.openolt.OnuLossOfOmciChannelIndicationH RonuLossOmciIndW
onu_signals_fail_ind (2$.openolt.OnuSignalsFailureIndicationH RonuSignalsFailIndO
onu_tiwi_ind	 (2+.openolt.OnuTransmissionInterferenceWarningH R
onuTiwiInd`
onu_activation_fail_ind
 (2'.openolt.OnuActivationFailureIndicationH RonuActivationFailInd`
onu_processing_error_ind (2%.openolt.OnuProcessingErrorIndicationH RonuProcessingErrorInde
onu_loss_of_sync_fail_ind (2*.openolt.OnuLossOfKeySyncFailureIndicationH RonuLossOfSyncFailIndU
onu_itu_pon_stats_ind (2!.openolt.OnuItuPonStatsIndicationH RonuItuPonStatsIndl
onu_deactivation_failure_ind (2).openolt.OnuDeactivationFailureIndicationH RonuDeactivationFailureIndW
onu_remote_defect_ind (2".openolt.OnuRemoteDefectIndicationH RonuRemoteDefectInds
onu_loss_gem_delineation_ind (21.openolt.OnuLossOfGEMChannelDelineationIndicationH RonuLossGemDelineationIndv
 onu_physical_equipment_error_ind (2,.openolt.OnuPhysicalEquipmentErrorIndicationH RonuPhysicalEquipmentErrorInd[
onu_loss_of_ack_ind (2+.openolt.OnuLossOfAcknowledgementIndicationH RonuLossOfAckIndo
onu_diff_reach_exceeded_ind (2/.openolt.OnuDifferentialReachExceededIndicationH RonuDiffReachExceededIndB
data".
OltIndication

oper_state (	R	operState"H
IntfIndication
intf_id (RintfId

oper_state (	R	operState"h
OnuDiscIndication
intf_id (RintfId:
serial_number (2.openolt.SerialNumberRserialNumber"�
OnuIndication
intf_id (RintfId
onu_id (RonuId

oper_state (	R	operState
admin_state (	R
adminState:
serial_number (2.openolt.SerialNumberRserialNumberL
fail_reason (2+.openolt.OnuIndication.ActivationFailReasonR
failReason"�
ActivationFailReason#
ONU_ACTIVATION_FAIL_REASON_NONE &
"ONU_ACTIVATION_FAIL_REASON_RANGING6
2ONU_ACTIVATION_FAIL_REASON_PASSWORD_AUTHENTICATION"
ONU_ACTIVATION_FAIL_REASON_LOS!
ONU_ACTIVATION_FAIL_ONU_ALARM#
ONU_ACTIVATION_FAIL_SWITCH_OVER"�
IntfOperIndication
type (	Rtype
intf_id (RintfId

oper_state (	R	operState
speed (Rspeed

technology (	R
technologyE
ranges (2-.openolt.IntfOperIndication.PONResourceRangesRranges�
PONResourceRangesH
pools (22.openolt.IntfOperIndication.PONResourceRanges.PoolRpools�
PoolO
type (2;.openolt.IntfOperIndication.PONResourceRanges.Pool.PoolTypeRtype
start (Rstart
end (Rend"A
PoolType

ONU_ID 
ALLOC_ID

GEMPORT_ID
FLOW_ID"R
OmciIndication
intf_id (RintfId
onu_id (RonuId
pkt (Rpkt"�
PacketIndication
	intf_type (	RintfType
intf_id (RintfId
onu_id (RonuId
uni_id	 (RuniId

gemport_id (R	gemportId
flow_id (RflowId
port_no (RportNo
cookie (Rcookie
pkt (Rpkt"$
	Interface
intf_id (RintfId"<
	Heartbeat/
heartbeat_signature (RheartbeatSignature"�
Onu
intf_id (RintfId
onu_id (RonuId:
serial_number (2.openolt.SerialNumberRserialNumber
pir (Rpir'
omcc_encryption (RomccEncryption"�
OnuLogicalDistance
intf_id (RintfId
onu_id (RonuId9
logical_onu_distance_zero (RlogicalOnuDistanceZero0
logical_onu_distance (RlogicalOnuDistance"K
OmciMsg
intf_id (RintfId
onu_id (RonuId
pkt (Rpkt"�
	OnuPacket
intf_id (RintfId
onu_id (RonuId
port_no (RportNo

gemport_id (R	gemportId
pkt (Rpkt"9
UplinkPacket
intf_id (RintfId
pkt (Rpkt"�

DeviceInfo
vendor (	Rvendor
model (	Rmodel)
hardware_version (	RhardwareVersion)
firmware_version (	RfirmwareVersion
	device_id (	RdeviceId0
device_serial_number (	RdeviceSerialNumber1
previously_connected (RpreviouslyConnected
	pon_ports (RponPorts@
ranges (2(.openolt.DeviceInfo.DeviceResourceRangesRranges�
DeviceResourceRanges
intf_ids (RintfIds

technology (	R
technologyC
pools (2-.openolt.DeviceInfo.DeviceResourceRanges.PoolRpools�
PoolJ
type (26.openolt.DeviceInfo.DeviceResourceRanges.Pool.PoolTypeRtypeS
sharing (29.openolt.DeviceInfo.DeviceResourceRanges.Pool.SharingTypeRsharing
start (Rstart
end (Rend"A
PoolType

ONU_ID 
ALLOC_ID

GEMPORT_ID
FLOW_ID"h
SharingType
DEDICATED_PER_INTF 
SHARED_BY_ALL_INTF_ALL_TECH 
SHARED_BY_ALL_INTF_SAME_TECHJJJ"�

Classifier
o_tpid (RoTpid
o_vid (RoVid
i_tpid (RiTpid
i_vid (RiVid
o_pbits (RoPbits
i_pbits (RiPbits
eth_type (RethType
dst_mac (RdstMac
src_mac	 (RsrcMac
ip_proto
 (RipProto
dst_ip (RdstIp
src_ip (RsrcIp
src_port (RsrcPort
dst_port (RdstPort 
pkt_tag_type (	R
pktTagType"�
	ActionCmd"
add_outer_tag (RaddOuterTag(
remove_outer_tag (RremoveOuterTag 
trap_to_host (R
trapToHost,
remark_outer_pbits (RremarkOuterPbits,
remark_inner_pbits (RremarkInnerPbits"
add_inner_tag (RaddInnerTag(
remove_inner_tag (RremoveInnerTag.
translate_inner_tag (RtranslateInnerTag.
translate_outer_tag	 (RtranslateOuterTag"�
Action$
cmd (2.openolt.ActionCmdRcmd
o_vid (RoVid
o_pbits (RoPbits
o_tpid (RoTpid
i_vid (RiVid
i_pbits (RiPbits
i_tpid (RiTpid"�
Flow$
access_intf_id (RaccessIntfId
onu_id (RonuId
uni_id (RuniId
flow_id (RflowId*
symmetric_flow_id (RsymmetricFlowId
	flow_type (	RflowType
alloc_id
 (RallocId&
network_intf_id (RnetworkIntfId

gemport_id (R	gemportId3

classifier (2.openolt.ClassifierR
classifier'
action (2.openolt.ActionRaction
priority	 (Rpriority
cookie (Rcookie
port_no (RportNo
group_id (RgroupId&
tech_profile_id (RtechProfileId%
replicate_flow (RreplicateFlowH
pbit_to_gemport (2 .openolt.Flow.PbitToGemportEntryRpbitToGemportE
gemport_to_aes (2.openolt.Flow.GemportToAesEntryRgemportToAes@
PbitToGemportEntry
key (Rkey
value (Rvalue:8?
GemportToAesEntry
key (Rkey
value (Rvalue:8"T
SerialNumber
	vendor_id (RvendorId'
vendor_specific (RvendorSpecific"�
PortStatistics
intf_id (RintfId
rx_bytes (RrxBytes

rx_packets (R	rxPackets(
rx_ucast_packets (RrxUcastPackets(
rx_mcast_packets (RrxMcastPackets(
rx_bcast_packets (RrxBcastPackets(
rx_error_packets (RrxErrorPackets
	rx_frames (RrxFrames 
rx_frames_64 (R
rxFrames64'
rx_frames_65_127 (RrxFrames65127)
rx_frames_128_255 (RrxFrames128255)
rx_frames_256_511 (RrxFrames256511+
rx_frames_512_1023 (RrxFrames5121023-
rx_frames_1024_1518 (RrxFrames10241518-
rx_frames_1519_2047 (RrxFrames15192047-
rx_frames_2048_4095 (RrxFrames20484095-
rx_frames_4096_9216 (RrxFrames40969216/
rx_frames_9217_16383 (RrxFrames921716383"
rx_crc_errors (RrxCrcErrors
tx_bytes (RtxBytes

tx_packets	 (R	txPackets(
tx_ucast_packets
 (RtxUcastPackets(
tx_mcast_packets (RtxMcastPackets(
tx_bcast_packets (RtxBcastPackets(
tx_error_packets (RtxErrorPackets
	tx_frames (RtxFrames 
tx_frames_64 (R
txFrames64'
tx_frames_65_127 (RtxFrames65127)
tx_frames_128_255 (RtxFrames128255)
tx_frames_256_511  (RtxFrames256511+
tx_frames_512_1023! (RtxFrames5121023-
tx_frames_1024_1518" (RtxFrames10241518-
tx_frames_1519_2047# (RtxFrames15192047-
tx_frames_2048_4095$ (RtxFrames20484095-
tx_frames_4096_9216% (RtxFrames40969216/
tx_frames_9217_16383& (RtxFrames921716383

bip_errors (R	bipErrors
	timestamp (R	timestamp"�
OnuStatistics
intf_id (RintfId
onu_id (RonuId%
positive_drift (RpositiveDrift%
negative_drift (RnegativeDrift8
delimiter_miss_detection (RdelimiterMissDetection

bip_errors (R	bipErrors
	bip_units (RbipUnits2
fec_corrected_symbols (RfecCorrectedSymbols6
fec_codewords_corrected	 (RfecCodewordsCorrected>
fec_codewords_uncorrectable
 (RfecCodewordsUncorrectable#
fec_codewords (RfecCodewords.
fec_corrected_units (RfecCorrectedUnits&
xgem_key_errors (RxgemKeyErrors
	xgem_loss (RxgemLoss&
rx_ploams_error (RrxPloamsError+
rx_ploams_non_idle (RrxPloamsNonIdle
rx_omci (RrxOmci8
rx_omci_packets_crc_error (RrxOmciPacketsCrcError
rx_bytes (RrxBytes

rx_packets (R	rxPackets
tx_bytes (RtxBytes

tx_packets (R	txPackets!
ber_reported (RberReported
lcdg_errors (R
lcdgErrors

rdi_errors (R	rdiErrors
	timestamp (R	timestamp"�
GemPortStatistics
intf_id (RintfId

gemport_id (R	gemportId

rx_packets (R	rxPackets
rx_bytes (RrxBytes

tx_packets (R	txPackets
tx_bytes (RtxBytes
	timestamp (R	timestamp"�
FlowStatistics
flow_id (RflowId
rx_bytes (RrxBytes

rx_packets (R	rxPackets
tx_bytes (RtxBytes

tx_packets	 (R	txPackets
	timestamp (R	timestamp"@
LosIndication
intf_id (RintfId
status (	Rstatus"]
DyingGaspIndication
intf_id (RintfId
onu_id (RonuId
status (	Rstatus"�
OnuAlarmIndication
intf_id (RintfId
onu_id (RonuId

los_status (	R	losStatus

lob_status (	R	lobStatus(
lopc_miss_status (	RlopcMissStatus1
lopc_mic_error_status (	RlopcMicErrorStatus
lofi_status (	R
lofiStatus!
loami_status (	RloamiStatus"e
OnuStartupFailureIndication
intf_id (RintfId
onu_id (RonuId
status (	Rstatus"�
OnuSignalDegradeIndication
intf_id (RintfId
onu_id (RonuId
status (	Rstatus3
inverse_bit_error_rate (RinverseBitErrorRate"�
OnuDriftOfWindowIndication
intf_id (RintfId
onu_id (RonuId
status (	Rstatus
drift (Rdrift
new_eqd (RnewEqd"h
OnuLossOfOmciChannelIndication
intf_id (RintfId
onu_id (RonuId
status (	Rstatus"�
OnuSignalsFailureIndication
intf_id (RintfId
onu_id (RonuId
status (	Rstatus3
inverse_bit_error_rate (RinverseBitErrorRate"�
"OnuTransmissionInterferenceWarning
intf_id (RintfId
onu_id (RonuId
status (	Rstatus
drift (Rdrift"q
OnuActivationFailureIndication
intf_id (RintfId
onu_id (RonuId
fail_reason (R
failReason"k
!OnuLossOfKeySyncFailureIndication
intf_id (RintfId
onu_id (RonuId
status (	Rstatus"T
RdiErrorIndication&
rdi_error_count (RrdiErrorCount
status (	Rstatus"�
OnuItuPonStatsIndication
intf_id (RintfId
onu_id (RonuIdA
rdi_error_ind (2.openolt.RdiErrorIndicationH RrdiErrorIndB
stats"N
OnuProcessingErrorIndication
intf_id (RintfId
onu_id (RonuId"j
 OnuDeactivationFailureIndication
intf_id (RintfId
onu_id (RonuId
status (	Rstatus"j
OnuRemoteDefectIndication
intf_id (RintfId
onu_id (RonuId

rdi_errors (R	rdiErrors"�
(OnuLossOfGEMChannelDelineationIndication
intf_id (RintfId
onu_id (RonuId
status (	Rstatus-
delineation_errors (RdelineationErrors"m
#OnuPhysicalEquipmentErrorIndication
intf_id (RintfId
onu_id (RonuId
status (	Rstatus"l
"OnuLossOfAcknowledgementIndication
intf_id (RintfId
onu_id (RonuId
status (	Rstatus"�
&OnuDifferentialReachExceededIndication
intf_id (RintfId
onu_id (RonuId
status (	Rstatus
distance (Rdistance"�
GroupMember!
interface_id (RinterfaceIdI
interface_type (2".openolt.GroupMember.InterfaceTypeRinterfaceType
gem_port_id (R	gemPortId
priority (Rpriority"=
InterfaceType
PON 
EPON_1G_PATH
EPON_10G_PATH"�
Group
group_id (RgroupId<
command (2".openolt.Group.GroupMembersCommandRcommand.
members (2.openolt.GroupMemberRmembers'
action (2.openolt.ActionRaction"K
GroupMembersCommand
ADD_MEMBERS 
REMOVE_MEMBERS
SET_MEMBERS"]

ValueParam
onu (2.openolt.OnuRonu/
value (2.extension.ValueType.TypeRvalue"�
PonRxPowerData
intf_id (RintfId
onu_id (RonuId
status (	RstatusR
fail_reason (21.openolt.PonRxPowerData.RssiMeasurementFailReasonR
failReason)
rx_power_mean_dbm (RrxPowerMeanDbm"j
RssiMeasurementFailReason
FAIL_REASON_NONE 
FAIL_REASON_NO_DELIMITER
FAIL_REASON_NO_ACCESS"�
OnuInfo
onu_id (RonuId/
state (2.openolt.OnuInfo.OnuStateRstate'
losi (2.openolt.AlarmStateRlosi'
lofi (2.openolt.AlarmStateRlofi)
loami (2.openolt.AlarmStateRloami"S
OnuState
UNKNOWN 
NOT_CONFIGURED

ACTIVE
INACTIVE
DISABLED"�
PonIntfInfo
intf_id (RintfId7
state (2!.openolt.PonIntfInfo.PonIntfStateRstate%
los (2.openolt.AlarmStateRlos"_
PonIntfState
UNKNOWN 
ACTIVE_WORKING
ACTIVE_STANDBY
INACTIVE
DISABLED"
Empty*

AlarmState
OFF 
ON2�
OpenoltD

DisableOlt.openolt.Empty.openolt.Empty"���"/v1/Disable:*F
ReenableOlt.openolt.Empty.openolt.Empty"���"/v1/Reenable:*E
ActivateOnu.openolt.Onu.openolt.Empty"���"/v1/EnableOnu:*H
DeactivateOnu.openolt.Onu.openolt.Empty"���"/v1/DisableOnu:*C
	DeleteOnu.openolt.Onu.openolt.Empty"���"/v1/DeleteOnu:*I

OmciMsgOut.openolt.OmciMsg.openolt.Empty"���"/v1/OmciMsgOut:*O
OnuPacketOut.openolt.OnuPacket.openolt.Empty"���"/v1/OnuPacketOut:*X
UplinkPacketOut.openolt.UplinkPacket.openolt.Empty"���"/v1/UplinkPacketOut:*@
FlowAdd.openolt.Flow.openolt.Empty"���"/v1/FlowAdd:*F

FlowRemove.openolt.Flow.openolt.Empty"���"/v1/FlowRemove:*S
HeartbeatCheck.openolt.Empty.openolt.Heartbeat"���"/v1/HeartbeatCheck:*M
EnablePonIf.openolt.Interface.openolt.Empty"���"/v1/EnablePonIf:*O
DisablePonIf.openolt.Interface.openolt.Empty"���"/v1/DisablePonIf:*R
GetDeviceInfo.openolt.Empty.openolt.DeviceInfo"���"/v1/GetDeviceInfo:*?
Reboot.openolt.Empty.openolt.Empty"���"
/v1/Reboot:*U
CollectStatistics.openolt.Empty.openolt.Empty" ���"/v1/CollectStatistics:*Y
GetOnuStatistics.openolt.Onu.openolt.OnuStatistics"���"/v1/GetOnuStatistics:*k
GetGemPortStatistics.openolt.OnuPacket.openolt.GemPortStatistics"#���"/v1/GetGemPortStatistics:*r
CreateTrafficSchedulers.tech_profile.TrafficSchedulers.openolt.Empty"&��� "/v1/CreateTrafficSchedulers:*r
RemoveTrafficSchedulers.tech_profile.TrafficSchedulers.openolt.Empty"&��� "/v1/RemoveTrafficSchedulers:*f
CreateTrafficQueues.tech_profile.TrafficQueues.openolt.Empty""���"/v1/CreateTrafficQueues:*f
RemoveTrafficQueues.tech_profile.TrafficQueues.openolt.Empty""���"/v1/RemoveTrafficQueues:*;
EnableIndication.openolt.Empty.openolt.Indication" 0]
PerformGroupOperation.openolt.Group.openolt.Empty"$���"/v1/PerformGroupOperation:*I
DeleteGroup.openolt.Group.openolt.Empty"���"/v1/DeleteGroup:*W
GetExtValue.openolt.ValueParam.extension.ReturnValues"���"/v1/GetExtValue:*]
OnuItuPonAlarmSet.config.OnuItuPonAlarm.openolt.Empty" ���"/v1/OnuItuPonAlarmSet:*p
GetLogicalOnuDistanceZero.openolt.Onu.openolt.OnuLogicalDistance"(���""/v1/GetLogicalOnuDistanceZero:*h
GetLogicalOnuDistance.openolt.Onu.openolt.OnuLogicalDistance"$���"/v1/GetLogicalOnuDistance:*T
GetPonRxPower.openolt.Onu.openolt.PonRxPowerData"���"/v1/GetPonRxPower:*G

GetOnuInfo.openolt.Onu.openolt.OnuInfo"���"/v1/GetOnuInfo:*`
GetPonInterfaceInfo.openolt.Interface.openolt.PonIntfInfo"���"/v1/GetInterfaceInfo:*B]
org.opencord.voltha.openoltBVolthaOpenOLTZ/github.com/opencord/voltha-protos/v5/go/openoltJ�
 �
�
 2� Copyright 2018-2024 Open Networking Foundation (ONF) and the ONF Contributors

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at:

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.


 F
	
 F

 4
	
 4

 .
	
 .

 
	
  &
	
 *
	
 (
	
 (

  �


 

  !

  

  

  #(

   


	  �ʼ" 


 #(

 #

 #

 #$)

 $'


	 �ʼ"$'


 */

 *

 *

 *"'

 +.


	 �ʼ"+.


 16

 1

 1

 1$)

 25


	 �ʼ"25


 8=

 8

 8

 8 %

 9<


	 �ʼ"9<


 ?D

 ?

 ?

 ?%*

 @C


	 �ʼ"@C


 FK

 F

 F

 F).

 GJ


	 �ʼ"GJ


 MR

 M

 M$

 M/4

 NQ


	 �ʼ"NQ


 TY

 T

 T

 T$

 UX


	 �ʼ"UX


 	[`

 	[

 	[

 	["'

 	\_


	 	�ʼ"\_


 
bg

 
b

 
b

 
b'0

 
cf


	 
�ʼ"cf


 in

 i

 i

 i(-

 jm


	 �ʼ"jm


 pu

 p

 p

 p).

 qt


	 �ʼ"qt


 w|

 w

 w

 w&0

 x{


	 �ʼ"x{


 ~�

 ~

 ~

 ~$

 	�


	 �ʼ"	�


 ��

 �

 �

 �*/

 ��


	 �ʼ"��


 ��

 �

 �

 �'4

 ��


	 �ʼ"��


 ��

 �

 �&

 �1B

 ��


	 �ʼ"��


 ��

 �

 � >

 �IN

 ��


	 �ʼ"��


 ��

 �

 � >

 �IN

 ��


	 �ʼ"��


 ��

 �

 �6

 �AF

 ��


	 �ʼ"��


 ��

 �

 �6

 �AF

 ��


	 �ʼ"��


 �>

 �

 �

 �)/

 �0:

 ��

 �

 �#

 �.3

 ��


	 �ʼ"��


 ��

 �

 �

 �$)

 ��


	 �ʼ"��


 ��

 �

 �

 �)?

 ��


	 �ʼ"��


 ��

 �

 �/

 �:?

 ��


	 �ʼ"��


 ��

 �!

 �"%

 �0B

 ��


	 �ʼ"��


 ��

 �

 �!

 �,>

 ��


	 �ʼ"��


 ��

 �

 �

 �$2

 ��


	 �ʼ"��

�
 ��� 
 GetOnuInfo takes Onu id, serialnumber, and pon interface as argument from the onu structure.
 Returns the Onu info from the device.


 �

 �

 �!(

 ��


	 �ʼ"��

�
 ��q
 GetPonInterfaceInfo takes the pon intf id as argument.
 Returns the pon interface information from the device.


 �

 �%

 �0;

 ��


	 �ʼ"��


 � �

 �

  ��

  �


  �"

  �

  �

  � !

 �$

 �

 �

 �"#

 �-

 �

 �(

 �+,

 �+

 �

 �&

 �)*

 �"

 �

 �

 � !

 �$

 �

 �

 �"#

 �%

 �

 � 

 �#$

 �&

 �

 �!

 �$%

 �&

 �

 �!

 �$%

 	�&

 	�

 	�!

 	�#%

� �

�

 ��

 �


 �"

 �

 �

 � !

�/

�

�*

�-.

�-

�

�(

�+,

�=

�#

�$8

�;<

�>

�"

�#9

�<=

�?

�"

�#:

�=>

�=

�&

�'8

�;<

�=

�#

�$8

�;<

�<

�*

�+7

�:;

	�D

	�&

	�'>

	�AC


�C


�$


�%=


�@B

�I

�)

�*C

�FH

�<

� 

�!6

�9;

�K

�(

�)E

�HJ

�=

�!

�"7

�:<

�S

�0

�1M

�PR

�R

�+

�,L

�OQ

�D

�*

�+>

�AC

�P

�.

�/J

�MO

� �

�

 �"
 up, down


 ��

 �


 �

 �

� �

�

 �

 ��

 �

 �

 �

�"
 up, down


��

�


�

�

� �

�

 �

 ��

 �

 �

 �

�#

��

�

�

�!"

� �

�

 �

 ��

 �

 �

 �

�

��

�

�

�

�"
 up, down


��

�


�

�

�"
 up, down


��

�


�

�

�#

��

�

�

�!"
*
 ��* activation fail reason. 

 �	

  �,

  �'

  �*+
 
 �/"Ranging Failure


 �*

 �-.
(
 �?"Password authentication


 �:

 �=>

 �+"LOS


 �&

 �)*

 �*" ONU Alarm


 �%

 �()
'
 �,"protection switch over


 �'

 �*+

�)

��

�

�$

�'(

� �

�

 �"
 nni, pon


 ��

 �


 �

 �

�

��

�

�

�

�"
 up, down


��

�


�

�
 
�" measured in Mbps


��

�

�

�

�

��

�


�

�

 ��

 �

  ��	

  �

   ��

	   �


    �

    �

    �


   �

   �

   �


   �

   �

   �


   �

   �

   �

   �

	   ��

	   �

	   �

	   �
?
  �"- lower bound on IDs allocated from this pool


	  ��

	  �

	  �

	  �
?
  �"- upper bound on IDs allocated from this pool


	  ��

	  �

	  �

	  �

  � 

  �

  �

  �

  �

�!

��

�

�

� 

� �

�

 �

 ��

 �

 �

 �

�

��

�

�

�

�

��

�	

�


�

� �

�
!
 �" nni, pon, unknown


 ��

 �


 �

 �

�

��

�

�

�

�

��

�

�

�

�

��

�

�

�

�

��

�

�

�

�

��

�

�

�

�

��

�

�

�

�

��

�

�

�

�

��

�	

�


�

	� �

	�

	 �

	 ��

	 �

	 �

	 �


� �


�


 �$


 ��


 �


 �


 �"#

� �

�

 �

 ��

 �

 �

 �

�

��

�

�

�

�#

��

�

�

�!"
5
�"' peak information rate assigned to onu


��#

�

�

�

�

��

�

�	

�

� �

�

 �

 ��

 �

 �

 �

�

��

�

�

�
#
�*"0km logical distance


��

�

�%

�()

�%

��*

�

� 

�#$

� �

�

 �

 ��

 �

 �

 �

�

��

�

�

�

�

��

�	

�


�

� �

�

 �

 ��

 �

 �

 �

�

��

�

�

�

�

��

�

�

�

�

��

�

�

�

�

��

�	

�


�

� �

�

 �

 ��

 �

 �

 �

�

��

�	

�


�

� �

�

 �

 ��

 �


 �

 �

�

��

�


�

�

� 

��

�


�

�

� 

�� 

�


�

�

�

�� 

�


�

�

�%

��

�


�

�"$
7
�#") used to indicate agent reconcile status


��%

�

�	

� "
<
�. Total number of pon intf ports on the device


��#

�

�

�
�
	�"� Not used anymore, this information is defined per-range only
 and is fully provided by DeviceResourceRanges

 string technology = 5;
 fixed32 onu_id_start = 6;
 fixed32 onu_id_end = 7;
 fixed32 alloc_id_start = 8;
 fixed32 alloc_id_end = 9;
 fixed32 gemport_id_start = 10;
 fixed32 gemport_id_end = 11;
 fixed32 flow_id_start = 13;
 fixed32 flow_id_end = 14;


	 �

	 �

	 �

	�

	�

	�

	�

	�

	�

 ��

 � 
�
  �&w List of 0 or more intf_ids that use the same technology and pools.
 If 0 intf_ids supplied, it implies ALL interfaces


  �

  �

  �!

  �$%
2
 �" Technology profile for this pool


 ��&

 �

 �

 �

  ��	

  �

   ��

	   �


    �

    �

    �


   �

   �

   �


   �

   �

   �


   �

   �

   �

  ��

	  �


   �'

   �"

   �%&
T

  �0"@ Shared across all interfaces in all technologies in all ranges


  �+

  �./
\

  �1"H Shared across all interfaces of the same technology used in this range


  �,

  �/0

   �

	   ��

	   �

	   �

	   �

  �$

	  ��

	  �

	  �

	  �"#
?
  �"- lower bound on IDs allocated from this pool


	  ��$

	  �

	  �

	  �
?
  �"- upper bound on IDs allocated from this pool


	  ��

	  �

	  �

	  �

 � 

 �

 �

 �

 �

�.

�

�!

�"(

�+-

� �

�

 �

 ��

 �

 �

 �

�

��

�

�

�

�

��

�

�

�

�

��

�

�

�

�

��

�

�

�

�

��

�

�

�

�

��

�

�

�

�

��

�	

�


�

�

��

�	

�


�

	�

	��

	�

	�

	�


�


��


�


�


�

�

��

�

�

�

�

��

�

�

�

�

��

�

�

�
0
�"" untagged, single_tag, double_tag


��

�


�

�

� �

�

 �

 ��

 �

 �	

 �

�

��

�

�	

�

�

��

�

�	

�

� 

��

�

�	

�

� 

�� 

�

�	

�

�

�� 

�

�	

�

�

��

�

�	

�

�!

��

�

�	

� 

�!

��!

�

�	

� 

� �

�

 �

 ��

 �

 �

 �

�

��

�

�

�

�

��

�

�

�

�

��

�

�

�

�

��

�

�

�

�

��

�

�

�

�

��

�

�

�

� �

�

 � 

 ��

 �

 �

 �

�

�� 

�

�

�

�

��

�

�

�
8
�"* voltha flow-id. 0 is not a valid flow_id


��

�

�

�
m
�#"_ symmetric voltha flow-id, if applicable. All data path flows generally have a symmetric flow,


��

�

�

� "
�
�", upstream, downstream, broadcast, multicast
2� but trap-to-controller flows do not have a symmetric flow
 Broadcom BAL requires that symmetric flows use the same BAL flow-id


��#

�


�

�

�

��

�

�

�

�!

��

�

�

� 
L
�"> When 'replicate_flow' field is true, this field is obsolete.


��!

�

�

�

	�

	��

	�

	�

	�


�


��


�



�


�

�

��

�

�

�
d
�"V must be provided for any flow with trap_to_host action. Returned in PacketIndication


��

�

�

�
d
�"V must be provided for any flow with trap_to_host action. Returned in PacketIndication


��

�

�

�

�

��

�

�

�

�!

��

�

�

� 
y
�"k When this field is true, use pbitToGemPortID to know which p-bit needs to be classfied to which gem port.


��!

�

�	

�
+
�/" Map of p-bit to gem port ID


��

�

�)

�,.
4
�+"& Map of gem port ID to aes encryption


��/

�

�%

�(*

� �

�

 �

 ��

 �	

 �


 �

�

��

�	

�


�

� �

�

 �

 ��

 �

 �

 �

�

��

�

�

�

�

��

�

�

�

�!

��

�

�

� 

�!

��!

�

�

� 

�!

��!

�

�

� 

�!

��!

�

�

� 

�

��!

�

�

�

�

��

�

�

�

	�"

	��

	�

	�

	�!


�#


��"


�


�


� "

�#

��#

�

�

� "

�$

��#

�

�

�!#

�%

��$

�

�

�"$

�%

��%

�

�

�"$

�%

��%

�

�

�"$

�%

��%

�

�

�"$

�&

��%

�

� 

�#%

�

��&

�

�

�

�

��

�

�

�

�

��

�

�

�

�"

��

�

�

�!

�"

��"

�

�

�!

�"

��"

�

�

�!

�"

��"

�

�

�!

�

��"

�

�

�

�

��

�

�

�

�"

��

�

�

�!

�#

��"

�

�

� "

�#

��#

�

�

� "

�$

��#

�

�

�!#

�%

��$

�

�

�"$

 �%

 ��%

 �

 �

 �"$

!�%

!��%

!�

!�

!�"$

"�%

"��%

"�

"�

"�"$

#�&

#��%

#�

#� 

#�#%

$�

$��&

$�

$�

$�

%�

%��

%�

%�

%�

� �

�

 �

 ��

 �

 �

 �

�

��

�

�

�

�

��

�

�

�

�

��

�

�

�

�)

��

�

�$

�'(

�

��)

�

�

�

�

��

�

�

�

�&

��

�

�!

�$%

�(

��&

�

�#

�&'

	�-

	��(

	�

	�'

	�*,


�


��-


�


�


�

�%

��

�

�

�"$

�!

��%

�

�

� 

�

��!

�

�

�

�!

��

�

�

� 

�$

��!

�

�

�!#

�

��$

�

�

�

�+

��

�

�%

�(*

�

��+

�

�

�

�

��

�

�

�

�

��

�

�

�

�

��

�

�

�

�

��

�

�

�

�

��

�

�

�

�

��

�

�

�

�

��

�

�

�

� �

�

 �

 ��

 �

 �

 �

�

��

�

�

�

�

��

�

�

�

�

��

�

�

�

�

��

�

�

�

�

��

�

�

�

�

��

�

�

�

� �

�

 �

 ��

 �

 �

 �

�

��

�

�

�

�

��

�

�

�

�

��

�

�

�

�

��

�

�

�

�

��

�

�

�

� �

�

 �

 ��

 �

 �

 �

�

��

�


�

�

� �

�

 �

 ��

 �

 �

 �

�

��

�

�

�

�

��

�


�

�

� �

�

 �

 ��

 �

 �

 �

�

��

�

�

�

�

��

�


�

�

�

��

�


�

�

� 

��

�


�

�

�%

�� 

�


� 

�#$

�

��%

�


�

�

�

��

�


�

�

� �

�#

 �

 ��%

 �

 �

 �

�

��

�

�

�

�

��

�


�

�

� �

�"

 �

 ��$

 �

 �

 �

�

��

�

�

�

�

��

�


�

�

�'

��

�

�"

�%&

� �

�"

 �

 ��$

 �

 �

 �

�

��

�

�

�

�

��

�


�

�

�

��

�

�

�

�

��

�

�

�

 � �

 �&

  �

  ��(

  �

  �

  �

 �

 ��

 �

 �

 �

 �

 ��

 �


 �

 �

!� �

!�#

! �

! ��%

! �

! �

! �

!�

!��

!�

!�

!�

!�

!��

!�


!�

!�

!�'

!��

!�

!�"

!�%&

"� �

"�*

" �

" ��,

" �

" �

" �

"�

"��

"�

"�

"�

"�

"��

"�


"�

"�

"�

"��

"�

"�

"�

#� �

#�&

# �

# ��(

# �

# �

# �

#�

#��

#�

#�

#�

#�

#��

#�

#�

#�

$� �

$�)

$ �

$ ��+

$ �

$ �

$ �

$�

$��

$�

$�

$�

$�

$��

$�


$�

$�

%� �

%�

% � " RDI Error count


% ��

% �

% �

% �
>
%�"0 on/off based on configured reporting condition


%�� 

%�


%�

%�

&� �

&� 

& �

& ��!

& �

& �

& �

&�

&��

&�

&�

&�

& ��

& �


&�-" add more here


&�

&�(

&�+,

'� �

'�$

' �

' ��&

' �

' �

' �

'�

'��

'�

'�

'�

(� �

(�(

( �

( ��*

( �

( �

( �

(�

(��

(�

(�

(�

(�

(��

(�


(�

(�

)� �

)�!

) �

) ��#

) �

) �

) �

)�

)��

)�

)�

)�

)�

)��

)�

)�

)�

*� �

*�0

* �

* ��2

* �

* �

* �

*�

*��

*�

*�

*�

*�

*��

*�


*�

*�

*�#

*��

*�

*�

*�!"

+� �

+�+

+ �

+ ��-

+ �

+ �

+ �

+�

+��

+�

+�

+�

+�

+��

+�


+�

+�

,� �

,�*

, �

, ��,

, �

, �

, �

,�

,��

,�

,�

,�

,�

,��

,�


,�

,�

-� �

-�.

- �

- ��0

- �

- �

- �

-�

-��

-�

-�

-�

-�

-��

-�

-�

-�

-�

-��

-�

-�

-�

.� �

.�

. ��

. �	

.  �

.  �

.  �

. �

. �

. �

. �

. �

. �

. �

. ��

. �


. �

. �

.�%

.��

.�

.� 

.�#$

.�

.��%

.�


.�

.�
`
.�"R Priority (and also the ID) of the default fixed queue for the multicast traffic.


.��

.�


.�

.�

/� �

/�

/ ��

/ �	

/  �

/  �

/  �

/ �

/ �

/ �

/ �

/ �

/ �

/ �

/ ��

/ �


/ �

/ �

/�$

/��

/�

/�

/�"#

/�%

/�

/�

/� 

/�#$

/�

/��%

/�


/�

/�

0� �

0�

0 �

0 ��

0 �

0 �

0 �

0�+

0��

0� 

0�!&

0�)*

1� �

1�

1 ��

1 �	"

1  �

1  �

1  �

1 �%

1 � 

1 �#$

1 �"

1 �

1 � !

1 �

1 ��

1 �

1 �

1 �

1�

1��

1�

1�

1�

1�

1��

1�


1�

1�

1�.

1��

1�

1�)

1�,-

1�!

1��.

1�


1�

1� 

 � �

 �

  �

  �

  �

 �

 �

 �
�
2� ��
 contains the onu id, state of the onu and the information about the alarms on the onu.
 As of now only few alarms are added, any further information needed can be added to the structure.


2�

2 �

2 ��

2 �

2 �

2 �

2 ��

2 �	
�
2  ��
 There are other states in BAL for ONU, which voltha is not interested as of now.
 UNKNOWN is to be filled for the rest of the states other than NOT_CONFIGURED/ACTIVE/INACTIVE/DISABLED


2  �

2  �

2 �

2 �

2 �

2 �

2 �

2 �

2 �

2 �

2 �

2 �

2 �

2 �

2�

2��

2�

2�

2�

2�

2��

2�

2�

2�

2�

2��

2�

2�

2�

2�

2��

2�

2�

2�
�
3� ��
 IntfInfo has the interface Id and if there are any alarms active on that interface.
 Any further information needed from the interface object can be added to the structure.


3�

3 �

3 ��

3 �

3 �

3 �

3 ��

3 �	

3  �

3  �

3  �

3 �

3 �

3 �

3 �

3 �

3 �

3 �

3 �

3 �

3 �

3 �

3 �

3�

3��

3�

3�

3�

3�

3��

3�

3�

3�


4� 

4�bproto3
�"
!voltha_protos/inter_adapter.protointer_adaptervoltha_protos/common.protovoltha_protos/voltha.proto voltha_protos/tech_profile.protovoltha_protos/openolt.protovoltha_protos/device.proto"�
OmciMessage
message (RmessageB
connect_status (2.common.ConnectStatus.TypesRconnectStatus@
proxy_address (2.device.Device.ProxyAddressRproxyAddress(
parent_device_id (	RparentDeviceId&
child_device_id (	RchildDeviceId"�
OmciMessages
messages (RmessagesB
connect_status (2.common.ConnectStatus.TypesRconnectStatus@
proxy_address (2.device.Device.ProxyAddressRproxyAddress(
parent_device_id (	RparentDeviceId&
child_device_id (	RchildDeviceId"�
TechProfileDownloadMessage
	device_id (	RdeviceId
uni_id (RuniId(
tp_instance_path (	RtpInstancePathD
tp_instance (2!.tech_profile.TechProfileInstanceH R
tpInstanceQ
epon_tp_instance (2%.tech_profile.EponTechProfileInstanceH ReponTpInstanceB
tech_tp_instance"�
DeleteGemPortMessage
	device_id (	RdeviceId
uni_id (RuniId(
tp_instance_path (	RtpInstancePath
gem_port_id (R	gemPortId"�
DeleteTcontMessage
	device_id (	RdeviceId
uni_id (RuniId(
tp_instance_path (	RtpInstancePath
alloc_id (RallocId"r
OnuIndicationMessage
	device_id (	RdeviceId=
onu_indication (2.openolt.OnuIndicationRonuIndication"�
!TechProfileInstanceRequestMessage
	device_id (	RdeviceId(
tp_instance_path (	RtpInstancePath(
parent_device_id (	RparentDeviceId&
parent_pon_port (RparentPonPort
onu_id (RonuId
uni_id (RuniIdBZ
!org.opencord.voltha.inter_adapterZ5github.com/opencord/voltha-protos/v5/go/inter_adapterJ�
  D

  

 L
	
 L

 :
	
 :
	
  $
	
 $
	
 *
	
 %
	
	 $

 
$
  2 Inter-Adapter messages



 

  

  

  	

  


  

 2

 

 

 -

 01

 1

 2

 

 ,

 /0

  

 1

 


 

 

 

  

 


 

 


 




  

 

 

 

 

2

 



-

01

1

2



,

/0

 

1










 









  (


 "

 !

 ! $

 !


 !

 !

"

"!

"


"

"

# 

#"

#


#

#

 $'

 $

@
%9"3 relevant for GPON, XGPON and XGS-PON technologies


%(

%)4

%78
+
&B" relevant for EPON technology


&,

&-=

&@A


* /


*

 +

 +*

 +


 +

 +

,

,+

,


,

,

- 

-,

-


-

-

.

.- 

.


.

.


1 6


1

 2

 21

 2


 2

 2

3

32

3


3

3

4 

43

4


4

4

5

54 

5


5

5


8 ;


8

 9

 98

 9


 9

 9

:-

:9

:

:(

:+,


= D


=)

 >

 >=+

 >


 >

 >
/
? "" technology profile instance path


?>

?


?

?

@ 

@? 

@


@

@

A

A@ 

A


A

A

B

BA

B


B

B

C

CB

C


C

Cbproto3
�	
-voltha_protos/olt_inter_adapter_service.protoolt_inter_adapter_servicevoltha_protos/common.protogoogle/protobuf/empty.proto!voltha_protos/inter_adapter.protovoltha_protos/health.proto2�
OltInterAdapterService?
GetHealthStatus.common.Connection.health.HealthStatus(0F
ProxyOmciRequest.inter_adapter.OmciMessage.google.protobuf.EmptyH
ProxyOmciRequests.inter_adapter.OmciMessages.google.protobuf.Emptyu
GetTechProfileInstance0.inter_adapter.TechProfileInstanceRequestMessage).inter_adapter.TechProfileDownloadMessageB�
-org.opencord.voltha.olt_inter_adapter_serviceBVolthaOltInterAdapterServiceZAgithub.com/opencord/voltha-protos/v5/go/olt_inter_adapter_serviceJ�
  

  

 X
	
 X

 F
	
 F

 =
	
 =

 "
	
  $
	
	 %
	

 +
	
 $


  


 
�
  W� GetHealthStatus is used by a OltInterAdapterService client to detect a connection
 lost with the gRPC server hosting the OltInterAdapterService service


  

  

  0

  ;A

  BU

 T

 

 2

 =R

 V

 

 4

 ?T

 �

 

 N

 Y�bproto3
�
-voltha_protos/onu_inter_adapter_service.protoonu_inter_adapter_servicevoltha_protos/common.protogoogle/protobuf/empty.proto!voltha_protos/inter_adapter.protovoltha_protos/health.proto2�
OnuInterAdapterService?
GetHealthStatus.common.Connection.health.HealthStatus(0L
OnuIndication#.inter_adapter.OnuIndicationMessage.google.protobuf.EmptyD
OmciIndication.inter_adapter.OmciMessage.google.protobuf.EmptyX
DownloadTechProfile).inter_adapter.TechProfileDownloadMessage.google.protobuf.EmptyL
DeleteGemPort#.inter_adapter.DeleteGemPortMessage.google.protobuf.EmptyH
DeleteTCont!.inter_adapter.DeleteTcontMessage.google.protobuf.EmptyB�
-org.opencord.voltha.onu_inter_adapter_serviceBVolthaOnuInterAdapterServiceZAgithub.com/opencord/voltha-protos/v5/go/onu_inter_adapter_serviceJ�
  

  

 X
	
 X

 F
	
 F

 =
	
 =

 "
	
  $
	
	 %
	

 +
	
 $


  


 
�
  W� GetHealthStatus is used by a OnuInterAdapterService client to detect a connection
 lost with the gRPC server hosting the OnuInterAdapterService service


  

  

  0

  ;A

  BU

 Z

 

 8

 CX

 R

 

 0

 ;P

 f

 

 D

 Od

 Z

 

 8

 CX

 V

 

 4

 ?Tbproto3