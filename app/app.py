from flask import Flask, render_template, request, redirect, url_for
import boto3
import pymysql
import uuid
import datetime
import os
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()

app = Flask(__name__)

# AWS Config
region = os.getenv("AWS_REGION")
bucket_name = os.getenv("BUCKET_NAME")

s3 = boto3.client('s3', region_name=region)
dynamodb = boto3.resource('dynamodb', region_name=region)
dynamo_table = dynamodb.Table('image_metadata')

# RDS Config
rds_host = os.getenv("RDS_HOST")
rds_user = os.getenv("RDS_USER")
rds_password = os.getenv("RDS_PASSWORD")
rds_db = os.getenv("RDS_DB")


@app.route('/')
def index():
    return render_template('index.html', title="Employee Registration")


@app.route('/upload', methods=['POST'])
def upload():
    name = request.form.get('name')
    location = request.form.get('location')
    age = request.form.get('age')
    tech = request.form.get('technology')
    file = request.files.get('photo')

    if file:
        filename = f"{uuid.uuid4()}_{file.filename}"
        try:
            # Upload to S3
            s3.upload_fileobj(file, bucket_name, filename)

            # Save metadata to DynamoDB
            dynamo_table.put_item(Item={
                'filename': filename,
                'upload_time': datetime.datetime.utcnow().isoformat()
            })

            # Save employee data to RDS
            with pymysql.connect(host=rds_host, user=rds_user,
                                 password=rds_password, db=rds_db) as connection:
                with connection.cursor() as cursor:
                    cursor.execute("""
                        INSERT INTO employees (name, location, age, technology) 
                        VALUES (%s, %s, %s, %s)
                    """, (name, location, age, tech))
                    connection.commit()

        except Exception as e:
            print(f"Error during upload: {e}")
            return "An error occurred while saving employee data.", 500

    return redirect(url_for('success'))


@app.route('/success')
def success():
    return render_template('success.html', title="Upload Successful")


@app.route('/about')
def about():
    return redirect(f"http://{bucket_name}.s3-website.{region}.amazonaws.com")


@app.route('/get_employee', methods=['GET', 'POST'])
def get_employee():
    employee = None
    employee_id = None

    if request.method == 'POST':
        employee_id = request.form.get('employee_id')

        try:
            with pymysql.connect(host=rds_host, user=rds_user,
                                 password=rds_password, db=rds_db) as connection:
                with connection.cursor() as cursor:
                    cursor.execute("SELECT * FROM employees WHERE id = %s", (employee_id,))
                    employee = cursor.fetchone()

        except Exception as e:
            print(f"Error fetching employee: {e}")

    return render_template('get_employee.html', employee=employee,
                           employee_id=employee_id, title="Find Employee")


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000, debug=True)
