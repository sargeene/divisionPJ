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




