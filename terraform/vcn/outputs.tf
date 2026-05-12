output "vcn_id" {
  description = "OCID of the VCN."
  value       = oci_core_virtual_network.this.id
}

output "vcn_cidr_block" {
  description = "CIDR block of the VCN."
  value       = oci_core_virtual_network.this.cidr_block
}

output "public_subnet_id" {
  description = "OCID of the public subnet."
  value       = oci_core_subnet.public.id
}

output "internet_gateway_id" {
  description = "OCID of the internet gateway."
  value       = oci_core_internet_gateway.this.id
}
