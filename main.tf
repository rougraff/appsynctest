#This Terraform file defines the infrastructure for setting up an AWS AppSync API 

#Specifies region
provider "aws" {
  region = "us-east-1"  # Replace with your desired AWS region
}
#Creates an AWS AppSync GraphQL API named "SampleAppSyncAPI" and defines schema
resource "aws_appsync_graphql_api" "sample_appsync_api" {
  name                = "SampleAppSyncAPI"
  authentication_type = "API_KEY"  # You can change the authentication method as needed

  schema = <<EOF
    type Query {
      hello: String
    }

  EOF
}

#Defines data source
resource "aws_appsync_datasource" "sample_datasource" {
  api_id = aws_appsync_graphql_api.sample_appsync_api.id
  name   = "SampleDataSource"
  type   = "NONE"
}

#Sets up a resolver for the "hello" field in the "Query" type
resource "aws_appsync_resolver" "sample_resolver" {
  api_id         = aws_appsync_graphql_api.sample_appsync_api.id
  type           = "Query"
  field          = "hello"
  data_source    = aws_appsync_datasource.sample_datasource.name
  request_template = <<EOF
{
  "version": "2017-02-28",
  "operation": "Invoke",
  "payload": {}
}
EOF

  response_template = <<EOF
#set($inputRoot = $util.parseJson($ctx.stash.get("RESPONSE_STRING")))
{
  "message": "$inputRoot.message"
}
EOF
}
