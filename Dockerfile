# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make entrypoint script executable if it exists
RUN if [ -f entrypoint.sh ]; then chmod +x entrypoint.sh; fi

# Make port 5000 available to the world outside this container
EXPOSE 5010

# Define environment variable
ENV NAME World

# Run entrypoint script when the container launches
CMD ["./entrypoint.sh"]
