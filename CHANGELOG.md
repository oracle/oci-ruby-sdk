# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/).

## 2.6.0 - 2019-08-27 
### Added
- Support for the Sao Paulo (GRU) region
- Support for dedicated virtual machine hosts in the Compute service
- Support for resource groups in metrics and alarms in the Monitoring service
- Support for the Data Transfer service
- Support for the Zurich (ZRH) region

### Breaking changes
- `OCI::Waas::Models::Certificate.issuer_name` type changed from `OCI::Waas::Models::CertificateSubjectName` to `OCI::Waas::Models::CertificateIssuerName`
- `OCI::Waas::Models::WafLog.timestamp` type changed from `String` to `DateTime`
- `WORK_REQUEST_OPERATION_TYPES_PURGE_WAAS_POLICY` removed from `OCI::Waas::Models.WORK_REQUEST_OPERATION_TYPES_ENUM`
- `OPERATION_TYPE_PURGE_WAAS_POLICY` removed from`OCI::Waas::Models::WorkRequestSummary.OPERATION_TYPE_ENUM`

## 2.5.11 - 2019-08-06
### Added
- Support for the Functions service
- Support for the Quotas service
- Support for moving resources across compartments in the DNS service
- Support for moving instances across compartments in the Compute service
- Support for moving keys and vaults across compartments in the Key Management service
- Support for moving topics and subscriptions across compartments in the Notifications service
- Support for moving load balancers across compartments in the Load Balancing service
- Support for specifying permitted REST methods in load balancer rule sets in the Load Balancing service
- Support for configuring cookie session persistence in backend sets in the Load Balancing service
- Support for ACL rules in rule sets in the Load Balancing service
- Support for move compartment tree in the Identity service
- Support for specifying and returning a KMS key in backup operations in the Block Storage service
- Support for transit routing in the Networking service
- Support for moving resources across compartments in the Database service
- Support for moving resources across compartments in the Health Checks service
- Support for moving alarms across compartments in the Monitoring service
- Support for creating instance configurations from running instances in the Compute service
- Support for setting up budget alerts for cost tracking tags in the Budgets service
- Support for the Mumbai (BOM) region
- Support for the Events service
- Support for moving streams across compartments in the Streaming service
- Support for moving FastConnect resources across compartments in the Networking service
- Support for moving policies across compartments in the Web Application Acceleration and Security service
- Support for tagging FastConnect resources in the Networking service
- Support for IPv6 load balancers in the Load Balancing service
- Support for IPv6 on VCN and FastConnect resources in the Networking service

## 2.5.10 - 2019-07-09
### Added
- Support for specifying custom boot volume sizes on instance configurations in the Compute Autoscaling service
- Support for 'Autonomous Transaction Processing - Dedicated' features, as well as maintenance run and backup operations on autonomous databases, autonomous container databases, and autonomous Exadata infrastructure in the Database service
- Support for moving service gateway resources across compartments in Core Services
- Support for moving block storage resources across compartments in Core Services
- Support for key deletion in the Key Management service
- Support for moving senders across compartments in the Email service
- Support for moving NAT gateway resources across compartments in Core Services
- Support for moving images, instance configurations, and instance pools across compartments in Core Services
- Support for moving autoscaling configurations across compartments in the Compute Autoscaling service
- Support for network security groups in the Load Balancing service
- Support for network security groups in Core Services
- Support for network security groups on database systems in the Database service
- Support for creating autonomous transaction processing and autonomous data warehouse previews in the Database service
- Support for getting the load balancer attachments of instance pools in the Compute service
- Support for moving resources across compartments in the Resource Manager service
- Support for moving VCN resources across compartments in the Networking service

### Fixed
- Fixed a bug where the Streaming service's endpoints in Tokyo, Seoul, and future regions were not reachable from the SDK
 
