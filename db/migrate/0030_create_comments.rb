class CreateComments < ActiveRecord::Migration
  def self.up
    create_table   :comments do |t|
      t.references :user
      t.references :post
      t.integer    :parent_comment_id
      t.string     :author_name
      t.string     :author_email
      t.text       :body

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
