# sudo docker build -t rilco .
# sudo docker run --name ril --rm -v $(pwd):/rilco -it rilco

FROM python:3.6.9
ENV MY_DIR=/rilco
WORKDIR ${MY_DIR}
COPY requirements.txt .
RUN python3 -m pip install -r requirements.txt
COPY . .
CMD bash
