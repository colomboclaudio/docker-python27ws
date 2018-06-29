FROM ubuntu:16.04

#Set Proxy
#ENV http_proxy http://192.168.8.8:3128
#ENV https_proxy http://192.168.8.8:3128

#Copia chiave ppa e aggiunta
#ppa.key ricavata da: http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x4F4EA0AAE5267A6C
COPY ppa.key /root/ppa.key
RUN apt-key add /root/ppa.key

#add repo list
COPY repos.list /etc/apt/sources.list.d/php56.list

#install package
RUN apt-get update && apt-get install -y python python-pip 
RUN pip install Flask flask-restful
#&& apt-get install -y nano software-properties-common 
#RUN apt-get install -y python-pip
#RUN pip install openpyxl

#start service apache2
EXPOSE 80
CMD ["python","/home/pda/ws.py"]
