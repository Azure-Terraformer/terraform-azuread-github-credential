
module "credential" {

  source = "../../"

  github_organization = "foo"
  repository_name     = "bar"
  entity_type         = "pr"
  owners              = []

}
