# Demo1.1

host1:
docker run -it ubuntu

container:
ps auxf

host0:
ps auxf
kill -9 id

# Demo1.2

host0:
ip -c -br a

container:
apt update && apt install -y iproute2

host0:
brctl show

# Demo1.3

container:
touch test-file123

host0:
find / -name test-file123

# Demo2

host0:
docker info

docker container inspect <id>

# Demo3.1

host0:
docker volume create volume1
docker volume ls

host1:
docker run -it -v volume1:/volume1 ubuntu
df -h
touch /volume1/file-volume
echo "text" > /volume1/file-volume
ls /volume1
exit
docker ps -a
docker container prune
docker ps -a 

docker run -it -v volume1:/volume1 ubuntu
cat /volume1/file-volume

host0:
find / -name file-volume

# Demo3.2

host0:
mkdir bind-mount
touch bind-mount/bind-file
echo "test" > bind-mount/bind-file

docker run -it -v /root/bind-mount/:/bm ubuntu
