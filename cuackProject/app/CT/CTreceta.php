<?php
	require_once("../BL/BLreceta.php");	
	$postdata = file_get_contents("php://input");
	$request = json_decode($postdata);
	$f=$request->fun;//echo $f;	
	$blreceta=new BLreceta();
	
	if(isset($request->dat) && !empty($request->dat)){
		$r=($request->dat);	//echo var_dump($r);
		if($f=='xxxx'){
			echo var_dump(get_object_vars($request));
		}else{
			echo call_user_func_array(array($blreceta, $f),get_object_vars($r));
		}
		//echo get_object_vars($r);
	}else{
		echo call_user_func(array($blreceta, $f));
	}
?>