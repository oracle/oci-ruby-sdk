# Oracle Cloud Infrastructure Ruby SDK

This is Oracle Cloud Infrastructure SDK for Ruby. This project is open source and maintained by Oracle Corp. The home page for the project is <a href="https://docs.cloud.oracle.com/en-us/iaas/Content/API/SDKDocs/rubysdk.htm">here</a>.

This project is no longer being actively developed by Oracle. We will continue to address security vulnerabilities for the foreseeable future, and will respond to questions on github, but have no plans to introduce any new functionality, and may not be able to address any non-security related issues. We encourage developers to migrate to other OCI SDKs, and developers may fork this project and enhance it as they desire.

**Version 2.21.0**

This topic describes how to install, configure, and use the Oracle Cloud Infrastructure Ruby SDK.

## SDK Overview

The Ruby SDK supports the following services:

* Access Governance
* Account Management
* Analytics Cloud 
* Announcements
* AI Anomaly Detection service
* AI Language service
* AI Speech service
* AI Vision
* API Gateway
* Application Dependency Management
* Application Management service
* Application Performance Monitoring
* Audit
* Autonomous recovery
* Autoscaling (Compute)
* Bastion service
* Big Data
* Blockchain Platform
* Budgets
* Build service
* Caching
* Certificates service
* Classic Migration
* Cluster Placement Groups service
* Cloud Bridge
* Cloud Guard
* Cloud Migrations
* Compute Cloud@Customer
* Compute Instance Agent
* Compute Autoscaling
* Connector Hub
* Console Dashboard service
* Container Engine
* Content and Experience
* Core Services (which includes Networking, Compute, and Block Volume)
* Data Catalog
* Data Flow
* Data Labeling service
* Database Migration
* Database Tools service
* Data Integration
* Data Science
* Data Safe
* Data Transfer 
* Database
* Database Management
* DevOps service
* Digital Assistant
* Disaster Recovery
* Digital Media
* Document Understanding
* Domain Name System
* Email
* Enterprise Manager Warehouse
* Events
* Exadata Fleet Update
* File Storage
* Functions
* Fusion Apps as a Service
* Generative AI service 
* Generative AI Inference service
* Generic Artifacts service
* Globally Distributed Database service
* Golden Gate
* Governance Rules service
* Health Checks
* Identity and Access Management
* Identity Domains
* Incident Management
* Integration Cloud
* Java Management Service
* Java Management Service Downloads
* Key Management
* License Manager
* Limits
* Load Balancing
* Logging
* Logging Analytics
* Logging Search
* Logging Ingestion
* Management Agent Cloud
* Management Dashboard
* Marketplace
* Marketplace Publisher
* Monitoring
* MySQL Database service
* Network Firewall
* Network Load Balancing
* Network Monitoring
* Networking Topology
* Notification
* OCI Control Center
* OCI Control Center service
* OCI Registry
* OneSubscription service
* Operations Insights
* Optimizer
* Organizations
* OS Management Hub
* Oracle Content and Experience
* Oracle Roving Edge Infrastructure
* Object Storage
* Operator Access Control service
* Oracle NoSQL Database Cloud
* OS Management
* Process Automation
* PostgreSQL service
* Queue Service
* Quotas
* Resource Manager
* Search
* Service Catalog service
* Secret Management (for the Vault service)
* Secure Desktops service
* Service Mesh
* Service Connector Hub
* Source Code Management service
* Stack Monitoring
* Streaming
* Support Management
* Threat Intelligence
* Usage
* Visual Builder
* VMWare Solution
* Vulnerability Scanning
* Web Application Acceleration and Security
* Work Requests

**Licensing:** This SDK and sample is dual licensed under the Universal Permissive License 1.0 and the Apache License.


## SDK Attributes
The following table provides details about some of the attributes of the SDK.

