require './nameable'
require './decorator'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(name, date)
    @rentals << Rental.new(name, date, self)
  end

  # Private methods.
  private

  def of_age?
    @age >= 18
  end
end

person = Person.new(22, 'maximilianus      ')
p person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
p capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(person)
p capitalized_trimmed_person.correct_name
