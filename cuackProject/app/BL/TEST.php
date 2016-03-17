<?php 
	require_once("../BL/BLusuario.php");
	$blusuario= new BLusuario();
	echo $blusuario->getUsuariosSeguidos(2);//getUsuariosSeguidos('1');
	// require_once("../BL/BLfavorito.php");
	// $blfav= new BLfavorito();
	// echo $blfav->getFavoritosxIdUsuario(2)
?>