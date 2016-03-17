<?php 
	require_once("../DA/DAcomentario.php");
	require_once("../BL/BLreceta.php");
	
	////////////////////////////////////
	// $idreceta=$_REQUEST['idreceta'];
	// $idusuario=$_REQUEST['idusuario'];
	// $descripcion=$_REQUEST['descripcion'];
	// $item=$_REQUEST['item'];
	// $blcomentario= new BLcomentario();
	// echo $blcomentario->deleteComentario($item);
	//////////////////////////////////
	
	class BLcomentario{
		public $_DAcomentario;
		public $_BLreceta;
		
		///////////////////////////////////  RECETA	
		public function getComentarios($idreceta){
			$this->_DAcomentario= new  DAcomentario();
			$result = $this->_DAcomentario->getComentarios($idreceta);
			
			while($row=mysqli_fetch_assoc($result)){
				$res[]=$row;//array_map("utf8_encode",$row);
			}
			$_DAcomentario=null;
			if(isset($res)){
				return json_encode($res);
			}		
		}
		
		public function getCantidadComentarios($idreceta){
			$this->_DAcomentario= new DAcomentario();
			$result = $this->_DAcomentario->getCantidadComentarios($idreceta);
			$row=mysqli_fetch_array($result);
			$cantidad=$row[0];
			$_DAcomentario=null;
			return $cantidad;
		}
		
		public function addComentario($idreceta, $idusuario, $descripcion){
			$this->_DAcomentario= new DAcomentario();
			$this->_BLreceta= new BLreceta();
			$result = $this->_DAcomentario->addComentario($idreceta, $idusuario, $descripcion);
			$aux= $this->_BLreceta->addComentarios($idreceta);
			$_DAcomentario=null;
			$_BLreceta=null;
			return $result;
		}
		
		public function deleteComentario($item){
			$this->_DAcomentario= new DAcomentario();
			$this->_BLreceta= new BLreceta();
			$result = $this->_DAcomentario->deleteComentario($item);
			$aux= $this->_BLreceta->deleteComentarios($idreceta);
			$_DAcomentario=null;
			$_BLreceta=null;
			return $result;
		}
	}	
?>