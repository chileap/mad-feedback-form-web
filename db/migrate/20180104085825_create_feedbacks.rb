class CreateFeedbacks < ActiveRecord::Migration[5.1]
  def change
    create_table :feedbacks do |t|
      t.string :user_type
      t.string :category
      t.text :comments
      t.integer :rating
      t.timestamps
    end
  end
end
