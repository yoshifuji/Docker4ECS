FROM centos
MAINTAINER Admin <admin@admin.com>

# RUN: buildするときに実行される
# RUN echo "now building..."
# CMD: runするときに実行される
CMD echo "now running..."

# httpdのインストール
RUN yum install -y nginx

# ホストのindex.htmlをImage内にコピー
ADD ./index.html /usr/share/nginx/html/

#ポート80を開ける
EXPOSE 80
# EXPOSE 8888

RUN mkdir -p /run/nginx

#runした時にnginx起動
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
