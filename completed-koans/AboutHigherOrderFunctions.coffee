should = require('chai').should() # import Chai.js matchers
FILL_ME_IN = 'Fill this value in' # Don't touch this one!

describe 'About Higher Order Functions', ->
  it "should use 'for' for simple iteration", ->
    numbers = [3..0] # a reverse range
    msg = ''
    tell = (num) -> if num > 0 then "#{num}, " else "Blastoff!"
    msg += tell i for i in numbers # 'for' gives an array comprehension

    numbers.should.deep.equal [3,2,1,0]
    msg.should.equal "3, 2, 1, Blastoff!"

  it "should use 'in' to test inclusion", ->
    numbers = [1..3]

    (if 2 in numbers then true else false).should.equal true

  it 'should use a JavaScript-style filter to return array items that meet a criteria', ->
    numbers = [1..6]
    even = (a) -> if a % 2 is 0 then true else false
    evens = numbers.filter even

    numbers.should.have.length 6
    evens.should.have.length 3
    evens.should.deep.equal [2,4,6]

  it 'should use a CoffeeScript-style filter', ->
    numbers = [1..6]
    even = (a) -> a % 2 is 0 # shorter version
    odds = (x for x in numbers when not even x) # filter an array comprehension with 'when'
    # Note: the line above returns an array because everything is
    # an expression hence 'for' and 'while' return arrays

    odds.should.deep.equal [1,3,5]
    odds.should.have.length 3
    numbers.should.have.length 6

  it 'should use a JavaScript-style map to transform each element', ->
    numbers = [1..3]
    plus1 = (a) -> a + 1
    numbersPlus1 = numbers.map plus1 # Javascript style map

    numbersPlus1.should.deep.equal [2..4]

  it 'should use a CoffeeScript-style map to transform each element', ->
    numbers = [1..3]
    twice = (a) -> a * 2
    # simply place any function in front of 'for' for a map
    doubles = (twice x for x in numbers)

    doubles.should.deep.equal [2,4,6]

  it "should use JavaScript-style 'reduce' to calculate a total over the array", ->
    numbers = [1..3]
    total = (i, a) -> i + a
    reduction = numbers.reduce total # Javascript style reduce

    reduction.should.equal 6

  it 'should use a CoffeeScript-style reduce to calculate a total', ->
    numbers = [1..3]
    total = 0
    # I'm a little unhappy with this as it uses a side-effect, but as comprehensions
    # compile down to a 'for' loop in Javascript I'm not sure there's a more elegant way
    # other than the JavaScript style reduce above
    total+= x for x in numbers

    total.should.equal 6
