variable "project" {
  type        = "string"
  description = "The name of the project we are bootstrapping."
}

variable "region" {
  type        = "string"
  description = "The AWS Region into which we are bootstrapping."
}

variable "environment" {
  type        = "string"
  description = "The name of the environment for the bootstrapping process."
  default = "state"
}

variable "component" {
  type        = "string"
  description = "The name of the component for the bootstrapping process."
  default = "state"
}

variable "ro_principals" {
  type        = "list"
  description = "A list of Principals permitted to ListBucket and GetObject for Remote State purposes"

  default = [
    "arn:aws:iam::137003653577:root",
  ] 
}
