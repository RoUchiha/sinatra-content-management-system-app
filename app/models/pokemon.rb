class Pokemon < ActiveRecord::Base

    validates_presence_of :name, :type1

    belongs_to :trainer

end