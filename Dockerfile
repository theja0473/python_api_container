# Base image
FROM python:3.9-alpine

# Set environment variables
ENV FLASK_APP app.py
ENV FLASK_RUN_HOST 0.0.0.0
ENV FLASK_ENV production

# Set working directory
WORKDIR /app

# Copy application files to working directory
COPY app.py requirements.txt ./

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 5000 for the Flask app
EXPOSE 5000

# Start the application
CMD ["flask", "run"]
