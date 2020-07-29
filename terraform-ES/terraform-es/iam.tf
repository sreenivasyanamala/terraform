resource "aws_cloudwatch_log_group" "es_cloudwatch_log_group" {
  name = "${var.domain_name}-log_group"
  tags = var.tags
}

resource "aws_cloudwatch_log_resource_policy" "es_aws_cloudwatch_log_resource_policy" {
  policy_name = "${var.domain_name}-policy"

  policy_document = <<CONFIG
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "es.amazonaws.com"
      },
      "Action": [
        "logs:PutLogEvents",
        "logs:PutLogEventsBatch",
        "logs:CreateLogStream"
      ],
      "Resource": "arn:aws:logs:*"
    }
  ]
}
CONFIG
}

# Service-linked role to give Amazon ES permissions to access your VPC
resource "aws_iam_service_linked_role" "es" {
  aws_service_name = "es.amazonaws.com"
  description      = "Service-linked role to give Amazon ES permissions to access your VPC"
}
