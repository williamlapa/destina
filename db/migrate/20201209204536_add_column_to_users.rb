class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :cpf, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :cnpj, :string
    add_column :users, :address, :string
    add_column :users, :entity_type, :string
    add_column :users, :role, :string
    add_column :users, :entity_name, :string
  end
end