## 2.5.9 - 2019-06-04
### Added
- Support for the Seoul (ICN) region
- Support for logging context fields on data-plane APIs of the Key Management Service
- Support for reverse pagination on list operations of the Email service
- Support for configuring backup retention windows on database backups in the Database service
- Support for returning tags when listing instance configurations, instance pools, or autoscaling configurations in the Compute Autoscaling service
- Support for getting the namespace of another tenancy than the caller's tenancy in the Object Storage service
- Support for BGP dynamic routing and providing pre-shared secrets (PSKs) when establishing tunnels in the Networking service
- Support for the Work Requests service, and tracking of a number of Core Services operations through work requests
- Support for emulated volume attachments in Core Services
- Support for changing the compartment of resources in the File Storage service
- Support for tags in list operations in the File Storage service
- Support for returning UI password creation dates in the Identity service
- Support for autoscaling autonomous databases and autonomous data warehouses in the Database service
- Support for specifying fault domains as part of instance configurations in the Compute Autoscaling service
- Support for deleting tag definitions and tag namespaces in the Identity service

### Fixed
- Support for regions in realms other than oraclecloud.com in the Load Balancing service

## 2.5.8 - 2019-05-07
### Added
- Support for the Tokyo (NRT) region.

## 2.5.7 - 2019-04-16
### Added
- Support for tagging dynamic groups in the Identity service
- Support for updating network ACLs and license types for autonomous databases and autonomous data warehouses in the Database service
- Support for editing static routes and IPSec remote IDs in the Virtual Networking service

## 2.5.6 - 2019-04-09
### Added
- Support for etag and if-match headers (for optimistic concurrency control) in the Email service

## 2.5.5 - 2019-04-02
### Added
- Support for provider service key names on virtual circuits in the FastConnect service
- Support for customer reference names on cross connects and cross connect groups in the FastConnect service

## 2.5.4 - 2019-03-26
### Added
- Support for glob patterns and exclusions for object lifecycle management in the Object Storage service
- Documentation enhancements and corrections for traffic management in the DNS service

## 2.5.3 - 2019-03-19
### Added
- Support for specifying metadata on node pools in the Container Engine for Kubernetes service
- Support for provisioning a new autonomous database or autonomous data warehouse as a clone of another in the Database service

## 2.5.2 - 2019-03-12
### Added
- Support for the Budgets service
- Support for managing multifactor authentication in the Identity service
- Support for managing default tags in the Identity service
- Support for account recovery in the Identity service
- Support for authentication policies in the Identity service
- Support for specifying the workload type when creating autonomous databases in the Database service
- Support for I/O resource management for Exadata database systems in the Database service
- Support for customer-specified timezones on database systems in the Database service

## 2.5.1 - 2019-02-28
### Added
- Support for the Monitoring service
- Support for the Notification service
- Support for the Resource Manager service
- Support for the Compute Autoscaling service
- Support for changing the compartment of a tag namespace in the Identity service
- Support for specifying fault domains in the Database service
- Support for managing instance monitoring in the Compute service
- Support for attaching/detaching load balancers to instance pools in the Compute service

