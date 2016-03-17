<?php
	require_once("../BL/BLnivel.php");
	$postdata = file_get_contents("php://input");
	$request = json_decode($postdata);
	$f=$request->fun;//echo $f;	
	$blnivel=new BLnivel();
	if(isset($request->dat) && !empty($request->dat)){
		$r=$request->dat;	//echo var_dump($r);
		echo call_user_func_array(array($blnivel, $f),get_object_vars($r));
	}else{
		echo call_user_func(array($blnivel, $f));
	}
?>

