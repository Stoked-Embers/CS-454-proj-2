terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "docker" {}

resource "docker_network" "local_net" {
  name = "local_net"
}

module "database" {
  source  = "./modules/database"
  db_user = var.db_user
  db_pass = var.db_pass
  network = docker_network.local_net.name
}

module "backend" {
  source    = "./modules/backend"
  image_tag = "my-backend:local"
  db_user   = var.db_user
  db_pass   = var.db_pass
  network   = docker_network.local_net.name
}

module "frontend" {
  source  = "./modules/frontend"
  network = docker_network.local_net.name
}
