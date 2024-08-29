FROM busybox as downloader
ARG BINARY_URL
ARG CHECKSUM_URL
RUN wget $BINARY_URL $CHECKSUM_URL  
RUN BINARY_TAR_FILE=`basename $BINARY_URL` \
    CHECKSUM_FILE=`basename $CHECKSUM_URL` && \
    grep "${BINARY_TAR_FILE}" $CHECKSUM_FILE > CHECKSUM_ONLY_TAR && \
    sha256sum -c CHECKSUM_ONLY_TAR

# Extract and get only binary with --strip-components=2
RUN mkdir -p energi && tar xf `basename $BINARY_URL` -C energi --strip-components=2

FROM ubuntu:24.04
RUN useradd -ms /bin/bash ops
USER ops

COPY --from=downloader /energi/* /usr/local/bin/

ENTRYPOINT ["energi3"]

