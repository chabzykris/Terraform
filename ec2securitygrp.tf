# first create variables with type list and the default ports u will like to open
variable "ingressrules" {
    type = list(number)
    default = [80,443,8080]
}

variable "egressrules" {
    type = list(number)
    default = [80,443,25,3306,53,8080]
}

variable "my_instance_type"{
  type = string
  default = "t2.micro"
}

# create security group – SSH Traffic
resource "aws_security_group" "web-traffic" {
    name = "Allow_tls" 
     # the name could be anything

    dynamic "ingress" {
        iterator = port
        for_each = var.ingressrules
        content {
        from_port = port.value
        to_port = port.value
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
        }
    }

    dynamic "egress" {
        iterator = port
        for_each = var.egressrules
        content {
        from_port = port.value
        to_port = port.value
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
        }
    }
}
