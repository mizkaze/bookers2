class RemoveIntroFromUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :Intro, :string
  end
end
