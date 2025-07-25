variable "aws_instance_type" {
  description = "The type of AWS instance to create"
  #default     = "t3.micro"
  type       = string
  #validation {
  #  condition = var.aws_instance_type=="t2.micro" || var.aws_instance_type=="t3.micro"
  #  error_message = "Instance type must be either t2.micro or t3.micro."
  #}
}

variable "ec2_config" {
    type = object({
      v_size = number
      v_type = string
    })
    default = {
      v_size = 20
      v_type = "gp2"
    }
}

variable "additional_tags" {
  description = "Additional tags to apply to the resources"
  type        = map(string) #expects a map of key-value pairs
  default     = {}
  
}

