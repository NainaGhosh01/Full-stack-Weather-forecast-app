variable "app_name" {
  description = "App Service name"
}

variable "docker_image" {
  description = "Docker image from DockerHub"
}

variable "weather_api_key" {
  description = "Weather API Key"
  sensitive   = true
}
