 terraform {
   required_providers {
     aws = {
       source  = "hashicorp/aws"
       version = "~> 3.0"
     }
   }
 }

 provider "aws" {
   access_key = var.morphues_access_key
   secret_key  = var.morphues_secret_key
   region = var.morphues_region
   assume_role {
     role_arn = var.morpheus_role_arn
   }
   default_tags {
    tags = {
      ApplicationName     = local.AppName,
      ApplicationOwner    = local.AppOwner,
      ApplicationCode     = local.AppCode,
      CostCode            = local.CostCode,
      BusinessGroup       = local.BusinessGroup,
      BusinessOwner       = local.BusinessOwner,
      Environment         = "<%=instance.instanceContext%>"
    }
  }
 }

 provider "aws" {
   alias = "route53"
   access_key = var.morphues_access_key
   secret_key  = var.morphues_secret_key
   region = var.morphues_region
   assume_role {
     role_arn = var.morpheus_role_arn_r53
   }
   default_tags {
    tags = {
      ApplicationName     = local.AppName,
      ApplicationOwner    = local.AppOwner,
      ApplicationCode     = local.AppCode,
      CostCode            = local.CostCode,
      BusinessGroup       = local.BusinessGroup,
      BusinessOwner       = local.BusinessOwner,
      Environment         = "<%=instance.instanceContext%>"
    }
  }
}
