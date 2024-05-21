# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/).

## 2.21.1 - 2024-05-21
### Added
- Fixed pysch dependency version

## 2.21.0 - 2024-05-06
### Added
- Support for changing compartments of configurations in the PostgreSQL service
- Support for granular policies including compartments, resource types, and recommendations in the Optimizer service
- Support for token exchanges in the Identity Domains service
- Support for Apache HTTP server discovery and monitoring in the Stack Monitoring service
- Support for resource locking in the Data Catalog service
- Support for concurrency throttling in the Data Integration service
- Support for reboot migrations for VMs on dedicated hosts in the Compute service
- Support for connection routing method settings and subnet update in the GoldenGate service
- Support for data discovery of commonly used sensitive types in the Data Safe service
- Support for incremental extraction and updates to the workflows in the Data Integration service
- Support for calling Oracle Cloud Infrastructure services in the sa-valparaiso-1 region
- Support for creation of up to 60 containers per container instance in the Container Instances service
- Support for Oracle GoldenGate discovery and monitoring in the Stack Monitoring service
- Support for GoldenGate stream analytics in the GoldenGate service
- Support for backup work requests in MySQL Heatwave service
- Support for create, update, delete and list operations on on-premise vantage points and workers in the Application Performance Monitoring service
- Support for host capacity planning for compute instances and host unallocated metrics in the Operations Insights service
- Support for resource id filter on the service work requests in the Container Instances service
- Support for polyglot vulnerability audit in the Application Dependency Management service
- Support for create, read, and update operations on peer databases in the Data Safe service
- Support for dimension specific alarm suppressions in the Monitoring service
- Support for calculating audit volume in the Data Safe service
- Support for viewing schema accesses in data safe user assessments in the Data Safe service
- Support for security feature usage in the Data Safe service
- Support for viewing the top security findings in data safe security assessments in the Data Safe service
- Support for additional filters in list findings operation in the Data Safe service
- Support for updating risk level of the specified finding in the Data Safe service
- Support for the Generative AI service
- Support for additional currencies and countries for paid listings in the Marketplace service
- Support for process sets in the Stack Monitoring service
- Support for OCI Control Center service
- Support for giro value set for address rules in the Oracle Store Platform service
- Support for giro in tax information for subscriptions in the Oracle Store Platform service
- Support for REST connectivity with Oath2 in the Data Integration service
- Support for resolver rules limit increase in the DNS service
- Support for named credentials in the Database Management service
- Support for the Globally Distributed Database service
- Support for secret auto-rotation in the Secret Management service
- Support for dedicated key management in the Key Management service
- Support for resource locking operations in the Digital Media service
- Support for data sources, including prometheus emitter, in the Management Agent service
- Support for Bring Your Own Certificates (BYOC) in the MySQL HeatWave Database service
- Support for adding automatic backups during cross region operations and disaster recovery in the Autonomous Database service
- Support for overlapping CIDR in network path analyzer in the Virtual Network Monitoring service
- Support for additional attributes in entity and topology in the Log Analytics service
- Support for historic collection and log type while creating object collection rules in the Log Analytics service
- Support for position aware parsers in the Log Analytics service
- Support for filtering log sources, detection rules and scheduled tasks based on target service in the Log Analytics service
- Support for additional recall and release attributes in the Log Analytics service
- Support for opc-meta-properties header while uploading log events in the Log Analytics service
- Support for calling Oracle Cloud Infrastructure services in the me-dcc-doha-1 region
- Support for Secure Desktops service
- Support for enabling and disabling Simultaneous Multithreading (SMT) for virtual machines in the Compute service
- Support for Bring Your Own Container Jobs (BYOC v2) in the Data Science service
- Support for expanded language translation in the AI Language service
- Support for additional flags for ignoring transliteration and text length to be considered for determining dominant language in the AI Language service
- Support for specifying dialog version when creating skills entities in the Digital Assistant service
- Support for bulk creation of skill entities in the Digital Assistant service
- Support for training skill query entities in the Digital Assistant service
- Support for cascading delete of skill custom entities in the Digital Assistant service
- Support for creating autonomous dataguard associations in the Database service
- Support for auto generation of secrets in the Secret Management service
- Support for cluster placement groups in Cloud Exadata Infrastructure in the Database service
- Support for retrieving previous logs of the container in the Container Instances service
- Support for queue sources in the Connector Hub service
- Support for automatic key rotation in the Key Management Service
- Support for downloading operator activity reports and assignment healthchecks in the Operator Access Control service
- Support for operator requesting access in the future time in the Operator Access Control service
- Support for forwarding hypervisor logs in the Operator Access Control service
- Support for asynchronous data asset export in the Data Catalog service
- Support for launch with multiple volumes for virtual machines in the Compute Service
- Support for tagging in Database Management service
- Support for Linux capabilities configuration for the containers in the Container Instances service
- Support for service platforms in the Oracle Store Platform Gateway service
- Support for whisper models and delete job operation in the Speech service
- Support for new SQL insight content types in news reports in the Operations Insights service
- Support for launching virtual machines with multiple volumes in the Compute service
- Support for new development license type on dedicated infrastructure in the Database service
- Support for placement parameters on Autonomous Container Database create operation in the Database service
- Support for autoscaling on model deployment in the Data Science service
- Support for standalone Oracle HTTP server discovery and monitoring in the Stack Monitoring service
- Support for attribute management for traces in the Application Performance Monitoring service
- Support for async jobs and document translations in the AI language service
- Support for creating and updating a refreshable clone with auto-refresh for an Autonomous Database in the Database service
- Support for symmetric hashing in the Network Load Balancer service
- Support for creating and deploying helm command specifications in the DevOps Service
- Support for uninstalling helm chart when deleting an Oracle Kubernetes Stage through the DevOps Service
- Support for collecting metrics and filter plugin with Unified Monitoring Agent (UMA) in the Logging service
- Support for reading logs from head position after agent restart in the Logging service
- Support for monitoring MySQL HeatWave clusters in Database Management Service
- Support for multiple severities in an alarm in the Monitoring service
- Support for assigned private IP and single stack IPV6 feature for Network Load Balancer Service
- Support for Configuration API in Email Delivery Service
- Support for the status field in creating data source resource for Cloud Guard Service
- Support for TLSv1.3 in Load Balancer Service
- Support for sending mails via HTTPS for Email Delivery Service
- Support for calling Oracle Cloud Infrastructure services in the ap-dcc-gazipur-1 region
- Support for the DNS-based backend health check in the Network Load Balancer service
- Support for Fail Open in the Network Load Balancer service
- Support for adding and updating Instant failover in the Network Load Balancer service
- Support for adding and updating source type and resource category for resource types in the Stack Monitoring service
- Support for searching resources based on resource category,  source type, multiple compartments, multiple lifecycle states in the Stack Monitoring service
- Support for filtering listed resources based on lifecycle status in the Stack Monitoring service
- Support for creating tasks with new config parameters in the Stack Monitoring service
- Support for Composite Resource Principal integration in the Data Flow service
- Support for calling Oracle Cloud Infrastructure services in the me-abudhabi-3 region
- Support for new Image resource for an Autonomous Database in the Database service
- Support for creating Autonomous Container Database using Autonomous Database Software Image in the Database service
- Support for new dedicated AI cluster unit shape in the Generative AI service
- Support for Chat API for LLM models in the Generative AI service
- Support for network security groups (NSGs) in the Redis service
- Support for custom public egress on model deployments in the Data Science service
- Support for a new data transfer parameter for AWS S3 bucket in the Database Migration service
- Support for Oracle Process Automation instance start and stop operations in the Process Automation service
- Support for healthcare Natural Language Processing (NLP) in the AI Language service
- Support for identification and de-identification of Private Health Information (PHI) service in the AI Language service
- Support for multilingual content for using machine learning models in the AI Language service
- Support for usage statements in cost management in the Usage service
- Support for the Cluster Placement Groups service
- Support for new optional parameter for managing approval template in the Managed Access service
- Support for cluster placement groups in the Compute service
- Support for replacing boot volume for virtual machines in the Compute service
- Support for assigning a cluster placement group to boot and block volumes in the Block Storage service
- Support for container workload integration in the Cloud Guard service
- Support for instances in OCI and 3rd party clouds in the OS Management service
- Support for enabling unified auditing for DBHome in the Database service
- Support for listing minor Grid Infrastructure (GI) versions available for custom GI software image creation in the Database service
- Support for network security groups in the Recovery Cloud service
- Support for lineage metadata import in the Data Catalog service
- Support for workspace properties in workspace create and update operations in the Data Integration service
- Support for monitoring ExaCC databases in the Database Management service
- Support for validations on target and policy before the masking process in the Data Safe service
- Support for resizing of local file systems in the Database service
- Support for adding user defined pause group in disaster recovery plan in the Disaster Recovery service
- Support for OS patching configs in the Big Data service
- Support for IP inventory and notification feature in the Networking service
- Support for accidental delete protection for load balancers, load balancer listeners, and load balancer backends in the Load Balancer service
- Support for backend max connections for load balancers in the Load Balancer service
- Support for listener max connections for load balancers in the Load Balancer service

### Breaking
- Models `MediaWorkflowJobFact`, `MediaWorkflowJobFactCollection` and `MediaWorkflowJobFactSummary` were removed from the Digital Media service
- Methods `get_media_workflow_job_fact` and `list_media_workflow_job_facts` were removed from the Digital Media service
- The model `PreTrainedPhiModelDetails` was removed in the AI Language service
- Property `max_cpu_core_count` was removed from models `UpdateAutonomousDatabaseDetails`, `CreateRefreshableAutonomousDatabaseCloneDetails`, `CreateCrossRegionDisasterRecoveryDetails`, `CreateCrossRegionAutonomousDatabaseDataGuardDetails`, `CreateAutonomousDatabaseFromBackupTimestampDetails`, `CreateAutonomousDatabaseFromBackupDetails`, `CreateAutonomousDatabaseDetails`, `CreateAutonomousDatabaseCloneDetails`, `CreateAutonomousDatabaseBase`, `AutonomousDatabase`, `AutonomousDatabaseSummary` in the Database service
- Property `key_id` in model `CreateSecretDetails` is made required in the Vault service
- Model `DatabaseConnectionCredentailsByName` was renamed to `DatabaseConnectionCredentialsByName` in the Database service
- The property `CapacityPlanningResources` has been made optional in the model `NewsContentTypes` in the Operations Insights service
- The properties `DisplayName` and `Description` were made required in the model `CreateUnifiedAgentConfigurationDetails` in the Logging service
- The property `RecordInput` was made required in the model `OperationalMetricsSource` in the Logging service
- The Application Migration service was decommissioned and removed
- The property `instance_location` was removed from the method `get_managed_instance_analytic_content` and `summarize_managed_instance_analytics` in the `ReportingManagedInstanceClient` in the OS Management service
- The property `display_name` was removed from the method `list_software_packages` in the `SoftwareSourceClient` in the OS Management service
- The property `AdvisoryType` was removed from the method `list_managed_instance_errata` in the `ManagedInstanceClient` in the OS Management service
- The type of property `Architecture` was changed from `string` to `SoftwarePackageArchitecture` in the models `SoftwarePackage` and `SoftwarePackageSummary` in the OS Management service



## 2.20.0 - 2023-12-04
### Added
- Support for creating flow log type capture filters in Virtual Cloud Network service
- Support for export and import of metadata in Data Integration service
- Support for displaying resource usage information on autonomous vm cluster get operations in Database service
- Support for displaying resource usage information for the list of autonomous container databases on autonomous vm cluster get operations in Database service
- Support for pluggable database with enhanced features in Database service
- Support for exporting container and kubernetes app listings in Marketplace service
- Support for work request statuses for export container and kubernetes app listings in Marketplace service
- Support for the Caching Service
- Support for the Marketplace Publisher service
- Support for higher limits for network firewalls in the Network Firewall service
- Support for exporting access request reports in the Lockbox service
- Support for storage mounts for jobs and notebooks in the Data Science service
- Support for unified agent operational metrics for the service configurations in the Logging Management service
- Support for optional parameters for autonomous container database create and update operations in the Database service
- Support for maintenance runs for autonomous container database resources in the Database service
- Support for runtime unsupported connections for Oracle Database and MySQL database types in the Database Tools service
- Support for PostgreSQL, Generic JDBC connections with runtime unsupported in the Database Tools service
- Support for resource locking in the Database Tools service
- Support for proxy sessions for Oracle database connections in the Database Tools service
- Support for global active tables in the NoSQL Database service
- Support for application dependency management (ADM) remediation features in the Application Dependency Management service
- Support for additional connections types for Amazon Kinesis, Amazon Redshift, Elasticsearch, Generic, Google BigQuery, Google Cloud Storage and Redis Database resources in the Golden Gate service
- Support for optional parameters for the list alarms status operation in the Monitoring Service
- Support for calling Oracle Cloud Infrastructure services in the us-saltlake-2 region
- Support for disaster recovery of load balancers, network load balancers and file systems in the Disaster Recovery service
- Support for performing disaster recovery drills in the Disaster Recovery service
- Support for enterprise SKUs and extensibility in the Stack Monitoring service
- Support for metric extensions in the Stack Monitoring service
- Support for baseline and anomaly detection in the Stack Monitoring service
- Support for integration with Database Management service in the MySQL HeatWave service
- Support for MySQL database management in the Database Management service
- Support for database firewalls in the Data Safe service
- Support for Java Management Service Downloads
- Support for creating autonomous dataguard associations in the Database service
- Support for SaaS administrative user configurations for autonomous database in the Database service
- Support for macOS in the the Java Management service
- Support for distribution and management of deployment rule sets in the Java Management service
- Support for new download location of Oracle Java runtime binaries in the Java Management service
- Support for exporting data across regions in the Java Management service
- Support for the PostgreSQL service
- Support for new operations in the Identity Domains service
- Support for enabling, disabling, and renewing SSL/TLS in the Big Data service
- Support for diarization in the AI Speech service
- Support for Capacity Topology API in the Compute service
- Support for calling Oracle Cloud Infrastructure services in the eu-dcc-zurich-1 and the sa-bogota-1 region
- Support for managing certificates of target Servers in the Golden Gate service
- Support for AWR Hub Snapshot ingest endpoints in the Operations Insights service
- Support for reducing false positives in the Application Dependency Management service
- Support for ARM shapes in the Data Science service
- Support for new optional parameters in the upload discovery data API in the Usage service
- Support for multiple clusters in a Software-Defined Data Centers (SDDCs) in the Ocvp service
- Support for No/Zero days backup in Autonomous Container Database in the Database service
- Support for provisioning a VM Cluster with a choice of Exadata image version in the Database service
- Support for updating ocpu/ecpu count, local storage , ACD count and Exadata storage on Cloud Autonomous VM Cluster and Autonomous VM Cluster in the Database service
- Support for serial console history in the Database service
- Support for Oracle Linux 8 version database system in the Database service

