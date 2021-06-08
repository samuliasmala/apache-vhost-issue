# apache-vhost-issue
Code to replicate Stackoverflow [Apache virtualhosts are not processed if request headers are malformed](https://stackoverflow.com/questions/67789669/apache-virtualhosts-are-not-processed-if-request-headers-are-malformed) issue.

## Steps to replicate

### Start Apache server

A) Use the pre-built image  
`$ docker run -it --rm --name apache-server -p 8080:80 asmala/apache-vhost-issue`

B) Build your own image  
`$ docker build -t apache-vhost-issue .`  
`$ docker run -it --rm --name apache-server -p 8080:80 apache-vhost-issue`

### Test with curl

Run curl command with malformed headers:  
`curl -H 'Content-Length: 0' -H 'Content-Length: 0' -H 'Host: beta' http://localhost:8080`

Resulting error page address part:  
`<address>Apache/2.4.46 (Ubuntu) Server at alpha Port 80</address>`

Expected error page address part:  
`<address>Apache/2.4.46 (Ubuntu) Server at beta Port 80</address>`
