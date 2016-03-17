<?php 
	require_once("../DA/DApais.php");
	//echo (new BLpais())->getPaises();
	class BLpais{
	
		public $_DApais;	
		
		public function getPais($idpais){
			$this->_DApais = new  DApais();
			$result = $this->_DApais->getPais($idpais);
			while($row=mysqli_fetch_assoc($result)){
				$res[]=$row;//array_map("utf8_encode",$row);
			}
			$_DAreceta=null;
			if(isset($res)){
				return json_encode($res[0]);
			}	
		}		
		public function getPaises(){
			$this->_DApais = new  DApais();
			$result = $this->_DApais->getPaises();
			//
			while($row=mysqli_fetch_assoc($result)){
				$res[]=$row;//array_map("utf8_encode",$row);
			}
			$_DAreceta=null;
			if(isset($res)){
				return json_encode($res);
			}	
		}	
	}
?>