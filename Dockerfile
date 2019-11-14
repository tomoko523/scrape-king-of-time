FROM lambci/lambda:build-python3.6

ENV AWS_DEFAULT_REGION ap-northeast-1
ENV APP_DIR /var/task

ADD . .

CMD pip install -r requirements.txt -t $APP_DIR && \
    chmod -R 755 $APP_DIR  && \
    zip -9 deploy_package.zip run.py && \
    zip -r9 deploy_package.zip *
