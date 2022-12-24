require_relative 'person'
require_relative 'classroom'

class Student < Person
  def initialize(age, classroom, name, parent_permission: true, id: Random.rand(1..1000))
    super(age, name, parent_permission: parent_permission, id: id)
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
