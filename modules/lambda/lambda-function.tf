resource "aws_lambda_function" "amibackup-function" {
   function_name = "${var.function_name}"   
   s3_bucket = "${var.s3_bucket}"
   s3_key    = "${var.s3_key}"

   handler = "${var.handler}"
   runtime = "${var.runtime}"
   role = "${var.lambda_role}" 
   
   environment {
      variables = {
      Retention_Days = "${var.Retention_Days}"
    }
  }   
}

