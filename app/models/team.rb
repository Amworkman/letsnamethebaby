class Team < ApplicationRecord
    has_many :parents
    has_many :babies
    accepts_nested_attributes_for :parents
end
