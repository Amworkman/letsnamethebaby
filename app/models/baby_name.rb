class BabyName < ApplicationRecord
    has_many :babies
    has_many :parents through: :babies
end