<table>
<tbody>
	<tr>
		<td>Requests</td>
		<td>API methods expose required parameters as arguments and optional arguments as a hash (opts = {}). Create and update operations take request objects that mirror the properties of those objects.</td>
	</tr>
	<tr>
		<td>Responses</td>
		<td>All API methods return a Response object, which contains an HTTP status (200, 204, etc), headers, and data, and also directly exposes some commonly used response headers such as <code>opc-next_page</code>, and <code>opc-request_id</code>.</td>
	</tr>
	<tr>
		<td>Models</td>
		<td>Get, update, and create operations return first class objects of the corresponding type (such as User, Instance, etc) in Response.data.</td>
	</tr>
	<tr>
		<td>Errors</td>
		<td>
            The main exception classes for the SDK are:
            <ul>
                <li>{OCI::Errors::ServiceError ServiceError} is thrown when an Oracle Cloud Infrastructure service returns a non-2xx HTTP status code</li>
                <li>
                    {OCI::Errors::NetworkError NetworkError} is thrown when the issue is likely to be network-related rather than an application issue. This is defined as:
                    <ul>
                        <li>
                            Requests that were sent from the SDK, but for which the outcome was not a response from an Oracle Cloud Infrastructure service. Examples include a gateway timeout, read or connection timeouts from Net::HTTP, and any (Errno) exception that was generated by the request itself.
                        </li>
                        <li>Requests that result in a HTTP 408 (timeout)</li>
                    </ul>
                </li>
                <li>
                    {OCI::Errors::ResponseParsingError ResponseParsingError} is thrown when a response is received from an Oracle Cloud Infrastructure service, but the SDK could not parse it into the appropriate model type for inserting into an {OCI::Response}
                </li>
            </ul>
        </td>
	</tr>
    <tr>
		<td>Signing</td>
		<td>Requests made through the API classes are automatically signed, but you can also use the {OCI::Signer Signer} directly to sign your own requests if needed.</td>
	</tr>
	<tr>
		<td>Automatic Paging</td>
		<td>Response objects for lists support {OCI::Response#each page enumeration}. See example code later in this file.</td>
	</tr>
	<tr>
		<td>Waiters</td>
		<td>
            Responses for get requests support waiting for a particular states using {OCI::Response#wait_until wait_until}. See example code later in this file.
            <p>
                In addition to using waiters, you can use the CompositeOperation classes in the SDK (e.g. {OCI::Core::ComputeClientCompositeOperations}) to perform
                an action on a resource and wait for it to enter a particular state (or states). The CompositeOperation classes provide convenience methods so that
                you yourself do not have to invoke an operation and then separately invoke a waiter. An example of using the CompositeOperations classes: <a href="https://github.com/oracle/oci-ruby-sdk/blob/master/examples-oci/composite_operations_example.rb">composite_operations_example.rb</a>
            </p>
        </td>
	</tr>
	<tr>
		<td>HTTP Client</td>
		<td>The Ruby SDK uses Net::HTTP for HTTP requests. Information on how to configure the client, including configuring a proxy, can be found in the <b>Configuring the HTTP Client</b> section of this page</td>
	</tr>
    <tr>
		<td>Instance Principals Authentication</td>
		<td>
            The Ruby SDK supports <a href="https://docs.cloud.oracle.com/Content/Identity/Tasks/callingservicesfrominstances.htm">Instance Principals</a> authentication via the use of the {OCI::Auth::Signers::InstancePrincipalsSecurityTokenSigner} class. An example of using Instance Principals authentication: <a href="https://github.com/oracle/oci-ruby-sdk/blob/master/examples-oci/instance_principals_example.rb">instance_principals_example.rb</a>
        </td>
	</tr>
    <tr>
		<td>Upload Manager</td>
		<td>
            The Object Storage service supports multipart uploads to make large object uploads easier by splitting the large object into parts. The Ruby SDK supports raw multipart upload operations for advanced use cases, as well as a higher-level upload class that uses the multipart upload APIs.
            <p>
                <a href="https://docs.cloud.oracle.com/Content/Object/Tasks/usingmultipartuploads.htm">Managing Multipart Uploads</a> provides links to the APIs used for raw multipart upload operations. Higher-level uploads can be performed using the {OCI::ObjectStorage::Transfer::UploadManager}.
            </p>
            <p>
                The UploadManager simplifies interaction with the Object Storage service by abstracting away the method used to upload objects and can handle uploading an entire object at once, or in multiple parts if it is of sufficient size (which is configurable via a {OCI::ObjectStorage::Transfer::UploadManagerConfig} object). In the latter case, the UploadManager will split a large object into parts for you, upload the parts in parallel, and then recombine and commit the parts as a single object in Object Storage.
            </p>
            <p>
                Example of using the Upload Manager: <a href="https://github.com/oracle/oci-ruby-sdk/blob/master/examples-oci/upload_manager.rb">upload_manager.rb</a>
                <br>
                Example of using the Upload Manager from <code>stdin</code>: <a href="https://github.com/oracle/oci-ruby-sdk/blob/master/examples-oci/upload_manager_stdin_example.rb">upload_manager_stdin_example.rb</a>
            </p>
        </td>
	</tr>
    <tr>
        <td>Retries</td>
        <td>
            By default the Ruby SDK will not retry failed service calls, however the SDK supports specifying per client and per operation retry configurations. An example of using retries: <a href="https://github.com/oracle/oci-ruby-sdk/blob/master/examples-oci/retry_example.rb">retry_example.rb</a>
        </td>
    </tr>
</tbody>
</table>


## SDK Requirements

To use the Ruby SDK, you must have:

* An Oracle Cloud Infrastructure account.
* A user created in that account, in a group with a policy that grants the desired permissions. This can be a user for yourself, or another person/system that needs to call the API. For an example of how to set up a new user, group, compartment, and policy, see [Adding Users](https://docs.cloud.oracle.com/Content/GSG/Tasks/addingusers.htm) in the Getting Started Guide. For a list of typical policies you may want to use, see [Common Policies](https://docs.cloud.oracle.com/Content/Identity/Concepts/commonpolicies.htm) in the User Guide.
* A keypair used for signing API requests, with the public key uploaded to Oracle. Only the user calling the API should be in possession of the private key. See the configuration information below.
* Ruby version 2.6 or 2.7 running on Mac, Linux or Windows.

# Downloading and Installing the Gem File
## Installing the SDK


 Install from [RubyGems](https://rubygems.org/gems/oci):

 `gem install oci`

You can also [download the SDK](https://github.com/oracle/oci-ruby-sdk/releases) as a zip file containing the gem file, examples, and documentation.

 Install the gem with the following command:


 `gem install oci-*.gem`

### Troubleshooting an Installation
If you see "Unable to resolve dependencies”, you can install the dependencies manually:

	gem install inifile

## SDK modules and namespacing
The top level module name for the Ruby SDK is `OCI`, however using `OracleBMC` as the top level namespace is also supported. For example, you can reference the configuration object as both `OCI::Config` and `OracleBMC::Config`.

Using `OCI` as the top level module name is preferred and it is also used in the SDK API Reference. Additionally, if you inspect the type of an SDK object it will always be reported as being under the `OCI::` module.

You can start from importing oci module, this will allow you to access the whole OCI Ruby SDK.

	require 'oci'

However, in some cases, if you're only using limited number of OCI services, importing the whole OCI module is not necessary and would possibly increase the loading time of your application. Instead importing the `oci` module, you can manually import sub modules based on your requirement:

	require 'oci/common' # This is commonly required for using oci ruby sdk
    require 'oci/auth/auth' # This module is commonly required to authenticate api calls
    require 'oci/core/core' # Replace this with your target service


## Configuring the SDK

To use any of the APIs, you must supply a {OCI::Config Config} object. You can create the object directly in code, or you can create one in a config file. The configuration includes:

* Required credentials and settings: See [SDK and Tool Configuration](https://docs.cloud.oracle.com/Content/API/Concepts/sdkconfig.htm) in the User Guide.
* Optional SDK-specific settings: See the {OCI::Config Config} object for the full list of config options. Samples for setting the config through code.


    config = OCI::Config.new
    config.tenancy = 'ocid1.tenancy.oc1..aa'  # Directly setting the tenancy OCID
    config.user = ENV['oci_user/or_some_other_name'] # Setting the user OCID from an environment variable


Note that the Ruby SDK does not support parsing custom attributes in the configuration file.

## Forward Compatibility

Some response fields are enum-typed. In the future, individual services may return values not covered by existing enums for that field. To address this possibility, every enum-type response field has an additional value named "UNKNOWN_ENUM_VALUE". If a service returns a value that is not recognized by your version of the SDK, then the response field will be set to this value. Please ensure that your code handles the "UNKNOWN_ENUM_VALUE" case if you have conditional logic based on an enum-typed field.

## Thread Safety

The OCI Ruby SDK is using net/http package which is not guaranteed to be thread-safe. 

If you're using this SDK in a multi-threaded application, you may have to create unique clients for each thread.

## New Region Support

If you are using a version of the SDK released prior to the announcement of a new region, you may still be able to reach it, depending on whether the region is in the oraclecloud.com realm.

A *region* is a localized geographic area. For more information on regions and how to identify them, see [Regions and Availability Domains](https://docs.cloud.oracle.com/iaas/Content/General/Concepts/regions.htm).

A *realm* is a set of regions that share entities. You can identify your realm by looking at the domain name at the end of the network address. For example, the realm for ``xyz.abc.123.oraclecloud.com`` is ``oraclecloud.com``.

### oraclecloud.com Realm

For regions in the oraclecloud.com realm, even if the `OCI::Regions::REGION_ENUM` does not contain the new region, the forward compatibility of the SDK can automatically handle it. You can pass new region names just as you would pass ones that are already defined. For more information on passing region names in the configuration, see [Configuring the SDK](#configuring-the-sdk). For details on `OCI::Regions::REGION_ENUM`, see [OCI::Regions](https://docs.cloud.oracle.com/iaas/tools/ruby/latest/OCI/Regions.html).

### Other Realms

For regions in realms other than oraclecloud.com, you can use the following workarounds to reach new regions with earlier versions of the SDK.

You can set the endpoint when creating a new client:
```
identity_client = OCI::Identity::IdentityClient.new(
  endpoint: 'https://identity.us-gov-phoenix-1.oraclegovcloud.com'
)
```

If you are authenticating via instance principals, you can set the `federation_endpoint` for the region using `InstancePrincipalsSecurityTokenSigner` when initializing the signer:
```
instance_principals_signer = OCI::Auth::Signers::InstancePrincipalsSecurityTokenSigner.new(
  federation_endpoint: 'https://auth.us-gov-phoenix-1.oraclegovcloud.com/v1/x509'
)
```

## Writing Your First Ruby Program with the SDK

    require 'oci'

    # This will load the config file at the default location, and will
    # use the tenancy from that config as the compartment in the
    # call to list_users.
    api = OCI::Identity::IdentityClient.new(region: OCI::Regions::REGION_US_PHOENIX_1)
    response = api.list_users(OCI.config.tenancy)
    response.data.each { |user| puts user.name }

## Loading Alternate Configurations

You can also load a config file from a different location, and/or specify a different profile from the config file:

    require 'oci'

    my_config = OCI::ConfigFileLoader.load_config(config_file_location:'my_config', profile_name:'USER_TWO')
    api = OCI::Identity::IdentityClient.new(config:my_config)
    response = api.get_user(my_config.user)
    puts 'User Name: ' + response.data.name

Or you can create a {OCI::Config Config} programmatically. Note that the global value {OCI#config OCI.config} will always attempt to load the DEFAULT profile from the default config file location unless it has been explicitly set to another value.

The default config file location is `~/.oci/config` (on Windows `C:\Users\{user}\.oci\config`).

## Configuring the HTTP Client

The underlying HTTP client used by the SDK can be configured by setting the {OCI::ApiClient#request_option_overrides ApiClient.request_option_overrides} on the client. An example on how to do this, showing all supported options, is:

    require 'oci'

    identity = OCI::Identity::IdentityService.new

    identity.api_client.request_option_overrides = {
      # The path to the PEM-formatted CA certificate file.
    	# The file can contain several CA certificates
    	ca_file: '/path/to/pem/file',

    	# The path to a directory of PEM-formatted CA certificate files
    	ca_path_cert: '/path/to/cert/directory',

    	# An OpenSSL::X509::Certificate object as client certificate
      cert: OpenSSL::X509::Certificate.new(...),

    	# The X509::Store to verify peer certificate.
    	cert_store: OpenSSL::X509::Store.new(...),

    	# One of the available ciphers from OpenSSL::SSL::SSLContext#ciphers
    	ciphers: ...,

    	# Close the connection immediately if the server sent no response body
        close_on_empty_response: true,

    	# An OpenSSL::PKey::RSA or OpenSSL::PKey::DSA object
    	key: ...,

    	# The SSL timeout in seconds
    	ssl_timeout: 60,

    	# The SSL version to use. See OpenSSL::SSL::SSLContext#ssl_version
    	ssl_version: ...,

    	# The verify callback for the server certification verification
    	verify_callback: ...,

    	# The maximum depth for the certificate chain verification
    	verify_depth: 3,

    	# Either OpenSSL::SSL::VERIFY_PEER or OpenSSL::SSL::VERIFY_NONE
    	# Using OpenSSL::SSL::VERIFY_NONE (i.e. not validating the SSL certificate) is not
    	# recommended
    	verify_mode: OpenSSL::SSL::VERIFY_PEER
    }

Note that these correspond to a subset of the keys that can be provided as `opts` to the `Net::HTTP` [start](https://ruby-doc.org/stdlib-2.4.3/libdoc/net/http/rdoc/Net/HTTP.html#method-c-start) method.

### Setting a proxy
If the SDK is running in an environment which requires the use of a proxy server for outgoing HTTP requests, this can be configured by providing via:

* Providing an environment variable; or
* Providing an {OCI::ApiClientProxySettings} object. Here is an example of the different ways to create this object:

#### Proxy via environment variable
As the SDK uses `Net::HTTP`, the `http_proxy` environment variable can be used to specify a proxy:

    export HTTP_PROXY="http://10.10.1.10:3128"

When using the environment variable approach, no code changes need to be made.

Note that this does not support providing a username and password to the proxy, *except* when using Ruby 2.5+ on Linux, FreeBSD or macOS (Darwin). Otherwise, if a username and password is required then the {OCI::ApiClientProxySettings} object method can be used.

#### Proxy via the ApiClientProxySettings object
An {OCI::ApiClientProxySettings} object can be used to capture proxy settings. Here are the different ways an object can be created:


	# This creates an ApiClientProxySettings with a nil proxy address and will make the API client
	# bypass all proxies
	proxy_settings = OCI::ApiClientProxySettings.new(nil)

	# This creates an ApiClientProxySettings that will use the proxy at 10.10.1.10:3128 and will
	# not provide a username and password to the proxy
	proxy_settings = OCI::ApiClientProxySettings.new("10.10.1.10", 3128)

	# This creates an ApiClientProxySettings with a username and password. In production, you should use an appropriate password/secret management mechanism to vend the username and password
	# rather than having the credentials in code
	proxy_settings = OCI::ApiClientProxySettings.new("10.10.1.10", 3128, "username", "pass")

Once an {OCI::ApiClientProxySettings} object has been created, it can be used when creating or modifying a client:

	# At client creation time
	identity = OCI::Identity::IdentityService.new(proxy_settings: proxy_settings)

	# When updating a client
	identity.api_client.proxy_settings = proxy_settings

	# The proxy_settings can also be nil'ed out. This will make the ApiClient fall back to
	# using the http_proxy environment variable (if present)
	identity.api_client.proxy_settings = nil

## Exceptions

### Service Errors
Any operation that receives a response with a non-2xx HTTP status code from an Oracle Cloud Infrastructure service will cause an exception of type {OCI::Errors::ServiceError ServiceError} to be thrown by the SDK.

For information about common service errors returned by OCI, see [API Errors](https://docs.cloud.oracle.com/Content/API/References/apierrors.htm).

The key attributes to inspect when dealing with a {OCI::Errors::ServiceError} are:

* {OCI::Errors::ServiceError#request_id request_id} if you need to contact Oracle about a particular request, please provide this request ID
* {OCI::Errors::ServiceError#status_code status_code} contains the HTTP status code of the response
* {OCI::Errors::ServiceError#service_code service_code} should contain a value from the *Error Code* field as described in the *API Errors* page
* {OCI::Errors::ServiceError#request_made request_made} contains the actual `Net::HTTPRequest` which was sent by the SDK

You can also call {OCI::Errors::ServiceError#to_s to_s} on the error to get a summary of the key information about the error.

#### HTTP 3xx Responses
The SDK will throw exceptions of type {OCI::Errors::ServiceError ServiceError} on HTTP 3xx responses. This impacts operations that support conditional GETs. This includes {OCI::ObjectStorage::ObjectStorageClient#get_object} and {OCI::ObjectStorage::ObjectStorageClient#head_object} methods as these can return responses with a HTTP status code of 304 if passed an `if_none_match`, which corresponds to the current etag of the object or bucket.

In order to account for this, you should catch {OCI::Errors::ServiceError ServiceError} and check its `status_code` attribute for the HTTP status code. For example:

    require 'oci'

    object_storage = OCI::ObjectStorage::ObjectStorageClient.new

    begin
        get_object_response = object_storage.get_object('my_namespace', 'my_bucket', 'my_object', if_none_match: 'some_etag_value')
    rescue OCI::Errors::ServiceError => err
        # Do nothing if the object exists but has not been modified (based on the etag value), otherwise raise the exception
        raise if err.status_code != 304
    end


### Network Errors
{OCI::Errors::NetworkError NetworkError} is thrown when the issue is likely to be network related rather than an application issue. This is defined as:

* Requests which were sent from the SDK but the outcome was not a response from an Oracle Cloud Infrastructure service. Further examples of include:
  * Gateway timeouts
  * Read or connection timeouts
  * Any {Errno} exception which was generated by making the request
* Requests which resulted in a HTTP 408 (timeout)

The key attributes to inspect when dealing with a {OCI::Errors::NetworkError} are:

* {OCI::Errors::NetworkError#request_made request_made} and {OCI::Errors::NetworkError#response_received response_received} contain the `Net::HTTPRequest` and `Net::HTTPResponse`, respectively
* {OCI::Errors::NetworkError#code code} contains the HTTP status code of the response

You can also call {OCI::Errors::NetworkError#to_s to_s} on the error to get a summary of the key information about the error. In addition, the {OCI::Errors::NetworkError#cause NetworkError.cause} of the {OCI::Errors::NetworkError NetworkError} can be inspected to see the original error that caused the {OCI::Errors::NetworkError NetworkError} to be thrown.

### Response Parsing Errors
{OCI::Errors::ResponseParsingError ResponseParsingError} is thrown when a response was received from an Oracle Cloud Infrastructure service but the SDK could not parse it into the appropriate model type to put into an {OCI::Response}.

The key attributes to inspect when dealing with a {OCI::Errors::ResponseParsingError} are:

* {OCI::Errors::ResponseParsingError#request_made request_made} and {OCI::Errors::ResponseParsingError#response_received response_received} contain the `Net::HTTPRequest` and `Net::HTTPResponse`, respectively
* {OCI::Errors::ResponseParsingError#response_body response_body} contains the response data which failed to parse

You can also call {OCI::Errors::ResponseParsingError#to_s to_s} on the error to get a summary of the key information about the error. In addition, the {OCI::Errors::ResponseParsingError#cause ResponseParsingError.cause} of the {OCI::Errors::ResponseParsingError ResponseParsingError} can be inspected to see the original error that caused the {OCI::Errors::ResponseParsingError ResponseParsingError} to be thrown.

### Other Errors
The other errors you may encounter while using the SDK are:

* {OCI::Errors::MaximumWaitTimeExceededError MaximumWaitTimeExceededError} when using {OCI::Response#wait_until} or when using {OCI::LoadBalancer::Util#wait_on_work_request}
* {OCI::Errors::WorkRequestFailedError WorkRequestFailedError} when using {OCI::LoadBalancer::Util#wait_on_work_request}. The {OCI::Errors::WorkRequestFailedError#work_request work_request} attribute can be inspected to get the actual work request details
* {OCI::Errors::MultipartUploadError MultipartUploadError} when using {OCI::ObjectStorage::Transfer::UploadManager UploadManager}. The {OCI::Errors::MultipartUploadError#errors errors} attribute can be inspected to see what errors occurred during the upload, and the {OCI::Errors::MultipartUploadError#upload_id upload_id} can be used if you wish to try and resume the upload via the UploadManager's {OCI::ObjectStorage::Transfer::UploadManager#resume resume} method

## Examples
The example code in this section shows how various parts of the Ruby SDK work. More examples can be found from the [Ruby SDK on GitHub](https://github.com/oracle/oci-ruby-sdk/tree/master/examples-oci).

### Management Operations on a User
The following example runs create, read, update, and delete (CRUD) operations on users.

    require 'oci'

    compartment = OCI.config.tenancy

    api = OCI::Identity::IdentityClient.new
    users = api.list_users(compartment_id = compartment).data
    puts "There are currently " + users.length.to_s + " users."

    # Create User
    request = OCI::Identity::Models::CreateUserDetails.new
    request.compartment_id = compartment
    request.name = "userA"
    request.description = "example user"
    response =  api.create_user(request)

    puts "Created user " + response.data.name
    user_id = response.data.id

    users = api.list_users(compartment_id = compartment).data
    puts "There are now " + users.length.to_s + " users."

    # Get User
    response =  api.get_user(user_id = user_id)

    # Update User (using a request object)
    newDescription = "updated user description"
    request = OCI::Identity::Models::UpdateUserDetails.new
    request.description = "Updated description"
    response = api.update_user(user_id, request)

    puts "Updated description to:" + response.data.description

    # Update User (using a hash)
    newDescription = "updated without a request object"
    response = api.update_user(user_id, { description: "Updated again, but using a hash instead of an object." })

    # Delete User
    api.delete_user(user_id)

    users = api.list_users(compartment_id = compartment).data
    puts "Back to " + users.length.to_s + " users."

### Paging Through Results
The following example shows how to page through results. It also gives an example of supplying optional parameters.

    require 'oci'

    api = OCI::Identity::IdentityClient.new
    compartment = OCI.config.tenancy

    ### Automatic paging:
    api.list_users(compartment, limit:'3').each { |r| r.data.each { |user| puts user.name }}

    ### Manual paging:
    request_number = 0
    next_page = nil

    loop do
      response = api.list_users(compartment, {limit: '3', page: next_page})

      puts "Page " + request_number.to_s
      response.data.each { |user| puts user.name }

      break unless response.has_next_page?
      next_page = response.next_page
      request_number += 1
    end

### Launching an Instance and Waiting for a State
The following example shows how to launch an instance (which assumes that you already have a subnet created), and then wait until the instance is running.

    require 'oci'

    ssh_public_key = File.open(File.expand_path(public_key_file), "rb").read

    request = OCI::Core::Models::LaunchInstanceDetails.new
    request.availability_domain = availability_domain # TODO: Set an availability domain, such as 'kIdk:PHX-AD-2'
    request.compartment_id = compartment_id # TODO: set your compartment ID here
    request.display_name = 'my_instance'
    request.image_id = image_id # TODO: set your image ID here. You can see the available options with list_images.
    request.shape = shape # TODO: set your instance shape. You can see the available options with list_shapes.
    request.subnet_id = subnet_id # TODO: set your subnet ID here
    request.metadata = {'ssh_authorized_keys' => ssh_public_key}

    api = OCI::Core::ComputeClient.new
    response = api.launch_instance(request)
    instance_id = response.data.id
    response = api.get_instance(instance_id).wait_until(:lifecycle_state, OCI::Core::Models::Instance::LIFECYCLE_STATE_RUNNING)

### Waiting for state using a proc/lambda
Instead of waiting until the attribute of a resource reaches a given state, the `wait_until` method can also be passed a proc/lambda via its `eval_proc` keyword argument.
Using `eval_proc` may be useful in situations where logic other than checking if an attribute has a certain value is needed, for example checking
that an attribute is one of a possible set of values. `eval_proc` should take a single argument, which is the raw response received from the service call, and its result
should be a truthy value if the waiter should stop waiting, and it should be falsey otherwise. If the `eval_proc` is provided, then neither the `property`
nor `state` parameters should be provided.

An example using a lambda is:

    require 'oci'

    request = OCI::Core::Models::CreateVcnDetails.new
    request.cidr_block = '10.0.0.0/16'
    request.display_name = 'my_test_vcn'
    request.compartment_id = compartment_id # TODO: set your compartment ID here

    api = OCI::Core::VirtualNetworkClient.new
    response = api.create_vcn(request)
    vcn_id = response.data.id

    response = api.get_vcn(vcn.id).wait_until(eval_proc: lambda { |response| response.data.lifecycle_state == OCI::Core::Models::Vcn::LIFECYCLE_STATE_AVAILABLE })

An example using a proc is:

    require 'oci'

    request = OCI::Core::Models::CreateVcnDetails.new
    request.cidr_block = '10.0.0.0/16'
    request.display_name = 'my_test_vcn'
    request.compartment_id = compartment_id # TODO: set your compartment ID here

    api = OCI::Core::VirtualNetworkClient.new
    response = api.create_vcn(request)
    vcn_id = response.data.id

    check_available_proc = Proc.new do |response|
      [OCI::Core::Models::Vcn::LIFECYCLE_STATE_AVAILABLE].include?(response.data.lifecycle_state)
    end

    response = api.get_vcn(vcn.id).wait_until(eval_proc: check_available_proc)

### Waiting on terminated/deleted resources
When waiting for a request to be terminated/deleted, there is a chance that doing a GET of that resource will return a 404 because the resource is no longer available. Instead
of having to catch this, for example:

    require 'oci'

    api = OCI::Core::VirtualNetworkClient.new
    api.delete_vcn(vcn.id)

    begin
        api.get_vcn(vcn.id).wait_until(:lifecycle_state, OCI::Core::Models::Vcn::LIFECYCLE_STATE_TERMINATED)
    rescue OCI::Errors::ServiceError => e
        raise unless e.status_code == 404
    end

You can instruct the waiter to take care of this for you and consider that a 404 means success. For example:

    require 'oci'

    api = OCI::Core::VirtualNetworkClient.new
    api.delete_vcn(vcn.id)
    api.get_vcn(vcn.id).wait_until(:lifecycle_state, OCI::Core::Models::Vcn::LIFECYCLE_STATE_TERMINATED, succeed_on_not_found: true)

Using the `succeed_on_not_found` keyword argument is likely only useful when waiting on temrinated/deleted resources.

### Signing a Raw Request
The {OCI::Signer} can be used to sign arbitrary requests to the Oracle Cloud Infrastructure Services. The following example uses Net::HTTP to call the IAM service directly.

    require 'oci'
    require 'net/http'

    config = OCI::ConfigFileLoader.load_config(config_file_location:my_config_file_location)
    endpoint = OCI::Regions.get_service_endpoint(config.region, :IdentityClient)

    uri = URI(endpoint + '/20160918/users/' + config.user)
    request = Net::HTTP::Get.new(uri)

    signer = OCI::Signer.new(config.user, config.fingerprint, config.tenancy, config.key_file, pass_phrase:my_private_key_pass_phrase)
    signer.sign(:get, uri.to_s, request, nil)

    result = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => true) {|http|
      http.request(request)
    }

    puts result.body


## Documentation

Full documentation, including prerequisites, installation, and configuration instructions can be found [here](docs.cloud.oracle.com/Content/API/SDKDocs/rubysdk.htm).

API reference can be found [here](https://docs.cloud.oracle.com/tools/ruby/latest/frames.html).

## Changes

See [CHANGELOG](https://github.com/oracle/oci-ruby-sdk/blob/master/CHANGELOG.md).

## Contributing

oci-ruby-sdk is an open source project. See [CONTRIBUTING](https://github.com/oracle/oci-ruby-sdk/blob/master/CONTRIBUTING.md) for details.

Oracle gratefully acknowledges the contributions to oci-ruby-sdk that have been made by the community.

## Notifications
To be notified when a new version of the Ruby SDK is released, subscribe to the [Atom feed](https://rubygems.org/gems/oci/versions.atom).

## Known Issues

You can find information on any known issues with the SDK [here](https://docs.cloud.oracle.com/Content/knownissues.htm) and under the [Issues](https://github.com/oracle/oci-ruby-sdk/issues) tab of this project's [GitHub repository](https://github.com/oracle/oci-ruby-sdk).

## SSE Support

For SSE response, Ruby SDK is having some performance issue where the response is not returning as a TRUE streaming mode. It's actually returning 
in a chunked mode, which waits until it receive multiple lines of SSE response into one block and then return the result. This behavior is caused by the base HTTP
client package(Net::HTTP) which is the only HTTP package we use in Ruby SDK Please refer genai_generate_text_example in examples-oci folder to use SSE support.

## Questions or Feedback?
You can post an issue on the [Issues](https://github.com/oracle/oci-ruby-sdk/issues) tab of this project's [GitHub repository](https://github.com/oracle/oci-ruby-sdk).

Addtional ways to get in touch:

* [Stack Overflow](https://stackoverflow.com/): Please use the [oracle-cloud-infrastructure](https://stackoverflow.com/questions/tagged/oracle-cloud-infrastructure) and [oci-ruby-sdk](https://stackoverflow.com/questions/tagged/oci-ruby-sdk) tags in your post
* [Developer Tools section](https://community.oracle.com/community/cloud_computing/bare-metal/content?filterID=contentstatus%5Bpublished%5D~category%5Bdeveloper-tools%5D&filterID=contentstatus%5Bpublished%5D~objecttype~objecttype%5Bthread%5D) of the Oracle Cloud forums
* [My Oracle Support](https://support.oracle.com)

## License

Copyright (c) 2016, 2021, Oracle and/or its affiliates.  All rights reserved.

This software is dual-licensed to you under the Universal Permissive License (UPL) 1.0 as shown at https://oss.oracle.com/licenses/upl
or Apache License 2.0 as shown at http://www.apache.org/licenses/LICENSE-2.0. You may choose either license.

See [LICENSE](https://github.com/oracle/oci-ruby-sdk/blob/master/LICENSE.txt) for more details.
