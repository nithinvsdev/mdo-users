FROM python:3.7-alpine
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOT=0.0.0.0
RUN apk add --no-cache gcc musl-dev linux-headers
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY app.py app.py
EXPOSE 5000
COPY . .
RUN python app.test.py
CMD ["flask", "run"]

