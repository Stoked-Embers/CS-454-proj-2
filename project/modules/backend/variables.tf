variable "image_tag" {
  description = "Backend image tag to deploy."
  type        = string
}

variable "network" {
  description = "Docker network to attach the backend container to."
  type        = string
}

variable "db_user" {
  description = "Database username passed to the backend."
  type        = string
}

variable "db_pass" {
  description = "Database password passed to the backend."
  type        = string
}
