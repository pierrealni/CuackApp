<?php 

	require_once("../conexion.php");
	
	class DAcalificacion{
		//msqli_insert_id: devuelve el id generado por la conulta anterior para una columna autoincrement en caso de exito. Devolverá 0 si si no genera un valor auto_increment.
		//msqli_affected_rows: devolverá el número de filas afectadas por la última consulta insert,update,replace o delete en caso de exito. Devolverá -1 si la consulta fallo.

		public function addCalificacion($idreceta, $idnivel, $idusuario){
			$sql="insert into calificacion (idreceta, idnivel, idusuario) 
			values('".$idreceta."','".$idnivel."','".$idusuario."')";
			$link=Conectarse();
			$result=mysqli_query($link,$sql);//boolean si se llega a ejecutar
			CerrarConexion($link);	
			if($result){
				
				return $idreceta.",".$idnivel.",".$idusuario;
			}		
		}
		
		public function updateCalificacion($idreceta, $idnivel, $idusuario){
			$sql="update calificacion set idnivel='".$idnivel."'			
				where idreceta='".$idreceta."' and idusuario='".$idusuario."'";
			$link=Conectarse();
			mysqli_query($link,$sql);
			$result=mysqli_affected_rows($link);//$result=$idreceta;		
			CerrarConexion($link);
			return $result;	
		}
		
		public function promediar_calificacion($idreceta){
			$sql="select ROUND(AVG(idnivel), 0) from calificacion where idreceta='".$idreceta."'";
			$link=Conectarse();
			$result=mysqli_query($link,$sql);
			CerrarConexion($link);
			return $result;
		}
	}
?>