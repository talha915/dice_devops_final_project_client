# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Declare a volume to persist client data
VOLUME /clientdata

# Set the working directory in the container
WORKDIR /clientdata

# Copy the requirements.txt file and install any needed packages
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

RUN mkdir -p /clientdata

# Copy the application files into the container
COPY app /clientdata/app

# Ensure the clientdata directory has the right permissions
RUN chmod -R 777 /clientdata

# Set the working directory for running the script
WORKDIR /clientdata/app

# Run the client.py script when the container launches
CMD ["python", "client.py"]
