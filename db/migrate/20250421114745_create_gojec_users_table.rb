class CreateGojecUsersTable < ActiveRecord::Migration[8.0]
  def change
    create_table :gojec_users_tables do |t|
      t.timestamps
    end
  end
end
