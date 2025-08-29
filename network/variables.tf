variable "YC_FOLDER_ID" {
  description = "Yandex Cloud Folder ID"
  type        = string
}

variable "YC_TOKEN" {
  description = "OAuth or IAM token for Yandex Cloud"
  type        = string
  sensitive   = true
}
