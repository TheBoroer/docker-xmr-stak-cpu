FROM alpine:3.6

MAINTAINER docker@bo.ro

COPY start.sh /tmp/
COPY config.txt /tmp/

RUN   adduser -S -D -H -h /xmr-stak-cpu/bin miner
RUN   chown miner /tmp/config.txt
RUN   chmod +x /tmp/start.sh

RUN   apk --no-cache upgrade && \
      apk --no-cache add \
          openssl-dev \
          cmake \
          g++ \
          build-base \
          git
        
RUN   git clone https://github.com/TheBoroer/xmr-stak-cpu && \
      cd xmr-stak-cpu && \
      cmake -DHWLOC_ENABLE=OFF -DMICROHTTPD_ENABLE=OFF -DMICROHTTPD_REQUIRED=OFF -DCMAKE_LINK_STATIC=ON . && \
      make
      
RUN   apk del \
          cmake \
          g++ \
          build-base \
          git

WORKDIR /tmp

USER miner
ENTRYPOINT ["/tmp/start.sh"]