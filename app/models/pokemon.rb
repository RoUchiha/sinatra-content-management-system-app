class Pokemon < ActiveRecord::Base

    validates_presence_of :name, :type1

    belongs_to :trainer

    def slug
        name.downcase.gsub(" ", "-")
    end

    def self.find_by_slug(slug)
        Pokemon.all.find{ |t| t.slug == slug }
    end

end