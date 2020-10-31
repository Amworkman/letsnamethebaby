class Baby < ApplicationRecord
    has_many :parents
    belongs_to :team
end
