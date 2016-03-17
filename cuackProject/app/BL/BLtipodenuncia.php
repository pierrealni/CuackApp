<?php 
	require_once("../DA/DAtipodenuncia.php");
		
	class BLtipodenuncia{		
		public $_DAtipodenuncia;
		//SPRINT 4 H11
		public function getTipodenunciaxIdTipodenuncia($idtipodenuncia){
			$this->_DAtipodenuncia = new  DAtipodenuncia();
			$result = $this->_DAtipodenuncia->getTipodenunciaxIdTipodenuncia($idtipodenuncia);
			while($row=mysqli_fetch_assoc($result)){
				$res[]=$row;
			}
			$_DAtipodenuncia=null;
			if(isset($res)){
				return json_encode($res[0]);
			}
		}
		
	}	
?>



