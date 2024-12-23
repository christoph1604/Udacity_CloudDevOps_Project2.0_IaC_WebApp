aws cloudformation deploy --stack-name $1  \
    --template-file $2   \
    --parameter-overrides $3  \
    --capabilities "CAPABILITY_NAMED_IAM"  \
    --region=us-east-1