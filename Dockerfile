# Start with heroku-18 as parent image
FROM heroku/heroku:18

# Sets the working directory 
WORKDIR /

# Copy Sinatra app into container
ADD app.rb app.rb
#ADD worker.rb worker.rb


RUN apt-get update ;\
apt-get install -y tzdata

# Set Time zone to TW.
ENV TZ=Asia/Taipei
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN  echo "Asia/Taipei" > /etc/timezone sudo
RUN  dpkg-reconfigure -f noninteractive tzdata 


# Install Sinatra gem
RUN gem install sinatra --no-ri --no-rdoc

# Start Sinatra
CMD ["ruby", "app.rb"]
