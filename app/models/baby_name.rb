class BabyName < ApplicationRecord
    has_many :parents_baby_names
    has_many :parents, through: :parents_baby_names
    validates :name, presence: true 
    validates :name, uniqueness: true  
    
    def format_baby_name_info(baby_name)
        baby_name.name.capitalize!
        if baby_name.origin
            baby_name.origin.capitalize!
        end
        if baby_name.gender
            baby_name.gender.capitalize!
        end
        if baby_name.meaning
            baby_name.meaning.titleize
        end
        if baby_name.variations
            baby_name.variations.titleize
        end
    end
end
