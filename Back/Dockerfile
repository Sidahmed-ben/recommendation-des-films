FROM python:3.11.5

WORKDIR /app
COPY requirements.txt /app/requirements.txt

RUN python3 -m venv .venv \
    && . .venv/bin/activate
ENV PATH="/app/venv/bin:$PATH"

RUN pip install --upgrade pip \
    && pip install -r requirements.txt

# Copy the application files
COPY . /app

# Set the entrypoint to start the Flask application
ENTRYPOINT ["python", "app.py"]
