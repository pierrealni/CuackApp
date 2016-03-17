app.controller('recetaViewCtrl', recetaViewCtrl);
function recetaViewCtrl($rootScope,$scope,$http,$mdToast,$mdDialog,data,idusuario,rv) {
	$scope.receta = data;
	$scope.idusuario=idusuario;
	$scope.cancel = function() {
		if($scope.idusuario>0){
			var haycambios=$scope.eini != $scope.esFav;
			if(haycambios){
				var accion='';
				if($scope.esFav){
					accion='addFavorito';
				}else{
					accion='deleteFavorito';
				}
				$http.post('./app/CT/CTfavorito.php',{fun: accion , dat : $scope.aux } )
				.success(function(response) {
					response = response.replace(/\r\n/g, "");
					console.log(response);
					$mdDialog.hide(true);		
				});	
			}else{
				$mdDialog.cancel();
			}			
		}else{
			$mdDialog.cancel();
		}		
	};
	
	if($scope.idusuario>0){
		$scope.aux={};
		$scope.aux.idusuario=idusuario;
		$scope.aux.idreceta=data.idreceta;
		//existFavorito
		$http.post('./app/CT/CTfavorito.php',{fun: 'existFavorito' , dat : $scope.aux } )
		.success(function(response) {
		response = response.replace(/\r\n/g, "");
		console.log("existFavorito?: "+response);
			if(response.trim()!=''){
				$scope.esFav=true;
				$scope.iconx='favorite';
				$scope.bckc='red';
			}else{
				$scope.esFav=false;
				$scope.iconx='favorite_outline';
				$scope.bckc='gray';
			}
			$scope.eini=$scope.esFav;
		});	
		//existDenuncia
		$http.post('./app/CT/CTdenuncia.php',{fun: 'existDenuncia' , dat : $scope.aux } )
		.success(function(response) {
		response = response.replace(/\r\n/g, "");
		console.log("existdenuncia?: "+response);
			if(response.trim()!=''){
				$scope.esDen=true;
				$scope.bckcDen='yellow';
			}else{
				$scope.esDen=false;
				$scope.bckcDen='gray';
			}
		});
		//existFollow
		$http.post('./app/CT/CTusuario.php',{fun: 'existSeguirUsuario' , dat : {idusuario: $scope.idusuario, idusuarioseguido:data.idusuario} } )
		.success(function(response) {
		response = response.replace(/\r\n/g, "");
		console.log("existFollow?: "+response);		
			if(response.trim()!=''){
				$scope.esFollow=true;
				$scope.bckFoll='#0000FF';
			}else{
				$scope.esFollow=false;
				$scope.bckFoll='gray';
			}
			$scope.einiFollow=$scope.esFollow;
		});	
	}
  ///////////////TOAST
	$scope.openToast = function($event) {
		var contentx='';
		if($scope.esFav){
			$scope.esFav=false;
			contentx='Sacado de Favoritos!';
			$scope.iconx='favorite_outline';
			$scope.bckc='gray';
			$scope.receta.favoritos--;
		}else{
			$scope.esFav=true;
			contentx='Añadido a Favoritos!'
			$scope.iconx='favorite';
			$scope.bckc='red';
			$scope.receta.favoritos++;
		}
		
		$mdToast.show($mdToast.simple()
		.content(contentx)
		.position($scope.getToastPosition())
		.hideDelay(300)
		);
		// Could also do $mdToast.showSimple('Hello');
	};
    var last = { bottom: true,top: false,left: false,right: true};
	$scope.toastPosition = angular.extend({},last);
	$scope.getToastPosition = function() {
		return Object.keys($scope.toastPosition)
		.filter(function(pos) { return $scope.toastPosition[pos]; })
		.join(' ');
	};
	/////////////TOAST
	
	//////DENUNCIA
	$scope.sendDen = function(ev) {
		if(!$scope.esDen && $scope.idusuario>0){
			$scope.cancel();
			$mdDialog.show({
			  controller: DialogDenController,
			  templateUrl: './scripts/views/denuncia.html',
			  //parent: angular.element(document.body),
			  targetEvent: ev,
			  //clickOutsideToClose:true
			})
			.then(function(answer) {	
				console.log("tipo denuncia: "+answer);// // recoger el "tipo denuncia"
				$http.post('./app/CT/CTdenuncia.php',{fun: 'addDenuncia' , dat : {'idreceta':data.idreceta,'idusuario':idusuario,'idtipodenuncia':answer} } )
				.success(function(response) {
					response = response.replace(/\r\n/g, "");
					$scope.dialog = rv;
					data.denunciasPen++;	
					$scope.dialog(null, data); 
				});	
			}
			, function() {
				$scope.dialog = rv;		  
				$scope.dialog(null, data); 
			 });		
		}else{
			$mdToast.showSimple('Ya ha registrado una denuncia para esta receta.');
		}
	};
	function DialogDenController($scope, $mdDialog) {
		$scope.receta=data;
		$scope.cancelarDen = function() {
			console.log("ejecutando cancelarDen");
			$mdDialog.cancel();
		
		};
		$scope.sendDenTrue = function() {
			console.log("ejecutando sendDenTrue");
			$mdDialog.hide($scope.tipoDen);
		};
	}
	///////////////FOLLOW
	$scope.showConfirm = function(ev) {
    // Appending dialog to document.body to cover sidenav in docs app
	$scope.cancel();
    var confirm = $mdDialog.confirm()
          .title('¿Desea ' + ($scope.esFollow? 'dejar de ' : '') +'seguir al usuario '+data.nombreusuario+' ?')
          //.textContent('All of the banks have agreed to forgive you your debts.')
          .ariaLabel('Pregunta')
          .targetEvent(ev)
          .ok('Confirmar')
          .cancel('Cancelar');
    $mdDialog.show(confirm).then(function() {
		//$scope.esFollow= !$scope.esFollow;
		var accionx=($scope.esFollow? 'deleteSeguirUsuario':'addSeguirUsuario');
		$http.post('./app/CT/CTusuario.php',{fun: accionx , dat : {idusuario: $scope.idusuario, idusuarioseguido:data.idusuario} } )
			.success(function(response) {
			response = response.replace(/\r\n/g, "");
			$scope.dialog = rv;	
			$scope.dialog(null, data); 
		});	
    }, function() {
		$scope.dialog = rv;	
		$scope.dialog(null, data); 
    });
	};
}
/*
update receta set denuncias=0;
delete from denuncia;

*/
