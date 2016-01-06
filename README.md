# Zoneminder Docker Image
Self-Contained Zoneminder Image build upon a Minimal Debian Base System

# Volumes

| Volume | Payload      |
|--------|:------------:| 
| /var/lib/mysql        | MySQL Database 
| /var/cache/zoneminder | Image Files 

# Build
No Special setup needed for build: 

~~~bash
 docker build -t cholzberger/zoneminder .
~~~
# Example
~~~bash
docker run -v /var/lib/mysql:/volumes/mysql -v /var/cache/zoneminder:/volumes/zoneminder
~~~




