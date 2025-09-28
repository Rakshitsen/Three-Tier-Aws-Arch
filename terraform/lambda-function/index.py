import json
import boto3
import os

def lambda_handler(event, context):
    s3_event_info = event['Records'][0]['s3']
    bucket_name = s3_event_info['bucket']['name']
    object_key = s3_event_info['object']['key']

    sns = boto3.client('sns')

    sns_topic_arn = os.environ['SNS_TOPIC_ARN']

    message = f"New image uploaded to S3: {bucket_name}/{object_key}"

    response = sns.publish(
        TopicArn=sns_topic_arn,
        Subject='S3 Image Upload Notification',
        Message=message
    )

    print(response)
    return {
        'statusCode': 200,
        'body': json.dumps('Notification sent!')
    }