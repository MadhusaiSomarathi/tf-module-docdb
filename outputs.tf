output "secrets" {
  value = jsondecode(data.aws_secretsmanager_secret_version.roboshop.secret_string)
}