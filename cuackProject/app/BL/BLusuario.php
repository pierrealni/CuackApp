<?php 
	//namespace Foobar;
	require_once("../DA/DAusuario.php");
	class BLusuario{
	
		public $_DAusuario;	
		
		public function getUsuario($nombreusuario,$contrasenha=null){
			$this->_DAusuario = new  DAusuario();
			$result = $this->_DAusuario->getUsuario($nombreusuario,$contrasenha);
			while($row=mysqli_fetch_assoc($result)){
				$res[]=$row;
			}
			$_DAusuario=null;
			if(isset($res)){
				return json_encode($res[0]);
			}	
		}
		public function getUsuarioxIdUsuario($idusuario){
			$this->_DAusuario = new  DAusuario();
			$result = $this->_DAusuario->getUsuarioxIdUsuario($idusuario);
			while($row=mysqli_fetch_assoc($result)){
				$res[]=$row;
			}
			$_DAusuario=null;
			if(isset($res)){
				return json_encode($res[0]);
			}	
		}			
		public function addUsuario($nombre, $apellidos, $idpais, $correo, $nombreusuario, $contrasenha){
			$this->_DAusuario = new  DAusuario();
			$idusuario = $this->_DAusuario->addUsuario($nombre, $apellidos, $correo, $nombreusuario, $contrasenha, $idpais);		
			$_DAusuario=null;
			return $idusuario;
		}
		//logica de negocio
		public function login($nombreusuario, $contrasenha){
			$aux=json_decode($this->getUsuario($nombreusuario,$contrasenha));
			if(!empty($aux)){
				return $aux->idusuario;//return json_encode(["r" => $aux->idusuario]);
			}else{
				return "no existe";
			}		
		}
		
		//////////////////////////////SPRINT 5 BL
		
		//h12
		public function addSeguirUsuario($idusuario, $idusuarioseguido){
			$this->_DAusuario = new DAusuario();
			$result = $this->_DAusuario->addSeguirUsuario($idusuario, $idusuarioseguido);
			//$aux= $this->_DAusuario->addSeguidor($idusuarioseguido);
			$_DAusuario=null;		
			return $result;
		}
		
		//h12
		public function deleteSeguirUsuario($idusuario, $idusuarioseguido){
			$this->_DAusuario= new DAusuario();
			$result = $this->_DAusuario->deleteSeguirUsuario($idusuario, $idusuarioseguido);
			//$aux= $this->_DAusuario->deleteSeguidor($idusuarioseguido);
			$_DAusuario=null;
			return $result;
		}
		//H12
		public function existSeguirUsuario($idusuario, $idusuarioseguido){
			$this->_DAusuario= new  DAusuario();
			$result = $this->_DAusuario->existSeguirUsuario($idusuario, $idusuarioseguido);
			if($row=mysqli_fetch_array($result)){
				$aux=$row[0];
			}			
			$_DAusuario=null;
			if(isset($aux)){
				return $aux;
			}
		}
		
		//H13
		public function getUsuariosSeguidos($idusuario){
			$this->_DAusuario= new  DAusuario();
			$result = $this->_DAusuario->getUsuariosSeguidos($idusuario);
			//
			while($row=mysqli_fetch_assoc($result)){
				//por si quieres solo listar sus nombres
				//$row['nombreusuario']=json_decode($this->getUsuarioxIdUsuario($row['idusuarioseguido']))-> nombre;
				//por si quieres listar toda la info del usuario
				$row=json_decode($this->getUsuarioxIdUsuario($row['idusuarioseguido']));
				$res[]=$row;
			}
			$_DAusuario=null;
			if(isset($res)){
				return json_encode($res);
			}	
		}
		
		// public function testito($aux){
			// return "1x".$aux;
		// }
		// public function testito2(){
			// return "testito2";
		// }
		
	}
?>