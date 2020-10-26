class Parent < ApplicationRecord
    belong_to :team
    has_many :babies
    has_many :baby_names through: :babies
end
