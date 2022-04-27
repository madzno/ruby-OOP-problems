class MealItem
  def return_name
    p self.class
  end
end

class Burger < MealItem
  NAME = "Burger"
end

p MealItem.new.return_name
