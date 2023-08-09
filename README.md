Steps:
1.	Requirements:<br>
  a.	Terraform<br>
  b.	AWS Account<br>
  c.	Github Account<br>
  d.	Git Bash<br>
  e.	Go<br>
  f.	Windows Powershell<br>
2.	Git Bash Commands:<br>
        git config --global user.name "Your Name"<br>
        git config --global user.email "your.email@example.com"<br>
        ssh-keygen -t rsa -C your.email@example.com<br>
  a.	Press Enter when asked to choose the default location for the SSH key (usually, ~/.ssh/id_rsa).<br>
3.	Enter a passphrase for the SSH key (optional).<br>
  a.	Press Enter when asked to choose the default location for the SSH key (usually, ~/.ssh/id_rsa).<br>
  b.	Enter a passphrase for the SSH key (optional).<br>
  c.	Press Enter when asked to choose the default location for the SSH key (usually, ~/.ssh/id_rsa).<br>
  d.	Enter a passphrase for the SSH key (optional).<br>
  e. Add SSH key to Github page.
4.  IAM Policies <br>
        AdministratorAccess	<br>
        AWSAppSyncAdministrator	<br>
        AWSLambda_FullAccess<br>
5.	Windows Powershell Commands:<br>
        git clone git@github.com:rougraff/appsynctest.git <br>
        go mod init appsynctest/functions<br>
  	    go get github.com/aws/aws-lambda-go/events<br>
  	    go get github.com/aws/aws-lambda-go/lambda<br>
  	    go build -o functions/hello functions/hello.go<br>
  	    $env:AWS_SECRET_ACCESS_KEY="XXXXX"<br>
        $env:AWS_ACCESS_KEY_ID="XXXXX"<br>
  	    Terraform init<br>
        Terraform plan<br>
        Terraform apply<br>
11.	AppSync<br>
    a. Create an API key<br>
    b. Query your API<br>
