<?php
	require_once("../BL/BLusuario.php");
	$postdata = file_get_contents("php://input");
	$request = json_decode($postdata);
	$f=$request->fun;//echo $f;	
	$blusuario=new BLusuario();
	if(isset($request->dat) && !empty($request->dat)){
		$r=$request->dat;	//echo var_dump($r);
		echo call_user_func_array(array($blusuario, $f),get_object_vars($r));
	}else{
		echo call_user_func(array($blusuario, $f));
	}
?>

