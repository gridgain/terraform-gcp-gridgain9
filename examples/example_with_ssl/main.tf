provider "google" {
  project        = "project-name"
  region         = "us-east1"
}

module "gridgain" {
  source = "../../"

  project_id     = "project-id"
  image_id       = "vmi-gridgain-db-9-1-4-byol-v00-09-0-0-1-7"
  nodes_count    = 2
  public_access_enable = true
  ssh_pub_key    = "ssh-rsa public-key"

  gridgain_config         = file("files/gridgain-config.conf")
  gridgain_logging_config = file("files/gridgain-logging.conf")
  gridgain_license        = file("files/gridgain-license.conf")
  gridgain_ssl_enable     = true
  gridgain_ssl_cert       = file("files/server.crt")
  gridgain_ssl_key        = file("files/server.key")
  keystore_password       = "password"
}

terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}