### Breaking
- Property `approver_levels` in models `ApprovalTemplateSummary` changed from required to optional in the Lockbox service
- Properties `lockbox_partner` and `partner_compartment_id` in models `LockboxSummary` changed from required to optional in the Lockbox service
- Allowed values `ENUM_STRING` and `RQS_FILTER` were removed from the property `type` in model `Parameter` in the Logging service
- Properties `rqs_type` and `display_name` were removed from model `Parameter` in the Logging service
- Parameter `service_stage` was removed from operation `list_services` from the logging management client in the Logging service
- Properties `mapped_secrets`, `application_lists`, `url_lists`, `ip_address_lists`, `security_rules`, `decryption_rules` and `decryption_profiles` were removed from models `CreateNetworkFirewallPolicyDetails`, `NetworkFirewallPolicy` and `UpdateNetworkFirewallPolicyDetails` in the Network Firewall Service
- Property `sources` is replaced by `source_address` and property `destinations` is replaced by `destination_address` in models `DecryptionRuleMatchCriteria` and `SecurityRuleMatchCriteria` in the Network Firewall Service
- Property `applications` is replaced by `application` and property `urls` is replaced by `url` in model `SecurityRuleMatchCriteria`in the Network Firewall Service
- Support for retries by default on operations of the Database Tools service
- Support for retries by default on operations of the Monitoring service
- The paremeter `opc_retry_token` was removed from operations `change_database_tools_connection_compartment` and `change_database_tools_private_endpoint_compartment` in the Database Tools service
- Properties `user_password`, `connection_string` and `user_name` were removed from models `CreateDatabaseToolsConnectionOracleDatabaseDetails` and `CreateDatabaseToolsConnectionMySqlDetails` in the Database Tools service
- The properties `compartment_id` and `user_assessment_id` were removed from the `ProfileAggregation` model in the Data Safe service
- Model `MyRequest` in the Identity Domains service now allows only certain restricted values. For more information please see https://docs.public.oneportal.content.oci.oraclecloud.com/en-us/iaas/tools/python/latest/api/identity_domains/models/oci.identity_domains.models.MyRequest.html#oci.identity_domains.models.MyRequest
- Constants `CURRENT_SKU_HOUR`, `CURRENT_SKU_MONTH`, `CURRENT_SKU_ONE_YEAR`, `CURRENT_SKU_THREE_YEARS`, `NEXT_SKU_HOUR`, `NEXT_SKU_MONTH`, `NEXT_SKU_ONE_YEAR`, `NEXT_SKU_THREE_YEARS` were renamed to `CURRENT_COMMITMENT_HOUR`, `CURRENT_COMMITMENT_MONTH`, `CURRENT_COMMITMENT_ONE_YEAR`, `CURRENT_COMMITMENT_THREE_YEARS`, `NEXT_COMMITMENT_HOUR`, `NEXT_COMMITMENT_MONTH`, `NEXT_COMMITMENT_ONE_YEAR`, `NEXT_COMMITMENT_THREE_YEARS` respectively in models `CreateEsxiHostDetails`, `EsxiHost` and `EsxiHostSummary` in the Ocvp service
- Parameters `sddc_id`, `current_sku`, `next_sku`, were renamed to `cluster_id`, `current_commitment`, `next_commitment` in models `CreateEsxiHostDetails`, `EsxiHost` and `EsxiHostSummary` in the Ocvp service
- Parameters `non_upgraded_esxi_host_id` and `failed_esxi_host_id` were removed from model `CreateEsxiHostDetails` in the Ocvp service
- Constants `INITIAL_SKU_HOUR`, `INITIAL_SKU_MONTH`, `INITIAL_SKU_ONE_YEAR`, `INITIAL_SKU_THREE_YEARS` were removed from model `CreateSddcDetails` in the Ocvp service
- Parameters `compute_availability_domain`, `instance_display_name_prefix`, `esxi_hosts_count`, `initial_sku`, `is_hcx_enabled`, `hcx_vlan_id`, `is_hcx_enterprise_enabled`, `workload_network_cidr`, `provisioning_subnet_id`, `vsphere_vlan_id`, `vmotion_vlan_id`, `vsan_vlan_id`, `nsx_v_tep_vlan_id`, `nsx_edge_v_tep_vlan_id`, `nsx_edge_uplink1_vlan_id`, `nsx_edge_uplink2_vlan_id`, `replication_vlan_id`, `provisioning_vlan_id`, `initial_host_shape_name`, `initial_host_ocpu_count`, `is_shielded_instance_enabled`, `capacity_reservation_id`, `datastores` were removed from model `CreateEsxiHostDetails` in the Ocvp service
- Models `SupportedSkuSummary` and `SupportedSkuSummaryCollection` were removed from the Ocvp service



