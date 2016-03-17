<?php 
	require_once("../DA/DAcalificacion.php");
	require_once("../BL/BLreceta.php");
	////////////////////////////////////
	// $idreceta=$_REQUEST['idreceta'];
	// $idnivel=$_REQUEST['idnivel'];
	// $idusuario=$_REQUEST['idusuario'];
	// $blcalificacion= new BLcalificacion();
	// echo $blcalificacion->updateCalificacion($idreceta, $idnivel, $idusuario);
	//echo "".$blcalificacion->promediar_calificacion($idreceta);
	////////////////////////////////////
	
	class BLcalificacion{

		public $_DAcalificacion;

		public function addCalificacion($idreceta, $idnivel, $idusuario){
			$this->_DAcalificacion= new DAcalificacion();
			$result = $this->_DAcalificacion->addCalificacion($idreceta, $idnivel, $idusuario);
			$aux=$this->actualizar_promedio($idreceta);
			$_DAcalificacion=null;
			return $result;
		}
		
		public function updateCalificacion($idreceta, $idnivel, $idusuario){
			$this->_DAcalificacion= new  DAcalificacion();
			$result = $this->_DAcalificacion->updateCalificacion($idreceta, $idnivel, $idusuario);
			$aux=$this->actualizar_promedio($idreceta);
			$_DAcalificacion=null;
			return $result;
		}
		
		public function actualizar_promedio($idreceta){
			$this->_BLreceta= new BLreceta();
			$calificacion_promedio=$this->promediar_calificacion($idreceta);
			$result = $this->_BLreceta->updateReceta_calificacion_promedio($idreceta, $calificacion_promedio);
			$_BLreceta=null;
			return $result;
		}
		
		public function promediar_calificacion($idreceta){
			$this->_DAcalificacion= new DAcalificacion();
			$result = $this->_DAcalificacion->promediar_calificacion($idreceta);
			$row=mysqli_fetch_array($result);
			$promedio=$row[0];
			$_DAcalificacion=null;
			return $promedio;
		}
		
	}	
?>