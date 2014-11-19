should = require('chai').should() # import Chai.js matchers
expect = require('chai').expect # import Chai.js matchers
FILL_ME_IN = 'Fill this value in' # Don't touch this one!

describe 'About Objects', ->
  describe 'for properties', ->
    meglomaniac = {}
    beforeEach ->
      meglomaniac =
        mastermind: 'Joker'
        henchwoman: 'Harley'

    it 'should confirm objects are collections of properties', ->
      meglomaniac.mastermind.should.equal 'Joker'

    it 'should confirm that properties are case sensitive', ->
      meglomaniac.henchwoman.should.equal 'Harley'
      should.not.exist meglomaniac.henchWoman # make this right
      # Hint: invert the assertion
  # end Properties section

  describe 'for methods', ->
    it 'should know properties that are functions act like methods', ->
      # Coffeescript supports multi-line assignments and heredocs
      meglomaniac =
        mastermind: 'Brain'
        henchman: 'Pinky'
        battleCry: (noOfBrains) ->
          'They are ' + @henchman + ' and the' +
          Array(noOfBrains + 1).join(' ' + @mastermind)
          # Remember: '@' means 'this.'

      battleCry = meglomaniac.battleCry 3
      battleCry.should.equal 'They are Pinky and the Brain Brain Brain'


    it "should confirm that when a function is attached to an object, 'this' refers to the object", ->
      currentYear = (new Date).getFullYear()
      meglomaniac =
        mastermind: 'James Wood'
        henchman: 'Adam West'
        birthYear: 1970
        calculateAge: -> currentYear - @birthYear

      currentYear.should.equal 2014
      meglomaniac.calculateAge().should.equal 44
  # end methods section

  describe "for the 'in' keyword", ->
    meglomaniac = {}
    beforeEach ->
      meglomaniac =
        mastermind: 'The Monarch'
        henchwoman: 'Dr Girlfriend'
        theBomb: true

    it 'should have the bomb', ->
      hasBomb = meglomaniac.theBomb? # ? is the existence operator
      hasBomb.should.equal true

    it 'should not have the detonator however', ->
      hasDetonator = meglomaniac.theDetonator?
      hasDetonator.should.equal false
  # end 'in' keyword section

  describe 'for altering objects', ->
    it 'should know that properties can be added and deleted', ->
      meglomaniac =
        mastermind : 'Agent Smith'
        henchman: 'Agent Smith'

      meglomaniac.secretary?.should.equal false
      # Remember that '?' is the existential operator

      meglomaniac.secretary = 'Agent Smith'
      meglomaniac.secretary?.should.equal 'Agent Smith'

      delete meglomaniac.henchman
      meglomaniac.henchman?.should.equal false

    it 'should use prototype to add to all objects', ->
        Circle = (radius) -> @radius = radius

        simpleCircle = new Circle(10)
        colouredCircle = new Circle(5)
        colouredCircle.colour = 'red'

        expect(simpleCircle.colour).to.equal undefined # Again, fix it
        colouredCircle.colour.should.equal 'red'

        Circle::describe = ->
          'This circle has a radius of: ' + @radius

        simpleCircle.describe().should.equal 'This circle has a radius of: 10'
        colouredCircle.describe().should.equal 'This circle has a radius of: 5'
  # end altering objects section
