class Team < ApplicationRecord
    has_secure_password
    has_many :parents
    has_many :babies
    accepts_nested_attributes_for :parents
    validates :teamname, uniqueness: true 

    def self.from_omniauth(auth)
        where(provider: auth.provider, uid: auth.uid).first_or_create do |team|
            team.provider = auth.provider
            team.uid = auth.uid
            team.parent_name = auth.info.first_name
            team.email = auth.info.email
            team.password = SecureRandom.urlsafe_base64
        end
    end

    def baby_names_arr_dupes(names_one, names_two)
        names_one & names_two
    end
end
