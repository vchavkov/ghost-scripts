|# in the container
/build
/start web

# UNMET PEER DEPENDENCY
rm -rf node_modules/
npm cache clean
npm install
