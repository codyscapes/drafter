# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :team do
		team_name 'team_one'
    draft_position 1
    draft_id 1

  	factory :team_two do
			team_name 'team_three'
	    draft_position 2
	    draft_id 1
	  end
  	factory :team_three do
			team_name 'team_three'
	    draft_position 3
	    draft_id 1
	  end
  	factory :team_four do
			team_name 'team_four'
	    draft_position 4
	    draft_id 1
	  end
  	factory :team_five do
			team_name 'team_five'
	    draft_position 5
	    draft_id 1
	  end
  	factory :team_six do
			team_name 'team_six'
	    draft_position 6
	    draft_id 1
	  end
  	factory :team_seven do
			team_name 'team_seven'
	    draft_position 7
	    draft_id 1
	  end
  	factory :team_eight do
			team_name 'team_eight'
	    draft_position 8
	    draft_id 1
	  end
	end
end
