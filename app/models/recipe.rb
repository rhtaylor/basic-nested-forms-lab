class Recipe < ActiveRecord::Base
  has_many :ingredients  
  accepts_nested_attributes_for :ingredients 
  def ingredients=(ingredients_params)
    self.ingredients.build(ingredients_params) 
    
  end

  
end
