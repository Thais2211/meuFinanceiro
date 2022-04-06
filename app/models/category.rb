class Category < ApplicationRecord
  enum kind: [:receita, :despesa ]
end
