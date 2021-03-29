touch style.css

cat <<EOF > index.html
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="style.css">
	<title>Document</title>
</head>
<body>
	<script src="main.js"></script>
</body>
</html>
EOF

cat <<EOF > main.js
window.onload = () => {
  start()  
}

function start() {

}
EOF
