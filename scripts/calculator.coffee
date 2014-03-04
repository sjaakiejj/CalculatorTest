
exports.Calculator = (equation) ->
  
  equationStack = new Array();
  particleArray = equation.split(/([\+\*\-\/])/)

  index = 0
  parseNext = false
  log = new Array()
  
  # Run through the numbers one by one
  # Put them on the stack until the end, unless we're dealing
  # with a multiplication or division. In such case, evaluate immediately.
  for particle in particleArray
   if index % 2 is 0
    if not isNaN(parseFloat(particle)) and isFinite(particle)
     if parseNext
      firstPartialLog(log, equation, index)
      result = evaluateExpression(log,particle, equationStack.pop(), equationStack.pop())
      equationStack.push result
      thirdPartialLog(log,equationStack)
      parseNext = false
     else
      equationStack.push particle
      fullLog(log, equation, index, "Adding " + particle + " to stack",equationStack)
    else
     throw new Error("Not a number!")
   else
    parseNext = true  if particle is "*" or particle is "/"
    equationStack.push particle      
    fullLog(log, equation, index, "Adding " + particle + " to stack",equationStack)
   index++  
   
   
  while equationStack.length > 1
    firstPartialLog(log, equation,++index)
    result = evaluateExpression(log, equationStack.pop(),equationStack.pop(),equationStack.pop())
    equationStack.push(result)
    thirdPartialLog(log, equationStack)
   
   return {solution: equationStack.pop(), log: log}  
  

evaluateExpression = (log, rhs, op, lhs) ->
  if op == '/' and rhs == 0
    throw new Error("Division by Zero")
   
  secondPartialLog(log, "Evaluating " + rhs + op + lhs)

  switch op
    when '*' then return parseFloat(lhs) * parseFloat(rhs)
    when '+' then return parseFloat(lhs) + parseFloat(rhs)
    when '-' then return parseFloat(lhs) - parseFloat(rhs)
    when '/' then return parseFloat(lhs) / parseFloat(rhs)

fullLog = (log, equation, step, operation, stack) ->
  log.push({eq: equation, stp: step, op: operation, stack:"["+stack+"]"})

firstPartialLog = (log, equation, step) ->
  log.push({eq: equation, stp: step})

secondPartialLog = (log,operation) ->
  log[log.length - 1].op = operation

thirdPartialLog = (log,stack) ->
  log[log.length - 1].stack = "["+stack+"]"
  
