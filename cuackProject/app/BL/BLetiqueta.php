<?php 
	require_once("../DA/DAetiqueta.php");
	
	class BLetiqueta{
	
		public $_DAetiqueta;	
		/*
		public function getNombreEtiquetaxIdEtiqueta($idetiqueta){
			$this->_DAetiqueta = new  DAetiqueta();
			$result = $this->_DAetiqueta->getNombreEtiquetaxIdEtiqueta($idetiqueta);
			//
			$row=mysqli_fetch_array($result);
			$nombreetiqueta=$row[0];
			$_DAetiqueta=null;
			return utf8_encode($nombreetiqueta);
		}
		
		public function getIdEtiquetaxNombreEtiqueta($nombreetiqueta){	
			$this->_DAetiqueta = new DAetiqueta();
			$result = $this->_DAetiqueta->getIdEtiquetaxNombreEtiqueta($nombreetiqueta);
			$row=mysqli_fetch_array($result);
			$idetiqueta=$row[0];
			$_DAetiqueta=null;
			return $idetiqueta;
		}
		*/
		
		//
		public function getEtiqueta($idetiqueta){
			$this->_DAetiqueta = new DAetiqueta();
			$result = $this->_DAetiqueta->getEtiqueta($idetiqueta);
			//
			while($row=mysqli_fetch_assoc($result)){
				$res[]=$row;
			}
			$_DAetiqueta=null;
			if(isset($res)){
				return json_encode($res[0]);
			}	
		}
		
		public function getEtiquetaxNombreEtiqueta($nombreetiqueta){
			$this->_DAetiqueta = new DAetiqueta();
			$result = $this->_DAetiqueta->getEtiquetaxNombreEtiqueta($nombreetiqueta);
			//
			while($row=mysqli_fetch_assoc($result)){
				$res[]=$row;
			}
			$_DAetiqueta=null;
			if(isset($res)){
				return json_encode($res[0]);
			}	
		}		
		
		public function addEtiqueta($nombreetiqueta){
			$this->_DAetiqueta = new  DAetiqueta();
			$idetiqueta = $this->_DAetiqueta->addEtiqueta($nombreetiqueta);
			$_DAetiqueta=null;		
			return $idetiqueta;
		}
		
		public function disableEtiquetaxNombreEtiqueta($nombreetiqueta){
			$this->_DAetiqueta = new  DAetiqueta();
			$result = $this->_DAetiqueta->disableEtiquetaxNombreEtiqueta($nombreetiqueta);
			$_DAetiqueta=null;		
			return $result;
		}		
		
		public function enableEtiquetaxNombreEtiqueta($nombreetiqueta){
			$this->_DAetiqueta = new  DAetiqueta();
			$result = $this->_DAetiqueta->enableEtiquetaxNombreEtiqueta($nombreetiqueta);
			$_DAetiqueta=null;		
			return $result;
		}

		public function existEtiquetaxNombreEtiqueta($nombreetiqueta){
			$this->_DAetiqueta = new  DAetiqueta();
			$result = $this->_DAetiqueta->existEtiquetaxNombreEtiqueta($nombreetiqueta);
			if($row=mysqli_fetch_array($result)){
				$idetiqueta=$row[0];
			}			
			$_DAetiqueta=null;
			if(isset($idetiqueta)){
				return $idetiqueta;
			}
		}		
	}
?>