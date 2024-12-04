
module "credential" {

  source = "../../"

  github_organization = "foo"
  repository_name     = "bar"
  entity_type         = "branch"
  branch_name         = "main"
  owners              = []

}
