IP="116.202.28.78"
PORT="22"
DEPLOY_DIR="/root/BlogInfra"

eval "$(ssh-agent -s)" # Start ssh-agent cache
chmod 600 .travis/id_rsa # Allow read access to the private key
ssh-add .travis/id_rsa # Add the private key to SSH

git config --global push.default matching
git remote add deploy ssh://git@$IP:$PORT$DEPLOY_DIR
echo "uspijeh" > /var/log/uspeh.txt
