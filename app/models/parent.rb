class Parent < ApplicationRecord    
    belongs_to :team
    has_many :babies
    has_many :parents_baby_names
    has_many :baby_names, through: :parents_baby_names
   
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
