class AddType2ToPokemons < ActiveRecord::Migration[4.2]

    def change
        add_column :pokemons, :type2, :string, default: nil
    end

end