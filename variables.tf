variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP deployment region"
  type        = string
  default     = "us-east1"
}

variable "zones" {
  description = "List of zones to use (first element used for single‑node)"
  type        = list(string)
  default     = ["us-east1-b", "us-east1-c"]
}

variable "nodes_count" {
  description = "Number of GG9 nodes. 1 = single node"
  type        = number
  default     = 1
}

variable "name_prefix" {
  description = "Name prefix to be used for all resources"
  type        = string
  default     = "gridgain9db"
}

variable "machine_type" {
  description = "GCP machine type"
  type        = string
  default     = "e2-medium"  # 2vCPU / 4GB memory
}

variable "image_id" {
  description = "ImageID to use for boot disk"
  type        = string
}

variable "enable_project_oslogin" {
  description = "Allow OS Login at project level"
  type        = bool
  default     = false
}

variable "enable_oslogin" {
  description = "Enable OS Login to compute instance"
  type        = bool
  default     = true
}

variable "oslogin_access_principals" {
  description = "List of principals that are granted access via IAP and SSH. Or leave blank to take the current user. Examples: user:alice@example.com, group:devops@example.com, serviceAccount:sa@project.iam.gserviceaccount.com"
  type    = list(string)
  default = []
}

variable "ssh_pub_key" {
  description = "SSH public key used to connect to instances (algorithm + public key). If empty, none will be provisioned"
  type        = string
  default     = ""
}

variable "root_disk_size_gb" {
  description = "Boot disk size in GB"
  type        = number
  default     = 128
}

variable "root_disk_type" {
  description = "Boot disk size type"
  type        = string
  default     = "pd-balanced"
}

variable "root_disk_throughput" {
  description = "Root disk throughput in MB/s"
  type        = number
  default     = null
}

variable "root_disk_iops" {
  description = "Amount of provisioned IOPS for root disk"
  type        = number
  default     = null
}

variable "vpc_id" {
  description = "ID of an existing VPC network to attach"
  type        = string
  default     = ""
}

variable "subnet_id" {
  description = "Subnet ID to be used for deployment. If empty, module should provision new subnets"
  type        = string
  default     = ""
}

variable "subnet_cidr" {
  description = "CIDR for private subnet"
  type        = string
  default     = "10.0.0.0/24"
}

variable "public_access_enable" {
  description = "Whether to assign external IPs to instances"
  type        = bool
  default     = false
}

variable "public_allowlist" {
  description = "CIDR allow list for public subnet"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "gridgain_config" {
  description = "GridGain config"
  type        = string
  default     = ""
}

variable "gridgain_logging_config" {
  description = "GridGain logging config"
  type        = string
  default     = ""
}

variable "gridgain_license" {
  description = "GridGain license"
  type        = string
  default     = ""
}

variable "gridgain_ssl_enable" {
  description = "Whether SSL should be enabled"
  type        = bool
  default     = false
}

variable "gridgain_ssl_cert" {
  description = "GridGain SSL certificate. Important: The certificate must be issued for the domain zone that will be specified in gridgain_cluster_dns variable"
  type        = string
  default     = ""
}

variable "gridgain_ssl_key" {
  description = "GridGain SSL key"
  type        = string
  default     = ""
}

variable "gridgain_cluster_dns" {
  description = "GridGain Cluster DNS (FQDN)"
  type        = string
  default     = ""
}

variable "keystore_password" {
  description = "SSL Keystore password"
  type        = string
  default     = ""
}

variable "enable_disk_encryption" {
  description = "Enable disk encryption using KMS keys"
  type        = bool
  default     = false
}

variable "kms_location" {
  description = "KMS location"
  type        = string
  default     = "us-east1"
}

variable "kms_key_ring_id" {
  description = "KMS keyring id"
  type        = string
  default     = ""
}

variable "kms_crypto_key_id" {
  description = "KMS crypto key in keyring"
  type        = string
  default     = ""
}

variable "marketplace_labels" {
  description = "Consumption‑tracking + common labels"
  type        = map(string)
  default     = {}
}
