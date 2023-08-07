provider "aws" {
  region = "us-east-1"
}

resource "aws_appsync_graphql_api" "example_api" {
  name          = "ExampleAPI"
  authentication_type = "API_KEY"
}

resource "aws_appsync_datasource" "example_datasource" {
  name            = "ExampleDataSource"
  api_id          = aws_appsync_graphql_api.example_api.id
  type            = "NONE"
}

resource "aws_appsync_resolver" "example_resolver" {
  api_id          = aws_appsync_graphql_api.example_api.id
  type            = "Query"
  field           = "hello"

  data_source     = aws_appsync_datasource.example_datasource.name

  request_template = jsonencode({
    version: "2017-02-28",
    operation: "GET",
    path: "/hello"
  })
}

resource "aws_appsync_type" "example_type" {
  api_id = aws_appsync_graphql_api.example_api.id
  name   = "ExampleType"

  definition = """
    type ExampleType {
      message: String
    }
  """

  format = "SDL"
}
