class Classroom
    attr_accessor :label
    attr_reader :students

    def initialize(label)
        @label = label
        @students = []
    end

    # Add student to the classroom one by one.(has many relationship)
    # I can use this [ @students.push(student) ] instead of [ @students << student ]
    def add_student(student)
        @students << student
        #Make sure that when adding a student to a classroom it also sets the classroom for the student.
        student.classroom = self
    end
end