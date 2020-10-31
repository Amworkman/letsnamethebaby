class Parent < ApplicationRecord    
    belongs_to :team
    belongs_to :baby
    has_many :parents_baby_names
    has_many :baby_names, through: :parents_baby_names
   
    def add_baby_name_to_list(parent, baby_name)
        if parent.baby_names.length < 10 
            parent.baby_names << baby_name
        else
            raise "Your list is full"
        end
    end
    
    def baby_names_attributes=(baby_name_attributes)
        baby_name_attributes.values.each do |baby_name_attribute|
            baby_name = BabyName.find_or_create_by(baby_name_attribute)
            #self.baby_names.find_or_create_by(baby_name.name)
            unless self.baby_names.exists?(baby_name.id) 
                self.baby_names << baby_name
            end
        end
    end

end
