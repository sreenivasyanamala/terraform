#
# AWS ElasticSearch
#
variable "domain_name" {
  description = "Name of the domain"
  type        = string
}

variable "elasticsearch_version" {
  description = "The version of Elasticsearch to deploy."
  type        = string
  default     = "7.4"


variable "access_policies" {
  description = "IAM policy document specifying the access policies for the domain"
  type        = string
  default     = ""
}

# Advanced options
variable "advanced_options" {
  description = "Key-value string pairs to specify advanced configuration options. Note that the values for these configuration options must be strings (wrapped in quotes) or they may be wrong and cause a perpetual diff, causing Terraform to want to recreate your Elasticsearch domain on every apply"
  type        = map(string)
  default     = {}
}

# ebs_options
variable "ebs_options" {
  description = "EBS related options, may be required based on chosen instance size"
  type        = map
  default     = {}
}

variable "ebs_enabled" {
  description = "Whether EBS volumes are attached to data nodes in the domain"
  type        = bool
  default     = true
}

variable "ebs_options_volume_type" {
  description = "The type of EBS volumes attached to data nodes"
  type        = string
  default     = "gp2"
}

variable "ebs_options_volume_size" {
  description = "The size of EBS volumes attached to data nodes (in GB). Required if ebs_enabled is set to true"
  type        = number
  default     = 10
}

variable "ebs_options_iops" {
  description = "The baseline input/output (I/O) performance of EBS volumes attached to data nodes. Applicable only for the Provisioned IOPS EBS volume type"
  type        = number
  default     = 0
}

# encrypt_at_rest
variable "encrypt_at_rest" {
  description = "Encrypt at rest options. Only available for certain instance types"
  type        = map
  default     = {}
}

variable "encrypt_at_rest_enabled" {
  description = "Whether to enable encryption at rest"
  type        = bool
  default     = true
}

variable "encrypt_at_rest_kms_key_id" {
  description = "The KMS key id to encrypt the Elasticsearch domain with. If not specified then it defaults to using the aws/es service KMS key"
  type        = string
  default     = "alias/aws/es"
}

# node_to_node_encryption
variable "node_to_node_encryption" {
  description = "Node-to-node encryption options"
  type        = map
  default     = {}
}

variable "node_to_node_encryption_enabled" {
  description = "Whether to enable node-to-node encryption"
  type        = bool
  default     = true
}

# cluster_config 
variable "cluster_config" {
  description = "Cluster configuration of the domain"
  type        = map
  default     = {}
}

variable "cluster_config_instance_type" {
  description = "Instance type of data nodes in the cluster"
  type        = string
  default     = "r5.large.elasticsearch"
}

variable "cluster_config_instance_count" {
  description = "Number of instances in the cluster"
  type        = number
  default     = 3
}

variable "cluster_config_dedicated_master_enabled" {
  description = "Indicates whether dedicated master nodes are enabled for the cluster"
  type        = bool
  default     = true
}

variable "cluster_config_dedicated_master_type" {
  description = "Instance type of the dedicated master nodes in the cluster"
  type        = string
  default     = "r5.large.elasticsearch"
}

variable "cluster_config_dedicated_master_count" {
  description = "Number of dedicated master nodes in the cluster"
  type        = number
  default     = 3
}

variable "cluster_config_availability_zone_count" {
  description = "Number of Availability Zones for the domain to use with"
  type        = number
  default     = 3
}

variable "cluster_config_zone_awareness_enabled" {
  description = "Indicates whether zone awareness is enabled. To enable awareness with three Availability Zones"
  type        = bool
  default     = false
}

# snapshot_options
variable "snapshot_options" {
  description = "Snapshot related options"
  type        = map
  default     = {}
}

variable "snapshot_options_automated_snapshot_start_hour" {
  description = "Hour during which the service takes an automated daily snapshot of the indices in the domain"
  type        = number
  default     = 0
}

# vpc_options
variable "vpc_options" {
  description = "VPC related options, see below. Adding or removing this configuration forces a new resource"
  type        = map
  default     = {}
}

variable "vpc_options_security_group_ids" {
  description = "List of VPC Security Group IDs to be applied to the Elasticsearch domain endpoints. If omitted, the default Security Group for the VPC will be used"
  type        = list
  default     = []
}

variable "vpc_options_subnet_ids" {
  description = "List of VPC Subnet IDs for the Elasticsearch domain endpoints to be created in"
  type        = list
  default     = []
}

# log_publishing_options 
variable "log_publishing_options" {
  description = "Options for publishing slow logs to CloudWatch Logs"
  type        = map
  default     = {}
}

variable "log_publishing_options_log_type" {
  description = "A type of Elasticsearch log. Valid values: INDEX_SLOW_LOGS, SEARCH_SLOW_LOGS, ES_APPLICATION_LOGS"
  type        = string
  default     = "INDEX_SLOW_LOGS"
}

variable "log_publishing_options_cloudwatch_log_group_arn" {
  description = "iARN of the Cloudwatch log group to which log needs to be published"
  type        = string
  default     = ""
}

variable "log_publishing_options_enabled" {
  description = "Specifies whether given log publishing option is enabled or not"
  type        = bool
  default     = true
}

# cognito_options  
variable "cognito_options" {
  description = "Options for Amazon Cognito Authentication for Kibana"
  type        = map
  default     = {}
}

variable "cognito_options_enabled" {
  description = "Specifies whether Amazon Cognito authentication with Kibana is enabled or not"
  type        = bool
  default     = false
}

variable "cognito_options_user_pool_id" {
  description = "ID of the Cognito User Pool to use"
  type        = string
  default     = ""
}

variable "cognito_options_identity_pool_id" {
  description = "ID of the Cognito Identity Pool to use"
  type        = string
  default     = ""
}

variable "cognito_options_role_arn" {
  description = "ARN of the IAM role that has the AmazonESCognitoAccess policy attached"
  type        = string
  default     = ""
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map
  default     = {}
}


# Timeouts
variable "timeouts" {
  description = "Timeouts map."
  type        = map
  default     = {}
}

variable "timeouts_update" {
  description = "How long to wait for updates."
  type        = string
  default     = null
}
