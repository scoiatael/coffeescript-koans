should = require('chai').should() # import Chai.js matchers
FILL_ME_IN = 'Fill this value in' # Don't touch this one!

# In this koan, we'll explore the concept of CoffeeScript's
# Class keyword a little
# Note: ES6's new 'Class' keyword functions in a very similar way
# (this is not a coincidence!)

class Muppet
  constructor: (@age, @hobby) -> # Why is this function empty?
  answerNanny: -> "Everything's cool!"

class SwedishChef extends Muppet
  constructor: (age, hobby, @mood) ->
    super(age, hobby)
  cook: -> 'Mmmm soup!'

describe 'About inheritance', ->
  muppet = new Muppet 2, 'coding'
  swedishChef = new SwedishChef 3, 'cooking', 'chillin'

  it 'should be able to call a method on the derived object', ->
    swedishChef.cook().should.equal 'Mmmm soup!'

  it 'should be able to call a method on the base object', ->
    swedishChef.answerNanny().should.equal "Everything's cool!"

  it 'should set constructor parameters on the base object', ->
    swedishChef.age.should.equal 3
    swedishChef.hobby.should.equal 'cooking'

  it 'should set constructor parameters on the derived object', ->
    swedishChef.mood.should.equal 'chillin'

  it 'should allow instances to override class methods', ->
    gonzo = new Muppet 3, 'daredevil performer'
    gonzo.answerNanny = -> 'Hehehe!'
    gonzo.answerNanny().should.equal 'Hehehe!'
    muppet.answerNanny().should.equal "Everything's cool!"

  it 'should allow derived classes to override base classes', ->
    class DanishChef extends SwedishChef
      cook: -> 'Sizzle'
    redzepi = new DanishChef 30, 'foraging', 'happy'
    redzepi.cook().should.equal 'Sizzle'
    swedishChef.cook().should.equal 'Mmmm soup!'
