
module "credential" {

  source = "../../"

  github_organization = "foo"
  repository_name     = "bar"
  entity_type         = "tag"
  tag_name            = "v1.0.0"
  owners              = []

}
