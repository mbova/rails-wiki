class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :user_id
      t.integer :stripe_customer_id
      t.float :payment_amount
      t.string :membership

      t.timestamps
    end
  end
end
