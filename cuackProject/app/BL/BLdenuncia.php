<?php 
	require_once("../DA/DAdenuncia.php");
	require_once("../BL/BLreceta.php");
	require_once("../BL/BLtipodenuncia.php");
	
	class BLdenuncia{		
		public $_DAdenuncia;
		public $_BLreceta;
		public $_BLtipodenuncia;
		
		
		//SPRING 4 H10: Denuncia a receta
		public function addDenuncia($idreceta, $idusuario, $idtipodenuncia){
			$this->_DAdenuncia= new DAdenuncia();
			$this->_BLreceta= new BLreceta();
			$result= $this->_DAdenuncia->addDenuncia($idreceta, $idusuario, $idtipodenuncia);
			$aux= $this->_BLreceta->addDenuncias($idreceta);
			$_DAdenuncia=null;
			$_BLreceta=null;
			return $result;	
		}

		public function getDenunciasxReceta($idreceta){
			$this->_DAdenuncia = new  DAdenuncia();
			$result = $this->_DAdenuncia->getDenunciasxReceta($idreceta);
			//$this->_BLusuario = new BLusuario();
			//$this->_BLtipodenuncia = new BLtipodenuncia();
			//
			while($row=mysqli_fetch_assoc($result)){
				//$row['nombredenuncia']=json_decode($this->_BLtipodenuncia->getTipodenunciaxIdTipodenuncia($row['idtipodenuncia']))->descripcion;
				//$row['nombreusuario']=json_decode($this->_BLusuario->getUsuarioxIdUsuario($row['idusuario']))->nombre;
				//$row['nombredenuncia']=json_decode($this->_BLtipodenuncia->getTipodenunciaxIdTipodenuncia($row['idtipodenuncia']))->descripcion;
				$res[]=$row;
			}
			$_DAdenuncia=null;
			if(isset($res)){
				return json_encode($res);
			}			
		}
		
		public function existDenuncia($idusuario, $idreceta){
			$this->_DAdenuncia= new  DAdenuncia();
			$result = $this->_DAdenuncia->existDenuncia($idusuario,$idreceta);
			if($row=mysqli_fetch_array($result)){
				$idDenuncia=$row[0];
			}			
			$_DAdenuncia=null;
			if(isset($idDenuncia)){
				return $idDenuncia;
			}
		}
		
		// public function existDenuncia($idreceta, $idusuario, $idtipodenuncia){
			// $this->_DAdenuncia= new  DAdenuncia();
			// $result = $this->_DAdenuncia->existDenuncia($idreceta, $idusuario, $idtipodenuncia);
			// if($row=mysqli_fetch_array($result)){
				// $idDenuncia=$row[0];
			// }			
			// $_DAdenuncia=null;
			// if(isset($idDenuncia)){
				// return $idDenuncia;
			// }
		// }
		
	}	
?>



