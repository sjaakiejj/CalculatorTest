
#
# * The Actual Calculator Code.
# 

calc = require('../scripts/calculator')
mongoose = require('mongoose')
mongoose.connect('mongodb://localhost/calculatorapp')
# db = mongoose.createConnection('localhost','calculatorapp')
EquationSchema = require('../models/Calculator.coffee').EquationHistory
History = mongoose.model("History",EquationSchema)


console.log(mongoose.connection.host); 
console.log(mongoose.connection.port); 

exports.index = (req, res) ->
  res.render "index",
    title: "Calculator"

  return
 
# Returns the last 50 log entries in the database 
exports.gethistory = (req, res) ->
  console.log("Entering Function")

  History.find( {}, (error, hist) ->
   console.log('returned db')
   if(!error)
    res.json(hist)
   else
    throw new Error(err)
  ).limit(50)
  console.log("Exiting function")


# Use the Calculator Script to log and run a calculation
exports.solve = (req, res) ->
  equation = req.query.equation;
  
  output = calc.Calculator(equation)
  log = output.log
  
  for entry in log 
    dbPush(entry.op, entry.stack, entry.stp, entry.eq)
  
  res.json({solution: output.solution})


# Push a single log line into the database
dbPush = (op, stack, index, equation) ->
  insertRow = {step: index, operation: op, stack: stack, equation: equation };
  entry = new History(insertRow)
  entry.save( (error,data) -> 
   console.log('Saving row into Database')
   if(error)
    throw new Error("Couldn't database")
   )
