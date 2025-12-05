variable "db_user" {
  description = "Database username for Postgres."
  type        = string
}

variable "db_pass" {
  description = "Database password for Postgres."
  type        = string
}

variable "network" {
  description = "Docker network to attach the database container to."
  type        = string
}