## 2.19.0 - 2023-10-03
### Added
- Support for calling Oracle Cloud Infrastructure services in the mx-queretaro-1 region
- Support for the Process Automation service
- Support for the Managed Access service
- Support for extending maintenance reboot due dates on virtual machines in the Compute service
- Support for ingress routing tables on NAT gateways and internet gateways in the Networking service
- Support for container database and pluggable database discovery in the Stack Monitoring service
- Support for displaying rack serial numbers for Exadata infrastructure resources in the Database service
- Support for grace periods for wallet rotation on autonomous databases in the Database service
- Support for hosting models on flexible compute shapes with customizable OCPUs and memory in the Data Science service
- Support for the Fusion Apps as a Service service
- Support for the Digital Media service
- Support for accessing all Terraform providers from Hashicorp Registry, as well as bringing your own providers, in the Resource Manager service
- Support for runtime configurations in notebook sessions in the Data Science service
- Support for compartmentIdInSubtree and accessLevel filters when listing management agents in the Management Agent Cloud service
- Support for filtering by type when listing work requests in the Management Agent Cloud service
- Support for filtering by agent id when listing management agent plugins in the Management Agent Cloud service
- Support for specifying size preference when requesting a data transfer appliance in the Data Transfer service
- Support for encryption of boot and block volumes associated with a cluster using customer-specified KMS keys in the Big Data service
- Support for the VM.Standard.E4.Flex shape for Cloud SQL (CSQL) nodes in the Big Data service
- Support for listing block and boot volumes, as well as block and boot volume replicas, within a volume group in the Block Volume service
- Support for dedicated autonomous databases in the Operator Access Control service
- Support for viewing automatic workload repository (AWR) data for databases added to AWRHub in the Operations Insights service
- Support for ports, protocols, roles, and SSL secrets when enabling or modifying database management in the Database service
- Support for monthly security maintenance runs in the Database service
- Support for monthly infrastructure patching for Exadata Cloud at Customer resources in the Database service
- Support for OpenSearch in the Search service
- Support for child tables in the NoSQL Database Cloud service
- Support for private repositories in the DevOps service
- Support for single-host software-defined data centers in the VMWare Solution service
- Support for Java download and installation in the Java Management service
- Support for lifecycle management for Windows in the Java Management service
- Support for installation scripts in the Java Management service
- Support for unlimited-installation keys in the Java Management service
- Support for configuring automatic usage tracking in the Java Management service
- Support for STANDARDX and ENTERPRISEX instance types in Integration service
- Support for additional languages and multimedia formats in transcription jobs in the AI Speech service
- Support for maintenance run history for Exadata Cloud at Customer in the Database service
- Support for Optimizer statistics monitoring and management on various database administration operations in the Database Management service
- Support for OCI Compute instances in the Operations Insights service
- Support for moving resources in the Console Dashboard service
- Support for round-robin alerting in the Application Performance Monitoring service
- Support for aggregated network data of synthetic monitors in the Application Performance Monitoring service
- Support for etags on operations in the Load Balancing service
- Support for Logging Analytics as a streaming source target in the Service Connector Hub service
- Support for data sources for logging query registration in the Cloud Guard service
- Support for custom detector rules on insight detector recipes in the Cloud Guard service
- Support for fetching data source events and problem entities in the Cloud Guard service
- Support for E3, E4, Standard3, and Optimized3 flexible compute shapes on notebooks, model deployment, and jobs in the Data Science service
- Support for streaming application logs to the Logging service in the Data Flow service
- Support for the Enterprise Manager Warehouse service
- Support for additional configuration variables in the MySQL Database service
- Support for file filters in the DevOps service
- Support for support rewards redemption summaries in the Usage service
- Support for the parent tenancy of an organization to view child tenancy categories, recommendations, and resource actions in the Optimizer service
- Support for choosing prior versions during infrastructure maintenance on Exadata Cloud at Customer in the Database service
- Support for opting out of guest VM event collection, health metrics, diagnostics logs, and traces in the Database service
- Support for in-place upgrades for software-defined data centers in the VMWare Solution service
- Support for single-client access name protocol as a data source for private access channels in the Analytics Cloud service
- Support for network security groups, egress control on public datasources, and GitHub access in the Analytics Cloud service
- Support for performance-based autotuning of block and boot volumes in the Block Storage service
- Support for generic REST, OCI Streaming service, and Lake House connectors in the Data Connectivity Management service
- Support for connecting to the Data Catalog service in the Data Connectivity Management service
- Support for Kerberos and SSL for HDFS operations in the Data Connectivity Management service
- Support for excel-formatted data and default columns in the Data Connectivity Management service
- Support for reporting connector usage in the Data Connectivity Management service
- Support for preferred credentials for performing privileged operations in the Database Management service
- Support for passing a content encoding when posting metrics in the Monitoring service
- Support for Session Token authentication
- Support for calling Oracle Cloud Infrastructure services in the eu-madrid-1 region
- Support for exporting and importing larger model artifacts in the model catalog in the Data Science service
- Support for Request Based Authorization in the API Gateway service
- Support for Dynamic Authentication in the API Gateway service
- Support for Dynamic Routing Backend in the API Gateway service
- Support for the Cloud Bridge service
- Support for the Cloud Migrations service
- Support for display banners, trails, and sizes in the GoldenGate service
- Support for generic REST data assets, flattening of data in Data Flow, and runtime information on pipelines in the Data Integration service
- Support for expanded search functionality in the Threat Intelligence service
- Support for ingest-time rules and specifying logsets and query strings during recalls in the Logging Analytics service
- Support for repository mirroring from Visual Builder Studio in the DevOps service
- Support for running a managed build stage with the source code hosted in a Visual Builder Studio repository in the DevOps service
- Support for triggering a build run based on an event in a Visual Builder Studio repository in the DevOps service
- Support for additional parameters during cost management scheduling in the Usage service
- Support for search capabilities for monitored resources in the Stack Monitoring service
- Support for deleting monitored resources with their members in the Stack Monitoring service
- Support for creating host-type monitored resources in the Stack Monitoring service
- Support for associating external resources during creation of monitored resources in the Stack Monitoring service
- Support for uploading bulk data in the NoSQL Database Cloud service
- Support for examining query execution plans in the NoSQL Database Cloud service
- Support for starting and stopping clusters in the Big Data service
- Support for additional compute shapes in the Big Data service
- Support for backwards pagination in the Search service
- Support for cross-region replication in the File Storage service
- Support for elastic compute for Exadata Cloud at Customer in the Database service
- Support for calling Oracle Cloud Infrastructure services in the eu-dcc-milan-1 region
- Support for target host identification and SOCKS support on dynamic port forwarding sessions in the Bastion service
- Support for viewing top processes running at a particular point of time in the Operations Insights service
- Support for filtering top processes by a single process to view that process's trend over time in the Operations Insights service
- Support for creating Enterprise Manager-based Windows host targets in the Operations Insights service
- Support for creating Management Agent Cloud-based Windows and Solaris host targets in the Operations Insights service
- Support for the Disaster Recovery service
- Support for running code interactively with session applications using statements in the Data Flow service
- Support for language custom models and language translation in the AI Language service
- Support for cloning from a backup from the last available timestamp in the Database service
- Support for third-party scanning using Qualys in the Vulnerability Scanning service
- Support for customer-provided encryption keys in the Logging Analytics service
- Support for connections for database resources in the GoldenGate service
- Support for listing local and cross-region refreshable clones in the Database service
- Support for adding multiple cloud VM clusters in the Database service
- Support for creating rollback jobs in the Resource Manager service
- Support for edge nodes in the Big Data service
- Support for Single Client Access Name (SCAN) in the Data Flow service
- Support for additional filters when listing application dependencies in the Application Dependency Management service
- Support for additional properties when reading Vulnerability Audit resources in the Application Dependency Management service
- Support for optionally passing compartment IDs when creating Vulnerability Audit resources in the Application Dependency Management service
- Support for mTLS authentication with listeners during Autonomous VM Cluster creation on Exadata Cloud at Customer in the Database service
- Support for providing custom values for TLS and non-TLS ports during Autonomous VM Cluster creation on Exadata Cloud at Customer in the Database service
- Support for creating multiple Autonomous VM Clusters in the same Exadata infrastructure in the Database service
- Support for listing resources associated with a job in the Resource Manager service
- Support for listing resources associated with a stack in the Resource Manager service
- Support for listing outputs associated with a job in the Resource Manager service
- Support for the Oracle distribution of Apache Hadoop 2.0 in the Big Data service
- Support for the Container Instances service
- Support for the Document Understanding service
- Support for creating stacks from OCI DevOps service and Bitbucket Cloud/Server as source control management in the Resource Manager service
- Support for deployment stage level parameters in the DevOps service
- Support for PeopleSoft discovery in the Stack Monitoring service
- Support for Apache Tomcat discovery in the Stack Monitoring service
- Support for SQL Server discovery in the Stack Monitoring service
- Support for OpenId Connect in the API Gateway service
- Support for returning compartment ids when listing backups in the MySQL Database service
- Support for adding a load balancer endpoint to a DB system in the MySQL Database service
- Support for managed read replicas in the MySQL Database service
- Support for setting replication filters on channels in the MySQL Database service
- Support for replicating from a source configured without global transaction identifiers into a channel in the MySQL Database service
- Support for time zone and language preferences in the Announcements service
- Support for adding report schedules for activity auditing and alerts reports in the Data Safe service
- Support for bulk operations on alerts in the Data Safe service
- Support for Java server usage reporting in the Java Management service
- Support for Java library usage reporting in the Java Management service
- Support for cryptographic roadmap impact analysis in the Java Management service
- Support for Java Flight Recorder recordings in the Java Management service
- Support for post-installation steps in the Java Management service
- Support for restricting management of advanced functionality in the Java Management service
- Support for plugin improvements in the Java Management service
- Support for collecting diagnostics on deployments in the GoldenGate service
- Support for onboarding Exadata Public Cloud (ExaCS) targets to the Operations Insights service
- Support for the Queue service
- Support for Intel X9 shapes when launching VM database systems in the Database service
- Support for enabling, disabling, and editing Database Management service connections on pluggable databases in the Database service
- Support for availability configurations and maintenance window schedules on synthetic monitors in the Application Performance Monitoring service
- Support for scheduling cascading deletes on a project in the DevOps service
- Support for cancelling a scheduled cascading delete on a project in the DevOps service
- Support for issue and action fields on job phases of validation and migration processes in the Database Migration service
- Support for cluster profiles in the Big Data service
- Support for egress-only services in the Service Mesh service
- Support for optional listeners and service discovery metadata on virtual deployments in the Service Mesh service
- Support for canceling work requests in the accepted state in the Service Mesh service
- Support for filtering work requests on associated resource id and operation status in the Service Mesh service
- Support for sorting while listing work requests, listing work request logs, and listing work request errors in the Service Mesh service
- Support for Oracle Managed Access integration in the Fusion Apps as a Service service
- Support for refresh scheduling in the Fusion Apps as a Service service
- Support for additional connections types on database resources in the GoldenGate service
- Support for calling Oracle Cloud Infrastructure services in the us-chicago-1 region
- Support for cross-region replication in the File Storage service
- Support for setting up private DNS on ExaCS systems during provisioning in the Database service
- Support for elastic storage expansion on infrastructure resources for Exadata Cloud at Customer in the Database service
- Support for target versions during infrastructure patching on Cloud Exadata infrastructure in the Database service
- Support for creating model version sets in the model catalog in the Data Science service
- Support for associating a model with a model version set in the Data Science service
- Support for custom key/value annotations on documents in the Data Labeling service
- Support for configurable timeouts in the Service Mesh service
- Support for the Cloud Migrations service
- Support for setting up custom private IPs while creating private endpoints in the Database service
- Support for machine learning pipelines in the Data Science service
- Support for personally identifiable information detection in the AI Language service
- Support for ECPU billing for autonomous databases and dedicated autonomous databases on Exadata Cloud at Customer in the Database service
- Support for providing a vault secret ID when creating or updating autonomous shared databases in the Database service
- Support for including machine learning notebook, ORDS, and database transform URLs as autonomous database connections in the Database service
- Support for role-based access control on OpenSearch clusters in the Search service
- Support for managed shell stages on deployments in the DevOps service
- Support for memory encryption on confidential VMs in the Compute service
- Support for configuration items, and reporting ownership of configuration items, in the Application Performance Monitoring service
- Support for changing an instance's Data Guard role in the Database service
- Support for listing autonomous container database versions in the Database service
- Support for specifying a database version when creating or updating an autonomous container database in the Database service
- Support for specifying an eCPU count when creating or updating autonomous shared databases in the Database service
- Support for Helm attestation and Helm arguments on deploy operations in the DevOps service
- Support for uploading master key wallets for deployments in the GoldenGate service
- Support for custom configurations in the Operations Insights service
- Support for refreshing the session token in SessionTokenAuthenticationDetailsProvider
- Support for the Visual Builder Studio service
- Support for the Autonomous Recovery service
- Support for retries by default on operations of the Compute service
- Support for selecting specific database servers when creating autonomous VM clusters in the Database service
- Support for creating autonomous VMs during the creation of autonomous VM clusters in the Database service
- Support for async jobs in the AI Anomaly Detection service
- Support for specifying algorithm hints and windows sizes during model training in the AI Anomaly Detection service
- Support for specifying a sensitivity value during model detection in the AI Anomaly Detection service
- Support for discovery and monitoring of external Oracle database infrastructure components in the Database Management service
- Support for calling Oracle Cloud Infrastructure services in the eu-dcc-rating-1, eu-dcc-rating-2, eu-dcc-dublin-1, eu-dcc-dublin-2, and eu-dcc-milan-2 regions
- Support for on-demand bootstrap script execution in the Big Data Service
- Support for creating and updating autonomous database long-term backup schedules in the Database service
- Support for creating, updating, and deleting autonomous database long-term backups in the Database service
- Support for model deployment resources to use customized container images containing runtime dependencies of ML models and custom web servers to handle inference requests in the Data Science service
- Support for using the compartmentIdInSubtree parameter when summarizing management agent counts in the Management Agent Cloud service
- Support for getting agent property details in the Management Agent Cloud service
- Support for filtering by gateway ID when listing agents in the Management Agent Cloud service
- Support for the Hebrew and Greek languages during AI language text translation in the AI Language service
- Support for auto-detection when analyzing text with pre-trained models in the AI Language service
- Support for specifying update operation constraints when updating an instance in the Compute Service
- Support for disaster recovery in the Content Management service
- Support for advanced autonomous databases insights in the Operations Insights service
- Support for the Identity Domains service
- Support for long-term backups for autonomous databases on Exadata Cloud at Customer in the Database service
- Support for database OS patching in the Database service
- Support for managing enhanced clusters, cluster add-ons, and serverless virtual node pools in the Container Engine for Kubernetes service
- Support for templates and copy object requests in the Data Integration service
- Support for maintenance features in the GoldenGate service
- Support for `AMD_MILAN_BM_GPU` configuration type on instances in the Compute service
- Support for host storage metrics and network metrics as part of host capacity planning in the Operations Insights service
- Support for backup automation integration with the Database Recovery service in the Database service
- Support for changing the disaster recovery configuration of an autonomous database in remote regions of its disaster recovery association in the Database service
- Support for creating a remote disaster recovery association clone of an autonomous database in the Database service
- Support for managed build stages to be configured to use custom shape build runners in the DevOps service
- Support for listing pre-built functions and creating functions from pre-built functions in the Functions service
- Support for connections types for database resources of type Amazon S3, HDFS, SQL Server, Java Messaging service, Mongo DB, Oracle NoSQL, and Snowflake in the GoldenGate service
- Support for ACD and OKV wallet naming for autonomous databases and dedicated autonomous databases on Exadata Cloud at Customer in the Database service
- Support for validating the credentials of a connection in the DevOps service
- Support for GoldenGate Replicat performance profiles when creating a migration in the Database Migration service
- Support for connection diagnostics on registered databases in the Database Migration service
- Support for launching bare metal instances in an RDMA network in the Compute service
- Support for pre-emptible worker nodes in the Container Engine for Kubernetes service
- Support for larger data storage (now up to 128TB) in the MySQL Database service
- Support for HTTP health checks for HTTPS backend sets in the Load Balancer service
- Support for rotation of certificates on autonomous VM clusters on Exadata Cloud at Customer in the Database service
- Support for ACD and OKV wallet naming for autonomous databases and dedicated autonomous databases on Exadata Cloud at Customer in the Database service
- Support for Exadata cloud service application virtual IPs (VIPs) in the Database service
- Support for additional manageability features for large sensitive data models and masking policies in the Data Safe service
- Support for getting user profile details and assignments for databases and fleets in the Data Safe service
- Support for enabling ADDM spotlight for databases in the Operations Insights service
- Support for private endpoints in the Digital Assistant service
- Support for canceling backups in the Database service
- Support for improved labeling of key/value pairs in the Data Labeling service
- Support for enabling mTLS authentication with Listener and for providing custom value for TLS port and Non-TLS Port during AVM Cluster Creation in Database service
- Support for usedDataStorageSizeInGbs property for autonomous database in the Database service
- Support for csiNumber organization in Tenant Manager Control Plane service
- Support for creating and updating an infrastructure with LACP support in Database service
- Support for changePrivateEndpointOutboundConnection operation in Integration Cloud service
- Support for Enable Process in Integration Cloud service
- Support for Disaster Recovery, DR enablement, switchover, and failover feature in Fusion Apps service
- Support for discovery and monitoring of External Exadata infrastructure in Database Management Service
- Support for calling Oracle Cloud Infrastructure services in the `eu-jovanovac-1` region
- Support for bring-your-own-license TLS and ORDS certificates in the Database service
- Support for tags in the Stack Monitoring service
- Support for GPU shapes for model deployments in the Data Science service
- Support for returning networking details of instances in the Visual Builder service
- Support for high-memory VMs in the Compute service
- Support for integrating with the Integration Cloud service in the Process Automation service
- Support for managing on-demand node upgrades in node pools in the Container Engine for Kubernetes service
- Support for the Access Governance service
- Support for creating, updating, listing and downloading one-off patches in the Database service
- Support for changing disaster recovery configurations of remote autonomous databases in the Database service
- Support for scheduling automatic backups in the Database service
- Support for provisioning Software-Defined Data Centers (SDDCs) using standard bare metal shapes, with Block Storage as the datastore, in the VMWare Solution service
- Support for parity with the configuration options of the Compute service in the Compute Autoscaling service
- Support for self-service integration in the Fusion Apps as a Service service
- Support for CRI-O parsing in the Logging service
- Support for retrieving the resource availability domain when getting Exadata infrastructure or VM clusters in the Database service
- Support for specifying database servers when creating dedicated autonomous databases in the Database service
- Support for secondary egress zones in the DNS service
- Support for policy-based snapshots in the File Storage service
- Support for creating and updating a VM cluster network with disaster recovery network support in the Database service
- Support for setting a management dashboard or saved search to be shared across OCI Observability & Management services in the Management Dashboard service
- Support for calling Oracle Cloud Infrastructure services in the `eu-madrid-2` region
- Support for bulk include/exclude of migration objects in the Database Migration service
- Support for Kafka cluster profiles, including dedicated Kafka broker nodes, in the Big Data service
- Support for MySQL HeatWave Lakehouse in the MySQL Database service
- Support for capacity reports in the Compute service
- Support for the OCI Control Center service
- Support for resource quotas and limits in the Usage service
- Support for allowing users to select the billing interval of deleted ESXi hosts while adding new ESXi hosts in the VMWare Solution service
- Support for custom key/value pairs and custom document classification in the AI Document service
- Support for namespace-prefixed domains in the Object Storage service
- Support for getting the full path to a pre-authenticated request in the Object Storage service
- Support for Java migration analysis, performance tuning recommendations, and JDK LCM customization in the Java Management service
- Support for the TCPS protocol for cloud databases in the Operations Insights service
- Support for AIX hosts that are monitored via Enterprise Manager in the Operations Insights service
- Support for serial console access in the Database service
- Support for an increased storage size limit of up to 384 TBs in the Database service
- Support for network security group (NSG) support for private database registrations / private endpoints in the Database Migration service
- Support for document classification on documents of more than one page in the Data Labeling service
- Support for importing datasets in the Data Labeling service
- Support for specifying a shape when creating applications in the Functions service
- Support for creating and managing pools in the Data Flow service
- Support for specifying certificate parameters when creating or updating a node in the Roving Edge Infrastructure service
- Support for certificate management in the Roving Edge Infrastructure service
- Support for upgrade bundle management in the Roving Edge Infrastructure service
- Support for calling Oracle Cloud Infrastructure services in the eu-frankfurt-2 region
- Support for the OS Management Hub service
- Support for changing the key store type, and rotating keys, on Exadata Cloud at Customer in the Database service
- Support for launching VM database systems using Ampere A1 shapes in the Database service
- Support for additional currencies and countries on paid listings in the Marketplace service
- Support for ECPU integration in the License Manager service
- Support for freeform and defined tags on resources in the Generic Artifacts service
- Support for SQL endpoints in the Data Flow service
- Support for setting replication delays on channels in the MySQL Database service
- Support for setting how channels handle replicated tables with no primary key in the MySQL Database service
- Support for SQL Plan Management (SPM) in Database Management service
- Support for specifying default snapshot enablement, verified response codes, client certificate details, and request authentication schemes when creating or updating synthetic monitors in the Application Performance Monitoring service
- Support for address rules, address verification, and requesting addresses in the OSP Gateway service
- Support for synchronous operations in the Document Understanding service
- Support for migration without SSH to database hosts (DMS) in the Database Migration service
- Support for processing workload mappings in the Container Engine for Kubernetes service
- Support for Salesforce, MySQL HeatWave, and Oracle EBS, Sieble, and PeopleSoft connectors in the Data Integration service
- Support for updating the envelope key of a volume backup in the Block Volume service
- Support for calling Oracle Cloud Infrastructure services in the mx-monterrey-1 region
- Support for Kerberos and LDAP with NFSv3 in the File Storage service
- Support for capacity reservation checks for movable compute instances in the Disaster Recovery service
- Support for Oracle MFT monitoring in the Stack Monitoring service
- Support for OS patching in the Big Data service
- Support for master and utility nodes in the Big Data service
- Support for connectivity testing in the GoldenGate service
- Support for composing multiple document service custom key value models into one single model in Document Understanding Service
- Support for custom hostname in the Compute service
- Support for cloud subscription in the Organizations service
- Support for automatic backup download in the GoldenGate service
- Support for creating single use (non-recurring) budgets in the Budgets service
- Support for the Exadata Fleet Update service
- Support for REST-based log collection, multi-conditional labels, and collection properties in the Logging Analytics service
- Support for Kubernetes cluster credential rotation in the Container Engine for Kubernetes service
- Support for zero-downtime features in the Fusion Apps as a Service service
- Support for news reports in the Operations Insights service
- Support for backup retention on autonomous database create operations in the Database service
- Support for exclude tables for replication in the Database Migration service
- Support for adding and updating auto failover maximum data loss limits for local autonomous data guards in the Database service
- Support for limiting networking diagram ingestion in the Networking Monitoring service
- Support for new operations for deployment upgrades in the GoldenGate service
- Support for getting model type information and base model versions while creating language custom models in the AI Language service
- Support for support field in class metric in the AI Language service
- Support for Compute Cloud at Customer resource type in the Operator Access Control service
- Support for managing account management info, account recovery settings, app roles, apps, app status changers, grants, identity propagation trusts and settings, request-able groups, requests, security questions, OAuth tokens, and user attribute settings in the Identity Domains service
- Support for credential stores, including Single Sign-On support, for deployments in the GoldenGate service
- Support for container security contexts in the Container Instances service
- Support for placement constraints and cluster configurations on cluster networks in the Compute service
- Support for Compute Cloud at Customer service
- Support for warehouse data objects in the Operations Insights service
- Support for standard queries on operations insights data objects in the Operations Insights service
- Support for database in memory on autonomous database create operations in the Database service
- Support for creating and updating network monitors in the Application Performance Monitoring Synthetics service
- Support for integration of GoldenGate service for replication in the Database Migration Service
- Support for displaying resource usage information on autonomous container database and cloud autonomous vm cluster get operations in the Database service
- Support for FastConnect Media Access Control Security (MACSec) fail open option in the Network Monitoring service
- Support for generic bare metal types and configuration maps in compute instance platform configuration in the Compute service
- Support for encrypted FastConnect in the Network Monitoring service
- Support for new parameters on customer premises equipment and virtual circuit create operations in the Network Monitoring service
- Support for virtual circuit associated tunnels in the Network Monitoring service
- Support for additional parameters on dynamic routing gateway create and update operations in the Network Monitoring service
- Support for assigning an IPv6 address to a compute instance during instance launch or secondary VNIC attach in the Compute service
- Support for queue channels in the Queue Service
- Support for entity lineage retrieval and asynchronous glossary export in the Data Catalog service
- Support for filtering and sorting while listing work requests in the Container Instances service
- Support for the ability to create support requests for various support ticket types (TECH, LIMIT, ACCOUNT) in the Customer Incident Management Service
- Endpoint changed from https://incidentmanagement.{region}.{domainAndTopLevelDomain} to https://incidentmanagement.{region}.oci.{domainAndTopLevelDomain} (e.g. https://incidentmanagement.us-phoenix-1.oraclecloud.com to https://incidentmanagement.us-phoenix-1.oci.oraclecloud.com) in the Customer Incident Management Service
- Support for SQL tuning sets in Database Management service
- Support for announcement chaining in Announcements service
- Support for automatic promotion of hosts in Stack Monitoring service
- Support for face detection in AI Vision service
- Support for change parameters on list character sets operation in Database Management service
- Support for displaying software sources attached to a managed instance group in OS Management service
- Support for listing compute performances and storage performances in Database service
- Support for private endpoints for external key managers in Key Management service
- Support for additional parameters in vaults and keys for external key managers in Key Management service
- Support for domains while creating integration instances in Oracle Integration Cloud service
- Support for elastic resource pools in the Database service
- Support for private endpoints in the Data Science service
- Support for File System Service (FSS) as transfer medium for data export and import in the Database Migration service
- Support for new optional parameters on replica create, update and list operations in the MySQL Heatwave service
- Support for OKE workload auth


