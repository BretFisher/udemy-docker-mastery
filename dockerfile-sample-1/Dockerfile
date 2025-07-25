#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#
FROM debian:bookworm-slim

LABEL maintainer="NGINX Docker Maintainers <docker-maint@nginx.com>"

ENV NGINX_VERSION   1.29.0
ENV NJS_VERSION     0.9.0
ENV NJS_RELEASE     1~bookworm
ENV PKG_RELEASE     1~bookworm
ENV DYNPKG_RELEASE  1~bookworm

RUN set -x \
    # create nginx user/group first, to be consistent throughout docker variants
    && groupadd --system --gid 101 nginx \
    && useradd --system --gid nginx --no-create-home --home /nonexistent --comment "nginx user" --shell /bin/false --uid 101 nginx \
    && apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y gnupg1 ca-certificates \
    && \
    NGINX_GPGKEYS="573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 8540A6F18833A80E9C1653A42FD21310B49F6B46 9E9BE90EACBCDE69FE9B204CBCDCD8A38D88A2B3"; \
    NGINX_GPGKEY_PATH=/etc/apt/keyrings/nginx-archive-keyring.gpg; \
    export GNUPGHOME="$(mktemp -d)"; \
    found=''; \
    for NGINX_GPGKEY in $NGINX_GPGKEYS; do \
    for server in \
    hkp://keyserver.ubuntu.com:80 \
    pgp.mit.edu \
    ; do \
    echo "Fetching GPG key $NGINX_GPGKEY from $server"; \
    gpg1 --keyserver "$server" --keyserver-options timeout=10 --recv-keys "$NGINX_GPGKEY" && found=yes && break; \
    done; \
    test -z "$found" && echo >&2 "error: failed to fetch GPG key $NGINX_GPGKEY" && exit 1; \
    done; \
    gpg1 --export $NGINX_GPGKEYS > "$NGINX_GPGKEY_PATH" ; \
    rm -rf "$GNUPGHOME"; \
    apt-get remove --purge --auto-remove -y gnupg1 && rm -rf /var/lib/apt/lists/* \
    && dpkgArch="$(dpkg --print-architecture)" \
    && nginxPackages=" \
    nginx=${NGINX_VERSION}-${PKG_RELEASE} \
    nginx-module-xslt=${NGINX_VERSION}-${DYNPKG_RELEASE} \
    nginx-module-geoip=${NGINX_VERSION}-${DYNPKG_RELEASE} \
    nginx-module-image-filter=${NGINX_VERSION}-${DYNPKG_RELEASE} \
    nginx-module-njs=${NGINX_VERSION}+${NJS_VERSION}-${NJS_RELEASE} \
    " \
    && case "$dpkgArch" in \
    amd64|arm64) \
    # arches officialy built by upstream
    echo "deb [signed-by=$NGINX_GPGKEY_PATH] https://nginx.org/packages/mainline/debian/ bookworm nginx" >> /etc/apt/sources.list.d/nginx.list \
    && apt-get update \
    ;; \
    *) \
    # we're on an architecture upstream doesn't officially build for
    # let's build binaries from the published packaging sources
    # new directory for storing sources and .deb files
    tempDir="$(mktemp -d)" \
    && chmod 777 "$tempDir" \
    # (777 to ensure APT's "_apt" user can access it too)
    \
    # save list of currently-installed packages so build dependencies can be cleanly removed later
    && savedAptMark="$(apt-mark showmanual)" \
    \
    # build .deb files from upstream's packaging sources
    && apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
    curl \
    devscripts \
    equivs \
    git \
    libxml2-utils \
    lsb-release \
    xsltproc \
    && ( \
    cd "$tempDir" \
    && REVISION="${NGINX_VERSION}-${PKG_RELEASE}" \
    && REVISION=${REVISION%~*} \
    && curl -f -L -O https://github.com/nginx/pkg-oss/archive/${REVISION}.tar.gz \
    && PKGOSSCHECKSUM="400593da45fc0195a01138c0c23a06059da1c6a2e26959f2c4c95fbaf63436ff211665ef01392d2b775a0133d5b57680dabe51b840a55f82e89621e84cf651d1 *${REVISION}.tar.gz" \
    && if [ "$(openssl sha512 -r ${REVISION}.tar.gz)" = "$PKGOSSCHECKSUM" ]; then \
    echo "pkg-oss tarball checksum verification succeeded!"; \
    else \
    echo "pkg-oss tarball checksum verification failed!"; \
    exit 1; \
    fi \
    && tar xzvf ${REVISION}.tar.gz \
    && cd pkg-oss-${REVISION} \
    && cd debian \
    && for target in base module-geoip module-image-filter module-njs module-xslt; do \
    make rules-$target; \
    mk-build-deps --install --tool="apt-get -o Debug::pkgProblemResolver=yes --no-install-recommends --yes" \
    debuild-$target/nginx-$NGINX_VERSION/debian/control; \
    done \
    && make base module-geoip module-image-filter module-njs module-xslt \
    ) \
    # we don't remove APT lists here because they get re-downloaded and removed later
    \
    # reset apt-mark's "manual" list so that "purge --auto-remove" will remove all build dependencies
    # (which is done after we install the built packages so we don't have to redownload any overlapping dependencies)
    && apt-mark showmanual | xargs apt-mark auto > /dev/null \
    && { [ -z "$savedAptMark" ] || apt-mark manual $savedAptMark; } \
    \
    # create a temporary local APT repo to install from (so that dependency resolution can be handled by APT, as it should be)
    && ls -lAFh "$tempDir" \
    && ( cd "$tempDir" && dpkg-scanpackages . > Packages ) \
    && grep '^Package: ' "$tempDir/Packages" \
    && echo "deb [ trusted=yes ] file://$tempDir ./" > /etc/apt/sources.list.d/temp.list \
    # work around the following APT issue by using "Acquire::GzipIndexes=false" (overriding "/etc/apt/apt.conf.d/docker-gzip-indexes")
    #   Could not open file /var/lib/apt/lists/partial/_tmp_tmp.ODWljpQfkE_._Packages - open (13: Permission denied)
    #   ...
    #   E: Failed to fetch store:/var/lib/apt/lists/partial/_tmp_tmp.ODWljpQfkE_._Packages  Could not open file /var/lib/apt/lists/partial/_tmp_tmp.ODWljpQfkE_._Packages - open (13: Permission denied)
    && apt-get -o Acquire::GzipIndexes=false update \
    ;; \
    esac \
    \
    && apt-get install --no-install-recommends --no-install-suggests -y \
    $nginxPackages \
    gettext-base \
    curl \
    && apt-get remove --purge --auto-remove -y && rm -rf /var/lib/apt/lists/* /etc/apt/sources.list.d/nginx.list \
    \
    # if we have leftovers from building, let's purge them (including extra, unnecessary build deps)
    && if [ -n "$tempDir" ]; then \
    apt-get purge -y --auto-remove \
    && rm -rf "$tempDir" /etc/apt/sources.list.d/temp.list; \
    fi \
    # forward request and error logs to docker log collector
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log \
    # create a docker-entrypoint.d directory
    && mkdir /docker-entrypoint.d

# COPY docker-entrypoint.sh /
# COPY 10-listen-on-ipv6-by-default.sh /docker-entrypoint.d
# COPY 15-local-resolvers.envsh /docker-entrypoint.d
# COPY 20-envsubst-on-templates.sh /docker-entrypoint.d
# COPY 30-tune-worker-processes.sh /docker-entrypoint.d
# ENTRYPOINT ["/docker-entrypoint.sh"]
#
EXPOSE 80

STOPSIGNAL SIGQUIT

CMD ["nginx", "-g", "daemon off;"]
