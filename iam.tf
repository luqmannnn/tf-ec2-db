# Create policy
resource "aws_iam_policy" "policy" {
  name        = var.policy_name
  path        = "/"
  description = "My test policy"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "dynamodb:BatchGetItem",
          "dynamodb:DescribeImport",
          "dynamodb:ConditionCheckItem",
          "dynamodb:DescribeContributorInsights",
          "dynamodb:Scan",
          "dynamodb:ListTagsOfResource",
          "dynamodb:Query",
          "dynamodb:DescribeStream",
          "dynamodb:DescribeTimeToLive",
          "dynamodb:DescribeGlobalTableSettings",
          "dynamodb:PartiQLSelect",
          "dynamodb:DescribeTable",
          "dynamodb:GetShardIterator",
          "dynamodb:DescribeGlobalTable",
          "dynamodb:GetItem",
          "dynamodb:DescribeContinuousBackups",
          "dynamodb:DescribeExport",
          "dynamodb:GetResourcePolicy",
          "dynamodb:DescribeKinesisStreamingDestination",
          "dynamodb:DescribeBackup",
          "dynamodb:GetRecords",
          "dynamodb:DescribeTableReplicaAutoScaling"
        ]
        Effect   = "Allow"
        Resource = "arn:aws:dynamodb:${var.region}:${var.accountid}:table/${var.dynamodb_table_name}"
      },
      {
        Effect : "Allow",
        Action : [
          "dynamodb:ListContributorInsights",
          "dynamodb:DescribeReservedCapacityOfferings",
          "dynamodb:ListGlobalTables",
          "dynamodb:ListTables",
          "dynamodb:DescribeReservedCapacity",
          "dynamodb:ListBackups",
          "dynamodb:GetAbacStatus",
          "dynamodb:ListImports",
          "dynamodb:DescribeLimits",
          "dynamodb:DescribeEndpoints",
          "dynamodb:ListExports",
          "dynamodb:ListStreams"
        ],
        "Resource" : "*"
      }
    ]
  })
}

# Create role and link to policy
resource "aws_iam_role" "role" {
  name                = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  managed_policy_arns = [aws_iam_policy.policy.arn]
}

resource "aws_iam_instance_profile" "iam_instance_profile" {
  name = var.role_name
  role = aws_iam_role.role.name
}