## 2.18.0 - 2022-07-12
### Added
- Support for the Data Connectivity Management service
- Support for the AI Speech service
- Support for disabling crash recovery in the MySQL Database service
- Support for detector recipes of type "threat", new detector rule of type "rogue user", and sightings operations in the Cloud Guard service
- Support for more VM shape configurations when listing shapes in the Compute service
- Support for customer-managed encryption keys in the Analytics Cloud service
- Support for FastConnect device information in the Networking service
- Support for DRG route distribution statements to be specified with a new match type 'MATCH_ALL' for matching criteria in the Networking service
- Support for VCN route types on DRG attachments for deciding whether to import VCN CIDRs or subnet CIDRs into route rules in the Networking service
- Support for CPS offline reports in the Database service
- Support for infrastructure patching v2 features in the Database service
- Support for auto-scaling the storage of an autonomous database, as well as shrinking an autonomous database, in the Database service
- Support for managed egress via a default networking option on jobs and notebooks in the Data Science service
- Support for more types of saved search enums in the Management Dashboard service 
- Support for the Sales Accelerator license option in the Content Management service
- Support for VCN hostname cluster endpoints in the Container Engine for Kubernetes service
- Support for optionally specifying an admin username and password when creating a database system during a restore operation in the MySQL Database service
- Support for automatic tablespace creation on non-autonomous and autonomous database dedicated targets in the Database Migration service
- Support for reporting excluded objects based on static exclusion rules and dynamic exclusion settings in the Database Migration service
- Support for removing, listing, and adding database objects reported by the Cloud Premigration Advisor Tool (CPAT) in the Database Migration service
- Support for migrating Oracle databases from the AWS RDS service to OCI as autonomous databases, using the AWS S3 service and DBLINK for data transfer, in the Database Migration service
- Support for querying additional fields of a resource using return clauses in the Search service
- Support for clusters and station clusters in the Roving Edge Infrastructure service
- Support for creating database systems and database homes using customer-managed keys in the Database service
- Support for Ubuntu platforms and unlimited installation keys in the Management Agent Cloud service
- Support for shielded instances in the VMWare Solution service
- Support for application resources in the Data Integration service
- Support for multi-AVM on Exadata Cloud at Customer infrastructure in the Database service
- Support for heterogeneous (VM and AVM) clusters on Exadata Cloud at Customer infrastructure in the Database service
- Support for custom maintenance schedules for AVM clusters on Exadata Cloud at Customer infrastructure in the Database service
- Support for listing vulnerabilities, vulnerability-impacted containers, and vulnerability-impacted hosts in the Vulnerability Scanning service
- Support for specifying an image count when creating or updating container scan recipes in the Vulnerability Scanning service
- Support for getting the storage utilization of a deployment on deployment list and get operations in the GoldenGate service
- Support for virtual machines, bare metal machines, and Exadata databases with private endpoints in the Operations Insights service
- Support for setting deletion policies on database systems in the MySQL Database service
- Support for returning the number of network ports as part of listing shapes in the Compute service
- Support for Java runtime removal and custom logs in the Java Management service
- Support for new parameters for BGP admin state and enabling/disabling BFD in the Networking service
- Support for private OKE clusters and blue-green deployments in the DevOps service
- Support for international customers to consume and launch third-party paid listings in the Marketplace service
- Support for additional fields on entities, attributes, and folders in the Data Catalog service
- Support for content length and content type response headers when downloading PDFs in the Account Management service
- Support for creating Enterprise Manager-based zLinux host targets, creating alarms, and viewing top process analytics in the Operations Insights service
- Support for diagnostic reboots on VM instances in the Compute service
- Support for bringing your own IPv6 addresses in the Networking service
- Support for specifying database edition and maximum CPU core count when creating or updating an autonomous database in the Database service
- Support for enabling and disabling data collection options when creating or updating Exadata Cloud at Customer VM clusters in the Database service
- Support for the Stack Monitoring service
- Support for stack monitoring on external databases in the Database service
- Support for upgrading VM database systems in place in the Database service
- Support for viewing supported VMWare software versions when listing host shapes in the VMWare Solution service
- Support for choosing compute shapes when creating SDDCs and ESXi hosts in the VMWare Solution service
- Support for work requests on delete operations in the Vulnerability Scanning service
- Support for additional scan metadata in reports, including CVE descriptions, in the Vulnerability Scanning service
- Support for redemption codes in the Usage service
- Support for the Service Mesh service
- Support for security zones in the Cloud Guard service
- Support for virtual test access points (VTAPs) in the Networking service
- Support for monitoring as a source in the Service Connector Hub service
- Support for creating budgets that target subscriptions and child tenancies in the Budgets service
- Support for listing shapes and specifying a shape during creation of a node in the Roving Edge Infrastructure service
- Support for bringing your own key in the Roving Edge Infrastructure service
- Support for enabling inspection of HTTP request bodies in the Web Application Acceleration and Security
- Support for cost management schedules in the Usage service
- Support for TCPS on external containers as well as non-container and pluggable databases in the Database service
- Support for autoscaling on Open Data Hub (ODH) clusters in the Big Data service
- Support for creating Open Data Hub (ODH) 0.9 clusters in the Big Data service
- Support for Open Data Hub (ODH) patch management in the Big Data service
- Support for customizable Kerberos realm names in the Big Data service
- Support for dedicated vantage points in the Application Performance Monitoring service
- Support for reactivating child tenancies in the Organizations service
- Support for punctuation and the SRT transcription format in the AI Speech service
- Support for the Application Dependency Management service
- Support for platform configuration options on some bare metal shapes in the Compute service
- Support for shielded instances for BM.Standard.E4.128 and BM.Standard3.64 shapes in the Compute service
- Support for E4 dense VMs on launch and update instance operations in the Compute service
- Support for reboot migration on DenseIO shapes in the Compute service
- Support for an increased database name maximum length, from 14 to 30 characters, in the Database service
- Support for provisioned concurrency in the Functions service
- Support for getting usage information for autonomous databases and Cloud at Customer autonomous databases in the Database service
- Support for the "standby" lifecycle state on autonomous databases in the Database service
- Support for BIP connections and dataflow operators in the Data Integration service
- Support for information requests in the Operator Access Control service
- Support for Helm charts and repositories on deployments in the DevOps service
- Support for Application Dependency Management service scan results on builds in the DevOps service
- Support for build resources to use Bitbucket Cloud repositories for source code in the DevOps service
- Support for character set selection on autonomous dedicated databases in the Database service
- Support for listing autonomous dedicated database supported character sets in the Database service
- Support for AMD E4 flex shapes on virtual machine database systems in the Database service
- Support for terraform and improvements for cross-region ADGs in the Database service
- Support for the License Manager service
- Support for usage plans in the API Gateway service
- Support for packaged skill and instance metadata management, role-based access options on instance creation, and assigned ownership in the Digital Assistant service
- Support for compute capacity reservations in the VMWare Solution service
- Support for Oracle Linux 8 application streams in the OS Management service
- Support for in-depth monitoring, diagnostics capabilities, and advanced management functionality for on-premise Oracle databases in the Database Management service
- Support for using Oracle Cloud Agent to perform iSCSI login and logout for non-multipath-enabled iSCSI attachments in the Container Engine for Kubernetes service
- Support for Fault Domain placement in the Container Engine for Kubernetes service
- Support for worker node images in the Container Engine for Kubernetes service
- Support for flexible shapes using the driverShapeConfig and executorShapeConfig properties in the Data Flow service
- Support for calling Oracle Cloud Infrastructure services in the eu-paris-1 region
- Support for private endpoints in Resource Manager service
- Support downloading generated Terraform plan output in JSON or binary format in Resource Manager service
- Support for querying OPSI Data Objects in the Operations Insights service
- Support for the Web Application Acceleration (WAA) service
- Support for the Governance Rules service
- Support for the OneSubscription service
- Support for resource locking in the Identity service
- Support for quota resource locking in the Limits service
- Support for returning the backup with the requested changes in the MySQL Database service
- Support for time zone in Cloud Autonomous VM (CAVM) clusters in the Database service
- Support for configuration options in the Application Performance Monitoring service
- Support for MySQL connections in the Database Tools service
- Support for the Network Monitoring service
- Support for specifying application scan settings when creating or updating host scan recipes in the Vulnerability Scanning service
- Support for moving data into an autonomous data warehouse in the Operations Insights service
- Support for shared infrastructure autonomous database character sets in the Database service
- Support for data collection logging events on Exadata instances in the Database service
- Support for specifying boot volume VPUs when launching instances from images in the Compute service
- Support for safe-deleting nodes in the Container Engine for Kubernetes service
- Support for backup policies returned as part of the database system list operation in the MySQL Database service
- Support for DBCS databases in the Operations Insights service
- Support for point-in-time recovery for non-highly-available database systems in the MySQL Database service
- Support for triggering reboot migration on instances with pending maintenance in the Compute service
- Support for native pod networking in the Container Engine for Kubernetes service
- Support for creating Data Guard associations with new database systems in the Database service
- Support for the Network Firewall service
- Support for smaller and larger HeatWave cluster nodes in the MySQL Database service
- Support for CSV file type datasets for text labeling and JSONL in the Data Labeling service
- Support for diagnostics in the Database Management service

