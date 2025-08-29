# Yandex Cloud provider

provider "yandex" {
  token     = var.YC_TOKEN
  folder_id = var.YC_FOLDER_ID
  zone      = "ru-central1-a"
}

# Terraform set

terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "> 0.100"
    }
  }

  cloud {
    organization = "sattvika"
    workspaces {
      name = "sattvika"
    }
  }
}
