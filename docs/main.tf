terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13"
    }
  }
}

provider "docker" {}

resource "docker_container" "dind_container" {
  name  = "dind"
  image = "docker:dind"
  privileged = true
}

resource "docker_image" "jenkins_image" {
  name = "jenkins/jenkins:latest"
}

resource "docker_container" "jenkins_container" {
  name  = "jenkins"
  image = docker_image.jenkins_image.latest
  ports {
    internal = 8080
    external = 8080
  }
  depends_on = [
    docker_container.dind_container
  ]
}
