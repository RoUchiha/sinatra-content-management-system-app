class AddBestBuddyToPokemons < ActiveRecord::Migration[4.2]

    def change 
        add_column :pokemons, :best_buddy, :boolean, default: false
    end

end