wget https://dl.google.com/go/go1.12.6.linux-amd64.tar.gz && sudo  tar -C /usr/local -xzf go1.12.6.linux-amd64.tar.gz

vi .profile

export PATH=$PATH:/usr/local/go/bin
export GOROOT=/usr/local/go
export GOPATH=/home/ubuntu/gopath

source .profile