### Breaking
- Param `type` in model `DiscoveryDetails` assumes the value of `UNKNOWN_ENUM_VALUE` if it is assigned a value that is not of the allowed_values. It will not raise a `ValueError`.
- Property `risk_score` is removed from model `Sighting` in the Cloud Guard service
- `subscription_id` is a required parameter for operation `list_subscription_mappings` in the subscription client in Tenant Manager control plane service
- The type of parameter `default_connection` was changed from `CreateConnectionFromBICC` to `CreateConnectionDetails` in the create_data_asset_from_fusion_app model in the Data Integration service
- The type of parameter `default_connection` was changed from `ConnectionFromBICCDetails` to `ConnectionDetails` in the data_asset_from_fusion_app model in the Data Integration service
- The type of parameter `default_connection` was changed from `ConnectionSummaryFromBICC` to `ConnectionSummary` in the data_asset_summary_from_fusion_app model in the Data Integration service
- The type of parameter `output_ports` was changed from a list of oci.data_integration.models.OutputPort to oci.data_integration.models.TypedObject in the aggregator model in the Data Integration service
- The property `specification` is now a required parameter for the deployment model in the API Gateway service
- The property `specification` is now a required parameter for the create_deployment_details model in the API Gateway service
- The models `DatabaseToolsAllowedNetworkSources`, `DatabaseToolsVirtualSource`, and `ServiceCapability` are removed from the Database Tools service
- The property `SecretId` is made a required property in the `DatabaseToolsUserPasswordSecretIdDetails` model in the Database Tools service
- Response type for operation `update_backup` is changed to `oci.mysql.models.Backup` from `None` in the `DbBackupsClient` of the MySQL service

### Changed
- Network security groups (NSGs) are now optional for autonomous databases on private endpoints in the Database service
- Optimized the loading time, only the required modules are loaded for OCI Ruby SDK

## 2.17.0 - 2022-02-15
### Added
- Support for calling Oracle Cloud Infrastructure services in the ap-dcc-canberra-1 region
- Support for the Console Dashboard service
- Support for capacity reservation in the Container Engine for Kubernetes service
- Support for tagging in the Container Engine for Kubernetes service
- Support for fetching listings by image OCID in the Marketplace service
- Support for underscores and hyphens in project resource names in the DevOps service
- Support for cross-region cloning in the Database service
- Support for managing tablespaces in the Database Management service
- Support for upgrading and managing payment for subscriptions in the Account Management service
- Support for listing fast launch job configurations in the Data Science service
- Support for the AI Vision service
- Support for the Threat Intelligence service
- Support for creation of NoSQL database tables with on-demand throughput capacity in the NoSQL Database Cloud service
- Support for tagging features in the Oracle Container Engine for Kubernetes (OKE) service
- Support for trace snapshots in the Application Performance Monitoring service
- Support for auditing and alerts in the Data Safe service
- Support for data discovery and data masking in the Data Safe service
- Support for customized subscriptions and delivery of announcements by email and SMS in the Announcements service
- Support for requiring common package for faster load speed

### Breaking changes
- The type for the `bill_to_address` parameter was changed from `Address` to `BillToAddress` in the invoice model of the Account Management service
- `payment_method` was made a required property of the `payment_detail` model of the Account Management service
- The API `query_old` was removed from `query_client` in the Application Performance Monitoring service


## 2.16.0 - 2022-01-25
### Added
- Support for getting management agent hosts which are eligible to create Operations Insights host resources on, in the Operations Insights service
- Support for getting summarized agent counts and summarized plugin counts in the Management Agent Cloud service
- Support for generating recommended VM cluster networks in the Database service
- Support for creating VM cluster networks with a specified listener port in the Database service
- Support for Oracle Analytics Cloud and OCI Vault integration on connections in the Data Catalog service
- Support for critical event monitoring in the OS Management service
- Support for terraform advanced options (detailed log level, refresh, and parallelism) on jobs in the Resource Manager service
- Support for forced cancellation when cancelling jobs in the Resource Manager service
- Support for getting the detailed log content of a job in the Resource Manager service
- Support for provider information in the responses of list operations in the Management Dashboard service
- Support for scheduled jobs in Database Management service
- Support for monitoring and management of OCI virtual machine, bare metal, and ExaCS databases in the Database Management service
- Support for a unified way of managing both external and cloud databases in the Database Management service
- Support for metrics and Performance Hub on virtual machine, bare metal, and ExaCS databases in the Database Management service
- Support for serviceHostKeyFingerprint property for InstanceConsoleConnection in Core service
- Support for Shielded Instances in Core service
- Support for ML Jobs in the Data Science service
- Support for autonomous databases and clones on shared infrastructure not requiring mTLS in the Database service
- Support for server-side encryption using object-specific KMS keys in the Object Storage service
- Support for Windows in the Java Management service
- Support for using network security groups in the API Gateway service
- Support for network security groups in the Functions service
- Support for signed container images in the Functions service
- Support for setting message format when creating and updating alarms in the Monitoring service
- Support for user and security assessment features in the Data Safe service
- Support for configuring Binlog variables in the MySQL Database service.
- Support new response value "OPERATOR" for backup creationType in list and get MDS backup API in the MySQL Database service.
- Support for SetAutoUpgradableConfig and GetAutoUpgradableConfig operations in Management Agent Cloud service.
- Support for additional installType filter for List Management Agents, Images and Count API operations in Management Agent Cloud service.
- Support for list and read DeploymentUpgrade, cancel and restore DeploymentBackup in the Golden Gate service.
- Support for non-autonomous databases targets, executing Pre-Migration advisor, uploading Datapump logs into Object Storage bucket, and filtering Database Objects in the Database Migration service.
- Support for calling Oracle Cloud Infrastructure services in the ap-ibaraki-1 region.
- Support for the Data Labeling service
- Support for querying and setting Application Performance Monitoring configurations in the Application Performance Monitoring service
- Support for the run-once monitor feature and network data collection in the Application Performance Monitoring service
- Support for Oracle Enterprise Manager bridges, source auto-association, source event types mapping, and partitioning and searching data by LogSet in the Logging Analytics service
- Support for Log events APIs used by plugins like fluentd, fluentbit, etc. to upload data in the Logging Analytics service
- Support for a new ActionType: FAILED in work requests in the VMware Provisioning service
- Support for calling Oracle Cloud Infrastructure services in the il-jerusalem-1 region
- Support for creating database systems from backups with database software images in the Database service
- Support for optionally providing a SID prefix during Exadata database creation in the Database service
- Support for node subsetting on VM clusters in the Database service
- Support for non-CDB to PDB conversion in the Database service
- Support for default homepages, unprocessed data buckets, and parsing geostats in the Logging Analytics service
- Support for the Source Code Management service
- Support for the Build service
- Support for the Certificates service
- Support to create child tenancies in an organization and manage subscriptions in the Organizations service
- Support for Certificates service integration in the Load Balancing service
- Support for creating hosts in specific availability domains in the VMWare Solution service
- Support for user-defined functions and libraries, as well as scheduling and orchestration, in the Data Integration service
- Support for EM-managed Exadatas and EM-managed hosts in the Operations Insights service
- Support for the Database Tools service
- Support for scan listener port TCP and TCP SSL on cloud VM clusters in the Database service
- Support for domains in the Identity service
- Support for redeemable users and support rewards in the Usage service
- Support for calling Oracle Cloud Infrastructure services in the ap-singapore-1 and eu-marseille-1 regions
- Support for drill down metadata in the Management Dashboard service
- Support for operator access control on dedicated autonomous databases in the Operator Access Control service
- Support for getting subnet topology in the Networking service
- Support for encrypted FastConnect resources in the Networking service
- Support for performance and high availability, as well as recommendation metrics, in the Optimizer service
- Support for optional TDE wallet passwords in the Database service
- Support for Object Storage service integration in the Big Data service
- Support for circuit breakers enabled by default in all services except Streaming and Compute
- Support for retries enabled by default in all operations of the Functions and Roving Edge services, and in some operations of the Streaming service.
- Support for SQL Tuning Advisor in the Database Management service
- Support for listing users and getting user details in the Database Management service
- Support for autonomous databases in the Database Management service
- Support for enabling and disabling Database Management features on autonomous databases in the Database service
- Support for the Solaris platform in the Management Agent Cloud service
- Support for cross-compartment operations in the Operations Insights service
- Support for listing deployment backups in the GoldenGate service
- Support for standard tags in the Identity service
- Support for viewing problems for deleted targets in the Cloud Guard service
- Support for choosing a platform version while creating a platform instance in the Blockchain Platform service
- Support for custom IPSec connection tunnel internet key exchange phase 1 and phase 2 encryption algorithms in the Networking service
- Support for pagination when listing work requests corresponding to an APM domain in the Application Performance Monitoring service
- Support for the "deleted" lifecycle state on APM domains in the Application Performance Monitoring service
- Support for calling Oracle Cloud Infrastructure services in the eu-milan-1 and me-abudhabi-1 regions
- Support for the Application Management service
- Support for getting the inventory of JMS resources and listing Java runtime usage in a specified host in the Java Management service
- Support for categories, entity topology, and verifying scheduled tasks in the Logging Analytics service
- Support for RAC databases in the GoldenGate service
- Support for querying additional fields of a resource using return clauses in the Search service
- Support for key versions and key version OCIDs in the Key Management service
- Support for node replacement in the VMWare Solution service
- Support for ingestion of SQL stats metrics in the Operations Insights service
- Support for AWR hub integration in the Operations Insights service
- Support for automatically generating logical entities from filename patterns and relationships between business terms across glossaries in the Data Catalog service
- Support for automatic start/stop at scheduled times in the Database service
- Support for cloud VM cluster resources on autonomous dedicated databases in the Database service
- Support for external Hive metastores in the Big Data service
- Support for batch detection/inference in the AI Language service
- Support for dimensions on monitoring targets in the Service Connector Hub service
- Support for invoice operations in the Account Management service
- Support for custom CA trust stores in the API Gateway service
- Support for generating scoped database tokens in the Identity service
- Support for database passwords for users, for logging into database accounts, in the Identity service
- Support for calling Oracle Cloud Infrastructure services in the af-johannesburg-1 and eu-stockholm-1 regions
- Note: Python SDK already had eu-stockholm-1 so need to change above for Python SDK
- Support for multiple protocols on the same listener in the Network Load Balancing service
- IPv6 support in the Network Load Balancing service
- Support for creating Enterprise Manager-based Solaris and SunOS host targets in the Operations Insights service
- Support for choosing Data Guard type (Active Data Guard or regular) on databases in the Database service
- Support for calling Oracle Cloud Infrastructure services in the me-dcc-muscat-1 region
- Support for the Visual Builder service
- Support for cross-region replication of volume groups in the Block Storage service
- Support for boot volume encryption in the Container Engine for Kubernetes service
- Support for adding metadata to records when creating and updating records in the Data Labeling service
- Support for global export formats in snapshot datasets in the Data Labeling service
- Support for adding labeling instructions to datasets in the Data Labeling service
- Support for updating autonomous dataguard associations for autonomous container databases in the Database service
- Support for setting up automatic failover when creating autonomous container databases in the Database service
- Support for setting the RECO storage size when updating a database system in the Database service
- Support for reconnecting refreshable clones to source for autonomous databases on shared infrastructure in the Database service
- Support for checking if an autonomous database on shared infrastructure can be reconnected to source, in the Database service


### Changed
- Endpoint for Identity service changed to include ".oci" subdomain
- Optimized import in OCI Auth module

