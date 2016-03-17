<?php 

	require_once("../conexion.php");
	
	class DAetiqueta{
		/*
		public function getNombreEtiquetaxIdEtiqueta($idetiqueta){
			$sql="select nombreetiqueta from etiqueta where idetiqueta='".$idetiqueta."'";
			$link=Conectarse();
			$result=mysqli_query($link,$sql);
			CerrarConexion($link);
			return $result;		
		}
		
		public function getIdEtiquetaxNombreEtiqueta($nombreetiqueta){	
			$sql="select idetiqueta from etiqueta where nombreetiqueta='".$nombreetiqueta."'";
			$link=Conectarse();
			$result=mysqli_query($link,$sql);
			CerrarConexion($link);	
			return $result;
		}		
		*/
		//
		public function getEtiqueta($idetiqueta){
			$sql="select * from etiqueta where estado=1 and idetiqueta='".$idetiqueta."'";
			$link=Conectarse();
			$result=mysqli_query($link,$sql);
			CerrarConexion($link);
			return $result;
		}
				
		public function getEtiquetaxNombreEtiqueta($nombreetiqueta){
			$sql="select * from etiqueta where estado=1 and nombreetiqueta='".$nombreetiqueta."'";
			$link=Conectarse();
			$result=mysqli_query($link,$sql);
			CerrarConexion($link);	
			return $result;
		}

		public function addEtiqueta($nombreetiqueta){
			$sql="insert into etiqueta (nombreetiqueta) values('".$nombreetiqueta."')";
			$link=Conectarse();
			mysqli_query($link,$sql);		
			$result=mysqli_insert_id($link);
			CerrarConexion($link);
			return $result;	
		}
		
		public function disableEtiquetaxNombreEtiqueta($nombreetiqueta){
			$sql="update etiqueta set estado=0 where nombreetiqueta='".$nombreetiqueta."'";
			$link=Conectarse();
			mysqli_query($link,$sql);
			$result=mysqli_affected_rows($link);//
			CerrarConexion($link);
			return $result;
		}		
		
		public function enableEtiquetaxNombreEtiqueta($nombreetiqueta){
			$sql="update etiqueta set estado= 1 where nombreetiqueta='".$nombreetiqueta."'";
			$link=Conectarse();
			mysqli_query($link,$sql);		
			$result=mysqli_affected_rows($link);//
			CerrarConexion($link);
			return $result;	
		}

		public function existEtiquetaxNombreEtiqueta($nombreetiqueta){
			$sql="select idetiqueta from etiqueta where nombreetiqueta='".$nombreetiqueta."'";
			$link=Conectarse();
			$result=mysqli_query($link,$sql);		
			CerrarConexion($link);
			return $result;	
		}	
	}
?>