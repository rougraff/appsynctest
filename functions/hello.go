package main

import (
	"context"
	"encoding/json"
	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
)

// Response struct defines the structure of the JSON response.
type Response struct {
	Message string `json:"message"`
}

// helloHandler is the main Lambda handler for API Gateway requests.
func helloHandler(ctx context.Context, request events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
	// Create a Response struct with a custom message.
	response := Response{
		Message: "Hello, Gopher!",
	}

	// Marshal the Response struct into JSON format.
	body, err := json.Marshal(response)
	if err != nil {
		return events.APIGatewayProxyResponse{}, err
	}

	// Construct an APIGatewayProxyResponse with a status code of 200 (OK)
	// and the marshaled JSON response as the body.
	return events.APIGatewayProxyResponse{
		StatusCode: 200,
		Body:       string(body),
	}, nil
}

func main() {
	// Start the Lambda handler when the Lambda function is invoked.
	lambda.Start(helloHandler)
}
