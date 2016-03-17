<?php 
	require_once("../DA/DAnivel.php");
	
	////////////////////////////////////
	// $idnivel=$_REQUEST['idnivel'];
	// $blnivel = new BLnivel();
	// echo $blnivel->getNivel($idnivel);
	////////////////////////////////////
	
	class BLnivel{
		public $_DAnivel;

		public function getNivel($idnivel){
			$this->_DAnivel = new DAnivel();
			$result = $this->_DAnivel->getNivel($idnivel);
			//
			while($row=mysqli_fetch_assoc($result)){
				$res[]=$row;//array_map("utf8_encode",$row);
			}
			$_DAnivel=null;
			if(isset($res)){
				return json_encode($res[0]);
			}	
		}
	}	
?>