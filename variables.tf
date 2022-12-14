variable "gcp_region" {
  type    = string
  default = "GCP_REGION_FOR_RESOURCES"
}

variable "publicip" {
  type    = string
  default = "IP_IN_CIDR_FORMAT/32"
}

variable "gcp_user" {
  type    = string
  default = "USERNAME_FROM_PROJECT_SSH"
}

variable "privatekeypath" {
  type    = string
  default = "~/.ssh/google_compute_engine"
}

variable "gcp_project_id" {
  type    = string
  default = "PROJECT_ID_TO_HOST_VM"
}