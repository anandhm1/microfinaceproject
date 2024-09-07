# Base image with Python 3.9
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app
COPY ./MicroFinanceProject /app
# Copy the requirements file into the container

# Install dependencies
RUN pip install --upgrade pip
RUN pip install django
# Copy the entire project into the container
COPY . .

# Set environment variables (update as needed)
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Run collectstatic for production (if applicable
# Expose the port that the app runs on
EXPOSE 8000

# Run database migrations and start the Django development server
CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]
