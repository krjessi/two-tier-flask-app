# base image
FROM python:3.9-slim

# Working Directory
WORKDIR /app

# install required packages
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

# copy the requirements file into container
COPY requirements.txt .

# install app dependencies
RUN pip install mysqlclient
RUN pip install --no-cache-dir -r requirements.txt

# copy the rest of the application code
COPY . .

# specify the command to run application
CMD ["python","app.py"]
