require './lib/recipe'
require './lib/pantry'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class RecipeTest < Minitest::Test

  attr_reader :r,
              :pantry

  def setup
    @r = Recipe.new("Cheese Pizza")
    @pantry = Pantry.new
  end

  def test_it_has_a_name
    r = Recipe.new("Cheese Pizza")
    assert_equal "Cheese Pizza", r.name
  end

  def test_it_can_add_an_ingredient
    r = Recipe.new("Cheese Pizza")
    r.add_ingredient("Flour", 20) 
    assert_equal ["Flour"], r.ingredient_types
    r.add_ingredient("Cheese", 20)
    assert_equal ["Flour", "Cheese"], r.ingredient_types
  end

  def test_it_tracks_amount_of_a_recipe_required
    r = Recipe.new("Cheese Pizza")
    r.add_ingredient("Flour", 20)
    assert_equal 20, r.amount_required("Flour")
  end

  def test_correct_ingredients_are_returned
    r = Recipe.new("Cheese Pizza")
    r.add_ingredient("Cheese", 20)
    r.add_ingredient("Flour", 20)

    assert_equal ({"Cheese" => 20, "Flour" => 20}), r.ingredients
  end

  def test_shopping_list_returns_items
    r = Recipe.new("Cheese Pizza")
    r.add_ingredient("Cheese", 20)
    r.add_ingredient("Flour", 20)

    pantry.add_to_shopping_list(r)
    
    assert_equal ({"Cheese" => 20, "Flour" => 20}), pantry.shopping_list
  end

  def test_adding_recipe_to_shopping_list
    r = Recipe.new("Spaghetti")
    r.add_ingredient("Noodles", 10)
    r.add_ingredient("Sauce", 10)
    r.add_ingredient("Cheese", 5)
    r.add_ingredient("Flour", 20)
    pantry.add_to_shopping_list(r)

    assert_equal ({"Cheese" => 5, "Flour" => 20, "Noodles" => 10, "Sauce" => 10}), pantry.shopping_list 
  end

  def test_print_shopping_list
  r = Recipe.new("Spaghetti")
  r.add_ingredient("Noodles", 10)
  r.add_ingredient("Sauce", 10)
  r.add_ingredient("Cheese", 25)
  r.add_ingredient("Flour", 20)
  pantry.add_to_shopping_list(r)

  assert_equal "* Cheese: 20\n* Flour: 20\n* Noodles: 10\n* Sauce: 10", pantry.print_shopping_list
  end

  def test_case_name
    r1 = Recipe.new("Cheese Pizza")
    r1.add_ingredient("Cheese", 20)
    r1.add_ingredient("Flour", 20)

    r2 = Recipe.new("Pickles")
    r2.add_ingredient("Brine", 10)
    r2.add_ingredient("Cucumbers", 30)

    r3 = Recipe.new("Peanuts")
    r3.add_ingredient("Raw nuts", 10)
    r3.add_ingredient("Salt", 10)

    pantry.add_to_cookbook(r1)
    pantry.add_to_cookbook(r2)
    pantry.add_to_cookbook(r3)

    pantry.restock("Cheese", 10)
    pantry.restock("Flour", 20)
    pantry.restock("Brine", 40)
    pantry.restock("Pickles", 40)
    pantry.restock("Raw nuts", 20)
    pantry.restock("Salt", 20)

   assert_equal ["Pickles", "Peanuts"], pantry.what_can_i_make 
  end

end


























