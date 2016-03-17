app.controller('recetaEditCtrl', recetaEditCtrl);
function recetaEditCtrl($rootScope,$scope,$http, $mdDialog,data) {
  $scope.receta = data;
  //console.log(JSON.stringify($scope.receta));
  $scope.cancel = function() {
    $mdDialog.cancel();
  };
  $scope.actualizar = function() {
	$scope.aux={};
	$scope.aux.idreceta=$scope.receta.idreceta;
	$scope.aux.nombrereceta=$scope.receta.nombrereceta;
	$scope.aux.descripcion=$scope.receta.descripcion;
	$scope.aux.ingredientes=$scope.receta.ingredientes;
	$scope.aux.procedimiento=$scope.receta.procedimiento;
	$scope.aux.etiquetas=$scope.receta.etiquetas;
	
	//console.log(JSON.stringify($scope.aux));  
	//console.log(JSON.stringify($scope.aux.etiquetas))
	
	$http.post("./app/CT/CTreceta.php", {fun: 'updateRecetaCompleto', dat : $scope.aux })
	.success(function(response) {
		$scope.receta.etx=$scope.aux.etiquetas.split(',');
		$mdDialog.hide('Actualizado');
    });

  };
}
