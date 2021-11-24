class CreateTrainersTable < ActiveRecord::Migration[4.2]

    def change
        create_table :trainers do |t|
            t.text :email
            t.string :trainer_name
            t.string :gender
            t.string :password_digest

            t.timestamps null: false
        end
    end

end