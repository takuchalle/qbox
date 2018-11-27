class AddTokenToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :token, :string

    add_index :questions, :token, unique: true
  end
end
