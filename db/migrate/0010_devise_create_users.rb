class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      t.bushido_authenticatable
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :locale
      t.string :timezone

      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      t.timestamps
    end

    add_index :users, :email,  :unique => true
    add_index :users, :ido_id, :unique => true
  end

  def self.down
    drop_table :users
  end
end
