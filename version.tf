terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "2.17.0"
    }
    aws ={
          source  = "hashicorp/aws"
      version = "~>3.0"
        
    }
  }
}
