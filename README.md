# [mitmproxy-jsondump](https://github.com/fengqi5866/mitmproxy-jsondump)

## quick start

```bash
docker run --rm -d -p 8888:8888/tcp fengqi5866/mitmproxy-jsondump:20220520
```
or
```bash
docker run --rm -d -v ~/.mitmproxy:/home/mitmproxy/.mitmproxy -p 8888:8888/tcp fengqi5866/mitmproxy-jsondump:20220520
```

## code

[jsondump.py](https://raw.githubusercontent.com/mitmproxy/mitmproxy/main/examples/contrib/jsondump.py) copy
from [mitmproxy](https://github.com/mitmproxy/mitmproxy.git) project

## build from source

copy your mitmproxy ca into mitmproxy-ca folder

```bash
docker build -t your-tag --no-cache . 
docker push your-tag
docker run --rm -d -p 8888:8888/tcp your-tag
```