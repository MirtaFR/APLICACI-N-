<!DOCTYPE html>
<html>
<head>
<style>
.frame {
	background-color: #5ee40c;
	display: flex;
	flex-direction: row;
	justify-content: center;
	width: 100%;
}

.frame .div {
	background-color: #5ee40c;
	width: 1452px;
	height: 1040px;
	position: relative;
}

.frame .overlap-group {
	position: absolute;
	width: 708px;
	height: 215px;
	top: 18px;
	left: 16px;
}

.frame .rectangle {
	position: absolute;
	width: 489px;
	height: 98px;
	top: 46px;
	left: 219px;
	object-fit: cover;
}

.frame .juguete-removebg {
	position: absolute;
	width: 270px;
	height: 215px;
	top: 0;
	left: 0;
	object-fit: cover;
}

.frame .text-wrapper {
	position: absolute;
	width: 222px;
	height: 65px;
	top: 55px;
	left: 50px;
	text-shadow: 0px 4px 4px #00000040;
	-webkit-text-stroke: 1px #000000;
	font-family: "Inria Sans-Bold", Helvetica;
	font-weight: 700;
	color: #000000;
	font-size: 38px;
	text-align: center;
	letter-spacing: 4.56px;
	line-height: 12px;
}

.frame .overlap {
	position: absolute;
	width: 304px;
	height: 106px;
	top: 604px;
	left: 196px;
}

.frame .text-wrapper-2 {
	position: absolute;
	width: 221px;
	height: 65px;
	top: 300px;
	left: 42px;
	text-shadow: 0px 4px 4px #00000040;
	-webkit-text-stroke: 1px #000000;
	font-family: "Inria Sans-Bold", Helvetica;
	font-weight: 700;
	color: #000000;
	font-size: 38px;
	text-align: center;
	letter-spacing: 4.56px;
	line-height: 12px;
}

.frame .text-wrapper-2 {
	position: absolute;
	width: 221px;
	height: 65px;
	top: -50px;
	left: 20px;
	text-shadow: 0px 4px 4px #00000040;
	-webkit-text-stroke: 1px #000000;
	font-family: "Inria Sans-Bold", Helvetica;
	font-weight: 700;
	color: #000000;
	font-size: 38px;
	text-align: center;
	letter-spacing: 4.56px;
	line-height: 12px;
}

.frame .image {
	position: absolute;
	width: 304px;
	height: 72px;
	top: -50px;
	left: 0;
	border-radius: 100px;
	mix-blend-mode: color;
	background: linear-gradient(180deg, rgb(231.41, 19.09, 210.18) 0%,
		rgba(202.42, 28.32, 180.57, 0.83) 50%, rgba(63.74, 72.45, 38.94, 0)
		100%);
	display: block;
}

.frame .overlap-2 {
	position: absolute;
	width: 606px;
	height: 96px;
	top: -200px;
	left: -42px;
}

.frame .overlap-3 {
	position: absolute;
	width: 606px;
	height: 96px;
	top: 10px;
	left: -42px;
}

.frame .text-wrapper-3 {
	position: absolute;
	width: 336px;
	height: 65px;
	top: -50px;
	left: -65px;
	text-shadow: 0px 4px 4px #00000040;
	-webkit-text-stroke: 1px #000000;
	font-family: "Inria Sans-Bold", Helvetica;
	font-weight: 700;
	color: #000000;
	font-size: 38px;
	text-align: center;
	letter-spacing: 4.56px;
	line-height: 12px;
}

.frame .image-2 {
	position: absolute;
	width: 572px;
	height: 62px;
	top: 0;
	left: 34px;
	border-radius: 100px;
	mix-blend-mode: color;
	background: linear-gradient(180deg, rgb(148.73, 114.3, 151.73) 0%,
		rgba(100.46, 81.83, 109.23, 0) 100%);
}

.frame .no-tienes-una-cuenta {
	position: absolute;
	width: 609px;
	height: 42px;
	top: 913px;
	left: 144px;
	font-family: "Inria Sans-Bold", Helvetica;
	font-weight: 700;
	color: #000000;
	font-size: 30px;
	text-align: center;
	letter-spacing: 3.6px;
	line-height: 12px;
}

