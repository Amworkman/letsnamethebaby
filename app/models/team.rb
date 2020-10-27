class Team < ApplicationRecord
    has_many :parents
    accepts_nested_attributes_for :parents
end
