class CreatePokemonsTable < ActiveRecord::Migration[4.2]

    def change
        create_table :pokemons do |t|
            t.string :name
            t.string :nickname
            t.string :type1
            t.integer :trainer_id

            t.timestamps null: false
        end
    end

end