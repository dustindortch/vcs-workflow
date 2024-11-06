terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "= 2.3.0"
    }
  }
}

provider "local" {
  # Configuration options
}

variable "product" {
  type        = string
  description = "A HashiCorp product name"
  default     = "X - Terraform"
}

resource "local_file" "tf_file" {
  content  = "\n This is a CSX ${var.product} workshop. New and improved in HCP Terraform!\n\n"
  filename = "${path.module}/terraform.txt"
}

output "text" {
  value = local_file.tf_file.content
}
