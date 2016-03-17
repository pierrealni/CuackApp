app.controller('recetaCtrl', recetaCtrl);

function recetaCtrl($scope, $http, $mdDialog,idusuario) {
	//alert(idusuario);
	$scope.cancel = function() {
		$mdDialog.cancel();
	};
	$scope.registrar = function() {
		$scope.receta.idusuario=idusuario;		
		$http.post("./app/CT/CTreceta.php", {fun: 'addRecetaCompleto' , dat : $scope.receta })
			.success(function(response) {
			response = response.replace(/\r\n/g, "");
			$scope.id = response;
			console.log($scope.id);
			$mdDialog.hide($scope.receta);
		})	
	};
}
