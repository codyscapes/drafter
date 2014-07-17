require 'rails_helper'

RSpec.describe Pick, :type => :model do
  it { should belong_to(:player) }
  it { should belong_to(:team) }
  it { should belong_to(:draft) }

  it { should validate_presence_of :draft_id}
  it { should validate_presence_of :player_id}
  it { should validate_presence_of :team_id}
  it { should validate_presence_of :draft_position}
end
