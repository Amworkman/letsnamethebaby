class Baby < ApplicationRecord
    belongs_to :parent
    belongs_to :baby_name, optional: true
    belongs_to :team
end
