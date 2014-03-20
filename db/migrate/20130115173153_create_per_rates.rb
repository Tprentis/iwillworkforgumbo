class CreatePerRates < ActiveRecord::Migration
  def change
    create_table :per_rates do |t|
      t.string :rate_description, :string
      t.timestamps
    end
  end
end
