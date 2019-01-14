# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

# This script provides a basic example of how to use the Email Delivery service in the Ruby SDK.
#
# This will use credentials and settings from the DEFAULT profile at ~/.oci/config (on windows
# "C:\Users\{user}\.oci\config"), however if that file does not exist we will automatically fall back to using
# ~/.oraclebmc/config (on windows "C:\Users\{user}\.oraclebmc\config")
#
# The script will demonstrate:
#
#     * Creating, retrieving, listing and deleting email senders
#     * Creating, retrieving, listing and deleting email suppressions
#     * Obtaining SMTP credentials for your IAM user so that you can send emails.
#       See https://docs.cloud.oracle.com/Content/Email/Tasks/configuresmtpconnection.htm for more
#       information on sending emails
#
# Note that email senders are created in the compartment which you specify, but the suppressions are always created at the tenancy
# level. The tenancy will be read from your configuration file
#
# Format:
#   email_service_example.rb <compartment ID> <sender email> <suppression email>
#
# Example run:
#   ruby examples/email_service_example.rb 'ocid1.compartment.oc1..aaaaaaaac4xqx43texeuonfionxsx4okzfsya5evr2goe2t7v5wntztaymab' sender@rubysdkexample.com suppression@rubysdkexample.com

require 'oci'
require 'pp'

compartment_id = ARGV[0]
sender_address = ARGV[1]
suppression_address = ARGV[2]
email_client = OCI::Email::EmailClient.new
identity_client = OCI::Identity::IdentityClient.new
tenancy_id = OCI.config.tenancy
user_id = OCI.config.user

puts 'Creating Sender'
puts '=' * 20
create_sender_response = email_client.create_sender(
  OCI::Email::Models::CreateSenderDetails.new(
    compartment_id: compartment_id,
    email_address: sender_address
  )
)
pp create_sender_response.data
puts

# A sender has a lifecycle state, and we can wait for it to become available
get_sender_response =
  email_client.get_sender(create_sender_response.data.id)
              .wait_until(:lifecycle_state, OCI::Email::Models::Sender::LIFECYCLE_STATE_ACTIVE)
sender = get_sender_response.data
puts 'Sender after waiting'
puts '=' * 20
pp sender
puts

# We can list all senders, and also provide optional filters and sorts. Here we'll list all
# senders sorted by their email address, and also demonstrate filtering by sender email
# address (an exact match filter)
#
# Listing senders is a paginated operation, so we can use .each to iterate over responses
puts 'Listing all senders sorted by email ascending'
puts '=' * 20
email_client.list_senders(compartment_id, sort_by: 'EMAILADDRESS', sort_order: 'ASC').each do |response|
  response.data.each { |s| pp s }
end
puts

puts 'Listing all senders filtered by a dummy address - expect no results'
puts '=' * 20
email_client.list_senders(compartment_id, email_address: "fake-#{sender_address}").each do |response|
  response.data.each { |s| pp s }
end
puts

# Suppressions do not have a lifecycle state, so we don't have to wait on anything after creation
puts 'Creating suppression'
puts '=' * 20
create_suppression_response = email_client.create_suppression(
  OCI::Email::Models::CreateSuppressionDetails.new(
    compartment_id: tenancy_id, # Suppressions are defined at the tenancy level
    email_address: suppression_address
  )
)
suppression = create_suppression_response.data
puts suppression
puts

# We can list all suppressions, and also provide optional filters and sorts. Here we'll list all
# suppressions sorted by their time created, and also demonstrate filtering by suppression email
# address (an exact match filter)
#
# Listing suppressions is a paginated operation, so we can use .each to iterate over responses
puts 'Listing all suppressions sorted by time created descending'
puts '=' * 20
email_client.list_suppressions(tenancy_id, sort_by: 'TIMECREATED', sort_order: 'DESC').each do |response|
  response.data.each { |s| pp s }
end
puts

puts 'Listing all suppressions filtered by a dummy address - expect no results'
puts '=' * 20
email_client.list_suppressions(tenancy_id, email_address: "fake-#{suppression_address}").each do |response|
  response.data.each { |s| pp s }
end
puts

# We can delete a sender and wait for it to be gone. Since we have a previous get response,
# we can use it to wait_until the snapshot has been deleted. If not, we need to call
# email_client.get_sender in order to obtain a response to wait on. It is recommended
# that this be done BEFORE the delete is issued in case the call to GET after DELETE returns
# a 404 (i.e. the resource may already be gone after the delete is issued)
#
# We set succeed_on_not_found on the waiter so that if the waiter receives a 404 back
# from the service it considers this as a successful delete.
puts 'Deleting Sender'
puts '=' * 20
email_client.delete_sender(sender.id)
get_sender_response.wait_until(
  :lifecycle_state,
  OCI::Email::Models::Sender::LIFECYCLE_STATE_DELETED,
  succeed_on_not_found: true
)
puts 'Deleted sender'
puts

# Suppressions do not have a lifecycle state, so we don't have to wait on anything after deletion
puts 'Deleting Suppression'
puts '=' * 20
email_client.delete_suppression(suppression.id)
puts 'Deleted suppression'
puts

# In order to send email, we'll need to create an SMTP credential associated with an IAM user. More
# information on sending email can be found here:
# https://docs.cloud.oracle.com/Content/Email/Tasks/configuresmtpconnection.htm
#
# Note, also, that an IAM user can only have two active SMTP credentials at any time
puts 'Creating SMTP credential'
puts '=' * 20
create_smtp_credential_response = identity_client.create_smtp_credential(
  OCI::Identity::Models::CreateSmtpCredentialDetails.new(
    description: 'New credential'
  ),
  user_id
)
# Note that the password for the SMTP credential is ONLY available in the create response, so you
# should store/save this as it won't be retrievable later
puts create_smtp_credential_response.data
puts

# We can update the description of an SMTP credential
puts 'Updating SMTP credential description'
puts '=' * 20
update_smtp_credential_response = identity_client.update_smtp_credential(
  user_id,
  create_smtp_credential_response.data.id,
  OCI::Identity::Models::UpdateSmtpCredentialDetails.new(
    description: 'Updated credential description'
  )
)
puts update_smtp_credential_response.data
puts

# We can list the credentials for a user. Note that this is not a paginated operation
puts 'List SMTP credentials'
puts '=' * 20
identity_client.list_smtp_credentials(user_id).data.each { |cred| pp cred }
puts

puts 'Deleting SMTP credential'
puts '=' * 20
identity_client.delete_smtp_credential(user_id, create_smtp_credential_response.data.id)
puts 'Deleted credential'
puts

puts 'Script finished'
