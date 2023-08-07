Steps:
1.	Requirements:
  a.	Terraform
  b.	AWS Account
  c.	Github Account
  d.	Git Bash
  e.	Go
  f.	Windows Powershell
2.	Git Bash Commands:
        git config --global user.name "Your Name"
        git config --global user.email "your.email@example.com"
        ssh-keygen -t rsa -C your.email@example.com
  a.	Press Enter when asked to choose the default location for the SSH key (usually, ~/.ssh/id_rsa).
3.	Enter a passphrase for the SSH key (optional).
  a.	Press Enter when asked to choose the default location for the SSH key (usually, ~/.ssh/id_rsa).
  b.	Enter a passphrase for the SSH key (optional).
  c.	Press Enter when asked to choose the default location for the SSH key (usually, ~/.ssh/id_rsa).
  d.	Enter a passphrase for the SSH key (optional).
4.	Windows Powershell Commands:
        mkdir my-graphql-api
        cd my-graphql-api
5.	Create a file named main.tf in your Terraform project directory. Can check our code above.
6.	Create a new directory named functions within your Terraform project directory.
        Powershell command: 
        mkdir functions
7.	Inside the functions directory, create a new Golang file (e.g., hello.go). Can check our code above.
8.	Powershell commands:
        go mod init my-graphql-api/functions
        go get github.com/aws/aws-lambda-go/events
        go get github.com/aws/aws-lambda-go/lambda
        go build -o functions/hello functions/hello.go
        cd C:\Users\<YourUsername>\my-graphql-api
        $env:AWS_SECRET_ACCESS_KEY="XXXXX"
        $env:AWS_ACCESS_KEY_ID="XXXXX"
        Terraform init
        Terraform plan
        Terraform apply
9.	Go into AppSync and check if you are able to query:
a.	If error try editing schema and deleting subscriptions / mutations
b.	Create an API key
10.	Query your API
