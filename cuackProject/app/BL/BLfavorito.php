<?php 
	require_once("../DA/DAfavorito.php");
	require_once("../BL/BLreceta.php");
	
	class BLfavorito{		
		public $_DAfavorito;
		public $_BLreceta;
	
		public function addFavorito($idusuario, $idreceta){
			$this->_DAfavorito = new DAfavorito();
			$this->_BLreceta= new BLreceta();
			$result = $this->_DAfavorito->addFavorito($idusuario, $idreceta);
			$aux= $this->_BLreceta->addFavoritos($idreceta);
			$_DAfavorito=null;
			$_BLreceta=null;			
			return $result;
		}
		
		public function deleteFavorito($idusuario, $idreceta){
			$this->_DAfavorito= new DAfavorito();
			$this->_BLreceta= new BLreceta();
			$result = $this->_DAfavorito->deleteFavorito($idusuario, $idreceta);
			$aux= $this->_BLreceta->deleteFavoritos($idreceta);
			$_DAfavorito=null;
			$_BLreceta=null;
			return $result;
		}
		
		public function existFavorito($idusuario, $idreceta){
			$this->_DAfavorito= new  DAfavorito();
			$result = $this->_DAfavorito->existFavorito($idusuario, $idreceta);
			if($row=mysqli_fetch_array($result)){
				$idfavorito=$row[0];
			}			
			$_DAfavorito=null;
			if(isset($idfavorito)){
				return $idfavorito;
			}
		}
		
		public function getFavoritosxIdUsuario($idusuario){
			$this->_DAfavorito = new  DAfavorito();
			$result = $this->_DAfavorito->getFavoritosxIdUsuario($idusuario);
			while($row=mysqli_fetch_assoc($result)){
				$res[]=$row;
			}
			$_DAfavorito=null;
			if(isset($res)){
				return json_encode($res);
			}	
		}	
	}	
?>