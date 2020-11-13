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

    def reset_and_update_team
        self.parents.clear
        self.babies.clear

        self.update(team_params)
             
        @baby = current_team.babies.build(baby_params)
        current_team.parents.each { |parent| @baby.parents << parent }
    end

    def common_names
        @parent_one_babies = self.parents.first.baby_names
        @parent_two_babies = self.parents.last.baby_names

        @baby_names = self.baby_names_arr_dupes(@parent_one_babies, @parent_two_babies)
    end

    def set_name
        self.parents.first.name = self.parent_name
        self.save
    end

    def baby_names_arr_dupes(names_one, names_two)
        names_one & names_two
    end
end
