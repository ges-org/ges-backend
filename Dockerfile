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

# Copy the current directory contents into the container at /gesBackendApi
ADD . /gesBackendApi/

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Run the migration commands and then start the server
CMD ["sh", "-c", "python manage.py makemigrations && python manage.py migrate && gunicorn gesBackendApi.wsgi:application --bind 0.0.0.0:8000 --workers 3"]
