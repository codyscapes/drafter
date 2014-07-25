# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :draft do
		draft_position 5
		number_of_teams 12
		PPTD 4
		PPR	0
		Number_of_starting_QBs 1
		Number_of_starting_HBs 2
		Number_of_starting_WRs 2
		Number_of_starting_FLEX 1
		draft_type 'snake'
		keeper 0
		ranking_method 'beer_value'

		factory :two_team_draft do
			draft_position 1
			number_of_teams 2
			PPTD 4
			PPR	0
			Number_of_starting_QBs 1
			Number_of_starting_HBs 2
			Number_of_starting_WRs 2
			Number_of_starting_FLEX 1
			draft_type 'snake'
			keeper 0
			ranking_method 'beer_value'
		end

		factory :five_team_draft do
			draft_position 1
			number_of_teams 5
			PPTD 4
			PPR	0
			Number_of_starting_QBs 1
			Number_of_starting_HBs 2
			Number_of_starting_WRs 2
			Number_of_starting_FLEX 1
			draft_type 'snake'
			keeper 0
			ranking_method 'beer_value'
		end
	end
end
