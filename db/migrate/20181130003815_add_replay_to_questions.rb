class AddReplayToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :replay, :string
    add_column :questions, :image, :string
  end
end
