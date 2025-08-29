
# variable "sattvika_folder" {
#   default     = "xxxxxxxxxxxxxxxxxx"
#   description = "sattvika folder id"
# }

variable "sattvika_folder" {
  description = "Folder ID in Yandex Cloud"
  type        = string
  sensitive   = true
}
