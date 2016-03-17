app.directive('setFav', function() {
	return {
		restrict: 'E',
		$scope: {},
		templateUrl: './scripts/directives/setFav.html',
    
		link: function($scope, element, attrs,$mdToast) {
			//scope.buttonText = "Install",
			//scope.installed = false,

      // scope.download = function() {
        // element.toggleClass('btn-active')
        // if(scope.installed) {
          // scope.buttonText = "Install";
          // scope.installed = false;
        // } else {
          // scope.buttonText = "Uninstall";
          // scope.installed = true;
        // }
      // }
	  
			$scope.openToast = function($event) {
				$mdToast.show($mdToast.simple()
				.content('Añadido a Favoritos!')
				.position($scope.getToastPosition())
				.hideDelay(500)
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
		}
	};
});