# benchmarks

A collection of simple web framework benchmarks.

Configurations:

* crystal
  * kemal
* python
  * flask-uwsgi
* ruby
  * rails-puma
  * rails-api-puma
  * sinatra-puma
  * sinatra-thin

Apps:
  * hello

Running:
```
docker build -t benchmarks .
# or if you wish not to use httpredir
docker build --build-arg sources_prefix=ftp.pl -t benchmarks .

docker rm -f benchmarks
docker run --name benchmarks benchmarks
```

Manually running:
```
# install dependencies as in Dockerfile
./install.sh # once
./run.sh
```
