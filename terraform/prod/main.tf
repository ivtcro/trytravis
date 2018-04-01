provider "google" {
  version = "1.4.0"
  project = "${var.project}"
  region  = "${var.region}"
}

module "app" {
  source           = "../modules/app"
  public_key_path  = "${var.public_key_path}"
  private_key_path = "${var.private_key_path}"
  zone             = "${var.zone}"
  app_disk_image   = "${var.app_disk_image}"
  db_ip            = "${module.db.reddit-db-instance-int-ip}"
  env_name         = "prod"
  deploy_app       = "yes"
}

module "db" {
  source           = "../modules/db"
  public_key_path  = "${var.public_key_path}"
  private_key_path = "${var.private_key_path}"
  zone             = "${var.zone}"
  db_disk_image    = "${var.db_disk_image}"
  env_name         = "prod"
}

module "vpc" {
  source        = "../modules/vpc"
  source_ranges = ["95.31.0.125/32"]
  env_name      = "prod"
}
