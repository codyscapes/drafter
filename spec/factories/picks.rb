# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pick do
    draft_position 1
    draft_id 0

  	factory :pick_two do
			team_name 'team_two'
	    draft_position 2
	    draft_id 0
	  end
	end
end
