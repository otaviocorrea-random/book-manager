class CreateUsersBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :users_books do |t|
      t.references :user, null: false
      t.references :book, null: false
      t.integer :rating, null: false, default: 0
      t.text :review
      t.boolean :read, null: false, default: false
      t.timestamps
    end
  end
end
