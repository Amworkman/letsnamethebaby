class BabyName < ApplicationRecord
    has_many :parents_baby_names
    has_many :parents, through: :parents_baby_names
    validates :name, presence: true 
    validates :name, uniqueness: true    
end
