FROM golang:1.4


RUN mkdir -p $GOPATH/src/github.com/x \
&& cd $GOPATH/src/github.com/x \
&& git clone https://github.com/toolkits/net.git net \
&& git clone https://github.com/golang/tools.git tools \
&& cp $GOPATH/src/github.com/x $GOPATH/src/golang.org/x

RUN mkdir -p $GOPATH/src/github.com/dinp \
&& cd $GOPATH/src/github.com/dinp \
&& git clone https://github.com/smartcaas/server.git \
&& cd server \
&& go get ./... \
&& go build
WORKDIR $GOPATH/src/github.com/dinp/server/
COPY cfg.json $GOPATH/src/github.com/dinp/server/cfg.json
COPY run.sh /run.sh
RUN chmod +x /run.sh
EXPOSE 1980 1970
CMD ["/run.sh"]
