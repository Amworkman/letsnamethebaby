class ParentsBabyName < ApplicationRecord
    belongs_to :parent
    belongs_to :baby_name
end
