app.controller('denunciasRecetasViewCtrl', denunciasRecetasViewCtrl);
function denunciasRecetasViewCtrl($rootScope,$scope,$http,$mdToast,$mdDialog,data,idusuario) {
	$scope.receta = data;
	$scope.idusuario=idusuario;
	$scope.cancel = function() {
		$mdDialog.cancel();		
	};
	
	if($scope.idusuario>0){
		//traer denuncias
		$http.post('./app/CT/CTdenuncia.php',{fun: 'getDenunciasxReceta' , dat :{ idreceta: data.idreceta} } )
		.success(function(response) {
			//console.log(JSON.stringify(response));
			$scope.denuncias=response;
			console.log("cantidad de denuncias: "+response.length);
		});
	}	
}

