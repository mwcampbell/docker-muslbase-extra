FROM mwcampbell/muslbase
ENV SRC /src
ADD . $SRC
RUN $SRC/build.sh && \
    rm -rf $SRC