### Fixed
- [GitHub Issue #29](https://github.com/oracle/oci-ruby-sdk/issues/29): Ability to omit specifying a `federation_endpoint` when using instance principals
- The `FederationClient` now properly sets the `:'content-type'` header so that it can be properly signed in the request to retrieve an auth token

## 2.5.0 - 2019-02-21
### Added
- Support for government-realm regions
- Support for the Streaming service
- Support for tags in the Key Management service
- Support for regional subnets in the Virtual Networking service
- Support for specifying an optional `endpoint` parameter when creating a new client

### Fixed
- Removed unused Announcements service `OCI::AnnouncementsService::Models::NotificationFollowupDetails` model and `followups` from `OCI::AnnouncementsService::Models::Announcement`


## 2.4.7 - 2019-02-07
### Added
- Support for the Web Application Acceleration and Security (WAAS) service
- Support for the Health Checks service
- Support for connection strings on Database resources in the Database service
- Support for traffic management in the DNS service
- Support for tagging in the Email service

## 2.4.6 - 2019-01-31
### Added
- Support for the Announcements service

## 2.4.5 - 2019-01-24
### Added
- Support for renaming databases during restore-from-backup operations in the Database service
- Support for calling Oracle Cloud Infrastructure services in the ca-toronto-1 region

## 2.4.4 - 2019-01-10
### Added
- Support for device attributes on volume attachments in the Compute service
- Support for custom header rulesets in the Load Balancing service

## 2.4.3 - 2018-12-13
### Added
- Support for Data Guard for VM shapes in the Database service
- Support for sparse disk groups for Exadata shapes in the Database service
- Support for a new field, `is_latest_for_major_version`, when listing DB versions in the Database service
- Support for in-transit encryption for paravirtualized boot volume and data volume attachments in the Block Storage service
- Support for tagging DNS Zones in the DNS service
- Support for resetting credentials for SCIM clients associated with an Identity provider and updating user capabilities in the Identity service

### Fixed
- KmsVaultClient now properly sets the endpoint when provided a region during instantiation as specified in [OCI::Regions::REGION_ENUM](https://github.com/oracle/oci-ruby-sdk/blob/master/lib/oci/regions.rb#L6)

## 2.4.2 - 2018-11-29
### Added
- Support for getting bucket statistics in the Object Storage service

### Fixed
- Block Storage service for copying volume backups across regions is now enabled

## 2.4.1 - 2018-11-15
### Added
- Support for VCN transit routing in the Networking service

## 2.4.0 - 2018-11-01
### Added
- Support for modifying the route table, DHCP options, and security lists associated with a subnet in the Networking service
- Support for tagging of File Systems, Mount Targets, and Snapshots in the File Storage service
- Support for nested compartments in the Identity service

### Breaking Changes
- `database_size_in_g_bs` field in Backup and BackupSummary models renamed to `database_size_in_gbs`

## 2.3.9 - 2018-10-18
### Added
- Support for cost tracking tags in the Identity service
- Support for generating and downloading wallets in the Database service
- Support for creating a standalone backup from an on-premises database in the Database service
- Support for db version and additional connection strings in the Autonomous Transaction Processing and Autonomous Data Warehouse resources of the Database service
- Support for copying volume backups across regions in the Block Storage service
- Support for deleting compartments in the Identity service
- Support for reboot migration for virtual machines in the Compute service
- Support for Instance Pools and Instance Configurations in the Compute service

### Breaking Changes
- The `db_data_size_in_mbs` field in the `OCI::Database::Models::Backup` and `OCI::Database::Models::BackupSummary` classes was renamed to `database_size_in_g_bs`, and its type was changed from `Integer` to `Float`
    - Before
    ```ruby
    # @return [Integer]
    attr_accessor :db_data_size_in_mbs
    ```
    - After
    ```ruby
    # @return [Float]
    attr_accessor :database_size_in_g_bs
    ```
- The data type of `database_edition` in the `OCI::Database::Models::Backup` and `OCI::Database::Models::BackupSummary` classes was changed from `attr_accessor` to `attr_reader`
    - Before
    ```ruby
    attr_accessor :database_edition
    ```
    - After
    ```ruby
    attr_reader :database_edition
    ```

## 2.3.8 - 2018-10-04
### Added
- Support for trusted partner images through application listings and subscriptions in the Compute service
- Support for object lifecycle policies in the Object Storage service
- Support for copying objects across regions in the Object Storage service
- Support for network address translation (NAT) gateways in the Networking service

## 2.3.7 - 2018-09-27
### Added
- Support for `paravirtualized` launch mode when importing images in the Compute service
- Support for Key Management service
- Support for encrypting the contents of an Object Storage bucket using a Key Management service key
- Support for specifying a Key Management service key when launching a compute instance in the Compute service
- Support for specifying a Key Management service key when backing up or restoring a block storage volume in the Block Volume service

### Fixed
- Fixed [GitHub Issue #10](https://github.com/oracle/oci-ruby-sdk/issues/10)
where specifying an optional `content_type` for `ObjectStorageClient#put_object` was not included in the request header.
- Fixed [GitHub Issue #11](https://github.com/oracle/oci-ruby-sdk/issues/11) by adding the ability to specify an optional `accept_encoding` parameter for `ObjectStorageClient#get_object`
- Fixed [GitHub Issue #13](https://github.com/oracle/oci-ruby-sdk/issues/13) by adding a note about thread safety for clients

## 2.3.6 - 2018-09-06
### Added
- Support for updating metadata fields on an instance in the Compute service

## 2.3.5 - 2018-08-23
### Added
- Support for fault domains in the Identity service
- Support for resizing an offline volume in the Block Storage service
- Support for Autonomous Data Warehouse and Autonomous Transaction Processing in the Database service

## 2.3.4 - 2018-08-09
### Added
- Support for fault domains in the Compute service

## 2.3.3 - 2018-07-26
### Added
- Support for Search.  An example on how to call this: [resource\_search\_example.rb](https://github.com/oracle/oci-ruby-sdk/tree/master/examples-oci/resource_search_example.rb)
- Support for specifying a backup policy when creating a boot volume in the Block Storage service

## 2.3.2 - 2018-07-12
### Added
- Support for tagging Load Balancers in the Load Balancing service
- Support for export options in the File Storage service
- Support for retrieving compartment name and user name as part of events in the Audit service


## 2.3.1 - 2018-06-28
### Added
- Support for service gateway management in the Networking service
- Support for backup and clone of boot volumes in the Block Storage service


## 2.3.0 - 2018-06-14
### Breaking Changes
- *Italic text* indicates breaking changes that may impact users, but most likely will not

### Added
- Support for the Container Engine service. An example of showing how to create a cluster: [container\_engine\_cluster\_example.rb](https://github.com/oracle/oci-ruby-sdk/blob/master/examples-oci/container_engine_cluster_example.rb)

### Changed
- *`OCI::LoadBalancer::Util.wait_on_work_request` now returns a `OCI::Response` that contains a `OCI::LoadBalancer::Models::WorkRequest` when using this utility to wait for a work request to complete*


## 2.2.1 - 2018-05-31
### Added
- Support for the "soft shutdown" instance action in the Compute service
- Support for Auth Token management in the Identity service


## 2.2.0 - 2018-05-17
### Breaking Changes
- *Italic text* indicates breaking changes that may impact users, but most likely will not


### Added
- Support for launching a database system from a backup in the Database service
- Support for backup or clone of multiple volumes at once using volume groups in the Block Storage service
- Support for the ability to optionally specify a compartment filter when listing exports in the File Storage service
- Support for tagging virtual cloud network resources in the Networking service. An example of using tagging: [tagging.rb](https://github.com/oracle/oci-ruby-sdk/blob/master/examples-oci/tagging.rb)
- Support for specifying `PARAVIRTUALIZED` remote volume type when creating a virtual image or launching a new instance in the Compute service

### Changed
- *`compartment_id` has changed from a positional to a keyword argument when calling the `ListExports` operation for the File Storage service*


## 2.1.2 - 2018-05-03
### Added
- Support for returning names for events in the Audit service
- Support for multiple hostnames per listener in the Load Balancing service
- Support for specifying a retry strategy when calling Oracle Cloud Infrastructure services. An example of specifying a client retry strategy: [retry\_example.rb](https://github.com/oracle/oci-ruby-sdk/blob/master/examples-oci/retry_example.rb)

## 2.1.1 - 2018-04-19

### Added
- Support for tagging `DbSystem` and `Database` resources in the Database Service. An example of using tagging: [tagging.rb](https://github.com/oracle/oci-ruby-sdk/blob/master/examples-oci/tagging.rb)
- Support for filtering by `DbSystemId` in `ListDbVersions` operation in Database Service
- Support for composite operations that provide convenience methods for operations that are often chained together.  An example on how to use this: [composite\_operations\_example.rb](https://github.com/oracle/oci-ruby-sdk/blob/master/examples-oci/composite_operations_example.rb)
- Support for logging enum values when mapped to unknown value.  To enable this logging, define a logger for `OCI.logger`

## 2.1.0 - 2018-03-27

### Breaking Changes
- *Italic text* indicates breaking changes that may impact users, but most likely will not

### Added
- Support for remote VCN peering across regions. An example on how to use this: [remote\_peering\_connection\_example.rb](https://github.com/oracle/oci-ruby-sdk/blob/master/examples-oci/remote_peering_connection_example.rb)
- Support for calling Oracle Cloud Infrastructure services in the uk-london-1 (LHR) region
- Support for username and password protected proxies

### Changed
- *Improved exception handling to correctly throw ServiceErrors where applicable.  This addresses an issue that caused `head_object` and `head_bucket` to throw a `NetworkError` when a `ServiceError` should have been thrown in the Object Storage service*

## 2.0.9 - 2018-03-08

### Added
- Support for the Email Service. An example on how to call this: [email\_service\_example.rb](https://github.com/oracle/oci-ruby-sdk/blob/master/examples-oci/email_service_example.rb)
- Support for SMTP credentials in the Identity Service. See the Email Service sample: [email\_service\_example.rb](https://github.com/oracle/oci-ruby-sdk/blob/master/examples-oci/email_service_example.rb)
- Support for paravirtualized volume attachments in Core Services.  An example on how to use this: [volume\_attachment\_example.rb](https://github.com/oracle/oci-ruby-sdk/blob/master/examples-oci/volume_attachment_example.rb)
- Support for variable size boot volumes in Core Services

## 2.0.8 - 2018-02-22

### Added
- Support for the File Storage Service. An example on how to call this: [file\_storage\_service\_example.rb](https://github.com/oracle/oci-ruby-sdk/blob/master/examples-oci/file_storage_service_example.rb)
- Support for tagging Bucket resources in the Object Storage Service. An example of using tagging: [tagging.rb](https://github.com/oracle/oci-ruby-sdk/blob/master/examples-oci/tagging.rb)
- Support for specifying a restore period for archived objects in the `RestoreObjects` operation of the Object Storage service.

## 2.0.7 - 2018-02-08

### Added

- Support for Domain Name System Service. An example of calling this service: [dns\_service\_example.rb](https://github.com/oracle/oci-ruby-sdk/blob/master/examples-oci/dns_service_example.rb)
- Support for reserved public IPs in Virtual Networking Service
- Support for path route sets in Load Balancing Service
- Support for automated and policy-based backups, read-only volume attachments, and incremental backups in Block Storage Service
- Support for filtering by backupId in ListDbSystems operation in Database Service

## 2.0.6 - 2018-01-25

### Added
- Support for using the `ObjectReadWithoutList` public access type when creating and updating buckets
- Support for dynamic groups in Identity Service
- Support for instance principals authentication when calling Oracle Cloud Infrastructure services. An example of how to use instance principals authentication: [instance\_principals\_example.rb](https://github.com/oracle/oci-ruby-sdk/blob/master/examples-oci/instance_principals_example.rb)
- Support for configuring idle timeout for listeners in Load Balancer Service
- Support for VNC console connections in Compute Service

### Fixed
- Fixed an issue where boolean fields could not be assigned in object initializers, only by attribute accessors post-initialization

## 2.0.5 - 2018-01-11

### Added
- Support for tagging:
  - Support for creating, updating, retrieving and listing tags and tag namespaces (these operations can be found in Identity Service)
  - Support for adding freeform and defined tags to resources in Core Services (Networking, Compute, and Block Volume) and Identity Service
  - An example of using tagging: [tagging.rb](https://github.com/oracle/oci-ruby-sdk/blob/master/examples-oci/tagging.rb)
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
- Changed the default location of configuration file to "~/.oci/config" (on windows "C:\\Users\\{user}\\.oci\config"). The old location is deprecated, but still works, if file at new location does not exist.
- *Switched http stack from Typhoeus to Ruby built-in Net::HTTP. Net::HTTP has a known issue for setting no_proxy with Ruby 2.4, details at [https://github.com/ruby/ruby/pull/1513](https://github.com/ruby/ruby/pull/1513). The workaround is to use hostname instead of IP address.*
- **OCI::ApiClient#request\_option\_overrides was designed to override the options to Typhoeus, now it is used to override the options to Net::HTTP. See [http://ruby-doc.org/stdlib-2.4.1/libdoc/net/http/rdoc/Net/HTTP.html#method-c-start](http://ruby-doc.org/stdlib-2.4.1/libdoc/net/http/rdoc/Net/HTTP.html#method-c-start) for some of the available options.**
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
