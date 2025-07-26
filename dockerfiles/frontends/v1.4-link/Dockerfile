# syntax=docker/dockerfile:1.4
# COPY/ADD can now include files in a layer without invalidating layer cache

# Example 1: if images change, RUN layer isn't re-run
# Example 2: if only a --link layer needs updating, FROM and other layers aren't needed in cache

FROM alpine as stage1

# if these files change, the RUN layer below is still valid and cache is used
COPY /static/images /app/images


FROM alpine as stage2

# If this line changes, the COPY --link isn't affected
RUN apk add --no-cache curl


COPY --link --from=stage1 /app/images /app/images
