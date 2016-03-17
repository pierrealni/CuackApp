<?php 

	require_once("../conexion.php");
	
	class DAcomentario{
		//msqli_insert_id: devuelve el id generado por la conulta anterior para una columna autoincrement en caso de exito. Devolverá 0 si si no genera un valor auto_increment.
		//msqli_affected_rows: devolverá el número de filas afectadas por la última consulta insert,update,replace o delete en caso de exito. Devolverá -1 si la consulta fallo.
		
		//RECETAS
		public function getComentarios($idreceta){
			$sql="select * from comentario where idreceta='".$idreceta."'";
			$link=Conectarse();
			$result=mysqli_query($link,$sql);
			CerrarConexion($link);
			return $result;	
		}
		
		public function getCantidadComentarios($idreceta){
			$sql="select COUNT(descripcion) from comentario where idreceta='".$idreceta."'";
			$link=Conectarse();
			$result=mysqli_query($link,$sql);
			CerrarConexion($link);
			return $result;	
		}
		
		public function addComentario($idreceta, $idusuario, $descripcion){
			$sql="insert into comentario(idreceta, idusuario, descripcion) 
			       values('".$idreceta."','".$idusuario."','".$descripcion."')";
			$link=Conectarse();		
			$result=mysqli_query($link,$sql);//boolean si se llega a ejecutar
			CerrarConexion($link);
			if($result){
				return $idreceta.",".$idusuario.",".$descripcion;
			}
		}
		
		public function deleteComentario($item){
			$sql="delete from comentario where item='".$item."'";
			$link=Conectarse();
			mysqli_query($link,$sql);
			$result=mysqli_affected_rows($link);//$result=$idreceta;		
			CerrarConexion($link);
			return $result;	
		}
	}
?>