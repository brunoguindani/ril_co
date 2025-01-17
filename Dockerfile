# sudo docker build -t rilco .
# sudo docker run --name ril --rm -v $(pwd):/rilco -it rilco

FROM python:3.10.4
ENV MY_DIR=/rilco
WORKDIR ${MY_DIR}
RUN apt-get update
RUN apt-get install --yes libopenmpi-dev ffmpeg libsm6 libxext6
COPY requirements.txt .
RUN python3 -m pip install -r requirements.txt
RUN python3 -m pip install git+https://github.com/openai/baselines@ea25b9e8
COPY . .
CMD bash
