variable "gcp_region" {
  type    = string
  default = "GCP_REGION_FOR_RESOURCE_CREATION"
}

variable "publicip" {
  type    = string
  default = "YOUR_PUBLIC_IP_IN_CIDR_FORMAT_FOR_CLUSTER_ACCESS/32"
}

variable "gcp_user" {
  type    = string
  default = "USERNAME_FROM_PROJECT_SSH_OR_OS_LOGIN"
}

variable "privatekeypath" {
  type    = string
  default = "~/.ssh/google_compute_engine"
}

variable "gcp_project_id" {
  type    = string
  default = "PROJECT_ID_TO_HOST_VM"
}