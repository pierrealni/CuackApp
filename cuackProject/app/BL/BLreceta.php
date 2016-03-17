<?php 
	//require_once("../BE/BEreceta.php");
	//require_once("../BE/BEetiqueta.php");
	require_once("../DA/DAreceta.php");
	require_once("../BL/BLetiqueta.php");
	require_once("../BL/BLusuario.php");
	require_once("../BL/BLfavorito.php");
	
	//echo (new BLreceta())->getRecetasxIdUsuario(2);
		
	class BLreceta{		
	
		public $_DAreceta;
		public $_BLetiqueta;	
		public $_BLusuario;
		public $_BLfavorito;
		///////////////////////////////////  RECETA	
		public function getRecetas(){
			$this->_DAreceta = new  DAreceta();
			$result = $this->_DAreceta->getRecetas();
			$this->_BLusuario = new BLusuario();
			//
			while($row=mysqli_fetch_assoc($result)){
				$row['etiquetas']=$this->getCadenaNombresEtiquetas($row['idreceta']);
				$row['nombreusuario']=json_decode($this->_BLusuario->getUsuarioxIdUsuario($row['idusuario']))->nombre;
				$res[]=$row;
			}
			$_DAreceta=null;
			if(isset($res)){
				return json_encode($res);
			}		
		}
		//SE USA TAMBIEN EN H13
		public function getRecetasxIdUsuario($idusuario){
			$this->_DAreceta = new  DAreceta();
			$result = $this->_DAreceta->getRecetasxIdUsuario($idusuario);
			$this->_BLusuario = new BLusuario();
			//
			while($row=mysqli_fetch_assoc($result)){
				$row['etiquetas']=$this->getCadenaNombresEtiquetas($row['idreceta']);
				$row['nombreusuario']=json_decode($this->_BLusuario->getUsuarioxIdUsuario($row['idusuario']))->nombre;
				$res[]=$row;
			}
			$_DAreceta=null;
			if(isset($res)){
				return json_encode($res);
			}
		}
		public function getRecetasxNombre($nombre){
			$this->_DAreceta = new  DAreceta();
			$result = $this->_DAreceta->getRecetasxNombre($nombre);
			$this->_BLusuario = new BLusuario();
			//
			while($row=mysqli_fetch_assoc($result)){
				$row['etiquetas']=$this->getCadenaNombresEtiquetas($row['idreceta']);
				$row['nombreusuario']=json_decode($this->_BLusuario->getUsuarioxIdUsuario($row['idusuario']))->nombre;
				$res[]=$row;
			}
			$_DAreceta=null;
			if(isset($res)){
				return json_encode($res);
			}		
		}		
		public function getReceta($idreceta){
			$this->_DAreceta = new DAreceta();
			$result = $this->_DAreceta->getReceta($idreceta);
			$this->_BLusuario = new BLusuario();			
			while($row=mysqli_fetch_assoc($result)){
				$row['etiquetas']=$this->getCadenaNombresEtiquetas($row['idreceta']);
				$row['nombreusuario']=json_decode($this->_BLusuario->getUsuarioxIdUsuario($row['idusuario']))->nombre;
				$res[]=$row;
			}
			$_DAreceta=null;
			if(isset($res)){
				return json_encode($res[0]);
			}	
		}
		public function addReceta($nombrereceta, $descripcion, $ingredientes, $procedimiento, $idusuario){
			$this->_DAreceta = new DAreceta();
			$idreceta = $this->_DAreceta->addReceta($nombrereceta, $descripcion, $ingredientes, $procedimiento, $idusuario);		
			$_DAreceta=null;
			return $idreceta;
		}
		public function disableReceta($idreceta){
			$this->_DAreceta = new  DAreceta();
			$result = $this->_DAreceta->disableReceta($idreceta);
			$_DAreceta=null;
			return $result;
		}
		public function updateReceta($idreceta, $nombrereceta, $descripcion, $ingredientes, $procedimiento){
			$this->_DAreceta = new  DAreceta();
			$result = $this->_DAreceta->updateReceta($idreceta, $nombrereceta, $descripcion, $ingredientes, $procedimiento);
			$_DAreceta=null;
			return $result;
		}
		
		public function updateReceta_calificacion_promedio($idreceta,$calificacion_promedio){
			$this->_DAreceta = new  DAreceta();
			$result = $this->_DAreceta->updateReceta_calificacion_promedio($idreceta, $calificacion_promedio);
			$_DAreceta=null;
			return $result;
		}
		//RECETA_ETIQUETA
		public function getReceta_Etiqueta($idreceta, $idetiqueta){
			$this->_DAreceta = new DAreceta();
			$result = $this->_DAreceta->getReceta_Etiqueta($idreceta, $idetiqueta);
			//
			while($row=mysqli_fetch_assoc($result)){
				$res[]=$row;
			}
			$_DAreceta=null;
			if(isset($res)){
				return json_encode($res[0]);
			}	
		}
		public function getReceta_EtiquetasxIdReceta($idreceta){
			$this->_DAreceta = new DAreceta();
			$result = $this->_DAreceta->getReceta_EtiquetasxIdReceta($idreceta);
			//
			while($row=mysqli_fetch_assoc($result)){
				$res[]=$row;
			}
			$_DAreceta=null;
			if(isset($res)){
				return json_encode($res);
			}	
		}
		public function getReceta_EtiquetasxIdEtiqueta($idetiqueta){
			$this->_DAreceta = new DAreceta();
			$result = $this->_DAreceta->getReceta_EtiquetasxIdEtiqueta($idetiqueta);
			//
			while($row=mysqli_fetch_assoc($result)){
				$res[]=$row;
			}
			$_DAreceta=null;
			if(isset($res)){
				return json_encode($res);
			}	
		}
		public function addReceta_Etiqueta($idreceta, $idetiqueta){
			$this->_DAreceta = new  DAreceta();
			$result = $this->_DAreceta->addReceta_Etiqueta($idreceta, $idetiqueta);
			$_DAreceta=null;
			return $result;
		}
		public function disableReceta_EtiquetasxIdReceta($idreceta){
			$this->_DAreceta = new  DAreceta();
			$result = $this->_DAreceta->disableReceta_EtiquetasxIdReceta($idreceta);
			$_DAreceta=null;
			return $result;
		}				
		public function enableReceta_Etiqueta($idreceta, $idetiqueta){
			$this->_DAreceta = new  DAreceta();
			$result = $this->_DAreceta->enableReceta_Etiqueta($idreceta, $idetiqueta);
			$_DAreceta=null;
			return $result;
		}
		public function existReceta_Etiqueta($idreceta, $idetiqueta){
			$this->_DAreceta = new  DAreceta();
			$result = $this->_DAreceta->existReceta_Etiqueta($idreceta, $idetiqueta);
			if($row=mysqli_fetch_array($result)){
				$idreceta_etiqueta=$row[0];
			}			
			$_DAetiqueta=null;
			if(isset($idreceta_etiqueta)){
				return $idreceta_etiqueta;
			}
		}
		//FAVORITOS
		public function addFavoritos($idreceta){
			$this->_DAreceta = new  DAreceta();
			$result = $this->_DAreceta->addFavoritos($idreceta);			
			$_DAreceta=null;
			return $result;			
		}		
		public function deleteFavoritos($idreceta){
			$this->_DAreceta = new  DAreceta();
			$result = $this->_DAreceta->deleteFavoritos($idreceta);			
			$_DAreceta=null;
			return $result;			
		}		
		public function getRecetasTopFavoritos(){
			$this->_DAreceta = new  DAreceta();
			$result = $this->_DAreceta->getRecetasTopFavoritos();
			$this->_BLusuario = new BLusuario();
			//
			while($row=mysqli_fetch_assoc($result)){
				$row['etiquetas']=$this->getCadenaNombresEtiquetas($row['idreceta']);
				$row['nombreusuario']=json_decode($this->_BLusuario->getUsuarioxIdUsuario($row['idusuario']))->nombre;
				$res[]=$row;
			}
			$_DAreceta=null;
			if(isset($res)){
				return json_encode($res);
			}
		}
		
		//COMENTARIOS
		public function addComentarios($idreceta){
			$this->_DAreceta = new  DAreceta();
			$result = $this->_DAreceta->addComentarios($idreceta);			
			$_DAreceta=null;
			return $result;			
		}		
		public function deleteComentarios($idreceta){
			$this->_DAreceta = new  DAreceta();
			$result = $this->_DAreceta->deleteComentarios($idreceta);			
			$_DAreceta=null;
			return $result;			
		}
		
		//DENUNCIAS
		public function addDenuncias($idreceta){
			$this->_DAreceta = new  DAreceta();
			$result = $this->_DAreceta->addDenuncias($idreceta);
			$_DAreceta=null;
			return $result;			
		}
		
		//////////////////////////////// LOGICA DE NEGOCIO
		////AGREGAR UNA RECETA		
		public function addRecetaCompleto($nombrereceta, $descripcion, $ingredientes, $procedimiento, $etiquetas, $idusuario){
			$idreceta = $this->addReceta($nombrereceta, $descripcion, $ingredientes, $procedimiento, $idusuario);
			if(!empty($idreceta)){			
				$this->addEtiquetasCompleto($etiquetas, $idreceta);
				return $idreceta;
			}
		}								
		public function addEtiquetasCompleto($etiquetas, $idreceta){ 
			$this->_BLetiqueta = new BLetiqueta();
			$lista_etiquetas=explode(",", $etiquetas);
			//para cada nombre, validar si existe e insertarlos en la tabla etiqueta y en la tabla relacional
			foreach($lista_etiquetas as $name){
				//validaciones en etiqueta
				$idetiquetax=$this->_BLetiqueta->existEtiquetaxNombreEtiqueta($name);
				if(!empty($idetiquetax)){//si es que existe
					$this->_BLetiqueta->enableEtiquetaxNombreEtiqueta($name);
					$idetiqueta=$idetiquetax;
				}
				else{
					$idetiqueta=$this->_BLetiqueta->addEtiqueta($name);
				}
				//validaciones en receta_etiqueta
				if(!empty($this->existReceta_Etiqueta($idreceta,$idetiqueta))){//si es que existe
					$this->enableReceta_Etiqueta($idreceta,$idetiqueta);
				}
				else{				
					$this->addReceta_Etiqueta($idreceta, $idetiqueta);
				}
			}
		}		
		////VER CADENA DE ETIQUETAS
		public function getCadenaNombresEtiquetas($idreceta){
			//traer todos los objetos receta_etiqueta
			$receta_Etiquetas= json_decode($this->getReceta_EtiquetasxIdReceta($idreceta));
			$this->_BLetiqueta = new BLetiqueta();
			if(!empty($receta_Etiquetas)){
				foreach($receta_Etiquetas as $re){
					$eti=json_decode($this->_BLetiqueta->getEtiqueta($re->idetiqueta));
					if(!empty($eti))
					$arrayNameEtiqueta[]=$eti->nombreetiqueta;
				}
				return implode(",",$arrayNameEtiqueta);
			}					
		}
		//////////////////////////BUSCAR. EL PARAMETRO DE ENTRADA PODRÃ�A SER VACIO
			//POR CADENA DE NOMBRESS
		public function getRecetasxNombresRecetas($nombresre){
			$this->_DAreceta = new  DAreceta();
			if(!empty($nombresre)){
				$lista_nombres=explode(",", $nombresre);
				//echo var_dump($lista_nombres);	
				$result = $this->_DAreceta->getRecetasxNombresRecetas($lista_nombres);
				while($row=mysqli_fetch_assoc($result)){
					$res[]=$row;
				}
				$_DAreceta=null;
				if(isset($res)){
					return json_encode($res);
				}	
			}		
		}
			//POR CADENA DE ETIQUETAS!!!!!!!!!!!!!
		public function getRecetasxNombresEtiquetas($etiquetas){
			$this->_BLetiqueta = new BLetiqueta();
			if(!empty($etiquetas)){
				$lista_etiquetas=explode(",", $etiquetas);
				foreach($lista_etiquetas as $name){				
					//por cada nombre, encontrar el idetiqueta
					$idetiqueta=json_decode($this->_BLetiqueta->getEtiquetaxNombreEtiqueta($name))->idetiqueta;
					//por cada idetiqueta, encontrar la relacion Receta_Etiqueta	
					$rel=json_decode($this->getReceta_EtiquetasxIdEtiqueta($idetiqueta));
					foreach($rel as $aux){
						$idrecetas[]=$aux->idreceta;//por cada relacion, extraer el idreceta		
					}
				}
				if(!empty($idrecetas)){
					$idrecetas=array_unique($idrecetas);
					foreach($idrecetas as $idreceta){
						$recetas[]=$this->getReceta($idreceta);	
					}
					return json_encode($recetas);
				}	
			}
		}
			//POR NOMBRE DE USUARIO
		public function getRecetasxNombreUsuario($nomusr){
			$this->_BLusuario = new BLusuario();
			if(!empty($nomusr)){
				$idusuario=json_decode($this->_BLusuario->getUsuario($nomusr))->idusuario;
				$recetas=$this->getRecetasxIdUsuario($idusuario);
				return $recetas;
			}
		}
		////////////////////////// MODIFICAR RECETA
		public function updateRecetaCompleto($idreceta, $nombrereceta, $descripcion, $ingredientes, $procedimiento, $etiquetas){
			if($this->updateReceta($idreceta, $nombrereceta, $descripcion, $ingredientes, $procedimiento)!=-1){	
			
				$this->updateReceta_Etiqueta(strtoupper($etiquetas), $idreceta);
			}
		}		
		public function updateReceta_Etiqueta($etiquetas, $idreceta){
			$this->disableReceta_EtiquetasxIdReceta($idreceta);
			$this->addEtiquetasCompleto($etiquetas, $idreceta);
		}
		//GET RECETAS FAVORITAS DE UN USUARIO
		public function getRecetasFavoritosxIdUsuario($idusuario){
			$this->_BLfavorito = new BLfavorito();
			$favoritos=json_decode($this->_BLfavorito->getFavoritosxIdUsuario($idusuario));
			foreach($favoritos as $fav){
				$receta=json_decode($this->getReceta($fav->idreceta));
				$res[]=$receta;
			}
			if(!empty($res)){
				return json_encode($res);
			}	
		}

		//SPRINT 4 H9: Recetas mas populares (las 5 primeras)
		public function getRecetasPopulares(){
			$this->_DAreceta = new  DAreceta();
			$result = $this->_DAreceta->getRecetasPopulares();
			$this->_BLusuario = new BLusuario();
			//
			while($row=mysqli_fetch_assoc($result)){
				$row['etiquetas']=$this->getCadenaNombresEtiquetas($row['idreceta']);
				$row['nombreusuario']=json_decode($this->_BLusuario->getUsuarioxIdUsuario($row['idusuario']))->nombre;
				$res[]=$row;
			}
			$_DAreceta=null;
			if(isset($res)){
				return json_encode($res);
			}		
		}
		
		//SPRINT 4 H11 El administrador del sistema puede visualizar las denuncias.
		public function getRecetasDenunciadasPendientes(){
			$this->_DAreceta = new  DAreceta();
			$result = $this->_DAreceta->getRecetasDenunciadasPendientes();
			$this->_BLusuario = new BLusuario();
			//
			while($row=mysqli_fetch_assoc($result)){
				$row['etiquetas']=$this->getCadenaNombresEtiquetas($row['idreceta']);
				$row['nombreusuario']=json_decode($this->_BLusuario->getUsuarioxIdUsuario($row['idusuario']))->nombre;
				$res[]=$row;
			}
			$_DAreceta=null;
			if(isset($res)){
				return json_encode($res);
			}	
		}
		
		public function getRecetasDenunciadas(){
		$this->_DAreceta = new  DAreceta();
			$result = $this->_DAreceta->getRecetasDenunciadas();
			$this->_BLusuario = new BLusuario();
			//
			while($row=mysqli_fetch_assoc($result)){
				$row['etiquetas']=$this->getCadenaNombresEtiquetas($row['idreceta']);
				$row['nombreusuario']=json_decode($this->_BLusuario->getUsuarioxIdUsuario($row['idusuario']))->nombre;
				$res[]=$row;
			}
			$_DAreceta=null;
			if(isset($res)){
				return json_encode($res);
			}	
		}
		
		public function getCantidadRecetasDenunciadasPendientes(){
			$this->_DAreceta= new DAreceta();
			$result = $this->_DAreceta->getCantidadRecetasDenunciadasPendientes();
			$row=mysqli_fetch_array($result);
			$cantidad=$row[0];
			$_DAreceta=null;
			return $cantidad;	
		}
		
		public function getCantidadRecetasDenunciadas(){
			$this->_DAreceta= new DAreceta();
			$result = $this->_DAreceta->getCantidadRecetasDenunciadas();
			$row=mysqli_fetch_array($result);
			$cantidad=$row[0];
			$_DAreceta=null;
			return $cantidad;	
		}
	}

?>



