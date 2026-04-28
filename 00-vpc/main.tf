module "vpc" {
    source = "../../Terrafrom-vpc-module"
    project = "roboshop"
    environment = "dev"
    is_peering_requried = false
}