variable "content_type" {
  description = "The file content type. Must be iso for VM images or vztmpl for LXC images."
  default     = "iso"
}

variable "datastore" {
  description = "The identifier for the target datastore."
  default     = "local"
}

variable "file_name" {
  description = "The file name. If not provided, it is calculated using url. PVE will raise 'wrong file extension' error for some popular extensions file .raw or .qcow2 on PVE versions prior to 8.4."
  default     = ""
}

variable "nodename" {
  description = "Hostname where the image/iso is allocated."
}

variable "url" {
  description = "The URL to download the file from. Format https?://.*."
}

variable "checksum" {
  description = "The expected checksum of the file."
  default     = ""
}

variable "checksum_algorithm" {
  description = "The algorithm to calculate the checksum of the file. Must be md5 | sha1 | sha224 | sha256 | sha384 | sha512."
  default     = "sha256"
}
