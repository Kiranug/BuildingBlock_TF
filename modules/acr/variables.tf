variable "acr_name" {}
variable "resource_group_name" {}
variable "location" {}
variable "sku" {
  default = "Basic"
}
variable "aks_kubelet_identity_id" {}
