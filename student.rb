require './person'
require './classroom'

class Student < Person
  def initialize(age, name, classroom, parent_permission: true)
    super(age, name, classroom, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  # This is the classroom the student belongs to.
  def classroom=(classroom)
    @classroom = classroom
    # When setting the classroom for a student it also adds it to the classrooms' students.
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