### Breaking
- Model `WorkSubmissionKey` was removed from Management Agent Cloud service
- Type for parameter `plugin_name` changed to `list[str]` from `str` in operation `list_management_agent_plugins` in the Management Agent Cloud Service
- Type for parameter `version` changed to `list[str]` from `str` in operation `list_management_agent_plugins` in the Management Agent Cloud Service
- Type for parameter `platform_type` changed to `list[str]` from `str` in operation `list_management_agent_plugins` in the Management Agent Cloud Service
- Param `oci_splat_generated_ocids` is removed from operation `create_template` in the Resource Manager service
- Operations `request_summarized_application_usage`, `request_summarized_installation_usage`, `request_summarized_jre_usage`, `request_summarized_managed_instance_usage` were removed from the Java Management Service Client
- Models `RequestSummarizedApplicationUsageDetails`, `RequestSummarizedInstallationUsageDetails`, `RequestSummarizedJreUsageDetails` and `RequestSummarizedManagedInstanceUsageDetails` were removed from Java Management Service
- Param `is_agent_auto_upgradable` is removed from model `UpdateManagementAgentDetails` in the Management Agent Cloud Service
- Param `display_name` is removed from operations `list_work_requests`, `list_work_request_logs` and `list_work_request_errors` in the Database Migration Service Client
- Allowed values for param `sort_order` from operation `list_work_requests` changed to `timeAccepted` in the Database Migration Service Client
- Allowed values for param `sort_order` from operations `list_work_request_errors` and `list_work_request_logs` changed to `timestamp` in the Database Migration Service Client
- Param `time_stamp` renamed to `timestamp` in models `WorkRequestLogEntry`, `WorkRequestError` for the Database Migration Service
- Param `compartment_id` is removed from model `UpdateAgentDetails` for the Database Migration Service
- Models `ComputeInstanceGroupBlueGreenDeployStageExecutionProgress`, `ComputeInstanceGroupBlueGreenTrafficShiftDeployStageExecutionProgress`, `ComputeInstanceGroupCanaryApprovalDeployStageExecutionProgress`, `ComputeInstanceGroupCanaryDeployStageExecutionProgress`, `ComputeInstanceGroupCanaryTrafficShiftDeployStageExecutionProgress`, `RunPipelineDeployStageExecutionProgress`and `RunValidationTestOnComputeInstanceDeployStageExecutionProgress` were removed from the DevOps service.
- Property `resource_type` and `is_enforced_always` from model `CreateOperatorControlAssignmentDetails` changed from optional to required in the Operator Access Control service
- Property `operator_control_name`, `approver_groups_list` and `is_fully_pre_approved` from model `UpdateOperatorControlDetails` changed from optional to required in the Operator Access Control service
- Property `is_enforced_always` from model `UpdateOperatorControlAssignmentDetails` changed from optional to required in the Operator Access Control service
- Property `approver_groups_list` and `is_fully_pre_approved` from model `CreateOperatorControlDetails` changed from optional to required in the Operator Access Control service
- Data type for response of operation `create_operator_control_assignment` changed to `oci.operator_access_control.models.OperatorControlAssignment` in the Operator Access Control service


## 2.15.0 - 2021-08-03
### Added
- Support for the Generic Artifacts service
- Support for the Bastion service
- Support for reading secrets by name in the Vault service
- Support for the isDynamic field when listing definitions in the Limits service
- Support for getting billable image sizes in the Compute service
- Support for getting Automatic Workload Repository (AWR) data on external databases in the Database Management service
- Support for the VM.Standard.E3.Flex flexible compute shape with customizable OCPUs and memory on notebooks in the Data Science service
- Support for container images and generic artifacts billing in the Registry service
- Support for the HCX Enterprise add-on in the VMware Solution service
- Support for configuration of autonomous database KMS keys in the Database service
- Support for creating database software images with any supported RUs in the Database service
- Support for creating database software images from an existing database home in the Database service
- Support for listing all NSGs associated with a given VLAN in the Networking service
- Support for a duration windows, task failure reasons, and next execution times on scheduled tasks in the Logging Analytics service
- Support for calling Oracle Cloud Infrastructure services in the sa-vinhedo-1 region
- Support for Java Management service
- Support for resource principals for the Enterprise Manager bridge resource in Operations Insights service
- Support for encryptionInTransitType in BootVolumeAttachment and IScsiVolumeAttachment in Core service
- Support for updating iscsiLoginState for VolumeAttachment in Core service
- Support for a new type of Source called Import for use with the Export tool in Application Migration service
- Support for elastic storage on Exadata Infrastructure resources for Cloud at Customer in the Database service
- Support for registration and management of target databases in the Data Safe service
- Support for config on metadata in the Management Dashboard service
- Support for a new work request operation type for node pool reconciliation events in the Container Engine for Kubernetes service
- Support for migrating clusters with a public Kubernetes API endpoint which are not integrated with a customer's VCN to a VCN-native cluster in the - Container Engine for Kubernetes service
- Support for getting the spark version of applications, and filtering applications by spark version, in the Data Flow service
- Support for virtual machine and bare metal pluggable databases in the Database service
- Support for the DevOps service
- Support for configuring network security groups for node pools in the Container Engine for Kubernetes service
- Support for optionally specifying CPU core count and data storage size when creating autonomous databases in the Database service
- Support for metastore and initial data asset import/export in the Data Catalog service
- Support for associating domain names to emails and managing email domain names / DKIM in the Email Delivery service
- Support for email domain names on senders and suppressions in the Email Delivery service
- Support for order activation in the Organizations service
- Support for resource principal authorization on Enterprise Manager bridge resources in the Operations Insights service
- Support for the starter edition license type in the Content and Experience service
- Support for the Generic Artifacts service's new domain name
- Support for the AI Anomaly Detection service
- Support for retrieving a DNS zone as a zone file in the DNS service
- Support for querying manual adjustments in the Usage service
- Support for searching Marketplace listings in the Marketplace service
- Support for new cluster type 'ODH' in the Big Data service
- Support for availability domain as an optional parameter when creating VLANs in the Networking service
- Support for search domain type on DHCP options, to support multi-level domain search in the Networking service
- Support for schedules, schedule tasks, REST tasks, operators, S3, and Fusion Apps in the Data Integration service
- Support for getting available updates and update histories for VM clusters in the Database service
- Support for downloading network validation reports for Exadata network resources in the Database service
- Support for patch and upgrade of Grid Infrastructure (GI), and update of DomU OS software for VM clusters in the Database service
- Support for updating data guard associations in the Database service
- Support for filtering by tag on capacity planning and SQL warehouse list operations in the Operations Insights service
- Support for creating cross-region autonomous data guards in the Database service
- Support for the customer contacts feature on cloud exadata infrastructure in the Database service
- Support for cost analysis custom tables in the Usage service
- Support for manually copying volume group backups across regions in the Block Volume service
- Support for work requests for the copy volume backup and copy boot volume backup operations in the Block Volume service
- Support for specifying external Hive metastores during application creation in the Data Flow service
- Support for changing the compartment of a backup in the MySQL Database service
- Support for model catalog features including provenance, metadata, schemas, and artifact introspection in the Data Science service
- Support for Exadata system network bonding in the Database service
- Support for creating autonomous databases with early patching enabled in the Database service

