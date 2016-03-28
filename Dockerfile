from debian:unstable

run apt-get update && apt-get install -y build-essential curl git procps vim

# Crystal
run curl http://dist.crystal-lang.org/apt/setup.sh | bash
run apt-get install -y crystal libssl-dev

# Python
run apt-get install -y python python-dev
# pip
run curl https://bootstrap.pypa.io/get-pip.py | python

# Ruby
run apt-get install -y ruby ruby-dev libsqlite3-dev
# RVM
# run gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
# run curl -sSL https://get.rvm.io | bash
# Latest Ruby
# run source /etc/profile.d/rvm.sh && rvm install ruby --latest
# Bundler
run gem install bundler --pre -N

# wrk
workdir /opt/
run git clone https://github.com/wg/wrk.git
run cd wrk && make && cp wrk /usr/local/bin/

add . /opt/benchmarks/
run ["/opt/benchmarks/install.sh"]

workdir /opt/benchmarks/
cmd ["/opt/benchmarks/run.sh"]
