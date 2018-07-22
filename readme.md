# Lambda
Lambda is a **FAAS** (function as a service).

### ARN
ARN is **Amazon resource name**. It uniqurely determins each resource in AWS.

### Working
AWS creates a container for our function as and when a request comes. As the number of requests increases, the containers spawned by AWS will increase to cater them.

When there are no request, AWS will kill all the containers it created before. 

## Handler function
They are the entry points inside the lambda functions.

While configuring the lambda function, we need to provide the filename and the name of the function containing the handler.

### Handler function for node.js

`exports.handler = function(event, context, callback){}`

Then use it as following in the lambda configuration:
`file_name.handler`

### Event object

It contains all the request parameters and data, header details, etc.

#### Other AWS services **Important**

- **S3**:  Used to store static files like JS, HTML, CSS
- **API Gateway**: Used for creating restful endpoints, which people can use to do some work
- **DynamoDB**: NoSQL database

All the above services can invoke lambda function.

### Context object

- Provides the runtime information of hte lambda function - **functionName**

- Provides details about the execution environment - **memory limit**

- Provides some properties and methods


#### **Properties** (Few important ones)      
- `context.functionName`                       
- `context.functionVersion` 
- `context.invokedFucntionARN`
- `context.memoryLimitMB`
- `context.awsRequestId`
- `context.logGroupName`  (every lambda function writes the log in AWS cloudwatch, we can access the log group name)
- `context.logStreamName`


#### **Methods** (Few important ones)
- `context.getRemainingTimeInMilis()`  (do some business logic like, if lambda function is going to cross the timeoue given, provide some meaningful error and do some other work)

### Callback function

- Exit point of the lambda function
- Callback parameter in handler function is optional
- If no callback is present, then it means the callback is called without any parameter

#### Callback syntax

`callback(param1, param2)`

##### If there is error
`callback(error)`

##### If success
`callback(null, Object result)`

If called with no parameter `callback()`, it means success but with no response and AWS will send `null` as response

Similarly, `callback(null)` means success but without any response

### Logging inside AWS lambda

- Lambda uses AWS Cloud Watch service to write logs

- Identifying the log group name and log stream name `context.logGroupName` & `context.logStreamName`

- Lambda Nodejs logs can be written using
    - `console.log()`
    - `console.info()`
    - `console.warn()`
    - `console.error()`

#### AWS CloudWatch

##### Log Group Name
If the name of the lambda function is "HelloWorld", then a log group is created with the same name, and all the logs pertaining to the same lambda function is stored in it

##### Log Stream Name
Inside the Log Group, there are multiple streams that are created based on time, or the number of times we are updating the lambda function. A large number of log streams refer to a single log group name. 

### Creating a zip in Ubuntu 

`sudo apt-get install zip`

Then for simply creating a zip file:

`zip -r compressed_filename.zip foldername`

## Setting up AWS CLI

- Install AWS CLI
- Create User in AWS IAM (so that user will be authorized to perform some opertaion based upon the policy)
- Configure the AWS CLI

### Prerequisites

- Python must be installed
- pip must be installed (to download all the dependencies)
    `sudo apt install python-pip`

After having python and pip installed, we can easily install AWS CLI :

`sudo pip install awscli`

Then check aws version:

`aws --version`

Then create an user to connect the aws cli to perform a particular service.

- create an user
- create a group with required policies
- attach the group to the user
- copy the aws access id and secret key to configure the aws cli

`aws configure`
**Then enter the access id and key**
 For region if working with Alexa, type in **us-east-1** which is for North Virginia(supported by Amazon Alexa)

Default output format: `json`

#### To check aws folder
`la ~`      //la shows the hidden folders as well

`cd ~/.aws`     //to go inside the folder

### Create lambda function using AWS CLI

- **Must read the documentation**

 [AWS Lambda Create function documentation](https://docs.aws.amazon.com/cli/latest/reference/lambda/create-function.html)

Example:

```aws lambda create-function```
    ```--function-name "LAMBDA_FUNCTION_NAME" ```
    ```--runtime "RUNTIME ENVIRONMENT" ```
    ```--role "AWS_LAMBDA_ROLE" ```
    ```--handler "HANDLER_FUNCTION_PATH" ```
    ```--timeout "TIMEOUT" ```
    ```--zip-file "ZIP_FILE_PATH" ```
    ```--region "AWS_REGION" ```

// role will contain the ARN for the particular role we want to provide

## To create a lambda function

Refer to sfFiles directory > **lambda_create.sh**

## To update a lambda function

Refer to sfFiles directory > **lambda_update.sh**



