
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "ubuntu" {
  name = "ubuntu:24.04"
}

resource "docker_container" "infra_target" {
  name  = "commute-infra-target"
  image = docker_image.ubuntu.image_id

  command = ["sleep", "infinity"]
}