.frame .img {
	position: absolute;
	width: 647px;
	height: 1040px;
	top: -600px;
	left: 840px;
	object-fit: cover;
}

.frame .image-3 {
	position: absolute;
	width: 572px;
	height: 62px;
	top: 517px;
	left: 67px;
	border-radius: 100px;
	mix-blend-mode: color;
	background: linear-gradient(180deg, rgb(148.73, 114.3, 151.73) 0%,
		rgba(100.46, 81.83, 109.23, 0) 100%);
}

.rounded-input {
	border-radius: 50px; /* Hace el campo de entrada redondo */
	padding: 10px; /* Ajusta el relleno según tu preferencia */
	width: 500px;
	/* Otros estilos que desees aplicar */
}

#submit_btn {
	width: 304px;
	top: -100px;
	height: 72px;
	border: none;
	border-radius: 100px;
	background: linear-gradient(180deg, rgb(231.41, 19.09, 210.18) 0%,
		rgba(202.42, 28.32, 180.57, 0.83) 50%, rgba(63.74, 72.45, 38.94, 0)
		100%);
	color: #fff;
	font-size: 18px;
	height: 72px;
}

.box .image {
	position: fixed;
	width: 572px;
	height: 62px;
	top: 0;
	left: 0;
	border-radius: 100px;
	mix-blend-mode: color;
	background: linear-gradient(180deg, rgb(148.73, 114.3, 151.73) 0%,
		rgba(100.46, 81.83, 109.23, 0) 100%);
}

/* Aplica los estilos al input con el ID 'login_id' */
#login_id {
	width: 572px;
	height: 62px;
	border-radius: 100px;
	mix-blend-mode: color;
	background: linear-gradient(180deg, rgb(148.73, 114.3, 151.73) 0%,
		rgba(100.46, 81.83, 109.23, 0) 100%);
}

#login_pwd {
	width: 572px;
	height: 62px;
	border-radius: 100px;
	mix-blend-mode: color;
	background: linear-gradient(180deg, rgb(148.73, 114.3, 151.73) 0%,
		rgba(100.46, 81.83, 109.23, 0) 100%);
	color
}

#submit_btn {
	margin-top: 150px;
	/* Ajusta la cantidad de margen superior según tus necesidades */
}

.text-wrapper-3, .text-wrapper-2 {
	color: black !important;
}

#login_id, #login_pwd {
	color: red; /* Cambia el color del texto a negro */
	border: 2px solid #000;
	/* Agrega un borde negro para separar el campo */
	font-size: 40px;
	/* Ajusta el tamaño de fuente según tus preferencias */
}

.input-group input {
	color: black;
}
</style>
</head>
<body>
	<div class="frame">
		<div class="div">
			<div class="overlap-group">
				<img class="rectangle" src="img/rectangle-9.png" /> <img
					class="juguete-removebg" src="img/juguete-2-removebg-preview-2.png" />
			</div>
			<div class="no-tienes-una-cuenta">
				¿No tienes una cuenta?
				<div style="margin-top: 50px;">
					<a href="<%=request.getContextPath()%>/register.jsp"
						style="color: black">Regístrate</a>
				</div>
			</div>

			<div id="login_form" class="overlap" style="display: block;">
				<form id="user_login_form" name="loginForm" method="post"
					action="Login">
					<!----- LOGIN FORM ----->
					<div class="overlap-2">
						<div class="text-wrapper-3">Usuario</div>
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-user"></i></span> <input type="text"
								class="form-control rounded-input" id="login_id"
								placeholder="Enter login id ..." name="login_id">
						</div>

					</div>

					<div class="overlap-3">
						<div class="text-wrapper-2" style="color: black;">Contraseña</div>
						<div class="input-group">
							<span class="input-group-addon" style="border-radius: 50px;">
								<i class="glyphicon glyphicon-lock"></i>
							</span> <input type="password" class="form-control rounded-input"
								id="login_pwd" placeholder="Enter password ..." name="login_pwd"
								style="color: black;">
						</div>
					</div>



					<!----- SUBMIT BUTTON ----->
					<div></div>
					<button id="submit_btn" type="submit" class="btn btn-primary">Ingresar</button>
				</form>
				<div>
					<img class="img" src="img/image-28.png" />
				</div>
			</div>

		</div>
	</div>
</body>

</html>