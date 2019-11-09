# build all css
postcss -o main.css ./src/main.css
# build app
parcel build --public-url https://shortercatechism.app index.html
# rebuild minimal css
NODE_ENV=production postcss -o main.css ./src/main.css
# rebuild app
parcel build --public-url https://shortercatechism.app index.html
