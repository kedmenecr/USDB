eval "$(ssh-agent -s)" # Start ssh-agent cache
chmod 600 id_rsa # Allow read access to the private key
ssh-add id_rsa # Add the private key to SSH

git config --global push.default matching
git remote add deploy ssh://root@$IP:$PORT$DEPLOY_DIR
git push deploy master

# Skip this command if you don't need to execute any additional commands after deploying.
ssh  root@$IP -p $PORT <<EOF
    cd /root/BlogInfra/USDB
    git checkout origin/feature/mk-190618-USDB-2
    docker build -t "usdb" .
	  docker run -d --network "blog-infra" --name "usdb" -p 9090:9090 usdb
	  docker logs usdb >> /var/log/containers.log  

    EOF
