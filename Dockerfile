FROM centos
MAINTAINER Admin <admin@admin.com>

# RUN: buildするときに実行される
# RUN echo "now building..."
# CMD: runするときに実行される
CMD echo "now running..."

# httpdのインストール
RUN yum install -y nginx

# ドキュメントルート
ADD ./app /app
ADD ./web/default.conf /etc/nginx/conf.d/default.conf

#ポート80を開ける
EXPOSE 80
EXPOSE 8080

RUN mkdir -p /run/nginx

#runした時にnginx起動
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
