FROM sinkcup/nginx-mkdocs:0.2.0
MAINTAINER sinkcup <sinkcup@163.com>

ADD . /usr/share/nginx/html/gmirror-portal
RUN cd /usr/share/nginx/html/gmirror-portal/ && \
  mkdocs build && \
  for file in `grep -lr googleapis site/`; do sed -i "s|href='https://fonts.googleapis.com/|href='http://fonts.gmirror.org/|g" $file; done
RUN rm -f /etc/nginx/conf.d/*
ADD nginx/conf.d /etc/nginx/conf.d/
