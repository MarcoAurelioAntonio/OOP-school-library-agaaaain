require './app'

class Interface
  def interface
    puts '   ****************************************   '
    puts ' ******* WELCOME!!... to our library! ******* '
    puts '   ****************************************   '
    puts '                                              '
    puts '                                              '
    puts '==========================='
    puts 'CHOOSE ONE OPTION YOU LIKE: '
    puts '==========================='
    puts '                           '
    puts '   1 --> See all the books'
    puts '   2 --> See all people'
    puts '   3 --> Load a person data in system'
    puts '   4 --> Load a book data'
    puts '   5 --> Make a rental'
    puts '   6 --> I want to know all rentals of a person ("id" based search)'
    puts '   7 --> Say goodbye!!'
  end
end

class Main
  def initialize
    @app = App.new
    @interface = Interface.new
  end

  def handle_selection
    option = gets.chomp.to_i
    selection = {
      1 => 'list_all_books',
      2 => 'list_all_people',
      3 => 'create_person',
      4 => 'create_book',
      5 => 'create_rental',
      6 => 'list_all_rentals_for_person_id'
    }
    case option
    when 1..6
      @app.send(selection[option])
      run
    when 7
      puts '*** It was a pleasure! Bye Bye!! ***'
    else
      puts '                                                                   | |'
      puts 'That is not a valid option, USE YOUR FINGER WISELLY THIS TIME DUDE x x'
      run
    end
  end

  def run
    @interface.interface
    handle_selection
  end

  private :handle_selection
end

Main.new.run
