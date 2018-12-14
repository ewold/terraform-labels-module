output "id" {
  value       = "${local.enabled ? local.id : ""}"
  description = "Disambiguated ID"
}

output "service" {
  value       = "${local.enabled ? local.service : ""}"
  description = "Normalized service"
}

output "region" {
  value       = "${local.enabled ? local.region : ""}"
  description = "Normalized region"
}

output "stage" {
  value       = "${local.enabled ? local.stage : ""}"
  description = "Normalized stage"
}

output "environment" {
  value       = "${local.enabled ? local.environment : ""}"
  description = "Normalized environment"
}

output "attributes" {
  value       = "${local.attributes}"
  description = "List of attributes"
}

output "delimiter" {
  value       = "${local.enabled ? local.delimiter : ""}"
  description = "Delimiter between `region`, `environment`, `stage`, `service` and `attributes`"
}

output "tags" {
  value       = "${local.tags}"
  description = "Normalized Tag map"
}

output "tags_as_list_of_maps" {
  value       = ["${local.tags_as_list_of_maps}"]
  description = "Additional tags as a list of maps, which can be used in several AWS resources"
}

output "context" {
  value       = "${local.output_context}"
  description = "Context of this module to pass to other label modules"
}

output "label_order" {
  value       = "${local.label_order_final_list}"
  description = "The naming order of the id output and service tag"
}
