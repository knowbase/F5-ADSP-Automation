variable "gcp_project_id" {
  type        = string
  description = "GCP project ID."
}

variable "gcp_region" {
  type        = string
  default     = "us-west1"
  description = "GCP region."
}

variable "tf_state_bucket" {
  type        = string
  description = "GCS bucket name used for Terraform remote state."
}

variable "infra_state_prefix" {
  type        = string
  default     = "state/uc4/infra"
  description = "GCS prefix where infra state is stored."
}

variable "k8s_state_prefix" {
  type        = string
  default     = "state/uc4/k8s"
  description = "GCS prefix where k8s state is stored."
}

variable "namespace" {
  type        = string
  default     = "nginx-gateway"
  description = "Kubernetes namespace for the NGF control plane and the Gateway."
}

variable "nginx_jwt" {
  type        = string
  sensitive   = true
  description = "NGINX Plus license JWT. Used for the license secret and as the docker registry username."
}

variable "nginx_registry" {
  type        = string
  default     = "private-registry.nginx.com"
  description = "NGINX private registry hostname used by the imagePullSecret."
}

variable "chart_version" {
  type        = string
  default     = "2.6.4"
  description = "nginx-gateway-fabric chart version."
}

variable "nginx_plus_image_repository" {
  type        = string
  default     = "private-registry.nginx.com/nginx-gateway-fabric/nginx-plus-f5waf"
  description = "Data plane image repository for NGINX Plus. Must be the -f5waf variant for the WAF sidecars to be available."
}

variable "nginx_plus_image_tag" {
  type        = string
  default     = "2.6.4"
  description = "Data plane image tag. Must match the chart version."
}

variable "gatewayclass_name" {
  type        = string
  default     = "nginx"
  description = "GatewayClass the chart creates and the Gateway references."
}

variable "gateway_api_crds_url" {
  type        = string
  default     = "https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.5.1/standard-install.yaml"
  description = "URL to the upstream Gateway API standard-channel CRDs. Version must match the one NGF supports."
}

variable "waf_policy_name" {
  type        = string
  default     = "waf-policy"
  description = "Name of the WAFPolicy resource attached to the Gateway."
}

variable "waf_bundle_url" {
  type        = string
  default     = ""
  sensitive   = true
  description = "Signed HTTPS URL to the compiled WAF policy bundle (.tgz). Set via TF_VAR_waf_bundle_url by the deploy workflow; left empty on destroy."
}
