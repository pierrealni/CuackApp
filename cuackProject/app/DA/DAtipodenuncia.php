<?php 

	require_once("../conexion.php");
	
	class DAtipodenuncia{
		
		//SPRINT 4 H11: 
		public function getTipodenunciaxIdTipodenuncia($idtipodenuncia){
			$sql="select * from tipodenuncia where idtipodenuncia='".$idtipodenuncia."'";
			$link=Conectarse();
			$result=mysqli_query($link,$sql);
			CerrarConexion($link);
			return $result;
		}
		
		
	}
?>