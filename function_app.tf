resource "azurerm_app_service_plan" "function_plan" {
  name                = "plan-${lower(var.project)}-${var.environment}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "FunctionApp"
  reserved            = true  # Required for Linux

  sku {
    tier = "Basic"
    size = "B1"
  }

  tags = var.tags
}

resource "azurerm_linux_function_app" "function_app" {
  name                       = var.project
  location                   = var.location
  resource_group_name        = azurerm_resource_group.rg.name
  service_plan_id            = azurerm_app_service_plan.function_plan.id
  storage_account_name       = azurerm_storage_account.saccount.name
  storage_account_access_key = azurerm_storage_account.saccount.primary_access_key
  functions_extension_version = "~4"
  https_only                 = true

  site_config {
    application_stack {
      node_version = "20"
    }
    always_on = true
  }

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = "1"
    "FUNCTIONS_WORKER_RUNTIME" = "node"
    "AzureWebJobsStorage"      = azurerm_storage_account.saccount.primary_connection_string
    "APPINSIGHTS_INSTRUMENTATIONKEY" = azurerm_application_insights.app_insights.instrumentation_key
  }

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}

resource "azurerm_application_insights" "app_insights" {
  name                = var.project
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  application_type    = "web"

  tags = var.tags
}
