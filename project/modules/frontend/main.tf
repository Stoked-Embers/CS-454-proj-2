terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

resource "docker_image" "frontend" {
  name = "nginx:latest"
}

resource "docker_container" "frontend" {
  name  = "frontend"
  image = docker_image.frontend.image_id

  ports {
    internal = 80
    external = 8080
  }

  volumes {
    host_path      = "${abspath(path.module)}/nginx.conf"
    container_path = "/etc/nginx/nginx.conf"
    read_only      = true
  }

  networks_advanced {
    name = var.network
  }
}
