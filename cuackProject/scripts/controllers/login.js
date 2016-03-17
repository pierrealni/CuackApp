app.controller('loginCtrl', loginCtrl);

function loginCtrl($scope,$http, $mdDialog) {
	var idusuario = 0;
	$scope.cancel = function() {
		$mdDialog.cancel();
	};
	$scope.ingresar = function() {
		//$http.post("./app/BL/BLusuario.php", {fun: 'testito' , dat : { usuario: 'xx'} })
		//$http.post("./app/BL/BLusuario.php", {fun: 'testito' })
		//$http.post("./app/CT/CTusuario.php", {fun: 'login' , dat : $scope.usr })
		$http.post("./app/CT/CTusuario.php", {fun: 'getUsuario' , dat : $scope.usr })
            .success(function(response) {
				//response = response.replace(/\r\n/g, "");
				//idusuario = response;
				//$mdDialog.hide(idusuario);
				$mdDialog.hide(response);
			});		
	};
}