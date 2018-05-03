# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/).

## 2.1.2 - 2018-05-03
### Added
- Support for returning names for events in the Audit service 
- Support for multiple hostnames per listener in the Load Balancing service
- Support for specifying a retry strategy when calling OCI services. An example of specifying a client retry strategy may be found in the `examples/` folder of the [ruby-sdk.zip](https://docs.us-phoenix-1.oraclecloud.com/tools/ruby/latest/download/oci-ruby-sdk.zip) download

## 2.1.1 - 2018-04-19

### Added
- Support for tagging `DbSystem` and `Database` resources in the Database Service. An example of using tagging can be found in the `examples/` folder of the [ruby-sdk.zip](https://docs.us-phoenix-1.oraclecloud.com/tools/ruby/latest/download/oci-ruby-sdk.zip) download
- Support for filtering by `DbSystemId` in `ListDbVersions` operation in Database Service
- Support for composite operations that provide convenience methods for operations that are often chained together.  An example on how to use this can be found in the `examples/` folder of the [ruby-sdk.zip](https://docs.us-phoenix-1.oraclecloud.com/tools/ruby/latest/download/oci-ruby-sdk.zip) download
- Support for logging enum values when mapped to unknown value.  To enable this logging, define a logger for `OCI.logger`

## 2.1.0 - 2018-03-27

### Breaking Changes
- *Italic text* indicates breaking changes that may impact users, but most likely will not

### Added
- Support for remote VCN peering across regions. An example on how to use this can be found in the `examples/` folder of the [ruby-sdk.zip](https://docs.us-phoenix-1.oraclecloud.com/tools/ruby/latest/download/oci-ruby-sdk.zip) download
- Support for calling Oracle Cloud Infrastructure services in the uk-london-1 (LHR) region
- Support for username and password protected proxies

### Changed
- *Improved exception handling to correctly throw ServiceErrors where applicable.  This addresses an issue that caused `head_object` and `head_bucket` to throw a `NetworkError` when a `ServiceError` should have been thrown in the Object Storage service*

## 2.0.9 - 2018-03-08

### Added
- Support for the Email Service. An example on how to call this service can be found in the `examples/` folder of the [ruby-sdk.zip](https://docs.us-phoenix-1.oraclecloud.com/tools/ruby/latest/download/oci-ruby-sdk.zip) download
- Support for SMTP credentials in the Identity Service. See the Email Service sample in the `examples/` folder of the [ruby-sdk.zip](https://docs.us-phoenix-1.oraclecloud.com/tools/ruby/latest/download/oci-ruby-sdk.zip) download
- Support for paravirtualized volume attachments in Core Services.  An example on how to use this can be found in `examples/` folder of the [ruby-sdk.zip](https://docs.us-phoenix-1.oraclecloud.com/tools/ruby/latest/download/oci-ruby-sdk.zip) download
- Support for variable size boot volumes in Core Services

## 2.0.8 - 2018-02-22

### Added
- Support for the File Storage Service. An example on how to call this service can be found in the `examples/` folder of the [ruby-sdk.zip](https://docs.us-phoenix-1.oraclecloud.com/tools/ruby/latest/download/oci-ruby-sdk.zip) download
- Support for tagging Bucket resources in the Object Storage Service. An example can be found in the `examples/` folder of the [ruby-sdk.zip](https://docs.us-phoenix-1.oraclecloud.com/tools/ruby/latest/download/oci-ruby-sdk.zip) download
- Support for specifying a restore period for archived objects in the `RestoreObjects` operation of the Object Storage service.

## 2.0.7 - 2018-02-08

### Added

- Support for Domain Name System Service. An example of calling this service can be found in the `examples/` folder of the [ruby-sdk.zip](https://docs.us-phoenix-1.oraclecloud.com/tools/ruby/latest/download/oci-ruby-sdk.zip) download
- Support for reserved public IPs in Virtual Networking Service
- Support for path route sets in Load Balancing Service
- Support for automated and policy-based backups, read-only volume attachments, and incremental backups in Block Storage Service
- Support for filtering by backupId in ListDbSystems operation in Database Service

## 2.0.6 - 2018-01-25

### Added
- Support for using the `ObjectReadWithoutList` public access type when creating and updating buckets
- Support for dynamic groups in Identity Service
- Support for instance principals authentication when calling OCI services. An example of how to use instance principals authentication can be found in the `examples/` folder of the [ruby-sdk.zip](https://docs.us-phoenix-1.oraclecloud.com/tools/ruby/latest/download/oci-ruby-sdk.zip) download
- Support for configuring idle timeout for listeners in Load Balancer Service 
- Support for VNC console connections in Compute Service

### Fixed
- Fixed an issue where boolean fields could not be assigned in object initializers, only by attribute accessors post-initialization

## 2.0.5 - 2018-01-11

### Added
- Support for tagging:
  - Support for creating, updating, retrieving and listing tags and tag namespaces (these operations can be found in Identity Service)
  - Support for adding freeform and defined tags to resources in Core Services (Networking, Compute, and Block Volume) and Identity Service
  - An example of using tagging can be found in the `examples/` folder of the [ruby-sdk.zip](https://docs.us-phoenix-1.oraclecloud.com/tools/ruby/latest/download/oci-ruby-sdk.zip) download
- Support for bringing your own custom image for emulation mode virtual machines in Compute Service

## 2.0.4 - 2017-12-11

### Added
- Support for retrieving custom operation metadata, such as the OCID of a resource, from response_payload attribute on the AuditEvent model of the Audit Service 
- Support for public peering for FastConnect in Core Services
- Support for specifying an authorized entity name in a Letter of Authority in Core Services
- Support for showing a list of bandwidth shapes for FastConnect provider in Core Services

### Deprecated
- The `list_virtual_circuit_bandwidth_shapes` operation in `VirtualNetworkClient` has been deprecated. Use the `list_fast_connect_provider_virtual_circuit_bandwidth_shapes` operation instead
- When using `CreateVirtualCircuitDetails`, supplying a `provider_name` is deprecated and `provider_service_id` should be used instead

## 2.0.3 - 2017-11-27

### Added
- Support for VCN to VCN peering within region in core services
- Support option for second NIC on X7 bare metal instances in core services
- Support for user-managed boot volumes in core services
- Support for create database from backup in database service
- Support for sort and filter in list_load_balancers method in load balancing service

## 2.0.2 - 2017-11-02

### Added
- Support for update audit retention policy and list events in audit service
- Support for archive storage tier, object rename and namespace metadata in object storage service
- Support for fast clones of volumes in block storage service
- Support for backup and restore in database service
- Support for sort and filter in list APIs in core services

## 2.0.1 - 2017-10-12

### Breaking Changes
- *Italic text* indicates breaking changes that may impact users, but most likely will not
- **Bold text** indicates breaking changes that require changes in your code, if you are using the capabilities mentioned in the breaking change description

### Added
- Support for database service
- Support for http PATCH request
- Support for passing the block volume size parameter in GB
- Support for VNIC routes and source/destination check
- Support for updating console history metadata and specifying a display name when capturing console history
- First class support for new region FRA (eu-frankfurt-1)

### Changed
- **OCI::Errors::NetworkError#code returns http status code (e.g 504) or 0 if the issue is caused by an exception.**
- **OCI::Errors::NetworkError#message method returns http status message (e.g ‘Not Found’) or exception's message .**

### Deprecated
- Passing the block volume size in MB is deprecated.

## 2.0.0 - 2017-09-11

### Breaking Changes
- *Italic text* indicates breaking changes that may impact users, but most likely will not
- **Bold text** indicates breaking changes that require changes in your code, if you are using the capabilities mentioned in the breaking change description

### Added
- Support for Object Storage service
- Support for instance console connections
- Support for Load Balancer health status API
- Support for compartment renaming
- Support for IAM CustomerSecretKeys

### Changed
- Renamed the namespace OracleBMC to OCI (Oracle Cloud Infrastructure). The namespace OracleBMC still works, but is deprecated and won't show up in any documentation.
- Changed the default location of configuration file to "~/.oci/config" (on windows "C:\Users\\{user}\\.oci\config"). The old location is deprecated, but still works, if file at new location does not exist.
- *Switched http stack from Typhoeus to Ruby built-in Net::HTTP. Net::HTTP has a known issue for setting no_proxy with Ruby 2.4, details at https://github.com/ruby/ruby/pull/1513. The workaround is to use hostname instead of IP address.*
- **OCI::ApiClient#request_option_overrides was designed to override the options to Typhoeus, now it is used to override the options to Net::HTTP. See http://ruby-doc.org/stdlib-2.4.1/libdoc/net/http/rdoc/Net/HTTP.html#method-c-start for some of the available options.**
- **OCI::Response#headers changed to OCI::ResponseHeaders which is a readonly and case-insensitive wrapper on hash object.**
- **OCI::Errors::NetworkError#code was mapping to Typhoeus's error message/code but now maps to Net::HTTPResponse's message or exception's message.**
- Support for passing the content of a private key file directly to OCI::Config, using the key_content param. Previously only a path to the private key could be used.
- Ruby SDK now works on Windows operating system as well.
- *Zero for OCI::Config#timeout means 365 days.*

### Fixed

- **Changed the naming convention of OCI::Errors::ServiceError properties to snake_case.**
- **Fixed typo issue in Core::Models::Volume#size_in_mbs (was size_in_m_bs).**
- Fixed the issue where list API filters do not work when a value with spaces is provided.
- Fixed confusing error message when configuration file is not valid. If any required configuration key is missed, OCI::InvalidConfigError will be thrown.
- Fixed method link issue in generated document.

### Deprecated
The oraclebmc gem is deprecated and will no longer be maintained starting March 2018. Please move to the oci gem instead to avoid interruption.

## 1.2.4 - 2017-07-20
### Added
- Support for VCN multi-VNIC operations.
- Support for VCN secondary IPs operations.
- Support for compute image import/export operations.

### Fixed
- Print opc-request-id as part of ServiceError#to_s method's output.

## 1.2.3 - 2017-06-09
### Added
- Support for load balancer session persistence operations.
- Support for VCN local load balancer operations.
- Support for nested instance metadata operations.

## 1.2.2 - 2017-05-18
### Added
- Support for VCN private subnets operations.
- Support for region subscription operations.
- Support for FastConnect operations.
- Support for identity federation operations.
- First class support for new region IAD.

## 1.2.1 - 2017-04-27
### Changed
- A new value has been added to all enums that are used by objects that may be returned from services, called UNKNOWN_ENUM_VALUE.
If a service returns an unrecognized value, then the enum will be set to this value. Previously this would throw an exception.

### Added
- Support for retry tokens in load balancer operations.

## 1.2.0 - 2017-04-06
### Added
- Support for hostnames for instances and DNS labels for VCNs and subnets.
- Support for DHCP Search Domain Option
- Support for ComputeClient.get_windows_instance_initial_credentials

### Fixed
- Responses with DhcpOption types will be deserialzed to the property subtype.

## 1.1.2 - 2017-03-16
### Fixed
- Additional subtypes for existing models will no longer cause a breaking change. Instead, the base types will be returned
until support is added for the new type.

## 1.1.1 - 2017-02-23
### Added
- Support for iPXE script parameter to launch_instance operation.
- Support for stateless security list rules.

### Fixed
- Fixed handling of unencrypted private keys with certain openssl gem versions.

## 1.1.0 - 2017-02-03
### Added
- Added support for Load Balancing Service.
- Added example code for Load Balancing Service.

## 1.0.2 - 2017-01-17
### Changed
- Tests are no longer included in the gem file.

## 1.0.1 - 2016-11-18
### Fixed
- Accept header set to json only, since some 500 responses were sent in other formats and caused deserialization failures.

### Added
- Signing now includes the signing version number with each request.
- Example code is now packaged in the zip file.

## 1.0.0 - 2016-10-20
### Added
- Initial Release
- Support added for Core Services and Identity Service
