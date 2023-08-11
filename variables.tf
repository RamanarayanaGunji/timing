    variable "cidr"{
    type = string
    #default ="10.0.0.0/16"

    }
    variable "public_subnet_cidr"{
    type = string
    }
    variable "private_subnet_cidr"{
    type = string
    }
    variable "internet_cidr"{
    type = string
     }

    variable "tags"{
    type = map
    }
    variable "internet"{
    type = bool
    }
    variable "lb_type"{
    type = string
    }
    variable "subnet_ids"{
    type = list
    }
    variable "security_groups"{
    type = list
    }
    variable "timeout"{
    type= number
    }