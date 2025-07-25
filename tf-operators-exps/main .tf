terraform {}

variable "num_list" {
    type = list(number)
    default = [1, 2, 3, 4, 5]
}

variable "person_list" {
    type = list(object({
        fname = string
        lname = string
    }))
    default = [{
        fname = "Raju"
        lname = "Rastogi"
    }, {
        fname = "Sham"
        lname = "Paul"
    }]
}

variable "map_list" {
    type = map(number)
    default = {
        "one" = 1
        "two" = 2
        "three" = 3
    }           
}

#Calculations
locals {
    mul = 2 * 2
    add = 2 + 2
    eq  = 2 != 3

    #Double the number list
    double = [for num in var.num_list : num * 2]

    odd = [for num in var.num_list : num if num % 2 == 1]

    fname_list = [for person in var.person_list : person.fname]

    map_info = [for key, value in var.map_list : value]

    double_map = {for key, value in var.map_list : key => value * 2}
}

output "output" {
    value = local.double_map
}