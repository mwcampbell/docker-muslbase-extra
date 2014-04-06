FROM mwcampbell/muslbase
ENV SRC /src
ADD . $SRC
RUN $SRC/build.sh && \
    rm -rf $SRC && \
    (find /local -type f -name "*.a" -print | xargs rm -f) && \
    ((find /local -type f -print | grep -v '\.a$' | grep -v '\.o$' | xargs strip --strip-all) || true)
