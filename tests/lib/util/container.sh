RETURN=$(docker ps|grep $1|sed s/[^a-z0-9].*$//)
echo $RETURN
