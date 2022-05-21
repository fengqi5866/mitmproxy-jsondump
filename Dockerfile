FROM mitmproxy/mitmproxy:latest
RUN apt-get update && apt-get install -y curl

COPY mitmproxy-ca /home/mitmproxy/.mitmproxy
ADD jsondump.py /home/mitmproxy/jsondump.py
RUN pip install requests

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 8888

CMD ["mitmdump", "-p 8888"]
