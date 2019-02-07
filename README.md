# voltha-protos

Protobuf files used by [VOLTHA](https://wiki.opencord.org/display/CORD/VOLTHA).

Currently this is used to generate both go and python.

Protobuf definition files are located in `protos` directory.

> NOTE: The `protos/google/api` directory has files copied from the [Google
> APIs](https://github.com/googleapis/googleapis), and is only included for
> initial compilation of the included protobuf files - these API's should be
> installed independently via either the python
> [googleapis-common-protos](https://pypi.org/project/googleapis-common-protos/)
> package or the golang [go-genproto](https://github.com/google/go-genproto)
> repo.

## Using voltha-protos in your project

### Python

`pip install voltha-protos`

### go

`go get ...`

## Testing

`make test` will run all tests.

