<?php
	require_once("../BL/BLcomentario.php");
	$postdata = file_get_contents("php://input");
	$request = json_decode($postdata);
	$f=$request->fun;//echo $f;	
	$blcomentario=new BLcomentario();
	if(isset($request->dat) && !empty($request->dat)){
		$r=$request->dat;	//echo var_dump($r);
		echo call_user_func_array(array($blcomentario, $f),get_object_vars($r));
	}else{
		echo call_user_func(array($blcomentario, $f));
	}
?>

