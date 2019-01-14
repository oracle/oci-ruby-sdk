# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

# This script provides a basic example on how to work with path route sets on a load balancer by:
#
#   - Creating path route sets when the load balancer is created
#   - Creating/updating path route after a load balancer has been created (via the CreatePathRouteSet and UpdatePathRouteSet operations)
#   - Creating and updating listeners with path route sets
#
# This will use credentials and settings from the DEFAULT profile at ~/.oci/config (on windows
# "C:\Users\{user}\.oci\config"), however if that file does not exist we will automatically fall back to using
# ~/.oraclebmc/config (on windows "C:\Users\{user}\.oraclebmc\config")
#
# This script accepts three arguments:
#   - The first argument is the compartment where we'll create the load balancer and related resources
#   - The second argument is the first availability domain where we'll create a subnet
#   - The third argument is a second (different) availability domain where we'll create a subnet
#
# A load balancer needs some backing networking resources (at least a VCN and two subnets). For demonstration purposes
# this script will create these resources and delete them upon completion

require 'oci'
require 'pp'

def create_vcn_and_subnets(virtual_network, compartment_id, first_ad, second_ad)
  # Create a VCN
  vcn_name = 'ruby_sdk_test_lb_vcn'
  cidr_block = '10.0.0.0/16'
  result = virtual_network.create_vcn(
    OCI::Core::Models::CreateVcnDetails.new(
      cidrBlock: cidr_block,
      displayName: vcn_name,
      compartmentId: compartment_id
    )
  )

  get_vcn_response = virtual_network.get_vcn(result.data.id).wait_until(
    :lifecycle_state,
    OCI::Core::Models::Vcn::LIFECYCLE_STATE_AVAILABLE
  )
  vcn = get_vcn_response.data
  puts 'Created VCN'

  # Create a subnet
  subnet_name = 'ruby_sdk_test_lb_subnet1'
  subnet_cidr_block1 = '10.0.0.0/24'
  result = virtual_network.create_subnet(
    OCI::Core::Models::CreateSubnetDetails.new(
      compartmentId: compartment_id,
      availabilityDomain: first_ad,
      displayName: subnet_name,
      vcnId: vcn.id,
      cidrBlock: subnet_cidr_block1
    )
  )
  get_subnet_response = virtual_network.get_subnet(result.data.id).wait_until(
    :lifecycle_state,
    OCI::Core::Models::Subnet::LIFECYCLE_STATE_AVAILABLE
  )
  subnet_one = get_subnet_response.data
  puts 'Created Subnet 1'

  # Create another subnet
  subnet_name = 'ruby_sdk_test_lb_subnet2'
  subnet_cidr_block2 = '10.0.1.0/24'
  result = virtual_network.create_subnet(
    OCI::Core::Models::CreateSubnetDetails.new(
      compartmentId: compartment_id,
      availabilityDomain: second_ad,
      displayName: subnet_name,
      vcnId: vcn.id,
      cidrBlock: subnet_cidr_block2
    )
  )
  get_subnet_response = virtual_network.get_subnet(result.data.id).wait_until(
    :lifecycle_state,
    OCI::Core::Models::Subnet::LIFECYCLE_STATE_AVAILABLE
  )
  subnet_two = get_subnet_response.data
  puts 'Created Subnet 2'

  { vcn: vcn, subnets: [subnet_one, subnet_two] }
end

def delete_vcn_and_subnets(virtual_network, vcn_and_subnets)
  vcn = vcn_and_subnets[:vcn]
  subnet_one = vcn_and_subnets[:subnets][0]
  subnet_two = vcn_and_subnets[:subnets][1]

  get_subnet_response = virtual_network.get_subnet(subnet_one.id)
  virtual_network.delete_subnet(subnet_one.id)
  get_subnet_response.wait_until(
    :lifecycle_state,
    OCI::Core::Models::Subnet::LIFECYCLE_STATE_TERMINATED,
    # For a deletion, the record may no longer be available and the waiter may encounter a 404 when trying to retrieve it.
    # This flag tells the waiter to consider 404s as successful (which is only really valid for delete/terminate since
    # the record not being there anymore can signify a successful delete/terminate)
    succeed_on_not_found: true
  )

  get_subnet_response = virtual_network.get_subnet(subnet_two.id)
  virtual_network.delete_subnet(subnet_two.id)
  get_subnet_response.wait_until(
    :lifecycle_state,
    OCI::Core::Models::Subnet::LIFECYCLE_STATE_TERMINATED,
    succeed_on_not_found: true
  )

  get_vcn_response = virtual_network.get_vcn(vcn.id)
  virtual_network.delete_vcn(vcn.id)
  get_vcn_response.wait_until(
    :lifecycle_state,
    OCI::Core::Models::Vcn::LIFECYCLE_STATE_TERMINATED,
    succeed_on_not_found: true
  )
