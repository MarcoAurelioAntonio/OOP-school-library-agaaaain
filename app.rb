require './book'
require './person'
require './student'
require './teacher'
require './rental'

class App
  def list_all_books
    Book.all.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def list_all_people
    Person.all.each { |person| puts "Name: #{person.name}, Age: #{person.age}, ID: #{person.id}" }
  end

  def create_person
    print 'Do you want to load a student (1) or a teacher (2) data? [Input the require number]: ' 
    option = gets.chomp

    case option
    when '1'
      create_student
    when '2'
      create_teacher
    else
      "Is not a valid input"
    end
  end

  def create_teacher
    puts 'Name: '
    name = gets.chomp
    puts 'Age: '
    age = gets.chomp
    puts 'Specialization: '
    specialization = gets.chomp
    Teacher.new(age, specialization, name)
    puts 'Teacher created successfully'
  end

  def create_student
    puts 'Name: '
    name = gets.chomp
    puts 'Age: '
    age = gets.chomp
    puts 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp
    parent_permission = parent_permission.downcase == 'y'
    puts 'Classroom: '
    classroom = gets.chomp
    Student.new(age, classroom, name, parent_permission: parent_permission)
    puts 'Student created successfully'
  end

  def create_book
    puts 'Title: '
    title = gets.chomp
    puts 'Author: '
    author = gets.chomp
    Book.new(title, author)
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    Book.all.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    Person.all.each_with_index { |person, index| puts "#{index}) Name: #{person.name} ID: #{person.id}" }
    person_index = gets.chomp.to_i
    puts 'Date: '
    date = gets.chomp
    Rental.new(date, Book.all[book_index], Person.all[person_index])
    puts 'Rental created successfully'
  end

  def list_all_rentals_for_person_id
    puts 'Type the ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals:'
    Rental.all.each do |rental|
      if rental.person.id == id
        puts "Book: #{rental.book.title} Rented by #{rental.person.name} on Date: #{rental.date}"
      end
    end
  end
end
