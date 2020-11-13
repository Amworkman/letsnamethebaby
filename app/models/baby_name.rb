class BabyName < ApplicationRecord
    has_many :parents_baby_names
    has_many :parents, through: :parents_baby_names
    validates :name, presence: true 
    validates :name, uniqueness: true
    
    def add_baby_name_to_list(parent, baby_name)
        if parent.baby_names.length < 10 
            parent.baby_names << baby_name
        else
            flash[:alert] = "Your list is full"
        end
    end

    
end
