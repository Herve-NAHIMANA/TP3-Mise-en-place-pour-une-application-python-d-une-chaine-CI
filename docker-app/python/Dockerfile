FROM python:3

WORKDIR /var/jenkins_home/test

COPY ./app/  .

RUN pip install --no-cache-dir -r requirements.txt

ENV FLASK_APP="main"

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]