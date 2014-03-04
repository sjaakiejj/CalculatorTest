assert = require "assert"

express = require("express")
calc = require("../scripts/calculator")
app = express()



describe "feature", -> 
  it "should evaluate the expression (Addition)", ->
    assert(16, calc.Calculator("6+10"))

describe "feature", ->
  it "should evaluate the expression (Multiplication)", ->
    assert(80, calc.Calculator("4*20"))

describe "feature", ->
  it "should evaluate the expression (Subtraction)", ->
    assert(68, calc.Calculator("90-22"))

describe "feature", ->   
  it "should evaluate the expression (Division)", ->
    assert(3, calc.Calculator("9/3"))

describe "feature", ->
  it "should evaluate floating point", ->
    assert(4.5, calc.Calculator("3.2+1.3"))

describe "feature", ->
  it "should evaluate to a floating point number", ->
     assert(2.5, calc.Calculator("5/2"))

describe "feature", -> 
  it "should throw an error", ->
     try
       calc.Calculator("6/0")
     catch err 
       done()

describe "feature", ->
   it "should evaluate correctly", ->
      assert(5, calc.Calculator("5*5+10-3/3+20/2-39"))

describe "feature", ->
   it "should ignore spaces", ->
      assert(6, calc.Calculator("5 * 5 - 20+1"))

describe "feature", ->
   it "should display a negative value", ->
      assert(-6, calc.Calculator("0-6"))

