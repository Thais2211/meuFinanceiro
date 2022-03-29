class Category < ApplicationRecord
  enum type: [:receita, :despesa ]
end
