    cidr ="10.0.0.0/16"
    public_subnet_cidr = "10.0.0.0/24"
    private_subnet_cidr = "10.0.2.0/24"
    tags={
    name = "timing"
    environment = "dev"
    terraform = "true"
    }
    internet_cidr = "0.0.0.0/0"
    internet = true
    lb_type = application
    subnet_ids = ["subnet-0c6eb8048abf1de34","subnet-038c0fe9dd707bb23"]
    security_groups = []
    timeout = 60