### Breaking
- `compartment_id` is now optional in operation `list_network_security_groups` in the Networking service
- The properties `freeform_tags` and `defined_tags` were removed from the ManagementDashboardExportDetails model in the Management Dashboard service
- The property `cpu_core_count` was made optional in model CreateAutonomousDatabaseBase in the Database service
- `DISPLAYNAME` was removed as allowed value for the SortBy property in method `list_job_executions` under the Data Catalog service
- Model `TSIG` was removed from the DNS service
- Param `tsig` was removed from model `ExternalMaster` in the DNS service
- Models `CreateCustomTableDetails`, `CreateScheduleReportDetails`, `CustomTable`, `CustomTableCollection`, `CustomTableSummary`, `SavedScheduleReport`, - cheduleReport`, `ScheduleReportCollection`, `ScheduleReportSummary`, `UpdateCustomTableDetails`, `UpdateScheduleReportDetails` were removed from Usage I - service
- Data Type for param `type` changed from `str` to `object` in model `ShapeField` in the Data Integration Service
- Data Type for param `type` changed from `oci.data_integration.models.BaseType` to `object` in model `Parameter` in the Data Integration Service
- Data Type for param `type` changed from `str` to `object` in model `NativeShapeField` in the Data Integration Service
- Base class for model `OracleWriteAttributes` changed from `object` to `oci.data_integration.models.AbstractWriteAttribute` in the Data Integration Service
- Base class for model `OracleReadAttributes` changed from `object` to `oci.data_integration.models.AbstractReadAttribute` in the Data Integration Service
- Base class for model `OracleAdwcWriteAttributes` changed from `object` to `oci.data_integration.models.AbstractWriteAttribute` in the Data Integration rvice
- Base class for model `OracleAtpWriteAttributes` changed from `object` to `oci.data_integration.models.AbstractWriteAttribute` in the Data Integration rvice
- Param `bucket_name` was removed from model `OracleAtpWriteAttributes` in the Data Integration Service
- Param `bucket_name` was removed from model `OracleAdwcWriteAttributes` in the Data Integration Service
- Param `bucket_name` was removed from model `OracleAdwcWriteAttributes` in the Data Integration Service
- Param `is_file_pattern` was removed from model `CsvFormatAttribute` in the Data Integration Service
- Constant `MODEL_TYPE_REST_OPERATOR` was removed from model `Operator` in the Data Integration Service

## 2.14.0 - 2021-05-18
### Added
- Support for the Database Migration service
- Support for the Networking Topology service
- Support for getting the id of peered VCNs on local peering gateways in the Networking service
- Support for burstable instances in the Compute service
- Support for preemptible instances in the Compute service
- Support for fractional resource usage and availability in the Limits service
- Support for streaming analytics in the Service Connector Hub service
- Support for flexible routing inside DRGs to enable packet flow between any two attachments in the Networking service
- Support for routing policy to customize dynamic import/export of routes in the Networking service
- Support for IPv6, including on FastConnect and IPsec resources, in the Networking service
- Support for request validation policies in the API Gateway service
- Support for RESP-compliant (e.g. REDIS) response caches, and for configuring response caching per-route in the API Gateway service
- Support for flexible billing in the VMWare Solution service
- Support for new DNS format for the Web Application Acceleration and Security service
- Support for configuring APM tracing on applications and functions in the Functions service
- Support for Enterprise Manager external databases and Management Agent Service managed external databases and hosts in the Operations Insights service
- Support for getting cluster cache metrics for RAC CDB managed databases in the Database Management service
- Support for opting in/out of live migration on instances in the Compute service
- Support for enabling/disabling Operations Insights on external non-container and external pluggable databases in the Database service
- Support for a GraphStudio URL as a connection URL on databases in the Database service
- Support for adding customer contacts on autonomous databases in the Database service
- Support for name annotations on harvested objects in the Data Catalog service
- Support for RACs (real application clusters) for external container, non-container, and pluggable databases in the Database service
- Support for data masking in the Cloud Guard service
- Support for opting out of DNS records during instance launch, as well as attaching secondary VNICs, in the Compute service
- Support for mutable sizes on cluster networks in the Autoscaling service
- Support for auto-tiering on buckets in the Object Storage service
- Support for the Operator Access Control service
- Support for the Service Catalog service
- Support for the AI Language service
- Support for autonomous database on Exadata Cloud at Customer infrastructure patching in the Database service
- Support for creating notebook sessions with larger block volumes in the Data Science service
- Support for database maintenance run patch modes in the Database service
- Support for spark-submit compatible options in the Data Flow service
- Support for Object Storage as a configuration source in the Resource Manager service
- Add Ruby Expect 100 Continue support
- Add Default Retry configuration helper function
- Update License, Notice and add THIRD_PARTY_LICENSES file
- Fix a bug in region realm mapping for Santiago region

### Breaking
- Removed response codes `200`, `201`, `202`, `204`, `206`, `300`, `301`, `302`, `303`, `304`, `307` and `444` from attribute `block_response_code` in model `AddressRateLimiting` in the Web Application Acceleration and Security Service
- `vcn_id` was made optional in CreateDrgAttachmentDetails model under Core services.
- The property `is_internet_access_allowed` was removed from CreateIpv6Details model under Core services.
- The property `ipv6_cidr_block` was removed from CreateVcnDetails model under Core services.
- The property `public_ip_address` and `is_internet_access_allowed` were removed from Ipv6 model under Core services.
- Required property `peer_id` was added to LocalPeeringGateway model under Core services.
- The property `ipv6_public_cidr_block` was removed from Subnet model under Core services.
- The property `ipv6_cidr_block` was replaced by `ipv6_cidr_blocks` in Vcn model in Core services.
- Required property `current_sku` was added under CreateEsxiHostDetails under Ocvp service.
- Required property `initial_sku` was added under CreateSddcDetails under Ocvp service.
- Required properties `billing_contract_end_date`, `next_sku` & `current_sku` were added under EsxiHost under Ocvp service.
- Required properties `billing_contract_end_date`, `next_sku` & `current_sku` were added under EsxiHostSummary under Ocvp service.
- Required property `initial_sku` was added under Sddc under Ocvp service.
- Required property `id` was added under DatabaseDetails under Opsi service.
- Value of attribute `model_type` in model `ConnectionDetails` in Data Integration service defaults to UNKNOWN_ENUM_VALUE when it receives an invalid value. In the earlier versions, this raises a ValueError
- `vcn_id` parameters were moved from being required to being optional on all list operations in the Networking service

## 2.13.0 - 2021-04-06
### Added
- Support for auto-scaling in the Big Data service
- Documentation fixes for the Logging Search service
- Support for Logging Analytics as a target in the Service Connector Hub service
- Support for lookups, agent collection warnings, task commands, and data archive/recall in the Logging Analytics service
- Support for creating, managing, and using asymmetric keys in the Key Management service
- Support for peer ACD unique names in Exadata Cloud at Customer in the Database service
- Support for ACLs on autonomous databases in Exadata Cloud at Customer Data Guard in the Database service
- Support for drift detection on individual resources of a stack in the Resource Manager service
- Support for private access channels and vanity URLs in the Analytics Cloud service
- Support for updating load balancer shapes in the Blockchain Platform service
- Support for assigning volume backup policies to volume groups in the Block Volume service
- Support for checking if a contact for Exadata infrastructure is valid in My Oracle Support in the Database service
- Support for checking if Exadata infrastructure is in a degraded state in the Database service
- Support for updating the operating system on a VM cluster in the Database service
- Support for external databases in the Database service
- Support for uploading objects to the infrequent access storage tier in the Object Storage service
- Support for changing the storage tier of existing objects in the Object Storage service
- Support for private templates in the Resource Manager service
- Support for multiple encryption domains on IPSec tunnels in the Networking service
- Support for the Database Management service
- Support for setting an offset for budget processing in the Budgets service
- Support for enabling and disabling Oracle Cloud Agent plugins in the Compute service
- Support for listing available plugins and for getting the status of plugins in the Oracle Cloud Agent service
- Support for one-off patching in autonomous transaction processing - dedicated databases in the Database service
- Support for additional database upgrade options in the Database service
- Support for glossary term recommendations in the Data Catalog service
- Support for listing errata in the OS Management service
- Support for scan DNS names and zone ids on database system, cloud VM cluster, and autonomous Exadata infrastructure responses in the Database service
- Support for specifying ACL rules to limit ingress into public load balancers in the Integration service
- Support for Cloud at Customer as a source type in the Application Migration service
- Support for selective migration of specific resources in the Application Migration service
- Support for the OCI Registry service
- Support for exporting an existing running VM, or a copy of VM, into a VMDK, QCOW2, VDI, VHD, or OCI formatted image in the Compute service
- Support for platform configurations on instances in the Compute service
- Support for providing target tags and target compartments on profiles in the Optimizer service
- Support for the 'Fix it' feature in the Optimizer service
- Support for pipelines, pipeline tasks, and favorites in the Data Integration service
- Support for publishing tasks to OCI Data Flow in the Data Integration service
- Support for clones in the File Storage service
- Support for the Application Performance Monitoring service
- Support for the Golden Gate service
- Support for SMS subscriptions in the Notifications service
- Support for friendly-formatted messages in the Service Connector Hub service
- Support for attaching and detaching instances to instance pools in the Autoscaling service
- Support for routing policies and HTTP2 listener protocols in the Load Balancing service
- Support for model deployments in the Data Science service
- Support for private clusters in the Container Engine for Kubernetes service
- Support for updating an instance's usage type in the Content and Experience service
- Support for the Network Load Balancing service
- Support for maintenance runs on autonomous databases in the Database service
- Support for announcement preferences in the Announcements service
- Support for domain claiming in the Organizations service
- Support for saved reports in the Usage service
- Support for the HeatWave in-memory analytics accelerator in the MySQL Database service
- Support for community applications in the Marketplace service
- Support for capacity reservations in the Compute service
- Support for the Vulnerability Scanning service
- Support for vSphere 7.0 in the VMware Solution service
- Support for forecasting in the Usage service
- Support for viewing, searching, and modifying parameters for on-premise Oracle databases in the Database Management service
- Support for listing tablespaces of managed databases in the Database Management service
- Support for cross-regional replication of keys in the Key Management service
- Support for highly-available database systems in the MySQL Database service
- Support for Oracle Enterprise Manager bridges, source auto-association, source event type mappings, and plugins to upload data in the Logging Analytics service
- Support for scheduling the suspension and resumption of compute instance pools based on predefined schedules in the Autoscaling service
- Support for database software images for Cloud@Customer in the Database service
- Support for OCIC IDCS authorization details in the Application Migration service
- Support for cross-region asynchronous volume replication in the Block Storage service
- Support for SDK generation in the API Gateway service
- Support for container image signing in the Registry service
- Support for cluster features as a part of the Container Engine for Kubernetes service
- Support for filtering dedicated virtual machine hosts by remaining memory and OCPUs in the Compute service
- Support for read/write-any object from buckets using pre-authenticated requests in the Object Storage service
- Support for restricting pre-authenticated requests by prefix in the Object Storage service
- Support for route filtering on public virtual circuits in the Virtual Networking service

### Breaking
- Fixed a bug in the endpoint used for the Management Dashboard service
- Removed `LIFECYCLE_STATE_UPDATING_INFRA` from model BdsInstance in the Big Data service
- Removed `LIFECYCLE_STATE_STOPPING` and `LIFECYCLE_STATE_STARTING` from model Node in the Big Data Service
- A new required property `kind` is added to the models `UpdateScheduledTaskDetails` and `ScheduledTask` in the Log Analytics service
- The allowed values for parameter `sort_by` are restricted for methods `list_meta_source_types`, `list_parser_functions`, `list_parser_meta_plugins`, `list_source_label_operators`, `list_source_meta_functions` in the Log Analytics service. For more information please see the documentation for LogAnalyticsClient at https://docs.oracle.com/en-us/iaas/tools/python/latest/api/log_analytics/client/oci.log_analytics.LogAnalyticsClient.html#loganalyticsclient
- Parameter `idcs_access_token` in model `CreateBlockchainPlatformDetails` changed from optional to required in the Blockchain service
- Attribute `vnic_id` in response model `Ipv6` changed from required to optional in the Networking service
- Model `InstanceAgentCommandContentInfo` is removed from Compute Instance Agent service
- Changed model `UniqueKey` in the Dataintegration service to not inherit from Key.
- Changed model `PrimaryKey` in the Dataintegration service to inherit from `UniqueKey`.
- Removed enum values `PRIMARY_KEY` and `UNIQUE_KEY` in property `model_type` from model `key` in the Dataintegration service. 
- Parameter `vnic_id` changed from optional to required in model `CreateIpv6Details` in the core services
- Parameter `vnic_id` changed from optional to required in model `Ipv6` in the core services
- Value of Enum attribute `operator` in Usage API service defaults to `UNKNOWN_ENUM_VALUE` when it receives an invalid value. In the earlier versions, this raises a `ValueError`


## 2.12.0 - 2020-12-14
### Added
- Support for calling Oracle Cloud Infrastructure services in the sa-santiago-1 region
- Support for peer and OSN resources, as well as retry tokens, in the Blockchain Platform service
- Support for getting the availability status of management agents in the Management Agent service
- Support for the on-prem-connector resource type in the Data Safe service
- Support for service channels in the MySQL Database service
- Support for getting the creation type of backups, and for filtering backups by creation type in the MySQL Database service
- Support for Integration Service custom endpoint feature
- Support for metadata field in IdentityProvider Get and List response
- Support for fine-grained data analysis and improved SQL insights
- Support for ADB Dedicated - ORDS and SSL cert rotation at AEI
- Support for Maintenance Schedule feature for Exadata Infrastructure resources for ExaCC
- Support for filtering listKeys based on KeyShape in KeyManagement service
- Support for the Oracle Roving Edge Infrastructure service
- Support for flexible ShapeDetails in Load Balancer service
- Support for listing of harvested Rules, additional filtering for Logical Entity list calls in Data Catalog service
- Support second level domain for audit SDK
- Support for listing flex components in Database service
- Support for APEX service for ADBS on OCI console for Database service
- Support for Customer-Managed Key features as a part of the Database service
- Support for Github configuration source provider as part of the Resource Manager service

### Breaking
- Parameter `compartment_id` changed from optional to required for method `list_work_requests` in the Data Safe service
- Return type of method `create_data_safe_private_endpoint` changed from `None` to `DataSafePrivateEndpoint` in the Data Safe service
- Parameters `freeform_tags` and `defined_tags` are removed from model `EnableDataSafeConfigurationDetails` in the Data Safe service
- Removed deprecated create_autonomous_data_warehouse API from Database service
- Removed deprecated create_autonomous_data_warehouse_backup API from Database service
- Removed deprecated delete_autonomous_data_warehouse API from Database service
- Removed deprecated generate_autonomous_data_warehouse_wallet API from Database service
- Removed deprecated get_autonomous_data_warehouse API from Database service
- Removed deprecated get_autonomous_data_warehouse_backup API from Database service
- Removed deprecated list_autonomous_data_warehouse_backups API from Database service
- Removed deprecated list_autonomous_data_warehouses API from Database service
- Removed deprecated restore_autonomous_data_warehouse API from Database service
- Removed deprecated start_autonomous_data_warehouse API from Database service
- Removed deprecated stop_autonomous_data_warehouse API from Database service
- Removed deprecated update_autonomous_data_warehouse API from Database service

## 2.11.0 - 2020-11-17
### Added
- Support for API definitions in the API Gateway service
- Support for pattern-based logical entities, namespace-bound custom properties, and faceted search in the Data Catalog service
- Support for autonomous Data Guard on autonomous infrastructure in the Database service
- Support for creating a Data Guard association on an existing standby database home in the Database service
- Support for upgrading cloud VM cluster grid infrastructure in the Database service
- Support for applying same retry policy across multiple requests in the same service
- Support for resource principal v1.1 authentication.
- Support for the Operations Insights service
- Support for updating autonomous databases to enable/disable Operations Insights service integration, in the Database service
- Support for the NEEDS_ATTENTION lifecycle state on database systems in the Database service
- Support for HCX in the VMware Solutions service
- Support for the Compute Instance Agent service
- Support for key store resources and operations in the Database service
- Support for specifying a key store when creating autonomous container databases in the Database service
- Support for calling Oracle Cloud Infrastructure services in the uk-cardiff-1 region
- Support for the Organizations service
- Support for the Optimizer service
- Support for tenancy ID and name on responses in the Usage service
- Support for object versioning in object lifecycle management in the Object Storage service
- Support for specifying a syslog URL for applications in the Functions service
- Support for creation of always-free NoSQL database tables in the NoSQL Database service
- Support for the 21C autonomous database version in the Database service
- Support for creating a Data Guard association with a standby database from a database software image in the Database service
- Support for specifying a TDE wallet password when creating a database or database system in the Database service
- Support for enabling access control lists for autonomous databases on Exadata Cloud At Customer in the Database service
- Support for private DNS resolvers, resolver endpoints, and views in the DNS service
- Support for getting a VCN and resolver association in the Networking service
- Support for additional parameters when updating subnets and VLANs in the Networking service
- Support for analytics clusters (database accelerators) in the MySQL Database service
- Support for migrations to Java Cloud Service and Oracle Weblogic Server instances that use existing databases in the Application Migration service
- Support for specifying reserved IPs when creating load balancers in the Load Balancing service
- Fix once request header content-length is 0, request body is not nil, then send chunked-encoding header issue
- Support for specifying memory for AMD E3 shapes during node pool creation and update in the Container Engine for Kubernetes service
- Support for upgrading a database on a VM database system in the Database service
- Support for listing autonomous database clones in the Database service
- Support for Data Guard with autonomous container databases on Exadata Cloud at Customer in the Database service
- Support for getting the last login time of a user in the Identity service
- Support to bulk editing tags on resources in the Identity service
- Fix URI.escape obsolete issue

### Breaking
- Removed models `AgentUpload`, `Attribute`, `CreateNamespaceDetails`, `FieldMap`, `GenerateAgentObjectNameDetails`, `LogAnalytics`, `LogAnalyticsCollectionWarning`, `LogAnalyticsSummary`, `OutOfBoxEntityTypeDetails`, `Query`, `QueryWorkRequestResource`, `RegisterEntityTypesDetails`, `ServiceTenancy`, `StringListDetails` from Log Analytics service
- Removed value `CUSLTER_SPLIT` and added `CLUSTER_SPLIT` in the Log Analytics service enum `name`
- The value for enum `status` is not validated against allowed values and will not raise `ValueError` in the Container Engine service
- Attribute `is_quick_start` in models `CreateLogSavedSearchDetails`, `LogSavedSearchSummary` and `LogSavedSearch` is removed from the Logging Management service
- Lifecycle State `DELETED` is removed from the Logging Management service

## 2.10.0 - 2020-10-06
### Added
- Support for the Data Integration service
- Support for updating database home IDs on databases in the Database service
- Support for backing up autonomous databases on Cloud at Customer in the Database service
- Support for managing autonomous VM clusters on Cloud at Customer in the Database service
- Support for accessing data assets via private endpoints in the Data Catalog service
- Support for dependency archive zip files to be specified for use by applications in the Data Flow service
- Support for the Usage service
- Support for the VMware Provisioning service
- Support for applying one-off patches to databases in the Database service
- Support for layer-2 virtualization features on vlans in the Networking service
- Support for all AttachVolumeDetails and ParavirtualizedAttachVolumeDetails properties on instance configurations in the Compute Management service
- Support for setting HTTP header size and allowing invalid characters in HTTP request headers in the Load Balancing service
- Support for registering and deregistering autonomous dedicated databases with Data Safe in the Database service
- Support for switching between non-private-endpoints and private endpoints on autonomous databases in the Database service
- Support for returning group names when listing identity provider groups in the Identity service
- Support for server-side object re-encryption in the Object Storage service
- Support for private endpoint (ingress) and public endpoint whitelisting in the Analytics Cloud service
- Support for the Blockchain service
- Support for failing over an autonomous database that has Data Guard enabled in the Database service
- Support for switching over an autonomous database that has Data Guard enabled in the Database service
- Support for git configuration sources in the Resource Manager service
- Support for optionally specifying a VCN id on list operations of DHCP options, subnets, security lists, route tables, internet gateways, and local peering gateways in the Networking service
- Support for license types on instances in the Content and Experience service
- Support for calling Oracle Cloud Infrastructure services in the us-sanjose-1 region
- Support for updating the fault domain and launch options of VM instances in the Compute service
- Support for image capability schemas and schema versions in the Compute service
- Support for 'Patch Now' maintenance runs for autonomous Exadata infrastructure and autonomous container database resources in the Database service
- Support for automatic performance and cost tuning on volumes in the Block Storage service
- Support for calling Oracle Cloud Infrastructure services in the uk-gov-cardiff-1 region
- Support for creating and managing private endpoints in the Data Flow service
- Support for changing instance shapes and restarting nodes in the Big Data service
- Support for additional versions (for example CSQL) in the Big Data service
- Support for creating stacks from compartments in the Resource Manager service
- Support for autonomous json databases in the Database service
- Support for cleaning up uncommitted multipart uploads in the Object Storage service
- Support for additional list API filters in the Data Catalog service
- Support for custom boot volume size and other node pool updates in the Container Engine for Kubernetes service
- Support for Data Guard on Exadata Cloud at Customer VM clusters in the Database service
- Support for stopping VM instances after scheduled maintenance or hypervisor reboots in the Compute service
- Support for creating and managing private endpoints in the Data Flow service
- Support for calling Oracle Cloud Infrastructure services in the ap-chiyoda-1 region
- Support for VM database cloning in the Database service
- Support for the MAINTENANCE_IN_PROGRESS lifecycle state on database systems, VM clusters, and Cloud Exadata in the Database service
- Support for provisioning refreshable clones in the Database service
- Support for new options on listeners and backend sets for specifying SSL protocols, SSL cipher suites, and server ordering preferences in the Load Balancing service
- Support for AMD flexible shapes with configurable CPU in the Container Engine for Kubernetes service
- Support for network sources in authentication policies in the Identity service
- Support for Logging Service
- Support for Logging Analytics Service
- Support for Logging Search Service
- Support for Logging Ingestion Service
- Support for Management Agent Cloud Service
- Support for Management Dashboard Service
- Support for Service Connector Hub service
- Support for Policy based Request/Response transformation in the API Gateway Service
- Support for sending diagnostic interrupt to a VM instance in the Compute Service
- Support for custom Database Software Images in the Database Service
- Support for getting and listing container database patches for Autonomous Container Database resources in the Database Service
- Support for updating patch id on maintenance run for Autonomous Container Database resources in the Database Service
- Support for searching Oracle Cloud resources across tenancies in the Search Service
- Documentation update for Logging Policies in the API Gateway service
- Support for the Cloud Guard service
- Support for specifying desired consumption models when creating instances in the Integration service
- Support for dynamic shapes in the Load Balancing service
- Support for software keys in the Key Management service
- Support for customer contacts on Exadata Cloud at Customer in the Database service
- Support for updating open modes and permission levels of autonomous databases in the Database service
- Support for flexible memory on VM instances in the Compute and Compute Management services
- Support for specifying custom content dispositions when downloading objects in the Object Storage service
- Support for the “bring your own IP address” feature in the Virtual Networking service
- Support for updating the tags of instance console connections in the Compute service
- Support for custom SSL certificates on gateways in the API Gateway service

## 2.9.0 - 2020-06-16
### Added
- Support for creating a new database from an existing database based on a given timestamp in the Database service
- Support for enabling archive log backups of databases in the Database service
- Support for returning the database version on autonomous container databases in the Database service
- Support for the new DNS format of the Data Transfer service
- Support for scheduled autoscaling, which allows for scaling actions triggered at particular times based on CRON expressions, in the Compute Autoscaling service
- Support for filtering of list APIs for groups, identity providers, identity provider groups, compartments, dynamic groups, network sources, policies, and users by name or lifecycle state in the Identity Service
- Support for returning the database version of backups in the Database service
- Support for patching on Exadata Cloud at Customer resources in the Database service
- Support for new lifecycle substates on instances in the Digital Assistant service
- Support for file servers in the Integration service
- Support for deleting non-empty tag namespaces and bulk deleting tags in the Identity service
- Support for bulk move and bulk delete of resources by compartment in the Identity service
- Support for optionally supplying a signature when deleting an agreement in the Marketplace service
- Support for launching paid listings in non-US regions in the Marketplace service
- Support for returning the image id of packages in the Marketplace service
- Support for calling Oracle Cloud Infrastructure services in the ap-chuncheon-1 region
- Support for returning the private IP of a private endpoint database in the Database service
- Support for native JWT validation in the API Gateway service
- Support for drift detection in the Resource Manager service
- Support for updating the license type of database systems in the Database service
- Support for updating the version of 19c autonomous databases in the Database service
- Support for backup and restore functionality in the Key Management service
- Support for reports in the Marketplace service
- Support for calling Oracle Cloud Infrastructure services in the ap-hyderabad-1 region
- Support for the MySQL Database service
- Support for updating the database home of a database in the Database service
- Support for government regions in the Marketplace service
- Support for starting and stopping instances in the Integration service
- Support for installing Windows updates in the OS Management service
- Support for the Data Safe service
- Support for the Incident Management service
- Support for showing which database versions support always-free in the Database service
- Support in instance configurations for flex shapes, dedicated VM hosts, encryption in transit, and KMS keys in the Compute Autoscaling service
- Support for server-side object encryption using a customer-provided encryption key in the Object Storage service
- Support for specifying maintenance preferences while launching and updating Exadata Database systems in the Database service
- Support for flexible-shaped VM instances in the Compute service
- Support for scheduled cross-region backups in the Block Volume service
- Support for object versioning in the Object Storage service

## 2.8.0 - 2020-04-13 
### Added
- Support for access to APEX and SQL Dev features on autonomous transaction processing and autonomous data warehouse resources in the Database service
- Support for registering / deregistering autonomous transaction processing and autonomous data warehouse resources with Data Safe in the Database service
- Support for redirecting HTTP / HTTPS request URIs to different URIs in the Load Balancing service
- Support for specifying compartments on options APIs in the Container Engine for Kubernetes service
- Support for volume performance units on block volumes in the Block Storage service
- Support for four-byte autonomous system numbers (ASNs) on FastConnect resources in the Networking service
- Support for choosing fault domains when creating instance pools in the Compute service
- Support for allowing connections from only specific VCNs to autonomous data warehouse and autonomous transaction processing instances in the Database service
- Support for maintenance windows on autonomous databases in the Database service
- Support for getting the compute units (OCPUs) of an Exadata autonomous transaction processing - dedicated resource in the Database service
- Support for etags on results of the List Objects API in the Object Storage service
- Support for OCIDs on buckets in the Object Storage service
- Support for content-disposition and cache-control headers on objects in the Object Storage service
- Support for recovering deleted compartments in the Identity service
- Support for sharing volumes across multiple instances in the Block Storage service
- Support for connect harnesses and stream pools in the Streaming service
- Support for associating file storage mount targets with network security groups in the File Storage service 
- Support for calling Oracle Cloud Infrastructure services in the uk-gov-london-1 region
- Add default connection timeout(10s) and read timeout(60s) for Python SDK client
- Add contents table to client documentation
- Fix the issue of the second style of pagination
- Support for the API Gateway service
- Support for the OS Management service
- Support for the Marketplace service
- Support for "default"-type vaults in the Key Management service
- Support for bringing your own keys in the Key Management service
- Support for cross-region backups of boot volumes in the Block Storage service
- Support for top-level TSIG keys in the DNS service
- Support for resizing virtual machine instances to different shapes in the Compute service
- Support for management configuration of cloud agents in the Compute service
- Support for launching node pools using image IDs in the Container Engine for Kubernetes service
- Support for optionally specifying the corporate proxy field when creating Exadata infrastructure in the Database service
- Support for maintenance windows, and rescheduling maintenance runs, on autonomous container databases in the Database service
- Support for a description field on route rules and security rules in the Networking service
- Support for starting and stopping Digital Assistant instances in the Digital Assistant service
- Support for shared database homes on Exadata, bare metal, and virtual machine instances in the Database service
- Support for tracking a number of Database service operations through the Work Requests service
- Support for getting DRG redundancy status in the Networking service
- Support for cloning autonomous databases from backups in the Database service
- Support for the Application Migration service
- Support for the Data Flow service
- Support for the Data Catalog service
- Support for cross-shape Data Guard in the Database service
- Support for offline data export in the Data Transfer service
- Support for the Data Science service
- Support for calling Oracle Cloud Infrastructure services in the ap-osaka-1 and ap-melbourne-1 regions
- Support for listing supported database versions for Autonomous Database Serverless, and selecting a version at provisioning time in the Database service
- Support for TCP proxy protocol versions on listener connection configurations in the Load Balancer service
- Support for calling the Notifications service in alternate realms
- Support for calling Oracle Cloud Infrastructure services in the eu-amsterdam-1 and me-jeddah-1 regions
- Support for the NoSQL Database service
- Support for filtering database versions by storage management type in the Database service
- Support for specifying paid listing types within pricing models in the Marketplace service
- Support for primary and non-primary instance types in the Content and Experience service
- Support for restarting autonomous databases in the Database service
- Support for private endpoints on autonomous databases in the Database service
- Support for IP-based policies in the Identity service
- Support for management of OAuth 2.0 client credentials in the Identity service
- Support for OCI Functions as a subscription protocol in the Notifications service
- Support for updating the shape of a Database System in the Database service
- Support for generating CPE configurations for download in the Networking service
- Support for private IPs and fault domains of cluster nodes in the Container Engine for Kubernetes service
- Support for calling Oracle Cloud Infrastructure services in the ca-montreal-1 region
- Support for Events service integration with alerts in the Budgets service
- Support for serial console connections in the Database service
- Support for preview database versions in the Database service
- Support for node reboot migration maintenance status and maintenance windows in the Database service
- Support for using instance metadata API v2 for instance principals authentication
- Support for Web Application Acceleration and Security configurations on instances in the Content and Experience service
- Support for shared database homes on Exadata Cloud at Customer resources in the Database service
- Support for Exadata database creation from backup in the Database service
- Support for conditions on JavaScript challenges, new action types on access rules, new policy configuration settings, exclusions on custom protection rules, and IP address lists on IP whitelists in the Web Application Acceleration and Security service
- Support for the Secrets Management service 
- Support for the Big Data service
- Support for updating class name, file URI, language, and spark version of applications in the Data Flow service
- Support for cross-region replication in the Object Storage service
- Support for retention rules in the Object Storage service
- Support for enabling and disabling pod security policy admission controllers in the Container Engine for Kubernetes service
- Support for changing compartments of runs and applications in the Data Flow service
- Support for getting usage information in the Key Management Vault service
- Support for custom Key Management service endpoints and private endpoints on stream pools in the Streaming service
- Support for access types on instances in the Content and Experience service
- Support for identity contexts in the Search service

### Breaking
- Removed support for v1 auth tokens in kubeconfig files in the `CreateClusterKubeconfigContentDetails` class of the Container Engine for Kubernetes service
- Removed the IDCS access token requirement on the delete deleteOceInstance operation in the Content and Experience service, which is why the `DeleteOceInstanceDetails` class was removed
- Set `compartment_id` as a required parameter in `list_stream_pools` for streaming service
- Field `hostname` in `NodeDetails` from Database service is changed to mandatory
- Deleted model autonomous_exadata_infrastructure_maintenance_window.rb from the database service.

## 2.7.0 - 2019-11-05
### Added
- Support for the Sydney (SYD) region
- Support for managing cluster networks in the Compute Autoscaling service
- Support for tracking asynchronous operations via work requests in the Database service
- Support for specifying the `auto_backup_window` field for scheduling backups in the Database service
- Support for network security groups on autonomous Exadata infrastructure in the Database service
- Support for Kubernetes secrets encryption in customer clusters, regional subnets, and cluster authentication for instance principals in the Container Engine for Kubernetes service
- Support for the Oracle Content and Experience service
- Support for importing state files in the Resource Manager service
- Support for Exadata Cloud at Customer in the Database service
- Support for free tier resources and system tags in the Load Balancing service
- Support for free tier resources and system tags in the Compute service
- Support for free tier resources and system tags in the Block Storage service
- Support for free tier and system tags on autonomous databases in the Database service
- Support for selecting the Terraform version to use in the Resource Manager service
- Support for bucket re-encryption in the Object Storage service
- Support for enabling / disabling bucket-level events in the Object Storage service
- Support for required tags in the Identity service
- Support for work requests on tagging operations in the Identity service
- Support for enumerated tag values in the Identity service
- Support for moving dynamic routing gateway resources across compartments in the Networking service
- Support for migrating zones from Dyn managed DNS to OCI in the DNS service
- Support for fast provisioning for virtual machine databases in the Database service
- Support for the new schema for events in the Audit service
- Support for entitlements in the Data Transfer service
- Support for custom scheduled backup policies on volumes in the Block Storage service
- Support for specifying the network type when launching virtual machine instances in the Compute service
- Support for Monitoring service integration in the Health Checks service
- Support for the Digital Assistant service
- Support for work requests on Instance Pool operations in the Compute service
- Support for wallet rotation operations on Autonomous Databases in the Database service
- Support for adding and removing image shape compatibility entries in the Compute service
- Support for managing redirects in the Web Application Acceleration and Security service
- Support for migrating zones from the Dyn HTTP Redirect Service to Oracle Cloud Infrastructure in the DNS service
- Support for the Analytics Cloud service
- Support for the Integration Cloud service
- Support for IKE versions in IPSec connections in the Virtual Networking service
- Support for getting a stack's Terraform state in the Resource Manager service

# Breaking
- The etag header has been removed from the responses for `NotificationDataPlaneClient.change_subscription_compartment()` and `NotificationControlPlaneClient.change_topic_compartment()`
- The class `OCI::Database::Models::CreateDbHomeWithDbSystemIdBase` was renamed to `OCI::Database::Models::CreateDbHomeBase` that impacts the following references:
    - `OCI::Database::DatabaseClient#create_db_home()` positional argument type
    - `OCI::Database::Models::CreateDbHomeWithDbSystemIdDetails` class extension
    - `OCI::Database::Models::CreateDbHomeWithDbSystemIdFromBackupDetails` class extension
- For `OCI::Dts::Models::TransferApplianceEntitlement`:
	- The `Status` parameter has been removed and replaced with `LifecycleState`
	- The `tenantId` parameter has been renamed as `id`
- The Audit service version to support the new schema was increased to 20190901.  Older versions of the SDK will continue to function to support Audit service version 20160918

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
