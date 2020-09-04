data "archive_file" "dummy" {
  type        = "zip"
  output_path = "${path.module}lambda_function.zip"
  source {
    content = <<EOF
import json
def lambda_handler(event, context):
    print('Hello from Lambda!');
EOF
    filename = "lambda_function.py"
  }
}

resource "aws_lambda_function" "amibackup-function" {
   function_name = "${var.function_name}"   
   filename = "${data.archive_file.dummy.output_path}"
   handler = "${var.handler}"
   runtime = "${var.runtime}"
   role = "${var.lambda_role}" 
   
   environment {
      variables = {
      Retention_Days = "${var.Retention_Days}"
    }
  }   
}

