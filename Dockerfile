FROM alpine:3.18.2
ENV REDIS_HOST=localhost
EXPOSE 5000
RUN apk update && apk add --update --no-cache git redis python3 py3-pip && ln -sf python3  
RUN git clone https://github.com/badtuxx/giropops-senhas.git
WORKDIR /giropops-senhas
RUN pip install --no-cache-dir -r requirements.txt
CMD redis-server & flask run --host=0.0.0.0

#docker container run --name giropops-senhas ewertao/linuxtips-giropops-senhas:VERSION