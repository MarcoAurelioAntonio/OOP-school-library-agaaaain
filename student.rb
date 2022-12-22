require './person'

class Student < Person
  attr_accessor :classroom # This is the classroom the student belongs to.

  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    # Make sure that when setting the classroom for a student it also adds it to the classrooms' students.
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
