
group "default" {
  targets = ["next", "static", "migration"]
}

group "production" {
  targets = ["next", "static", "migration"]
  platforms = ["linux/amd64"]
}

target "next" {
  dockerfile = "Dockerfile"
  target = "next"
  tags = ["registry.luchanso.mvp/app-next"]
}

target "static" {
  dockerfile = "Dockerfile"
  target = "static"
  tags = ["registry.luchanso.mvp/app-static"]
}

#target "scheduler" {
#  dockerfile = "./scheduler/Dockerfile"
#  target = "scheduler"
#  tags = ["registry.luchanso.mvp/app-scheduler"]
#
#}

target "migration" {
  dockerfile = "./prisma/migration-tool/Dockerfile"
  target = "migration"
  tags = ["registry.luchanso.mvp/app-migration"]
}
