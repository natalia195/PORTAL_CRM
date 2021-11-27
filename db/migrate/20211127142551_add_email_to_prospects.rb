class AddEmailToProspects < ActiveRecord::Migration[6.1]
  def change
    add_column :prospects, :email, :string
  end
end