end

# Default config file and profile
load_balancer_client = OCI::LoadBalancer::LoadBalancerClient.new
virtual_network_client = OCI::Core::VirtualNetworkClient.new

compartment_id = ARGV[0]
first_ad = ARGV[1]
second_ad = ARGV[2]

vcn_and_subnets = create_vcn_and_subnets(virtual_network_client, compartment_id, first_ad, second_ad)
subnets = vcn_and_subnets[:subnets]

# As part of creating a load balancer, we can create path route sets. Note that this is a hash where each
# key is the path route set name and the value is the information on what routes are in the set.
#
# Additionally, when creating a listener as part of load balancer creation we can specify the path route
# set for that listener. This path route set needs to correspond to one of the ones we'll create as part of
# load balancer creation.
response = load_balancer_client.create_load_balancer(
  OCI::LoadBalancer::Models::CreateLoadBalancerDetails.new(
    compartmentId: compartment_id,
    displayName: 'PathRouteSetLB',
    shapeName: '100Mbps',
    subnetIds: [subnets[0].id, subnets[1].id],
    backendSets: {
      'backend-1' => OCI::LoadBalancer::Models::BackendSetDetails.new(
        policy: 'ROUND_ROBIN',
        healthChecker: OCI::LoadBalancer::Models::HealthCheckerDetails.new(
          protocol: 'HTTP',
          urlPath: '/',
          port: 80,
          retries: 1,
          timeoutInMillis: 100,
          intervalInMillis: 1000
        ),
        sessionPersistenceConfiguration: OCI::LoadBalancer::Models::SessionPersistenceConfigurationDetails.new(
          cookie_name: '*',
          disableFallback: false
        )
      ),
      'backend-2' => OCI::LoadBalancer::Models::BackendSetDetails.new(
        policy: 'ROUND_ROBIN',
        healthChecker: OCI::LoadBalancer::Models::HealthCheckerDetails.new(
          protocol: 'HTTP',
          urlPath: '/testurl2',
          port: 80,
          retries: 1,
          timeoutInMillis: 100,
          intervalInMillis: 1000
        )
      )
    },
    pathRouteSets: {
      'path-route-set-1' => OCI::LoadBalancer::Models::PathRouteSetDetails.new(
        pathRoutes: [
          OCI::LoadBalancer::Models::PathRoute.new(
            # Note that this name has to match one of the backend sets specified in the backendSets hash
            backendSetName: 'backend-1',
            path: '/example/1',
            pathMatchType: OCI::LoadBalancer::Models::PathMatchType.new(
              matchType: OCI::LoadBalancer::Models::PathMatchType::MATCH_TYPE_PREFIX_MATCH
            )
          ),
          OCI::LoadBalancer::Models::PathRoute.new(
            backendSetName: 'backend-1',
            path: '/other/path/2',
            pathMatchType: OCI::LoadBalancer::Models::PathMatchType.new(
              matchType: OCI::LoadBalancer::Models::PathMatchType::MATCH_TYPE_EXACT_MATCH
            )
          )
        ]
      )
    },
    listeners: {
      'listener1' => OCI::LoadBalancer::Models::ListenerDetails.new(
        defaultBackendSetName: 'backend-1',
        # This path route set name corresponds to a name/key in the pathRouteSets hash
        pathRouteSetName: 'path-route-set-1',
        port: 80,
        protocol: 'HTTP'
      )
    }
  )
)

# CreateLoadBalancer gives us a work request we can wait on. The load balancer will have been created
# upon successful completion of the work request.
work_request = OCI::LoadBalancer::Util.wait_on_work_request(
  load_balancer_client,
  response.headers['opc-work-request-id'],
  max_wait_seconds: 1200
)
load_balancer_ocid = work_request.load_balancer_id
puts 'Load balancer created'
puts '=' * 20

# We can list the path route sets on the load balancer
path_route_sets = load_balancer_client.list_path_route_sets(load_balancer_ocid)
puts 'Path route sets from list'
puts '=' * 20
pp path_route_sets.data

# We can also get an individual path route set
path_route_set = load_balancer_client.get_path_route_set(load_balancer_ocid, 'path-route-set-1').data
puts 'Path route set from GET'
puts '=' * 20
pp path_route_set

# And it's accessible via the load balancer itself
load_balancer = load_balancer_client.get_load_balancer(load_balancer_ocid).data
puts 'Load balancer details'
puts '=' * 20
pp load_balancer

