variable "owner"{
    description = "division-owner"
    type = string
    default = "division"
}
variable "environment"{
    description = "division-environment"
    type = string
    default = "dev"
}
variable "rg"{
    description = "resource group"
    type = string
    default = "rg_name"
}
variable "userwinvm"{
    description = "windows virtual machine for users"
    type = string
    default = "user-win-vm"
}
variable "dbwinvm"{
    description = "windows virtual machine name for database"
    type = string
    default = "db-win-vm"
}
variable "dbvnet"{
    description = "virtual network for database"
    type = string
    default = "db-virtualnetwork"
}
variable "dbsubnet"{
    description = "subnet for database"
    type = string
    default = "db-subnet"
}
variable "dbnic"{
    description = "network interface card for database"
    type = string
    default = "db-nic"
}
variable "vmvnet"{
    description = "windows virtual machine name for users"
    type = string
    default = "user-win-vm"
}
variable "db_private_endoint"{
    description = "private endoint for database"
    type = string
    default = "db-private-endoint"
}
variable "db_private_service_connection" {
  description = "db private dns service connection name"
  type        = string
  default     = "db-private-service-connection"
}
variable "db_private_dns_group" {
  description = "db private dns group name"
  type        = string
  default     = "db-private-dns-group"
}
variable "db_private_dns_zone" {
  description = "db private dns zone name"
  type        = string
  default     = "privatelink.mysql.database.azure.com"
}
variable "db_private_dns_vnet_link" {
  description = "db private dns vnet link name"
  type        = string
  default     = "dbvnetlink"
}
variable "db_private_service_connection" {
  description = "db private dns service connection name"
  type        = string
  default     = "db-private-service-connection"
}
variable "this_mysql_fs" {
  description = "mysql flexible server name"
  type        = string
  default     = "mysql-flexible-server"
}
variable "this_mysql_flexible_database" {
  description = "flexible database name"
  type        = string
  default     = "flexible-database"
}
variable "flexible_db_username" {
  description = "flexible database admin login username"
  type        = string
  default     = "psqladmin"
}
variable "flexible_db_password" {
  description = "flexible database admin password"
  type        = string
  default     = "H@Sh1CoR3!"
}
variable "key_vault" {
  description = "flexible database admin password"
  type        = string
  default     = "H@Sh1CoR3!"
}
variable "vnet_peer1to2" {
  description = "vnet peering vnet1 to vnet 2"
  type        = string
  default     = "vnet-peer1to2"
}
variable "vnet_peer2to1" {
  description = "vnet peering vnet2 to vnet 1"
  type        = string
  default     = "vnet-peer2to1"
}
variable "vmnic"{
    description = "virtual machine network interface card"
    type = string
    default = "vm-nic"
}
variable "db_nsg"{
    description = "database network security group name"
    type = string
    default = "db-nsg"
}
variable "db_nsg_rule"{
    description = "database network security rule name"
    type = string
    default = "db-nsg-rule"
}
variable "vm_nsg"{
    description = "virtual machine network security group name"
    type = string
    default = "vm-nsg"
}
variable "vm_inbound_ns_rule"{
    description = "virtual machine inbound network security rule name"
    type = string
    default = "vm-inbound-ns-rule"
}
variable "vm_outbound_ns_rule"{
    description = "virtual machine outbound network security rule name"
    type = string
    default = "vm-outbound-ns-rule"
}
variable "win_vm_name"{
    description = "windows virtual machine name"
    type = string
    default = "win-vm"
}
variable "win_vm_username"{
    description = "windows vm username"
    type = string
    default = "win-vm-username"
}
variable "vm_secret"{
    description = "virtual machine secret"
    type = string
    default = "vm-secret"
}
variable "flexible_server_secret"{
    description = "flexible server secret"
    type = string
    default = "flexible-server-secret"
}
variable "bastion_public_ip"{
    description = "bastion public ip name"
    type = string
    default = "bastion-public-ip"
}
variable "bastion_host"{
    description = "bastion host name"
    type = string
    default = "bastion-host-name"
}

