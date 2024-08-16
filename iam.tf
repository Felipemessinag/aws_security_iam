
resource "aws_iam_policy" "ec2_policy" {
  name        = "NextWorkDevEnvironmentPolicy"
  path        = "/"
  description = "IAM Policy for NextWork's development environment."

  policy = <<EOF
{    
  "Version": "2012-10-17",    
  "Statement": [        
    {            
      "Effect": "Allow",            
      "Action": "ec2:*",            
      "Resource": "*",            
      "Condition": {                
        "StringEquals": {                    
          "ec2:ResourceTag/Env": "development"                
        }            
      }        
    },        
    {            
      "Effect": "Allow",            
      "Action": "ec2:Describe*",            
      "Resource": "*"        
    },        
    {            
      "Effect": "Deny",            
      "Action": [                
        "ec2:DeleteTags",                
        "ec2:CreateTags"            
      ],            
      "Resource": "*"        
    }    
  ] 
}
EOF
}

resource "aws_iam_account_alias" "nextwork_alias" {
  account_alias = "felipe-messina-devops"
}

resource "aws_iam_group" "nextwork_group" {
  name = "nextwork-dev-group"
}

resource "aws_iam_user" "nextwork_user" {
  name = "nextwork-dev-user"
}

resource "aws_iam_group_membership" "nextwork_team" {
  name = "nextwork-dev-membership"

  users = [
    aws_iam_user.nextwork_user.name,
  ]

  group = aws_iam_group.nextwork_group.name
}

resource "aws_iam_group_policy_attachment" "nextwork_attachment" {
  group      = aws_iam_group.nextwork_group.name
  policy_arn = aws_iam_policy.ec2_policy.arn
}