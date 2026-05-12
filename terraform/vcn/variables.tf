variable "region" {
  type        = string
  description = "OCI region."
  default     = "us-ashburn-1"
}

variable "tenancy_ocid" {
  type        = string
  description = "OCI tenancy OCID."
}

variable "compartment_ocid" {
  type        = string
  description = "Compartment OCID where the VCN resources are created."
}

variable "vcn_display_name" {
  type        = string
  description = "Display name for the VCN."
  default     = "github-upst-vcn"
}

variable "vcn_cidr_block" {
  type        = string
  description = "CIDR block for the VCN."
  default     = "10.10.0.0/16"
}

variable "vcn_dns_label" {
  type        = string
  description = "DNS label for the VCN."
  default     = "upstvcn"
}

variable "subnet_display_name" {
  type        = string
  description = "Display name for the public subnet."
  default     = "github-upst-public-subnet"
}

variable "subnet_cidr_block" {
  type        = string
  description = "CIDR block for the public subnet."
  default     = "10.10.1.0/24"
}

variable "subnet_dns_label" {
  type        = string
  description = "DNS label for the public subnet."
  default     = "public"
}

variable "allowed_ssh_cidr" {
  type        = string
  description = "Optional source CIDR allowed to reach TCP/22. Leave empty to disable SSH ingress."
  default     = ""
}
