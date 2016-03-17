app.controller('registroCtrl', registroCtrl);
function registroCtrl($scope, $http, $timeout, $mdDialog) {
  
  $scope.cancel = function() {
    $mdDialog.cancel();
  };
  $scope.registrarse = function() {
	$http.post("./app/CT/CTusuario.php", {fun: 'addUsuario' , dat: $scope.usr})
	.success(function(response) {
		response = response.replace(/\r\n/g, "");
		$scope.usr.idusuario = response;
		console.log($scope.usr.idusuario);
		$mdDialog.hide($scope.usr.nombre);
    });
  };
  //$scope.pais= null;
  //$scope.paises = null;
  $scope.loadPaises = function() {
    return $timeout(function() {
		$http.post("./app/CT/CTpais.php", {fun: 'getPaises' })
		.success(function(response) {
			$scope.paises = response;
			console.log(response.length);
		});
    }, 100);

  };
}
