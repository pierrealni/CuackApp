<?php 

	require_once("../conexion.php");
	
	class DAusuario{	
		public function getUsuario($nombreusuario,$contrasenha=null){
			$sql = is_null($contrasenha) ? "select * from usuario where estado=1 and nombreusuario='".$nombreusuario."'"  : "select * from usuario where estado=1 and nombreusuario='".$nombreusuario."' and contrasenha='".$contrasenha."'";
			$link=Conectarse();
			$result=mysqli_query($link,$sql);
			CerrarConexion($link);
			return $result;		
		}
		public function getUsuarioxIdUsuario($idusuario){
			$sql = "select usuario.*,pais.nombrepais from usuario inner join pais on usuario.idpais=pais.idpais where usuario.estado=1 and usuario.idusuario='".$idusuario."'";//"select * from usuario where estado=1 and idusuario='".$idusuario."'" ;
			$link=Conectarse();
			$result=mysqli_query($link,$sql);
			CerrarConexion($link);
			return $result;	
		}			
		public function addUsuario($nombre, $apellidos, $correo, $nombreusuario, $contrasenha, $idpais){
			$sql="insert into usuario (nombre, apellidos, correo, nombreusuario, contrasenha, idpais) 
			values('".$nombre."','".$apellidos."','".$correo."','".$nombreusuario."','".$contrasenha."','".$idpais."')";
			$link=Conectarse();
			mysqli_query($link,$sql);	
			$result=mysqli_insert_id($link);	
			CerrarConexion($link);
			return $result;	
		}
		
		public function updateUsuario($idusuario,$nombre, $apellidos, $correo ,$nombreusuario ,$contrasenha, $idpais){
			$sql="update usuario set (nombre='".$nombre."', apellidos='".$apellidos."', correo='".$correo."', 
				nombreusuario='".$nombreusuario."', contrasenha='".$contrasenha."', idpais='".$idpais."') 
				where idusuario='".$idusuario."'";
			$link=Conectarse();
			mysqli_query($link,$sql);
			$result=mysqli_affected_rows($link);//$result=$idusuario;		
			CerrarConexion($link);
			return $result;	
		}
		
	//////////////////////////////SPRINT 5 DA
		
		//HU 12
		public function addSeguirUsuario($idusuario, $idusuarioseguido){
			$sql="insert into seguirusuario(idusuario, idusuarioseguido) values('".$idusuario."','".$idusuarioseguido."')";
			$link=Conectarse();
			$result=mysqli_query($link,$sql);
			if($result){
				CerrarConexion($link);
				return $idusuario.",".$idusuarioseguido;
			}
			else{
				CerrarConexion($link);
			}	
		}
		
		//H12
		public function deleteSeguirUsuario($idusuario, $idusuarioseguido){
			$sql="delete from seguirusuario where idusuario='".$idusuario."' and idusuarioseguido='".$idusuarioseguido."'";
			$link=Conectarse();
			mysqli_query($link,$sql);
			$result=mysqli_affected_rows($link);	
			CerrarConexion($link);
			return $result;	
		}
		
		//h12
		public function existSeguirUsuario($idusuario, $idusuarioseguido){
			$sql="select concat(idusuario,',',idusuarioseguido) from seguirusuario where idusuario='".$idusuario."' and  idusuarioseguido='".$idusuarioseguido."' ";
			$link=Conectarse();
			$result=mysqli_query($link,$sql);		
			CerrarConexion($link);
			return $result;	
		}
		/*
		//HU12 es una funcion interna
		public function addSeguidor($idusuarioseguido){
			$sql="update usuario set seguidores= (seguidores + 1) where idusuario='".$idusuarioseguido." ' ";
			$link=Conectarse();
			mysqli_query($link,$sql);
			$result=mysqli_affected_rows($link);//	
			CerrarConexion($link);
			return $result;	
		}
		
		//HU12 es una funcion interna
		public function deleteSeguidor($idusuarioseguido){
			$sql="update usuario set seguidores= (seguidores - 1) where idusuario='".$idusuarioseguido." ' ";
			$link=Conectarse();
			mysqli_query($link,$sql);
			$result=mysqli_affected_rows($link);//	
			CerrarConexion($link);
			return $result;	
		}
		*/
		//H13 Listar usuarios favoritos
		public function getUsuariosSeguidos($idusuario){
			$sql = "select * from seguirusuario where idusuario='".$idusuario."'";
			$link=Conectarse();
			$result=mysqli_query($link,$sql);
			CerrarConexion($link);
			return $result;		
		}
		
	}
?>