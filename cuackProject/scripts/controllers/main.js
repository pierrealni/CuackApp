app.controller('mainCtrl', function ($scope,$http, $mdDialog) {
	$scope.msjeLogin="Acceder";
	//AL INICIO
	$scope.goToFirst = function(ev){
		$http.post('./app/CT/CTreceta.php',{fun: 'getRecetas' } )
		.success(function(response) {
			$scope.list = response;
			$scope.config = {
				itemsPerPage: 10,
				fillLastPage: true
			}
			$scope.templateCurrent="./scripts/views/first.html";
			$scope.recetasTitle="ULTIMAS RECETAS AÑADIDAS";
			$scope.whereiam="goToFirst";
		});
	}
	$scope.goToFirst();
	//loguearse
	$scope.showLogin = function(ev) {
		$mdDialog.show({
			controller: 'loginCtrl',
			templateUrl: './scripts/views/login.html',
			targetEvent: ev,
		})
		.then(function(answer) {
			console.log("id de usuario logeado: "+answer.idusuario+" con idrol " + (answer.idrol>1? "admin" : "normal")); //escribir la respuesta IDUSUARIO
			$scope.idusuario = answer.idusuario;
			$scope.idrol=answer.idrol;
			if(answer.idusuario>0){
				$scope.showMasPopulares();
				$scope.msjeLogin="Cerrar Sesión";
			}
		}, function() {
			console.log('loginCtrl - Cancel');
		});
    }
	$scope.logOut= function(ev) {
		console.log('sesion cerrada');
		$scope.idusuario=0;
		$scope.goToFirst();
		$scope.msjeLogin="Acceder";
	}
	
	$scope.showMasFavoritos=function(ev) {
		$http.post('./app/CT/CTreceta.php',{fun: 'getRecetasTopFavoritos' })
		.success(function(response) {
			console.log("longitud de recetas más favoritas: "+response.length);
			$scope.list = response;
			$scope.recetasTitle="LAS RECETAS MÁS FAVORITAS";
			$scope.whereiam="showMasFavoritos";
			$scope.templateCurrent="./scripts/views/first.html";
		});
	}
	
	$scope.showMasPopulares=function(ev) {
		$http.post('./app/CT/CTreceta.php',{fun: 'getRecetasPopulares' })
		.success(function(response) {
			console.log("longitud de recetas más populares: "+response.length);
			$scope.list = response;
			$scope.recetasTitle="LAS RECETAS MÁS POPULARES";
			$scope.whereiam="showMasPopulares";
			$scope.templateCurrent="./scripts/views/first.html";
		});
	}
	
	$scope.showMisFavoritos=function(ev) {
		if($scope.idusuario>0){
			$http.post('./app/CT/CTreceta.php',{fun: 'getRecetasFavoritosxIdUsuario' , dat: { idusuario : $scope.idusuario } })
			.success(function(response) {
					console.log("longitud de mis recetas favoritas: "+response.length);
					$scope.list = response;
					$scope.recetasTitle="MIS RECETAS FAVORITAS";
					$scope.whereiam="showMisFavoritos";
					$scope.templateCurrent="./scripts/views/first.html";
			});
		}
	}
	
	//mostrar mIS RECETAS
	$scope.showMisRecetas = function(ev) {
		if($scope.idusuario>0){
			$http.post('./app/CT/CTreceta.php',{fun: 'getRecetasxIdUsuario' , dat : { idusuario : $scope.idusuario } })
			.success(function(response) {
				console.log("longitud de recetas del usuario logueado: "+response.length);
				$scope.recetasView = response;
				$scope.templateCurrent="./scripts/views/recetasView.html";
			});			
		}
    }	
	$scope.recetas = [];
	
	//registrarse como usuario
	$scope.showRegistro = function(ev) {
		$mdDialog.show({
        controller: 'registroCtrl',
        templateUrl: './scripts/views/registro.html',
        targetEvent: ev,
		})
		.then(function(answer) {
			console.log(answer);
		}, function() {
			console.log('registroCtrl - Cancel');
		});
    };
	
	//añadir una receta
    $scope.showRecetaNew = function(ev) {
		$mdDialog.show({
			locals:{idusuario: $scope.idusuario},
			controller: 'recetaCtrl',
			templateUrl: './scripts/views/recetaNew.html',
			targetEvent: ev,
		})
		.then(function(answer) {
			console.log("receta anadida: "+answer);
			$scope.recetas.push(answer);
		}, function() {
			console.log('recetaCtrl - Cancel');
		});
    };
	//editar una receta
    $scope.showRecetaEdit = function(ev,receta) {
		$scope.receta = receta;
		$mdDialog.show({
			locals:{data: $scope.receta},
			controller: 'recetaEditCtrl',
			templateUrl: './scripts/views/recetaEdit.html',
			targetEvent: ev,
		})
		.then(function(answer) {
			console.log(answer);
		}, function() {
			console.log('recetaEditCtrl - Cancel');
		});
    };
	//mostrar una receta
    $scope.showRecetaView = function(ev,receta) {
		$scope.receta = receta;
		$mdDialog.show({
			locals:{data: $scope.receta, idusuario:$scope.idusuario, rv : $scope.showRecetaView},
			controller: 'recetaViewCtrl',
			templateUrl: './scripts/views/recetaView.html',
			targetEvent: ev,
		})
		.then(function(answer) {////entra aquí se ejecuta hide
			console.log("hay cambios?: "+answer);		
			if($scope.templateCurrent=="./scripts/views/first.html" && angular.isFunction($scope[$scope.whereiam])){
				$scope[$scope.whereiam]();
				console.log("recharging "+$scope.whereiam);
			}	
		}, function() {
			console.log('RecetaViewCtrl - Cancel');		
		});
    };
	//////////////////////////////////////////////////////////////////////////////////////////
	//evaluacion login/logut
	$scope.msjeLoginx = function(value) {
		if($scope.idusuario>0){
			$scope.logOut();
		}else{
			$scope.showLogin();
		}
	}
	$scope.showGestorDen = function(ev){
		$http.post('./app/CT/CTreceta.php',{fun: 'getRecetasDenunciadasPendientes' } )
		.success(function(response) {
			$scope.listDen = response;
			// $scope.configDen = {
				// itemsPerPage: 10,
				// fillLastPage: true
			// }
			$scope.templateCurrent="./scripts/views/gestorDen.html";
			$scope.recetasDenTitle="PENDIENTES";
			//$scope.whereiam="goToFirst";
		});
	}
	//mostrar detalle de las denuncias de una receta
    $scope.showDenunciasRecetasView = function(ev,receta) {
		$scope.receta = receta;
		$mdDialog.show({
			locals:{data: $scope.receta, idusuario:$scope.idusuario},
			controller: 'denunciasRecetasViewCtrl',
			templateUrl: './scripts/views/denunciasRecetasView.html',
			targetEvent: ev,
		})
		.then(function(answer) {//entra aquí se ejecuta hide
			console.log("hay cambios?: "+answer);		
		}, function() { //entra aquí si se ejecuta cancel
			console.log('showDenunciasRecetasView - Cancel');		
		});
    };
	//mostrar mis chefs
	$scope.showMisChefsView=function(ev) {
		if($scope.idusuario>0){
			$http.post('./app/CT/CTusuario.php',{fun: 'getUsuariosSeguidos' , dat: { idusuario : $scope.idusuario } })
			.success(function(response) {
					console.log("longitud de mis chefs: "+response.length);
					$scope.mischefs = response;
					$scope.templateCurrent="./scripts/views/misChefsView.html";
			});
		}
	}
});
