
module "credential" {

  source = "../../"

  github_organization = "foo"
  repository_name     = "bar"
  entity_type         = "environment"
  environment_name    = "dev"
  owners              = []

}
