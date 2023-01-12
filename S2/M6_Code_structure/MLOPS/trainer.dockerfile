# Base image
FROM python:3.7-slim

# install python
RUN apt update && \
    apt install --no-install-recommends -y build-essential gcc && \
    apt clean && rm -rf /var/lib/apt/lists/*



# Application specific
# the essential parts from our computer to the container
COPY requirements.txt requirements.txt
COPY setup.py setup.py
COPY src/ src/
COPY data/ data/

#et the working directory in our container and dependencies
WORKDIR /
RUN pip install -r requirements.txt --no-cache-dir

# entrypoint is the application that we want to run when the image is being executed
ENTRYPOINT ["python", "-u", "src/models/train_model.py"]


