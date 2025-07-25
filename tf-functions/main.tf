terraform{}

locals {
    value = "Hello World!"
}

variable "string_list" {
    type = list(string)
    default = ["serv1", "serv2", "serv3"]
}

output "output" {
    #value = (local.value)
    #value = startswith(local.value, "Hello") ? "String starts with 'Hello'" : "String does not start with 'Hello'"
    #value = split(" ", local.value)
    #value = min(1, 2, 3, 4, 5) # Returns the minimum value from the list
    #value = abs(-15.123)
    value = length(var.string_list) # Accessing the second element in the list
}

output "name" {
    value = var.string_list[1] # Accessing the second element in the list
  
}
