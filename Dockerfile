# The first instruction is what image we want to base our container on
# We use an official Python runtime as a parent image
FROM python:3.12

# The environment variable ensures that the Python output is set straight
# to the terminal without buffering it first
ENV PYTHONUNBUFFERED 1

# Create root directory for our project in the container
RUN mkdir /gesBackendApi

# Set the working directory to /gesBackendApi
WORKDIR /gesBackendApi

# ARG AWS_ACCESS_KEY_ID 
# ARG AWS_S3_ENDPOINT_URL  
# ARG AWS_SECRET_ACCESS_KEY  
# ARG AWS_STORAGE_BUCKET_NAME 
# ARG PGDATABASE 
# ARG PGHOST 
# ARG PGPASSWORD  
# ARG PGUSER   

# ENV AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
# ENV AWS_S3_ENDPOINT_URL=$AWS_S3_ENDPOINT_URL  
# ENV AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY 
# ENV AWS_STORAGE_BUCKET_NAME=$AWS_STORAGE_BUCKET_NAME 
# ENV PGDATABASE=$PGDATABASE
# ENV PGHOST=$PGHOST
# ENV PGPASSWORD=$PGPASSWORD  
# ENV PGUSER=$PGUSER

# Copy the current directory contents into the container at /gesBackendApi
ADD . /gesBackendApi/

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Run the migration commands and then start the server
CMD ["sh", "-c", "python manage.py makemigrations && python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]
