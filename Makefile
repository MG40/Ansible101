spawn: 
	echo "Spawning control node . ."
	docker run -itd --name control -h control ansible:v2.0 bash
	echo "Spawning host01 . ."
	docker run -itdP --name host01 -h host01 centos:v2.0 -o LogLevel=DEBUG
	echo "Spawning host02 . ."
	docker run -itdP --name host02 -h host02 centos:v2.0 -o LogLevel=DEBUG
list:
	docker ps -a
control:
	docker build --tag ansible:v2.0 .
host:
	docker build --tag centos:v2.0 .
exec_control:
	docker exec -it control bash
exec_host01:
	docker exec -it host01 bash
exec_host02:
	docker exec -it host02 bash
clean:
	docker rm -f $(docker ps -aq)

