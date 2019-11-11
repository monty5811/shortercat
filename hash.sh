CSS=$(md5sum dist/main.css | awk '{print "main."substr($1, 1, 7)".css"}')
ELM=$(md5sum dist/elm.min.js | awk '{print "elm.min."substr($1, 1, 7)".js"}')

cp dist/main.css $(echo "dist/$CSS")
cp dist/elm.min.js $(echo "dist/$ELM")

sed -i s/main.css/$CSS/g dist/index.html
sed -i s/elm.min.js/$ELM/g dist/index.html
