
class Pantry

  attr_reader :stock, :shopping_list

  def initialize
    @stock = {}
    @shopping_list = {}
    @cook_books = []
  end

  def stock_check(name)
    if @stock.include?(name)
      name = @stock[name]
      name
    else
    0
    end
  end


  def restock(key,value)
      stock[key] = value
      #This method overrides itself. I couldnt accurately test so
      #moved on. There is functionality up until the last method of three"
    end


  def add_to_shopping_list(data)
    data.ingredients.each_pair do |key, value|
      shopping_list[key] = value
    end
  end

  def print_shopping_list
    @shopping_list.map do |shop|
    list =  p "* #{shop[0]}:, #{shop[1]}:"
    end
    list
  end

  def add_to_cookbook(hash)
    @cook_books << hash
  end

  def what_can_i_make
    @cook_books.map do |cook_book|
      cook_book.name
    end
  end

  def how_many_can_i_make
    # @cook_books.map do |cook_book|
    #failed here, couldnt test exactly what was being passed.
    #the psuedo code is map through cook_books, if ingredients.values is an integer
    #after modulo 10, then i would set the remainder as the value of the recipe key.
    #there was also confusion as to what it was exactly asking as brine shot appears nowhere.

  end
end
