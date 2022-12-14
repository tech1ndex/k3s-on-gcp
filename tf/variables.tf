variable "gcp_region" {
  type    = string
  default = "us-east1"
}

variable "publicip" {
  type    = string
  default = "24.36.167.67/32"
}

variable "gcp_user" {
  type    = string
  default = "tech1ndex"
}

variable "privatekeypath" {
  type    = string
  default = "~/.ssh/google_compute_engine"
}

variable "gcp_project_id" {
  type    = string
  default = "homelab-uptime-checks"
}