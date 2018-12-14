# AWS Labeling

## Usage

```hcl
module "base_labels" {
  source     = "./terraform"
  stage      = "QA"
  region     = "europa"
  service    = ""
  attributes = []
  delimiter  = "-"
  tags       = "${map( "Owner", "Infra")}"
}

module "cassandra_labels" {
  source  = "./terraform"
  context = "${module.base_labels.context}"
  service = "Cassandra"
}
```

First module will give you : 

```
id = qa-europe
tags = {
  Service = qa-europe
  Owner = Infra
  Region = europe
  Stage = qa
}

```

Second Module adds cassandra specific name label: 

```
cassandra_id = qa-europe-cassandra
cassandra_tags = {
  Service = qa-europe-cassandra
  Owner = Infra
  Region = europe
  Stage = qa
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| additional\_tag\_map | Additional tags for appending to each tag map | map | `<map>` | no |
| attributes | Additional attributes (e.g. `1`) | list | `<list>` | no |
| context | Default context to use for passing state between label invocations | map | `<map>` | no |
| delimiter | Delimiter to be used between `region`, `environment`, `stage`, `service` and `attributes` | string | `-` | no |
| enabled | Set to false to prevent the module from creating any resources | string | `true` | no |
| environment | Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT' | string | `` | no |
| label\_order | The naming order of the id output and service tag | list | `<list>` | no |
| region | region, which could be your organization region | string | `` | no |
| service | Solution service, e.g. 'app' or 'jenkins' | string | `` | no |
| stage | Stage, e.g. 'prod', 'staging', 'dev', OR 'source', 'build', 'test', 'deploy', 'release' | string | `` | no |
| tags | Additional tags (e.g. `map('BusinessUnit','XYZ')` | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| attributes | List of attributes |
| context | Context of this module to pass to other label modules |
| delimiter | Delimiter between `region`, `environment`, `stage`, `service` and `attributes` |
| environment | Normalized environment |
| id | Disambiguated ID |
| label\_order | The naming order of the id output and service tag |
| region | Normalized region |
| service | Normalized service |
| stage | Normalized stage |
| tags | Normalized Tag map |
| tags\_as\_list\_of\_maps | Additional tags as a list of maps, which can be used in several AWS resources |



