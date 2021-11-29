variable "morphues_access_key" {}
variable "morphues_secret_key" {}
variable "morphues_region" {}
variable "morphues_role_arn" {}
variable "morphues_role_arn_r53" {}
variable "linux_user" {}
variable "linux_pass" {}
variable "inbound_traffic_controllers" {}
variable "enable_public_ips" {}
variable "enable_elastic_ips" {}
variable "enable_loadbalancer" {}
variable "enable_nat_gateways" {}
variable "disable_selinux" {}
variable "gitlabToken" {}
variable "vpc" {}
variable "availability_zone" {}
# variable "subnets" {} broken in 5.3.4, uncomment once working
variable "subnet1" {}
variable "subnet2" {}
variable "subnet3" {}
variable "security_groups" {}
variable "power_schedule" {}
variable "key_name" {}
variable "zone_id" {}
variable "https_cert" {}

# when 5.3.4 array in Cloud Profile bug is fixed, simply change the below local to equal var.subnets
# this should minimize, if not eradicate, the need for changes elsewhere
locals {
    subnets = [var.subnet1, var.subnet2, var.subnet3]
}

locals {
    AppName = "<%=customOptions.applicationName.tokenize('|')[0]%>"
    BusinessGroup = "<%=customOptions.applicationName.tokenize('|')[1]%>"
    CostCode = "<%=customOptions.applicationName.tokenize('|')[2]%>"
    BusinessOwner = "<%=customOptions.applicationName.tokenize('|')[3]%>"
    AppCode = "<%=customOptions.applicationName.tokenize('|')[4]%>"
    AppOwner = "<%=customOptions.applicationName.tokenize('|')[5]%>"
}


output "Application Name" {
    value = local.AppName
}
output "Business Group" {
    value = local.BusinessGroup
}
output "Cost Code" {
    value = local.CostCode
}
output "Business Owner" {
    value = local.BusinessOwner
}
output "App Code" {
    value = local.AppCode
}
output "App Owner" {
    value = local.AppOwner
}
