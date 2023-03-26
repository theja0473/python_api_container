# Base image
FROM python:slim

# Set environment variables
ENV FLASK_APP app.py
ENV FLASK_RUN_HOST 0.0.0.0
ENV FLASK_ENV production

# Set working directory
WORKDIR /app

# Copy application files to working directory
COPY app.py .
COPY requirements.txt .

# Install dependencies
RUN python -m pip install --upgrade pip \
    && pip install --no-cache-dir flask flask-limiter flask-logger

# Expose port 5000 for the Flask app
EXPOSE 5000

# Start the application
#CMD ["flask", "run"]
ENTRYPOINT ["python", "app.py"]
