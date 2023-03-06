resource "null_resource" "load-schema" {
  depends_on = [aws_docdb_cluster.docdb, aws_docdb_cluster_instance.cluster_instances]

  provisioner "local-exec" {
    command = <<EOF
curl -s -o /tmp/mongodb.zip "https://github.com/roboshop-devops-project/mongodb/archive/main.zip"
cd /tmp
unzip -o mongodb.zip
cd mongodb-main
curl -L -O https://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem
mongo --ssl --host ${aws_docdb_cluster.docdb.endpoint}:27017 --sslCAFile rds-combined-ca-bundle.pem --username ${local.DOCDB_USER} --password ${local.DOCDB_PASS} < catalogue.js
mongo --ssl --host ${aws_docdb_cluster.docdb.endpoint}:27017 --sslCAFile rds-combined-ca-bundle.pem --username ${local.DOCDB_USER} --password ${local.DOCDB_PASS} < users.js
EOF
  }

}