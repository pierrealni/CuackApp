<?php 

	require_once("../conexion.php");
	
	class DAreceta{
		//msqli_insert_id: devuelve el id generado por la conulta anterior para una columna autoincrement en caso de exito. Devolverá 0 si si no genera un valor auto_increment.
		//msqli_affected_rows: devolverá el número de filas afectadas por la última consulta insert,update,replace o delete en caso de exito. Devolverá -1 si la consulta fallo.
		
		//RECETAS
		public function getRecetas(){
			$sql="select * from receta where estado=1 order by fecha_modificacion";
			$link=Conectarse();
			$result=mysqli_query($link,$sql);	
			CerrarConexion($link);
			return $result;		
		}
		public function getRecetasxIdUsuario($idusuario){
			$sql="select * from receta where estado=1 and idusuario='".$idusuario."' order by fecha_modificacion";
			$link=Conectarse();
			$result=mysqli_query($link,$sql);	
			CerrarConexion($link);
			return $result;		
		}
		public function getRecetasxNombre($nombre){
			$sql="select * from receta where estado=1 and nombrereceta like '%".$nombre."%' order by fecha_modificacion";
			$link=Conectarse();
			$result=mysqli_query($link,$sql);	
			CerrarConexion($link);
			return $result;		
		}
		public function getRecetasxNombresRecetas($lista_nombres){
			$sql="select * from receta where estado=1"; 
			foreach($lista_nombres as $nombre){
				$sql.=" and nombrereceta like '%".$nombre."%'";
			}
			$sql.=" order by fecha_modificacion";
			//echo $sql;
			$link=Conectarse();
			$result=mysqli_query($link,$sql);	
			CerrarConexion($link);
			return $result;
		}
		public function getReceta($idreceta){
			$sql="select * from receta where estado=1 and idreceta='".$idreceta."'";
			$link=Conectarse();
			$result=mysqli_query($link,$sql);
			CerrarConexion($link);
			return $result;
		}
		public function addReceta($nombrereceta, $descripcion, $ingredientes, $procedimiento, $idusuario){
			$sql="insert into receta (nombrereceta, descripcion, ingredientes, procedimiento, idusuario) 
			values('".$nombrereceta."','".$descripcion."','".$ingredientes."','".$procedimiento."','".$idusuario."')";
			$link=Conectarse();
			mysqli_query($link,$sql);		
			$result=mysqli_insert_id($link);
			CerrarConexion($link);
			return $result;	
		}
		public function disableReceta($idreceta){
			$sql="update receta set estado=0 where idreceta='".$idreceta."'";
			$link=Conectarse();
			mysqli_query($link,$sql);
			$result=mysqli_affected_rows($link);//$result=$idreceta;
			CerrarConexion($link);
			return $result;
		}
		public function updateReceta($idreceta, $nombrereceta, $descripcion, $ingredientes, $procedimiento){
		//public function updateReceta($idreceta, $nombrereceta, $descripcion, $ingredientes, $procedimiento, $fecha_modificacion){
			
			$sql="update receta set nombrereceta='".$nombrereceta."',descripcion='".$descripcion."', 
				ingredientes='".$ingredientes."', procedimiento='".$procedimiento."'
				,fecha_modificacion=NOW()				
				where idreceta='".$idreceta."'";
			$link=Conectarse();
			mysqli_query($link,$sql);
			$result=mysqli_affected_rows($link);//$result=$idreceta;		
			CerrarConexion($link);
			return $result;	
		}
		public function updateReceta_calificacion_promedio($idreceta,$calificacion_promedio){
			$sql="update receta set calificacion_promedio='".$calificacion_promedio."'
				where idreceta='".$idreceta."'";
			$link=Conectarse();
			mysqli_query($link,$sql);
			$result=mysqli_affected_rows($link);//$result=$idreceta;		
			CerrarConexion($link);
			return $result;	
		}			
		//RECETA_ETIQUETA
		public function getReceta_Etiqueta($idreceta, $idetiqueta){
			$sql="select * from receta_etiqueta where estado=1 and idreceta='".$idreceta."' and idetiqueta='".$idetiqueta."'";
			$link=Conectarse();
			$result=mysqli_query($link,$sql);
			CerrarConexion($link);
			return $result;
		}	
		public function getReceta_EtiquetasxIdReceta($idreceta){
			$sql="select * from receta_etiqueta where estado=1 and idreceta='".$idreceta."'";
			$link=Conectarse();
			$result=mysqli_query($link,$sql);
			CerrarConexion($link);
			return $result;
		}	
		public function getReceta_EtiquetasxIdEtiqueta($idetiqueta){
			$sql="select * from receta_etiqueta where estado=1 and idetiqueta='".$idetiqueta."'";
			$link=Conectarse();
			$result=mysqli_query($link,$sql);
			CerrarConexion($link);
			return $result;
		}
		public function addReceta_Etiqueta($idreceta, $idetiqueta){
			$sql="insert into receta_etiqueta (idreceta, idetiqueta) values('".$idreceta."','".$idetiqueta."')";
			$link=Conectarse();		
			$result=mysqli_query($link,$sql);//boolean si se llega a ejecutar
			if($result){
				CerrarConexion($link);
				return $idreceta.",".$idetiqueta;
			}
			else{
				CerrarConexion($link);
			}				
		}
		public function disableReceta_EtiquetasxIdReceta($idreceta){
			$sql="update receta_etiqueta set estado=0 where idreceta='".$idreceta."'";
			$link=Conectarse();
			mysqli_query($link,$sql);
			$result=mysqli_affected_rows($link);//
			CerrarConexion($link);
			return $result;
		}		
		public function enableReceta_Etiqueta($idreceta, $idetiqueta){
			$sql="update receta_etiqueta set estado= 1 where idreceta='".$idreceta."' and idetiqueta='".$idetiqueta."'";
			$link=Conectarse();
			mysqli_query($link,$sql);		
			$result=mysqli_affected_rows($link);//
			CerrarConexion($link);
			return $result;	
		}
		public function existReceta_Etiqueta($idreceta, $idetiqueta){
			$sql="select concat(idreceta,',',idetiqueta) from receta_etiqueta where idreceta='".$idreceta."' and  idetiqueta='".$idetiqueta."' ";
			$link=Conectarse();
			$result=mysqli_query($link,$sql);		
			CerrarConexion($link);
			return $result;	
		}
		//FAVORITOS
		public function addFavoritos($idreceta){
			$sql="update receta set favoritos = (favoritos + 1) where idreceta='".$idreceta." ' ";
			$link=Conectarse();
			mysqli_query($link,$sql);
			$result=mysqli_affected_rows($link);//	
			CerrarConexion($link);
			return $result;	
		}
		
		public function deleteFavoritos($idreceta){
			$sql="update receta set favoritos = (favoritos - 1) where idreceta='".$idreceta." ' ";
			$link=Conectarse();
			mysqli_query($link,$sql);
			$result=mysqli_affected_rows($link);//	
			CerrarConexion($link);
			return $result;	
		}
		
		public function getRecetasTopFavoritos(){
			$sql="SELECT * FROM receta where estado = 1 order by favoritos desc LIMIT 0, 5";
			$link=Conectarse();
			$result=mysqli_query($link,$sql);	
			CerrarConexion($link);
			return $result;	
		}
		
		
		//SPRING 4 H9: Recetas mas populares (las 5 primeras)
		public function getRecetasPopulares(){
			$sql="select * from receta where estado=1 order by favoritos desc, comentarios desc LIMIT 5";
			$link=Conectarse();
			$result=mysqli_query($link,$sql);	
			CerrarConexion($link);
			return $result;		
		}
		//SPRING 4 H9:
		public function deleteComentarios($idreceta){
			$sql="update receta set comentarios = (comentarios - 1) where idreceta='".$idreceta." ' ";
			$link=Conectarse();
			mysqli_query($link,$sql);
			$result=mysqli_affected_rows($link);//	
			CerrarConexion($link);
			return $result;	
		}
		//SPRING 4 H9:
		public function addComentarios($idreceta){
			$sql="update receta set comentarios = (comentarios + 1) where idreceta='".$idreceta." ' ";
			$link=Conectarse();
			mysqli_query($link,$sql);
			$result=mysqli_affected_rows($link);//	
			CerrarConexion($link);
			return $result;	
		}
		
		//SPRING 4 H10:   {{checked}}
		public function addDenuncias($idreceta){
			$sql="update receta set denuncias = (denuncias + 1) where idreceta='".$idreceta." ' ";
			$link=Conectarse();
			mysqli_query($link,$sql);
			$result=mysqli_affected_rows($link);//	
			CerrarConexion($link);
			return $result;	
		}
		//SPRINT 4 H11 El administrador del sistema puede visualizar las denuncias.
		public function getRecetasDenunciadasPendientes(){
			$sql="select rec.*,count(*) as denunciasPen from receta rec inner join denuncia den on rec.idreceta=den.idreceta where rec.estado = 1 and den.estado='x' group by rec.idreceta";//$sql="select * from receta where estado = 1 and denuncias > 0";
			$link=Conectarse();
			$result=mysqli_query($link,$sql);	
			CerrarConexion($link);
			return $result;				
		}
		
		public function getRecetasDenunciadas(){
			$sql="select * from receta where denuncias > 0 ORDER BY estado DESC";
			$link=Conectarse();
			$result=mysqli_query($link,$sql);	
			CerrarConexion($link);
			return $result;				
		}
		
		public function getCantidadRecetasDenunciadasPendientes(){
			$sql="select COUNT(idreceta) from receta where estado=1 and denuncias > 0";
			$link=Conectarse();
			$result=mysqli_query($link,$sql);	
			CerrarConexion($link);
			return $result;				
		}
		
		public function getCantidadRecetasDenunciadas(){
			$sql="select COUNT(idreceta) from receta where and denuncias > 0";
			$link=Conectarse();
			$result=mysqli_query($link,$sql);	
			CerrarConexion($link);
			return $result;				
		}
	
	}
?>