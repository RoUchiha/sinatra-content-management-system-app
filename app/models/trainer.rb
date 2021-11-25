class Trainer < ActiveRecord::Base

    has_many :pokemons
    validates_presence_of :email, :password, :trainer_name, :gender
    has_secure_password

    def slug
        trainer_name.downcase.gsub(" ", "-")
    end

    def self.find_by_slug(slug)
        Trainer.all.find{ |t| t.slug == slug }
    end

end