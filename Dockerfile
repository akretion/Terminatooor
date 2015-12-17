FROM wmarinho/pentaho-kettle
MAINTAINER Raphaël Valyi <raphael.valyi@akretion.com>

user root
ADD ./ /Ruby-Scripting-for-Kettle/
run ls -la /Ruby-Scripting-for-Kettle/
RUN echo "kettle-dir=/opt/pentaho/data-integration" > /Ruby-Scripting-for-Kettle/build.properties

RUN DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y ant && \
    apt-get clean

RUN chown -R pentaho /Ruby-Scripting-for-Kettle
USER pentaho
RUN cd /Ruby-Scripting-for-Kettle && ant install

WORKDIR /opt/pentaho/data-integration

EXPOSE 8181

CMD ["./carte.sh", "0.0.0.0", "8181"]

