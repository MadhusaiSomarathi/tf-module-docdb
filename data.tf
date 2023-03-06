data "aws_secretsmanager_secret" "roboshop" {
  name = "roboshop/all-secrets"
}
