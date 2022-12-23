class Rental
    attr_accesor :date, :book

    def initialize(date, book)
        @date = date
        @book = book
    end
end
