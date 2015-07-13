class AlterPhones1 < ActiveRecord::Migration
  def change
    add_column :phones, :last_four_digits, :string # 下４桁を記録する
    add_index :phones, :last_four_digits
  end
end
