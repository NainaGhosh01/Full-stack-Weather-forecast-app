provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "weather-rg"
  location = "East US"
}

resource "azurerm_app_service_plan" "plan" {
  name                = "weather-app-plan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_app_service" "app" {
  name                = var.app_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.plan.id

  site_config {
    linux_fx_version = "DOCKER|${var.docker_image}"
  }

  app_settings = {
    "WEATHER_API_KEY" = var.weather_api_key
    "WEBSITES_PORT"   = "5000"
  }
}
