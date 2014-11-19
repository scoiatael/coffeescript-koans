should = require('chai').should() # import Chai.js matchers
FILL_ME_IN = 'Fill this value in' # Don't touch this one!

# Note how mocha uses the 'describe' function for a test suite,
# and the 'it' function for a test
#
# Note also that arguments to functions do not need to be inside
# brackets (parentheses) - these are optional and used either
# for clarity or where we need to impose an order on evaluation
#
# Functions in coffeeScript are denoted by the 'stabby' or ->
# Whitespace significant
#   A Function (or other block) ends when the indentation level
#   goes back out, just like Python

describe 'About Should', ->
  # We shall contemplate truth by testing reality
  it 'should expect true', ->
    true.should.be.true
    # The first part (FILL_ME_IN) should be 'true'
    # Note absence of () at the end - true is not a function

  # Sometimes we will ask you to fill in the values
  # Note: 'xit' denotes a pending test
  # change 'xit' to 'it' to enable the test
  it 'should have filled in values', ->
    2.should.equal 1 + 1
    # Note absence of parentheses around the addition
    # equal(toValue) is a function but brackets are optional

  it 'should understand type coercion is fixed', ->
    # The 'is' is the same as Javascript's === operator
    (0 is '0').should.be.false # unlike JavaScript's ==
    1.should.be.truthy # Why not? What should we replace it with?
    # Hint: search the Chai.js docs for 'truthy'

  # To understand reality, we must compare our expectations against reality.
  it 'should expect equality', ->
    expectedValue = 2
    actualValue = 1 + 1
    (expectedValue == actualValue).should.be.true
    # == is the same as 'is' i.e. JavaScript's === operator

  # Some ways of asserting equality are better than others.
  it 'should assert equality a better way', ->
    expectedValue = 2
    actualValue = 1 + 1
    # Chai's equal() function works like ===
    actualValue.should.equal expectedValue

