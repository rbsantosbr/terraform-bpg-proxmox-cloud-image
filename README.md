# terraform-bpg-proxmox-cloud-image

## Description

Terraform module which downloads cloud images or iso's on the proxmox host.

## Usage

```hcl
module "cloud-image" {
  source = "../terraform-bpg-proxmox-cloud-image"

  content_type = "iso"
  datastore = "local"
  nodename = "pve-host01"
  url      = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
  checksum = "0d8345a343c2547e55ac815342e6cb4a593aa5556872651eb47e6856a2bb0cdd"
  checksum_algorithm = "sha256"
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_bpg/proxmox"></a> [proxmox](#requirement\_bpg/proxmox) | >= 0.68.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [proxmox](#provider\_bpg/proxmox) | >= 0.68.0 |

## Inputs

- `content_type`: The file content type. Must be `iso` for VM images or `vztmpl` for LXC images.
- `datastore`: The identifier for the target datastore.
- `file_name` (Optional): The file name. If not provided, it is calculated using url. PVE will raise 'wrong file extension' error for some popular extensions file .raw or .qcow2 on PVE versions prior to 8.4.
- `nodename`: Hostname where the image/iso is allocated.
- `url`: The URL to download the file from. Format `https?://.*`.
- `checksum` (Optional): The expected checksum of the file.
- `checksum_algorithm` (Optional): The algorithm to calculate the checksum of the file. Must be `md5` | `sha1` | `sha224` | `sha256` | `sha384` | `sha512`.

## Outputs

- `id`: The unique identifier of this resource.

## Notes

- To use this module you need to load a *.env* file ( `source .env`) exporting the following variables with their respective values:

```bash
  export PROXMOX_VE_ENDPOINT=''
  export PROXMOX_VE_API_TOKEN=''
  export PROXMOX_VE_SSH_AGENT=true
  export PROXMOX_VE_SSH_USERNAME=''
```
