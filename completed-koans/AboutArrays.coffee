should = require('chai').should() # import Chai.js matchers
FILL_ME_IN = 'Fill this value in' # Don't touch this one!

describe 'About Arrays', ->
  describe 'for easier array functionality', ->
    # We shall contemplate truth by testing reality
    it 'should create an array', ->
      emptyArray = []

      (typeof emptyArray).should.equal 'object' # A mistake? - http://j.mp/oRuo6R
      emptyArray.should.have.length 0

    # An array is just one thing after another
    it 'should understand array literals', ->
      array = []
      array.should.deep.equal [] # Why isn't this so?
      # Hint: == is not the same as ===
      # What matcher should we use instead of equal()?
      # Hint: search the Chai.js docs for 'deep'

      array[0] = 1
      array.should.deep.equal [1]

      array[1] = 2
      array.should.deep.equal [1, 2]

      array.push(3)
      array.should.deep.equal [1,2,3]

    # How long is a piece of string?
    it 'should understand array length', ->
      fourNumberArray = [1, 2, 3, 4]

      fourNumberArray.should.have.length 4
      fourNumberArray.push(5, 6)
      fourNumberArray.should.have.length 6

      tenEmptyElementArray = new Array(10)
      tenEmptyElementArray.should.have.length 10

      tenEmptyElementArray.length = 5
      tenEmptyElementArray.should.have.length 5

    # Small fleas have big fleas upon their backs to bite 'em
    # And big fleas have bigger fleas and so on ad infinitum
    it 'should understand multitype arrays', ->
      multiTypeArray = [0 # newlines substitute for commas in CoffeeScript
                        1
                        'two'
                        -> 3 # anonymous functions can be array elements
                        value1: 4 # is this one object?
                        value2: 5 # or two objects?
                        [6
                        7]]

      multiTypeArray[0].should.equal 0
      multiTypeArray[2].should.equal 'two'
      multiTypeArray[3]().should.equal 3 # Note the parens!
      multiTypeArray[4].value1.should.equal 4
      multiTypeArray[5][0].should.equal 6


  describe 'for more complex array functions', ->
    # From here to..there, and back again
    it 'should understand array ranges', ->
      range = [1..5]
      range.should.deep.equal [1,2,3,4,5] # Write out all elements

      sdrawkcab = [3..1]
      sdrawkcab.should.deep.equal [3,2,1]

    # Not as clumsy or random as a blaster
    it 'should understand array comprehension', ->
      array = [1, 2, 3]
      accumulator = 0
      for element in array
        accumulator += element

      accumulator.should.deep.equal 6

    # A weapon for a more civilised age
    it 'should understand a more compact array comprehension', ->
      array = [1, 2, 3]
      accumulator = 1
      accumulator += element for element in array

      accumulator.should.equal 7

    # I do not think that word means what you think it means
    it 'should slice arrays', ->
      array = ['peanut', 'butter', 'and', 'jelly']

      array.slice(0, 1).should.deep.equal [ 'peanut' ]
      array.slice(0, 2).should.deep.equal ['peanut', 'butter'] # Not what you thought?
      array.slice(2, 2).should.deep.equal [] # What? Why?
      array.slice(2).should.deep.equal ['and', 'jelly'] # end?
      array.slice(2, 20).should.deep.equal ['and', 'jelly']
      array.slice(3, 0).should.deep.equal []
      array.slice(3, 100).should.deep.equal ['jelly']
      array.slice(5, 1).should.deep.equal []
      # Hint: look up http://j.mp/1lD9RXI

    # Much much nicer than Array.slice()
    it 'should understand range slicing', ->
      oneToTen = [1..10]
      oneToTen[3..5].should.deep.equal [4,5,6]

      myString = 'my string'[0..2]
      myString.should.equal 'my '

      firstTwo = ['one', 'two', 'three']
      firstTwo[0..1].should.deep.equal(['one', 'two'])

    # A pointer to a thing is not a thing
    it 'should understand array references', ->
      array = [ 'zero', 'one', 'two'
                'three', 'four', 'five' ]

      passedByReference = (refArray) ->
        refArray[1] = 'changed in function'

      passedByReference array
      array[1].should.equal 'changed in function'

      assignedArray = array
      assignedArray[5] = 'changed in assignedArray'
      array[5].should.equal 'changed in assignedArray' # Why?

      copyOfArray = array.slice()
      copyOfArray[3] = 'changed in copyOfArray'
      array[3].should.equal 'three' # Why?

    it 'should push and pop', ->
      array = [1, 2]

      array.push 'weasel'
      array.should.deep.equal [1,2,'weasel']

      poppedValue = array.pop()
      poppedValue.should.equal 'weasel'
      array.should.deep.equal [1,2]

    it 'should shift arrays', ->
      array = [1, 2]

      array.unshift 3
      array.should.deep.equal [3,1,2]

      shiftedValue = array.shift()
      shiftedValue.should.equal 3
      array.should.deep.equal [1,2]
