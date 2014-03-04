angular.module('calculator.controllers', []).
  controller('CalculatorCtrl', function($scope, Solver){
    $scope.rows = [
      [
	{'number': '1', 'colspan': '1'},
	{'number': '2', 'colspan': '1'},
	{'number': '3', 'colspan': '1'},
	{'number': '+', 'colspan': '1'}
      ],
      [
	{'number': '4', 'colspan': '1'},
	{'number': '5', 'colspan': '1'},
	{'number': '6', 'colspan': '1'},
	{'number': '-', 'colspan': '1'}
      ],
      [
	{'number': '7', 'colspan': '1'},
	{'number': '8', 'colspan': '1'},
	{'number': '9', 'colspan': '1'},
	{'number': '*', 'colspan': '1'}
      ],
      [
	{'number': '0', 'colspan': '1'},
	{'number': 'Solve', 'colspan': '2'},
	{'number': '/', 'colspan': '1'}
      ],
    ];

    $scope.calc_screen = "";

    $scope.addToScreen = function(str) 
    {
       if("Solve" == str){
          Solver.solve.solve({'equation': $scope.calc_screen},
		     function(sol){
		       $scope.calc_screen=sol.solution;
		     });
       }
       else
          $scope.calc_screen += str;
    }
}).controller("HistoryCtrl", function($scope, Solver){
  //$scope.steps = Solver.lhistory.lhistory();
  Solver.lhistory.lhistory({}, 
  			function(hist){
			  $scope.steps = hist
			});
})
