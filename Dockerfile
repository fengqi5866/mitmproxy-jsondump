FROM mitmproxy/mitmproxy:latest
RUN apt-get update && apt-get install -y curl
COPY mitmproxy-ca /home/mitmproxy/.mitmproxy
RUN curl -o /home/mitmproxy/jsondump.py https://ghproxy.com/https://raw.githubusercontent.com/mitmproxy/mitmproxy/main/examples/contrib/jsondump.py
RUN pip install requests
ENTRYPOINT ["mitmdump", "-p", "8888", "-s", "/home/mitmproxy/jsondump.py"]
EXPOSE 8888