# We can create another path route set on the load balancer. Note that this also returns a work request, and
# the new path route set will have been created upon successful completion of the work request.
response = load_balancer_client.create_path_route_set(
  OCI::LoadBalancer::Models::CreatePathRouteSetDetails.new(
    # This name needs to be unique amongst the path route sets on the load balancer
    name: 'path-route-set-2',
    pathRoutes: [
      OCI::LoadBalancer::Models::PathRoute.new(
        # Note that this needs to correspond to a backend set on the load balancer
        backendSetName: 'backend-2',
        path: '/example3/4',
        pathMatchType: OCI::LoadBalancer::Models::PathMatchType.new(
          matchType: OCI::LoadBalancer::Models::PathMatchType::MATCH_TYPE_EXACT_MATCH
        )
      ),
      OCI::LoadBalancer::Models::PathRoute.new(
        backendSetName: 'backend-2',
        path: '/some/kind/of/path',
        pathMatchType: OCI::LoadBalancer::Models::PathMatchType.new(
          matchType: OCI::LoadBalancer::Models::PathMatchType::MATCH_TYPE_EXACT_MATCH
        )
      )
    ]
  ),
  load_balancer_ocid
)
OCI::LoadBalancer::Util.wait_on_work_request(
  load_balancer_client,
  response.headers['opc-work-request-id'],
  max_wait_seconds: 1200
)

path_route_sets = load_balancer_client.list_path_route_sets(load_balancer_ocid)
puts 'Path route sets from list after creating another set'
puts '=' * 20
pp path_route_sets.data

# We can update the routes on a path route set. Note that this is a total replacement, so any routes which you want
# to preserve need to be passed as part of the update.
#
# In this example, we keep one of the path routes we defined above (the one for path /example3/4). The route for
# /some/kind/of/path will be removed as part of this update.
#
# Note that updating a path route also results in a work request that we can wait on until it succeeds
response = load_balancer_client.update_path_route_set(
  OCI::LoadBalancer::Models::UpdatePathRouteSetDetails.new(
    pathRoutes: [
      OCI::LoadBalancer::Models::PathRoute.new(
        backendSetName: 'backend-2',
        path: '/example3/4',
        pathMatchType: OCI::LoadBalancer::Models::PathMatchType.new(
          matchType: OCI::LoadBalancer::Models::PathMatchType::MATCH_TYPE_EXACT_MATCH
        )
      ),
      OCI::LoadBalancer::Models::PathRoute.new(
        backendSetName: 'backend-2',
        path: '/a/different/path',
        pathMatchType: OCI::LoadBalancer::Models::PathMatchType.new(
          matchType: OCI::LoadBalancer::Models::PathMatchType::MATCH_TYPE_EXACT_MATCH
        )
      )
    ]
  ),
  load_balancer_ocid,
  'path-route-set-2'
)
OCI::LoadBalancer::Util.wait_on_work_request(
  load_balancer_client,
  response.headers['opc-work-request-id'],
  max_wait_seconds: 1200
)

path_route_set = load_balancer_client.get_path_route_set(load_balancer_ocid, 'path-route-set-2').data
puts 'Path route set after update'
puts '=' * 20
pp path_route_set

# We can update the path route set on an existing listener
response = load_balancer_client.update_listener(
  OCI::LoadBalancer::Models::UpdateListenerDetails.new(
    defaultBackendSetName: 'backend-2',
    pathRouteSetName: 'path-route-set-2',
    port: 80,
    protocol: 'HTTP'
  ),
  load_balancer_ocid,
  'listener1'
)
OCI::LoadBalancer::Util.wait_on_work_request(
  load_balancer_client,
  response.headers['opc-work-request-id'],
  max_wait_seconds: 1200
)

load_balancer = load_balancer_client.get_load_balancer(load_balancer_ocid).data
puts 'Listener after update'
puts '=' * 20
pp load_balancer.listeners

# We can also create a listener with a path route set
response = load_balancer_client.create_listener(
  OCI::LoadBalancer::Models::CreateListenerDetails.new(
    name: 'listener2',
    defaultBackendSetName: 'backend-1',
    port: 8080,
    protocol: 'HTTP',
    pathRouteSetName: 'path-route-set-1'
  ),
  load_balancer_ocid
)
OCI::LoadBalancer::Util.wait_on_work_request(
  load_balancer_client,
  response.headers['opc-work-request-id'],
  max_wait_seconds: 1200
)

load_balancer = load_balancer_client.get_load_balancer(load_balancer_ocid).data
puts 'Listener after create new listener'
puts '=' * 20
pp load_balancer.listeners

# We now delete the load balancer
response = load_balancer_client.delete_load_balancer(load_balancer_ocid)
OCI::LoadBalancer::Util.wait_on_work_request(
  load_balancer_client,
  response.headers['opc-work-request-id'],
  max_wait_seconds: 1200
)
puts 'Deleted Load Balancer'

delete_vcn_and_subnets(virtual_network_client, vcn_and_subnets)
puts 'Deleted VCN and subnets'
puts 'Script finished'
