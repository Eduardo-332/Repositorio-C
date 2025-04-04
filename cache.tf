resource "azurerm_redis_cache" "redis" {
  name                          = "redis-${var.project}-${var.environment}"
  location                      = var.location
  resource_group_name           = azurerm_resource_group.rg.name
  capacity                      = 6
  family                        = "C"
  sku_name                      = "Basic"
  minimum_tls_version           = "1.2"
  public_network_access_enabled = true
  non_ssl_port_enabled          = false  # Corrección del argumento

  redis_configuration {
    
  }

  tags = var.tags
}

output "redis_hostname" {
  value = azurerm_redis_cache.redis.hostname
}

output "redis_ssl_port" {
  value = azurerm_redis_cache.redis.ssl_port
}
