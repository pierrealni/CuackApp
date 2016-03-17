<?php 

	require_once("../conexion.php");
	
	class DAfavorito{
		//msqli_insert_id: devuelve el id generado por la conulta anterior para una columna autoincrement en caso de exito. Devolverá 0 si si no genera un valor auto_increment.
		//msqli_affected_rows: devolverá el número de filas afectadas por la última consulta insert,update,replace o delete en caso de exito. Devolverá -1 si la consulta fallo.
		
		public function addFavorito($idusuario, $idreceta){
			$sql="insert into favorito(idusuario, idreceta) values('".$idusuario."','".$idreceta."')";
			$link=Conectarse();
			//mysqli_query($link,$sql);		
			//$result=mysqli_insert_id($link);
			$result=mysqli_query($link,$sql);
			if($result){
				CerrarConexion($link);
				return $idusuario.",".$idreceta;
			}
			else{
				CerrarConexion($link);
			}	
		}	
		public function deleteFavorito($idusuario, $idreceta){
			$sql="delete from favorito where idusuario='".$idusuario."' and idreceta='".$idreceta."'";
			$link=Conectarse();
			mysqli_query($link,$sql);
			$result=mysqli_affected_rows($link);	
			CerrarConexion($link);
			return $result;	
		}
		
		public function existFavorito($idusuario, $idreceta){
			$sql="select concat(idusuario,',',idreceta) from favorito where idusuario='".$idusuario."' and  idreceta='".$idreceta."' ";
			$link=Conectarse();
			$result=mysqli_query($link,$sql);		
			CerrarConexion($link);
			return $result;	
		}
		
		public function getFavoritosxIdUsuario($idusuario){
			$sql = "select * from favorito where idusuario='".$idusuario."'";
			$link=Conectarse();
			$result=mysqli_query($link,$sql);
			CerrarConexion($link);
			return $result;		
		}	
	}
?>