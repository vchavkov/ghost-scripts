|# in the container
/build
/start web

# UNMET PEER DEPENDENCY
rm -rf node_modules/
npm cache clean
npm install

# dokku ssh key for github
su dokku
ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
ssh -T git@github.com
