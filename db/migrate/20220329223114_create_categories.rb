class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.integer :kind
      t.string :title
      t.string :icone
      t.string :cor
    end
  end
end
