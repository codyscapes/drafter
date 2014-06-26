# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :player do
		name 'Cam Newton'
    team 'Carolina Panthers'
    points_2013 260
    beer_value 1.7
    bye_week 12
    adp 84
    tier 3
  end
end
