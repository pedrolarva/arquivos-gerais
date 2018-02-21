FROM centos:7

MAINTAINER Pedro Leite <pedro.larva@gmail.com>

RUN yum install -y epel-release
RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
RUN yum install -y wget mod_ssl openssl unzip php56w-pear php56w-devel openssl-devel php56w-mbstring php56w-pdo php56w-pgsql php56w-mysql php56w httpd curl 
RUN wget https://github.com/pedrolarva/arquivos-gerais/raw/master/mongo.so
RUN mv mongo.so /usr/lib64/php/modules/mongo.so
RUN echo 'extension=mongo.so' >> /etc/php.ini
RUN rm -rf /etc/httpd/conf.d/README /etc/httpd/conf.d/userdir.conf /etc/httpd/conf.d/welcome.conf /etc/httpd/conf.d/ssl.conf /var/log/httpd/error_log /var/log/httpd/access_log
RUN ln -s /dev/stderr /var/log/httpd/error_log
RUN ln -s /dev/stdout /var/log/httpd/access_log

# Personalizar aqui seu conf do apache.
RUN curl https://raw.githubusercontent.com/pedrolarva/arquivos-gerais/master/default.conf >  /etc/httpd/conf.d/default.conf


CMD ["/sbin/httpd", "-X"] 


