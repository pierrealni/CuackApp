<?php 

function Conectarsex(){
	if(!$link=mysql_connect("127.0.0.1", "root")){
		echo "Error al conectarse";
		exit();
	}
	if(!mysql_select_db("receta_cuack",$link)){
		echo "BD no disponible";
		exit();
	}
	return $link;
}

function Conectarse(){
	if(!$link=mysqli_connect("localhost","root","","receta_cuack")){
		echo "Error al conectarse";
		exit();
	}
	if(!mysqli_select_db($link,"receta_cuack")){
		echo "BD no disponible";
		exit();
	}
	if (!$link->set_charset("utf8")) {
		printf("Error cargando el conjunto de caracteres utf8: %s\n", $mysqli->error);
		exit();
	} else {
		//printf("Conjunto de caracteres actual: %s\n", $mysqli->character_set_name());
	}
	return $link;
}

function CerrarConexion($connect){
	return mysqli_close($connect);
}

?>