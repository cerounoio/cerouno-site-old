class AddTokenToUser < ActiveRecord::Migration[5.1]
  def up
    add_column :users, :token, :string
    add_index :users, :token, unique: true

    User.all.each do |user|
      user.update_column(:token, SecureRandom.hex(20))
      puts "Token created for #{user.full_name}"
    end
  end

  def down
    remove_column :users, :token
  end
end
