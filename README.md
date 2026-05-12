# OCI VCN with GitHub OIDC to OCI UPST

This repository creates an OCI Virtual Cloud Network (VCN) from GitHub Actions by exchanging the GitHub OIDC JWT for an OCI UPST token, then running Terraform with `auth = "SecurityToken"`.

It follows the JWT to UPST exchange pattern from `gautamm2707/oci_token_exchange_vass`, but keeps the repo focused on provisioning a VCN and avoids checking in generated keys or token material.

## What It Creates

- OCI VCN
- Optional DNS labels on the VCN
- Internet Gateway
- Route Table with a default route to the Internet Gateway
- Security List with optional inbound SSH and ICMP plus unrestricted egress
- Regional public subnet

## GitHub Secrets

Configure these repository secrets before running the workflow:

| Secret | Purpose |
| --- | --- |
| `CLIENT_ID` | IAM domain confidential app client ID used as the OIDC audience |
| `CLIENT_SECRET` | IAM domain confidential app client secret |
| `DOMAIN_BASE_URL` | IAM domain base URL, for example `https://idcs-...identity.oraclecloud.com` |
| `OCI_TENANCY` | Tenancy OCID for the OCI CLI config |
| `OCI_REGION` | OCI region, for example `us-ashburn-1` |
| `USER_OCID` | User OCID accepted by the OCI SDK config when using the UPST security token |
| `TF_VAR_TENANCY_OCID` | Tenancy OCID for the Terraform provider |
| `TF_VAR_COMPARTMENT_OCID` | Compartment OCID where the VCN will be created |

## Optional GitHub Variables

These can be repository variables or edited in `terraform/vcn/terraform.tfvars.example`.

| Variable | Default |
| --- | --- |
| `TF_VAR_region` | `us-ashburn-1` |
| `TF_VAR_vcn_display_name` | `github-upst-vcn` |
| `TF_VAR_vcn_cidr_block` | `10.10.0.0/16` |
| `TF_VAR_vcn_dns_label` | `upstvcn` |
| `TF_VAR_subnet_display_name` | `github-upst-public-subnet` |
| `TF_VAR_subnet_cidr_block` | `10.10.1.0/24` |
| `TF_VAR_subnet_dns_label` | `public` |
| `TF_VAR_allowed_ssh_cidr` | empty string disables SSH ingress |

## Run

1. Add the secrets above to the GitHub repository.
2. Open **Actions**.
3. Run **Create OCI VCN with JWT to UPST**.
4. Choose `plan`, `apply`, or `destroy`.

The workflow creates an ephemeral RSA key pair, requests a GitHub OIDC JWT, exchanges it for an OCI UPST token, writes a temporary OCI CLI config, and runs Terraform in `terraform/vcn`.

Terraform uses local state inside the GitHub Actions run. If you later want durable state across repeated applies/destroys, add a remote backend such as OCI Object Storage.
