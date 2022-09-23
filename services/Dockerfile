FROM python:3.8

RUN useradd weknowx

WORKDIR /home/weknowx

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
RUN pip install gunicorn

COPY weblog weblog
COPY weblog.py setup.py boot.sh ./
RUN chmod +x boot.sh

ENV FLASK_APP weblog.py

RUN chown -R weblog:weblog ./
USER weblog

EXPOSE 5000
ENTRYPOINT ["./boot.sh"]