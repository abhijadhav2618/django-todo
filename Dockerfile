# Use a stable Python version
FROM python:3.10

# Set working directory
WORKDIR /data

# Install system dependencies
RUN apt-get update && apt-get install -y python3-distutils python3-apt && rm -rf /var/lib/apt/lists/*

# Upgrade pip and install required packages
RUN pip install --upgrade pip setuptools

# Install Django and other dependencies
RUN pip install django==3.2

# Copy application files
COPY . .

# Run database migrations before starting the server
RUN python manage.py migrate

# Expose port 8000 for the app
EXPOSE 8000

# Start the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
