require './lib/pantry'
require 'minitest/autorun'
require 'minitest/pride'

class PantryTest < Minitest::Test

  def test_it_exists
    pantry = Pantry.new

    assert_instance_of Pantry, pantry
  end

  def test_pantry_stock_is_nil
    pantry = Pantry.new
    @h = {}

    assert_equal @h, pantry.stock
  end

  def test_stock_check
    pantry = Pantry.new

    assert_equal 0, pantry.stock_check("cheese")
  end

  def test_restock
    pantry = Pantry.new
    pantry.restock("Cheese", 10)
    # pantry.restock("Cheese", 20)

    assert_equal 10, pantry.stock.values
  end



  def test_add_to_shopping_list
    skip
    pantry = Pantry.new
    r = Recipe.new("Spaghetti")
    r.add_ingredient("Noodles", 10)
    r.add_ingredient("Sauce", 10)
    r.add_ingredient("Cheese", 5)

  assert_equal ({"Noodles" => 10, "Sauce" => 10, "Cheese" => 5}) , pantry.print_shopping_list
  end

end
