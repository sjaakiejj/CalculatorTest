angular.module('calculator.services',['ngResource']).
  factory('Solver', function($resource) {
    
    var mySolver = {};
    
    mySolver.solve = $resource('solver', {}, {
    		solve: { method: "GET", params: {op: "solve"} }
    });
    
    
    mySolver.lhistory = $resource('lhistory', {}, {
      		lhistory: { method: "GET", isArray: true } 
    });

    
    return mySolver;
    /*
    var MySolver =$resource('solver', 
    {
    }, {
    	solve: { method: "GET", params: { op: "solve" }},
      	lhistory: { method: "GET", params: {} }
       }
    );
    
    return MySolver;*/
    
    //return $resource('solve',{},{
    //  query: { method: "GET", params: { equation: 'eq' }, isArray: false }
    //}
  //)
})
