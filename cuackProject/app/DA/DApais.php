<?php 

	require_once("../conexion.php");
	
	
	class DApais{
		public function getPaises(){
			$sql="select * from pais where estado=1 order by nombrepais";
			$link=Conectarse();
			$result=mysqli_query($link,$sql);
			CerrarConexion($link);
			return $result;		
		}
		
		public function getPais($idpais){
			$sql="select * from pais where estado=1 and idpais='".$idpais."'";
			$link=Conectarse();
			$result=mysqli_query($link,$sql);
			CerrarConexion($link);
			return $result;		
		}
	}
?>