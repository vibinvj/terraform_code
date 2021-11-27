variable "sgname" {
  description = "this is test variable"
  default = "prodsg"
}
variable "ipblock" {
  description = "this is to allow server remote"
  type = list(string)
  default = ["0.0.0.0/16", "192.168.0.0/16"]
}

variable "pub_subnet" {
  description = "pub sub"
  type = string
}

variable "pub-sub-tag" {
  description = "tag for pub sub"
  type = object({
    name = string
    env = string
  })
}
variable "sg-tag" {
  description = "sg tag"
  type = object({
    name = string
    env = string
  })
}