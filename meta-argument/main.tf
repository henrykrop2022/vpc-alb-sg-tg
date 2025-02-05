/*
count = 2
depends_on =
for_each
lifecycle

provider "aws" {

    region = "us-east-1"
}
/*
resource "aws_instance" "s1" {
    count = 1
  ami = "ami-0f214d1b3d031dc53"
  instance_type = "t2.micro"

tags = {
    Name = "dev-server${count.index}"
}
}
resource "aws_iam_user" "user1" {
    name = "cloudadmin"
    depends_on = [ aws_instance.s1 ] //list
  
}
output "ip" {
    value = aws_instance.s1[*].public_ip 
      
    }

   */ 
 
/*
variable "typeofinstance" {
    type = list(string)
  default = ["t2.micro", "t3.small"]
}
/*
resource "aws_instance" "s2" {
   for_each = toset(var.typeofinstance)
   ami = "ami-0f214d1b3d031dc53"
   instance_type = each.key
}

variable "info" {
    type = map(object)
    default = {
      "dev" = {ami:"ami-0f214d1b3d031dc53", instance_type: "t2.micro"}
      "qa" = {ami:"ami-0f214d1b3d031dc53", instance_type: "t2.micro"}
    #   "prod" = {ami:"ami-0f214d1b3d031dc53", instance_type: "t2.micro"} 
    }
  
}

resource "aws_instance" "s2" {
  for_each = var.info
  ami = each.key[ami]
  instance_type = each.key[instance_type]
  tags = {
    Name = each.key
  }
}
*/
/*
# Define the variable with a proper object schema
variable "info" {
  type = map(object({
    ami = string, instance_type = string
    }))
  
  default = {
    "dev" = {
      ami           = "ami-0f214d1b3d031dc53"
      instance_type = "t2.micro"
    }
    "qa" = {
      ami           = "ami-0f214d1b3d031dc53"
      instance_type = "t2.micro"
    }
  }
}

resource "aws_instance" "s2" {
  for_each = var.info

  ami           = each.value.ami          
  instance_type = each.value.instance_type 

  tags = {
    Name = each.key 
  }
}


 
variable "region" {
  description = "value of region"
  type = string
  sensitive = true
  # default = "us-east-1"
}

 provider "aws" {
    region = "us-east-1"
    alias = "useast1"
}
provider "aws" {
    region = "us-weast-1"
    alias = "uswest1"
} 

resource "aws_instance" "server1" {
  provider = aws.useast1
  ami = "ami-0f214d1b3d031dc53"
  instance_type = "t2.micro"
  
}
*/
 provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "server1" {
  ami = "ami-0c614dee691cbbf37"
  instance_type = "t2.micro"
  lifecycle{
# create_before_destroy = true
prevent_destroy = false
}
} 
