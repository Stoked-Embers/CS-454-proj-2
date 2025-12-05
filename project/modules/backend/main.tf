terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

resource "docker_image" "backend" {
  name = var.image_tag

  build {
    context    = abspath("${path.root}/../actual")
    dockerfile = "Dockerfile"
  }
}

resource "docker_container" "backend" {
  name  = "backend-${count.index}"
  image = docker_image.backend.image_id
  count = 2

  env = [
    "DB_USER=${var.db_user}",
    "DB_PASS=${var.db_pass}"
  ]

  networks_advanced {
    name    = var.network
    aliases = ["backend"]
  }
}
