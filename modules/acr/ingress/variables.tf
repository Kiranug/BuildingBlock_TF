variable "namespace" {
  default = "ingress-basic"
}

variable "load_balancer_ip" {
  description = "Optional static IP if you want to reserve one"
  type        = string
  default     = ""
}
