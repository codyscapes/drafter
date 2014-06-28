# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :player do
		name 'Cam Newton'
    team 'Carolina Panthers'
    position 'QB'
    points_2013 260
    beer_value 1.7
    bye_week 12
    adp 84
    tier 3

  	factory :reggie_bush do
	  	name 'Reggie Bush'
	    team 'Detroit Lions'
	    position 'HB'
	    points_2013 175
	    beer_value 7
	    bye_week 9
	    adp 30
	    tier 6
	  end

	    factory :jamaal_charles do
	  	name 'Jamaal Charles'
	    team 'Kansas City Chiefs'
	    position 'HB'
	    points_2013 296
	    beer_value 9
	    bye_week 6
	    adp 2
	    tier 1
	  end

	    factory :matt_forte do
	  	name 'Matt Forte'
	    team 'Chicago Bears'
	    position 'HB'
	    points_2013 189
	    beer_value 8
	    bye_week 4
	    adp 4
	    tier 1
	  end

	  	factory :ray_rice do
	  	name "Ray Rice"
	  	team 'Baltimore Ravens'
	  	position 'HB'
	  	points_2013 107
	  	beer_value 1
	  	bye_week 5
	  	adp 88
	  	tier 8
	  end

	end
end
