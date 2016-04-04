from debian:unstable

arg sources_prefix=httpredir
env sources_prefix $sources_prefix
run sed -i s/httpredir/$sources_prefix/g /etc/apt/sources.list

run apt-get update && apt-get install -y build-essential curl git net-tools vim wrk

# Crystal
run curl http://dist.crystal-lang.org/apt/setup.sh | bash
run apt-get install -y crystal libssl-dev

# Python
run apt-get install -y python python-dev python-pip

# Ruby
run apt-get install -y ruby ruby-dev libsqlite3-dev
# Bundler
run gem install bundler --pre -N

# Rust
run apt-get install -y cargo rustc

add . /opt/benchmarks/
workdir /opt/benchmarks/
run ["/opt/benchmarks/install.sh"]

cmd ["/opt/benchmarks/run.sh"]
