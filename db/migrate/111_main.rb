# frozen_string_literal: true

class Main < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email, null: false, default: ""
      t.string :nickname, null: false, unique: true
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :first_name_kana, null: false
      t.string :last_name_kana, null: false
      t.date :birth_date,          null: false, use_month_numbers: true
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      # Uncomment below if timestamps were not included in your original model.
      # t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true


    create_table :addresses do |t|
      t.integer :zipcode, null: false
      t.integer :owners_area_id
      t.text :city_name, null: false
      t.text :city_number, null: false
      t.text :building_name
      t.bigint :phone_number, unique: true
      t.references :user
      t.timestamps
    end

    create_table :categories do |t|
      t.string :name, null: false, unique: true
      t.string :ancestry, index: true
      t.timestamps
    end
    # add_index :categories, :ancestry

    create_table :items do |t|
      t.string  :name,              null: false
      t.integer :price,             null: false
      t.integer :status_id
      t.string  :brand
      t.integer :shipping_fee_id
      t.integer :shipping_method_id
      t.integer :owners_area_id
      t.integer :arrival_date_id
      t.string  :explain
      t.string :category_id, foreign_key: true, null: false
      t.references :user, foreign_key: true, null:false
      # t.string :user_id, foreign_key: true, null: false
      t.integer :buyer_id
      t.timestamps
    end

    create_table :item_images do |t|
      # mount_uploaderを使う場合は、imageカラムが存在すれば、.image_urlメソッドで取得できる
      t.string :image
      t.references :item, null:false
      t.timestamps
    end

  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
  
end

