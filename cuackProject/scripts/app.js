var app = angular.module('cuackApp', ['ngMessages','ngMaterial','angular-table','angular-tabs']);
//First parameter is the name of the module and second parameter will be used to specify other dependent modules.


app.config(function ($mdThemingProvider) {		
		var amberLight = $mdThemingProvider.extendPalette('amber', {
		  'contrastDefaultColor': 'light'
		});
		$mdThemingProvider.definePalette('amberLight', amberLight);
		$mdThemingProvider.theme('default')
		.primaryPalette('amberLight')
		.accentPalette('blue');
});

app.filter('range',function(){
	return function(input,total){
		total= parseInt(total);
		for(var i=0; i<total;i++){
			input.push(i);
		}
		return input;
	};
});

//CON ESTA  CONFIGURACIÓN EL TAG, INCORPORA EL VALOR QUE LE PASEMOS POR "TEMPLATE URL", DEJANDO ATRÁS SU ANTERIOR VALOR
//EN CAMBIO CON $mdDialog el contenido anterior permanece mientras que para una nueva acción se apre una nueva ventana superpuesta
/*
app.config(function ($routeProvider) { 
  $routeProvider 
    .when('/', { 
      controller: 'mainCtrl',   //se hace innecesario declarar las directivas ng-app y ng-controller
      templateUrl: './scripts/views/first.html' 
    }) 
    .otherwise({ 
      //redirectTo: '/'
      controller: 'mainCtrl',   //se hace innecesario declarar las directivas ng-app y ng-controller
      templateUrl: './scripts/views/first.html' 	  
    }); 
});
*/
