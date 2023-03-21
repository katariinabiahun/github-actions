variable "autoscale" {
  description = "Should the Kubernetes Auto Scaler be enabled for this Node Pool"
  nullable    = false
  type        = bool
  default     = false
}

variable "default_node_pool_name" {
  description = "The name which should be used for the default Kubernetes Node Pool. The name must start with a lowercase letter, have max length of 12, and only have characters a-z0-9."
  nullable    = false
  type        = string
  #
  default = "nodpoolka"
}

variable "dns_prefix" {
  description = "The name of the DNS prefix"
  nullable    = false
  type        = string
  #
  default = "dnsprefkatkat"
}

variable "dns_service_ip" {
  description = "The name of the DNS service IP"
  nullable    = true
  type        = string
  default     = null
}

variable "docker_bridge_cidr" {
  description = "The name of the Docker bridge CIDR"
  nullable    = true
  type        = string
  default     = null
}

variable "key_vault_key_permissions" {
  description = "List of full key permissions, must be one or more from the following: Get, List, Update, Create, Import, Delete, Recover, Backup, Restore, GetRotationPolicy, SetRotationPolicy, Rotate."
  type        = list(string)
  default = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "GetRotationPolicy", "SetRotationPolicy", "Rotate"]
}

variable "key_vault_secret_permissions" {
  description = "List of full secret permissions, must be one or more from the following: Get, List, Set, Delete, Recover, Backup, Restore."
  type        = list(string)
  default     = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore"]
}

variable "key_vault_certificate_permissions" {
  description = "List of full certificate permissions, must be one or more from the following: Get, List, Update, Create, Import, Delete, Recover, Backup, Restore, ManageContacts, ManageIssuers, GetIssuers, ListIssuers, SetIssuers, and DeleteIssuers."
  type        = list(string)
  default = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "ManageContacts", "ManageIssuers", "GetIssuers", "ListIssuers", "SetIssuers", "DeleteIssuers" ]
}

variable "key_vault_name" {
  description = "The name of the Key Vault"
  nullable    = false
  type        = string
  #
  default = "kvnathskatkat"
}

variable "key_vault_secret_name" {
  description = "The name of the Key Vault Secret"
  nullable    = false
  type        = string
  #
  default = "keyvaultsecretname"
}

variable "key_vault_secret_value" {
  description = "The name of the Key Vault Secret value"
  nullable    = false
  type        = string
  #
  default = "keyvaultsecretvalue"
}

variable "key_vault_sku_name" {
  description = "The name of the Key Vault SKU"
  nullable    = false
  type        = string
  default     = "standard"
}

variable "kubernetes_cluster_name" {
  description = "The name of the Kubernetes cluster"
  nullable    = false
  type        = string
  #
  default = "kubcluskatkat"
}

variable "load_balancer_sku" {
  description = "The name of the Load Balancer SKU"
  nullable    = false
  type        = string
  default     = "standard"
}

variable "location" {
  description = "The Azure location where the resource(s) should exist"
  nullable    = false
  type        = string
  default     = "westeurope"
}

variable "max_count" {
  description = "The maximum number of nodes which should exist in this Node Pool. "
  nullable    = true
  type        = number
  default     = null
}

variable "min_count" {
  description = "The minimum number of nodes which should exist in this Node Pool. "
  nullable    = true
  type        = number
  default     = null
}

variable "network_plugin" {
  description = "Network plugin to use for Networking."
  nullable    = false
  type        = string
  default     = "kubenet"

  validation {
    condition     = can(regex("^(kubenet|azure|none)$", var.network_plugin))
    error_message = "Must either kubenet, azure or none."
  }
}

variable "node_count" {
  description = "The initial number of nodes which should exist in this Node Pool"
  nullable    = false
  type        = number
  default     = 1
}

variable "pod_cidr" {
  description = "The name of the Pod CIDR"
  nullable    = true
  type        = string
  default     = null
}

variable "resource_group_name" {
  description = "The name of the Resource Group for module's resources"
  nullable    = false
  type        = string
  #
  default = "rgnmkatkat"
}

variable "service_cidr" {
  description = "The name of the Service CIDR"
  nullable    = true
  type        = string
  default     = null
}

variable "soft_delete_retention_days" {
  description = "The number of the Soft Delete retention days"
  nullable    = false
  type        = number
  default     = 7
}

variable "tags" {
  description = "The tags to assign to the resources"
  nullable    = false
  type        = map(string)
  default = {
    usage = "development"
    critical = "no"
  }
}

variable "vnet_subnet_id" {
  description = "The ID of a Subnet where the Kubernetes Node Pool should exist."
  nullable    = true
  type        = string
  default     = null
}

variable "vm_size" {
  description = "The SKU which should be used for the virtual machine"
  nullable    = false
  type        = string
  default     = "Standard_DS2_v2"
}

variable "vmss_name" {
  description = "The name of the VMSS"
  nullable    = false
  type        = string
  #
  default = "aks-nodpoolka-34339936-vmss"
}

variable "vmss_resource_group_name" {
  description = "The name of the Resource Group for VMSS"
  nullable    = false
  type        = string
  #
  default = "MC_rgnmkatkat_kubcluskatkat_westeurope"
}
