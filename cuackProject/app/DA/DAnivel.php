<?php 

	require_once("../conexion.php");
	
	class DAnivel{
		
		public function getNivel($idnivel){
			$sql = "select * from nivel where idnivel='".$idnivel."'";
			$link=Conectarse();
			$result=mysqli_query($link,$sql);
			CerrarConexion($link);
			return $result;		
		}
	}
?>