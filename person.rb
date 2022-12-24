require_relative './nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def initialize(age, name = 'Unknown', classroom, parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @rentals = []
    @classroom = classroom
    @parent_permission = parent_permission
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def add_full_rental(rental)
    @rentals << rental
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
