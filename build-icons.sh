convert -flatten -resize 1024x1024 icon.xcf icon-1024x1024.png
convert -flatten -resize 114x114   icon.xcf icon@2x.png
convert -flatten -resize 57x57     icon.xcf icon.png
convert -gravity center -background white -resize 320x320  -extent 320x480 -flatten icon.xcf NaturalPomo/Default.png
convert -gravity center -background white -resize 640x640  -extent 640x960 -flatten icon.xcf NaturalPomo/Default@2x.png
convert -gravity center -background white -resize 640x640  -extent 640x1136 -flatten icon.xcf NaturalPomo/Default-568h@2x.png
