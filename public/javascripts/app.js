angular.module("calculator",['ngRoute','calculator.services', 'calculator.controllers'])
  .config(['$routeProvider', function($routeProvider){ 
     $routeProvider
      .when('/', {
	templateUrl: 'partials/calculator.html',
	controller: 'CalculatorCtrl'
      })
      .when('/history', {
        templateUrl: 'partials/history.html',
	controller: 'HistoryCtrl'
      })
  }]);
