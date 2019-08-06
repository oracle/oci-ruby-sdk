# Copyright (c) 2016, 2019, Oracle and/or its affiliates. All rights reserved.

# This script provides a basic example of how to you can create a budget and an alert rule on the budget.
# It then shows how to perform updates, reads, and deletes. It will:
#
#   * Create a budget
#   * List budgets in the compartment
#   * Get a single budget (the one that was created above)
#   * Create an alert rule on the budget to trigger when forecast spend reaches 100% of the budget amount, specifically:
#       type: FORECAST
#       threshold: 100
#       thresholdType: PERCENTAGE
#   * List alert rules in the budget
#   * Get a single alert rule (the one that was created above)
#   * Update the budget amount
#   * Update the alert rule threshold
#   * Delete the alert rule
#   * Delete the budget
#
# This script accepts five arguments:
#
#   * The ocid of the compartment for the budget, which should be the tenancy root compartment
#   * The target type of the budget, which should be COMPARTMENT or TAG.
#   * The target for the budget.
#       For COMPARTMENT budget, this should be the target compartment OCID;
#       For TAG budget, this should be the target tag in String format 'TagNamespace.TagDefinition.TagValue'.
#   * The amount for the budget, which should an unformatted number.
#   * An email address to be used as the budget alert rule recipient.
#
# Format:
#   budget_example.rb <compartment ID> <target type> <target> <amount> <recipient>
#
# Example run:
#   ruby examples/budget_example.rb 'ocid1.compartment.oc1..aaaaaaaac4xqx43texeuonfionxsx4okzfsya5evr2goe2t7v5wntztaymab' COMPARTMENT 'ocid1.compartment.oc1..aaaaaaaac4xqx43texeuonfionxsx4okzfsya5evr2goe2t7v5wntztaymab' 1000 suppression@rubysdkexample.com

require 'oci'
require 'pp'

if ARGV.length != 5
  raise 'This example expects 5 arguments: '\
      'compartment OCID, '\
      'target type (COMPARTMENT or TAG), '\
      'target (compartment OCID or cost tracking tag in String format \'TagNamespace.TagDefinition.TagValue\'), '\
      'budget amount, '\
      'alert rule recipient'
end

compartment_id = ARGV[0]
target_type = ARGV[1]
target = ARGV[2]
amount = ARGV[3]
recipient = ARGV[4]

budget_client = OCI::Budget::BudgetClient.new

# create a budget
create_budget_response = budget_client.create_budget(
  OCI::Budget::Models::CreateBudgetDetails.new(
    compartment_id: compartment_id,
    target_type: target_type,
    targets: [target],
    amount: amount.to_f,
    reset_period: 'MONTHLY'
  )
)

puts 'Created budget:'
pp create_budget_response.data

budget_id = create_budget_response.data.id

# list all budgets
budgets = []
budget_client.list_budgets(compartment_id).each do |list_budget_reponse|
  budgets += list_budget_reponse.data
end

puts 'ListBudgets for compartment with OCID: ' + compartment_id
pp budgets

# get a single budget
get_budget_response = budget_client.get_budget(budget_id)
puts 'GetBudget with OCID: ' + get_budget_response.data.id
pp get_budget_response.data

# create alert rule on the budget
create_alert_rule_response = budget_client.create_alert_rule(
  budget_id,
  OCI::Budget::Models::CreateAlertRuleDetails.new(
    type: 'FORECAST',
    threshold: 100,
    threshold_type: 'PERCENTAGE',
    recipients: recipient
  )
)
puts 'Created AlertRule:'
pp create_alert_rule_response.data

alert_rule_id = create_alert_rule_response.data.id

# list out all alert rules on the budget
alert_rules = []
budget_client.list_alert_rules(budget_id).each do |list_alert_rules_response|
  alert_rules += list_alert_rules_response.data
end
puts 'ListAlertRules for budget with OCID: ' + budget_id
pp alert_rules

# get a single alert rule (the one we just created)
get_alert_rule_response = budget_client.get_alert_rule(budget_id, alert_rule_id)
puts 'GetAlertRule with OCID: ' + alert_rule_id
pp get_alert_rule_response.data

# update the budget amount to increase it by 10%
update_budget_response = budget_client.update_budget(
  budget_id,
  OCI::Budget::Models::UpdateBudgetDetails.new(amount: amount.to_f * 1.1)
)
puts 'Updated budget with OCID: ' + budget_id
puts 'New budget amount = ' + update_budget_response.data.amount.to_s

# update the alert rule to make it trigger at 80% of actual spend and add a message.
update_alert_rule_response = budget_client.update_alert_rule(
  budget_id,
  alert_rule_id,
  OCI::Budget::Models::UpdateAlertRuleDetails.new(
    threshold: 80,
    type: 'ACTUAL',
    message: 'Spending has reached 80% of the budget'
  )
)
puts 'Updated AlertRule with OCID: ' + alert_rule_id
puts "New alert rule threshold = #{update_alert_rule_response.data.threshold}, " \
  "type = #{update_alert_rule_response.data.type}"

# (Clean-up) delete the alert rule
budget_client.delete_alert_rule(budget_id, alert_rule_id)
puts 'Delete AlertRule with OCID: ' + alert_rule_id

# (Clean-up) delete the budget
# Note, this triggers a cascading delete of all alert rules in the budget, and would have deleted the alert rule above.
budget_client.delete_budget(budget_id)
puts 'Delete Budget with OCID: ' + budget_id

puts 'Script Finished'
