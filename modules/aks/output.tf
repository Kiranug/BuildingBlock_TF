output "kube_config" {
  value     = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}

output "kubelet_identity_id" {
  value = azurerm_kubernetes_cluster.aks.identity[0].principal_id
}
