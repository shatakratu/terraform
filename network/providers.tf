# Yandex cloud

terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "> 0.100"
    }
  }


# Terraform cloud

  cloud {
    organization = "sattvika"
    workspaces {
      name = "sattvika"
    }
  }
}


