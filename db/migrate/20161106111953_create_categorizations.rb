class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.references :article, index: true
      t.references :category, index: true

      t.timestamps null: false
    end
    add_foreign_key :categorizations, :articles
    add_foreign_key :categorizations, :categories
  end
end
