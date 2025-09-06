variable "VERSION" {
  default = "latest"
}

group "default" {
  targets = ["next", "static", "scheduler", "migration"]
}

target "_common" {
  platforms = ["linux/amd64"]
}

target "next" {
  inherits = ["_common"]
  dockerfile = "Dockerfile"
  target = "next"
  tags = ["registry.routinedb.com/routinedb-next:${VERSION}"]
}

target "static" {
  inherits = ["_common"]
  dockerfile = "Dockerfile"
  target = "static"
  tags = ["registry.routinedb.com/routinedb-static:${VERSION}"]
}

// target "scheduler" {
//   inherits = ["_common"]
//   dockerfile = "./scheduler/Dockerfile"
//   target = "scheduler"
//   tags = ["registry.routinedb.com/routinedb-scheduler:${VERSION}"]
// }

target "migration" {
  inherits = ["_common"]
  dockerfile = "./prisma/migration-tool/Dockerfile"
  target = "migration"
  tags = ["registry.routinedb.com/routinedb-migration:${VERSION}"]
}
