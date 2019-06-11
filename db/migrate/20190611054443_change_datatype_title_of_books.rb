class ChangeDatatypeTitleOfBooks < ActiveRecord::Migration[5.2]
  def change
  	change_column :books, :title, :string
  	change_column :books, :body, :string
  end
end
