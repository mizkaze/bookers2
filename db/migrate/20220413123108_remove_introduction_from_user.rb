class RemoveIntroductionFromUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :Introduction, :string
  end
end
