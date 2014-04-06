FROM mwcampbell/muslbase
ENV SRC /src
ADD . $SRC
RUN $SRC/build.sh && \
    rm -rf $SRC && \
    (find /local type f -name "*.a" -print | xargs strip --strip-debug) && \
    (find /local type f -name "*.o" -print | xargs strip --strip-debug) && \
    ((find /local -type f -print | grep -v '\.a$' | grep -v '\.o$' | xargs strip --strip-all) || true)
