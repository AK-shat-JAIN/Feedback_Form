class AddFieldsToSessions < ActiveRecord::Migration[8.0]
  def change
    add_column :sessions, :phone_number, :string
    add_column :sessions, :otp, :string
    add_column :sessions, :verified, :boolean
  end
end
