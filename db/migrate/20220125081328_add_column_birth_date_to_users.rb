class AddColumnBirthDateToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :birth_date, :date
  end
end
