<?php 

	require_once("../conexion.php");
	
	class DAdenuncia{
		
		//SPRINT 4 H10: Denuncia a receta
		public function addDenuncia($idreceta, $idusuario, $idtipodenuncia){
			$sql="insert into denuncia (idreceta, idusuario, idtipodenuncia) 
			values('".$idreceta."','".$idusuario."','".$idtipodenuncia."')";
			$link=Conectarse();
			// mysqli_query($link,$sql);		
			// $result=mysqli_insert_id($link);
			$result=mysqli_query($link,$sql);
			if($result){
				CerrarConexion($link);
				return $idusuario.",".$idreceta;
			}
			else{
				CerrarConexion($link);
			}		
		}
		
		//SPRINT 4 H11 El administrador del sistema puede visualizar las denuncias.
		public function getDenunciasxReceta($idreceta){
			$sql="select de.idreceta,de.idtipodenuncia,de.fecha_denuncia,de.estado,us.nombreusuario,td.descripcion from denuncia de inner join tipodenuncia td on de.idtipodenuncia=td.idtipodenuncia inner join usuario us on de.idusuario=us.idusuario where de.idreceta='".$idreceta."' order by de.fecha_denuncia desc;";//$sql="select * from denuncia where idreceta='".$idreceta."' order by fecha_denuncia desc";
			$link=Conectarse();
			$result=mysqli_query($link,$sql);	
			CerrarConexion($link);
			return $result;	
		}
		
		public function existDenuncia($idusuario,$idreceta){
			$sql="select concat(idusuario,',',idreceta) from denuncia where idreceta=".$idreceta." and 
			idusuario='".$idusuario."'";
			$link=Conectarse();
			$result=mysqli_query($link,$sql);		
			CerrarConexion($link);
			return $result;	
		}
		
		// public function existDenuncia($idreceta, $idusuario, $idtipodenuncia){
			// $sql="select concat(idusuario,',',idreceta) from favorito where idreceta=".$idreceta." and 
			// idusuario='".$idusuario."' and  idtipodenuncia='".$idtipodenuncia."' ";
			// $link=Conectarse();
			// $result=mysqli_query($link,$sql);		
			// CerrarConexion($link);
			// return $result;	
		// }
	}
?>