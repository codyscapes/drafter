	<div id='new_draft_settings'>
	  <div class='col-md-12'>
	  	<div class='row'>
	  		<div class='col-md-4'>
		      <p class='top_choices'>Starting QBs:</p>
			      <div class="btn-group-qb">
			        <button type="button" class="btn btn-default">1</button>
			        <button type="button" class="btn btn-default">2</button>
			        <button type="button" class="btn btn-default">3</button>
			      </div>

		      <p class='top_choices'>Starting HBs:</p>
			      <div class="btn-group-hb">
			        <button type="button" class="btn btn-default">1</button>
			        <button type="button" class="btn btn-default">2</button>
			        <button type="button" class="btn btn-default">3</button>
			        <button type="button" class="btn btn-default">4</button>
			      </div>

		      <p class='top_choices'>Starting WRs:</p>
			      <div class="btn-group-wr">
			        <button type="button" class="btn btn-default">1</button>
			        <button type="button" class="btn btn-default">2</button>
			        <button type="button" class="btn btn-default">3</button>
			        <button type="button" class="btn btn-default">4</button>
			      </div>

				</div>

	  		<div class='col-md-4'>

	  			<p class='top_choices'> Number of Teams </p>
	  			<p class='top_choices'> Draft Number </p>
	  			<p class='top_choices'> Logic Type: </p>

	  		</div>

	  		<div class='col-md-4'>
	  			<p class='top_choices'> PPR </p>
	  			<p class='top_choices'> PPC </p>
	  			<p class='top_choices'> PPTD </p>
	  		</div>



	  	</div>
	  </div>
	</div>


<div id='new_draft_div'>
		<%= link_to "START YOUR DRAFT!", new_draft_path, id: "new_draft", :class => 'btn btn-success', remote: true %>
</div>














DRAFT INDEX


<div class='row top_header'>
  <div class='col-md-12'>
  	<div class='row'>
  		<div class='col-md-4'>

      <p>Starting QBs:</p>
      <select class='starter_settings'>
        <option value="QB-1">1</option>
        <option value="QB-2">2</option>
      </select>

      <p>Starting HBs:</p>
      <select class='starter_settings'>
        <option value="HB-1">1</option>
        <option value="HB-2">2</option>
        <option value="HB-3">3</option>
        <option value="HB-4">4</option>
      </select>

      <p>Starting WRs:</p>
      <select class='starter_settings'>
        <option value="WR-1">1</option>
        <option value="WR-2">2</option>
        <option value="WR-3">3</option>
        <option value="WR-4">4</option>
      </select>


  		</div>
  		<div class='col-md-4'>
  			<p class='top_choices'> DRAFT # </p>
  			<p class='top_choices'> TEAMS </p>
  			<p class='top_choices'> <%= link_to "New Draft", new_draft_path, id: "new_draft", remote: true %>  </p>

  		</div>
  		<div class='col-md-4'>
  			<p class='top_choices'> PPR </p>
  			<p class='top_choices'> PPC </p>
  			<p class='top_choices'> PPTD </p>
  		</div>
  	</div>
  </div>
</div>

<div class='row draft-center'>
  <div class='col-md-2 master_list'>
    <div id='player_list'>

      <% @draft.players.each do |player| %>
        <%= player.name %></br>
      <% end %>

    </div>
  </div>

  <div class='col-md-7'>
    <div id='recommendations'>
      <p> Player rec's:</p>
        <div class = 'row'>
          <% @draft.best_available('beer_value').each do |player| %>
            <div class = 'col-md-4'>
              <div class='player_box'>
                Player: <%= player.name %></br>
                Team: <%= player.team %></br>
                Beer Value: <%= player.beer_value %> </br>
                ADP: <%= player.adp %> </br>
                Bye Week: <%= player.bye_week %></br>
              </div>
            </div>
          <% end %>
        </div>


    </div>

    <div class='position_tracking'>
      <div class='row'>

        <div class='col-md-2 remaining'>

          <h5>QBs:</h5>
            <% @draft.players.each do |player| %>
              <% if player.position == 'QB' %>
                <%= player.name %> </br>
              <% end %>
            <% end %>

        </div>

        <div class='col-md-2 remaining'>

          <h5>HBs:</h5>
            <% @draft.players.each do |player| %>
              <% if player.position == 'HB' %>
                <%= player.name %> </br>
              <% end %>
            <% end %>

        </div>

        <div class='col-md-2 remaining'>
          <h5>WRs:</h5>
            <% @draft.players.each do |player| %>
              <% if player.position == 'WR' %>
                <%= player.name %> </br>
              <% end %>
            <% end %>
        </div>

        <div class='col-md-2 remaining'>

          <h5>TEs:</h5>
            <% @draft.players.each do |player| %>
              <% if player.position == 'TE' %>
                <%= player.name %> </br>
              <% end %>
            <% end %>

        </div>

        <div class='col-md-2 remaining'>

          <h5>DEFs:</h5>
            <% @draft.players.each do |player| %>
              <% if player.position == 'DEF' %>
                <%= player.name %> </br>
              <% end %>
            <% end %>

        </div>

        <div class='col-md-2 remaining'>

          <h5>Ks:</h5>
            <% @draft.players.each do |player| %>
              <% if player.position == 'K' %>
                <%= player.name %> </br>
              <% end %>
            <% end %>
        </div>

      </div>
    </div>

  </div>
  <div class='col-md-3'>
    <div class='roster'>
      <p>Drafted players will appear here.  A team rundown at each position will be available. </p>
      <ul>
        <li> QB:  </li>
        <li> HB:  </li>
        <li> WR:  </li>
        <li> TE:  </li>
        <li> DEF: </li>
        <li> K: </li>
        <li> FLEX: </li>
        <li> BENCH: </li>
      </ul>
    </div>
    <div class='under_roster'>
      <p> This area does not have a name yet because I do not know what I will put here!</p>
    </div>
  </div>
</div>
<div class='row footer'>
  <div class='col-md-12 bottom_footer'>
    <p> I don't know what will go at the bottom of the page.</p>
  </div>
</div>



SHOW


<div class='row top_header'>
  <div class='col-md-12'>
    <div class='row'>
      <div class='col-md-4'>

      <p>Starting QBs:</p>
      <select class='starter_settings'>
        <option value="QB-1">1</option>
        <option value="QB-2">2</option>
      </select>

      <p>Starting HBs:</p>
      <select class='starter_settings'>
        <option value="HB-1">1</option>
        <option value="HB-2">2</option>
        <option value="HB-3">3</option>
        <option value="HB-4">4</option>
      </select>

      <p>Starting WRs:</p>
      <select class='starter_settings'>
        <option value="WR-1">1</option>
        <option value="WR-2">2</option>
        <option value="WR-3">3</option>
        <option value="WR-4">4</option>
      </select>


      </div>
      <div class='col-md-4'>
        <p class='top_choices'> DRAFT # </p>
        <p class='top_choices'> TEAMS </p>
        <p class='top_choices'> <%= link_to "New Draft", new_draft_path, id: "new_draft", remote: true %>  </p>
      </div>
      <div class='col-md-4'>
        <p class='top_choices'> PPR </p>
        <p class='top_choices'> PPC </p>
        <p class='top_choices'> PPTD </p>
      </div>
    </div>
  </div>
</div>

<div class='row draft-center'>
  <div class='col-md-2 master_list'>
    <div id='player_list'>

      <% @player.each do |player| %>
        <%= player.name %></br>
      <% end %>

    </div>
  </div>

  <div class='col-md-7'>
    <div id='recommendations'>
      <p> Player rec's:</p>

      <% if 1 == 2 %>
      <%= @draft.best_available('beer_value').name %> </br>
      <% end %>

      <% if 1 == 2 %>
      <% @draft.draft_suggestions('beer_value').each do |player| %>
      <%= player.name %> </br>
      <% end %>
      <% end %>

      <% @draft.players.reject{|element| element == @draft.best_available('beer_value')}.each do |player|%>
      <%= player.name %>
      <% end %>



    </div>

    <div class='position_tracking'>
      <div class='row'>
        <div class='col-md-2 remaining'>
          <p>QBs:</p>
        </div>
        <div class='col-md-2 remaining'>
          <p>HBs:</p>
        </div>
        <div class='col-md-2 remaining'>
          <p>WRs:</p>
        </div>
        <div class='col-md-2 remaining'>
          <p>TEs:</p>
        </div>
        <div class='col-md-2 remaining'>
          <p>DEF:</p>
        </div>
        <div class='col-md-2 remaining'>
          <p>Ks:</p>
        </div>
      </div>
    </div>

  </div>
  <div class='col-md-3'>
    <div class='roster'>
      <p>Drafted players will appear here.  A team rundown at each position will be available. </p>
      <ul>
        <li> QB:  </li>
        <li> HB:  </li>
        <li> WR:  </li>
        <li> TE:  </li>
        <li> DEF: </li>
        <li> K: </li>
        <li> FLEX: </li>
        <li> BENCH: </li>
      </ul>
    </div>
    <div class='under_roster'>
      <p> This area does not have a name yet because I do not know what I will put here!</p>
    </div>
  </div>
</div>
<div class='row footer'>
  <div class='col-md-12 bottom_footer'>
    <p> I don't know what will go at the bottom of the page.</p>
  </div>
</div>





DRAFT SPECS

  # describe 'teams' do
  #   it 'should hold an array of all teams in the draft' do
  #     draft = FactoryGirl.create(:two_team_draft)
  #     team = Team.create(:team_name => 'team_one', :draft_position => 1, :draft_id => draft.id)
  #     team2 = Team.create(:team_name => 'team_two', :draft_position => 2, :draft_id => draft.id)
  #     team3 = Team.create(:team_name => 'team_three', :draft_position => 2, :draft_id => draft.id)
  #     team4 = Team.create(:team_name => 'team_four', :draft_position => 2, :draft_id => draft.id)
  #     team5 = Team.create(:team_name => 'team_five', :draft_position => 2, :draft_id => draft.id)
  #     team6 = Team.create(:team_name => 'team_six', :draft_position => 2, :draft_id => draft.id)
  #     team7 = Team.create(:team_name => 'team_seven', :draft_position => 2, :draft_id => draft.id)
  #     team8 = Team.create(:team_name => 'team_eight', :draft_position => 2, :draft_id => draft.id)
  #     draft.start()
  #     draft.teams.should eq [team, team2, team3, team4, team5, team6, team7, team8]
  #   end
  # end


  # describe 'order' do
  #   it 'should tell the order of the draft with a team at each position in the array' do
  #     draft = FactoryGirl.create(:two_team_draft)
  #     team = Team.create(:team_name => 'team_one', :draft_position => 1, :draft_id => draft.id)
  #     team2 = Team.create(:team_name => 'team_two', :draft_position => 2, :draft_id => draft.id)
  #     team3 = Team.create(:team_name => 'team_three', :draft_position => 2, :draft_id => draft.id)
  #     team4 = Team.create(:team_name => 'team_four', :draft_position => 2, :draft_id => draft.id)
  #     team5 = Team.create(:team_name => 'team_five', :draft_position => 2, :draft_id => draft.id)
  #     team6 = Team.create(:team_name => 'team_six', :draft_position => 2, :draft_id => draft.id)
  #     team7 = Team.create(:team_name => 'team_seven', :draft_position => 2, :draft_id => draft.id)
  #     team8 = Team.create(:team_name => 'team_eight', :draft_position => 2, :draft_id => draft.id)
  #     draft.start()
  #     draft.team_picks(draft.teams[0]).should eq [0,15,16,31,32,47,48,63,64,79,80,95,96,111,112,127]
  #   end
  # end


  # describe 'order' do
  #   it 'creates the draft order if the draft type is snake' do
  #     draft = Draft.create(8, 'snake')
  #     draft.start()
  #     draft.team_picks(draft.teams[0]).should eq [0,15,16,31,32,47,48,63,64,79,80,95,96,111,112,127]
  #   end
  # end

  # describe 'team_picks' do
  #   it 'returns the picks of a given team' do
  #     draft = Draft.create(8, 'snake')
  #     draft.start()
  #     draft.team_picks(draft.teams[1]).should eq [1,14,17,30,33,46,49,62,65,78,81,94,97,110,113,126]
  #   end
  # end


  #   it "automatically cycles to the next player's pick" do
  #     player = FactoryGirl.create(:player)
  #     draft = Draft.create(8, 'snake')
  #     draft.start()
  #     draft.pick(player)
  #     draft.order[0].should eq draft.teams[1]
  #   end

  #   it 'removes the player selected from the players array.' do
  #     player = FactoryGirl.create(:player)
  #     reggie = FactoryGirl.create(:reggie_bush)
  #     draft = Draft.create(8, 'snake')
  #     draft.start()
  #     draft.pick(player)
  #     draft.players.should eq [reggie]
  #   end
  # end


  #   it 'should tell the drafting team the best player available in the draft and not show a player that has already been drafted.' do
  #     cam = FactoryGirl.create(:player)
  #     reggie = FactoryGirl.create(:reggie_bush)
  #     forte = FactoryGirl.create(:matt_forte)
  #     jamaal = FactoryGirl.create(:jamaal_charles)
  #     draft = Draft.create(8, 'snake')
  #     draft.start()
  #     draft.pick(jamaal)
  #     draft.best_available("beer_value")[0].should eq forte
  #   end
  # end

  # describe 'analyze_bye_week' do
  #   it 'shouold analyze the drafting teams roster and if a suggested player has the same bye week as a player already in the roster, it should return the name of the player already in the roster.' do
  #     dud = FactoryGirl.create(:dud)
  #     cam = FactoryGirl.create(:player)
  #     reggie = FactoryGirl.create(:reggie_bush)
  #     jamaal = FactoryGirl.create(:jamaal_charles)
  #     forte = FactoryGirl.create(:matt_forte)
  #     rice = FactoryGirl.create(:ray_rice)
  #     draft = Draft.create(2, 'snake')
  #     draft.start()
  #     draft.pick(jamaal)
  #     draft.pick(cam)
  #     draft.pick(reggie)
  #     draft.analyze_bye_week(draft.best_available('beer_value')[0]).should eq jamaal
  #   end

  #   it 'should return false if a suggested player does not have the same bye week as a player in the same position for the team that is currently drafting.' do
  #     dud = FactoryGirl.create(:dud)
  #     cam = FactoryGirl.create(:player)
  #     reggie = FactoryGirl.create(:reggie_bush)
  #     jamaal = FactoryGirl.create(:jamaal_charles)
  #     forte = FactoryGirl.create(:matt_forte)
  #     rice = FactoryGirl.create(:ray_rice)
  #     draft = Draft.create(2, 'snake')
  #     draft.start()
  #     draft.pick(cam)
  #     draft.pick(jamaal)
  #     draft.pick(forte)
  #     draft.analyze_bye_week(draft.best_available('beer_value')[0]).should eq false
  #   end
  # end

  # describe 'analyze_bye_weeks' do
  #   it 'should analyze the bye week for each player in the suggested player array and return an array of responses corresponding to each player in the suggested player array.' do
  #     dud = FactoryGirl.create(:dud)
  #     cam = FactoryGirl.create(:player)
  #     reggie = FactoryGirl.create(:reggie_bush)
  #     jamaal = FactoryGirl.create(:jamaal_charles)
  #     forte = FactoryGirl.create(:matt_forte)
  #     rice = FactoryGirl.create(:ray_rice)
  #     lacy = FactoryGirl.create(:eddie_lacy)
  #     draft = Draft.create(2, 'snake')
  #     draft.start()
  #     draft.pick(jamaal)
  #     draft.pick(cam)
  #     draft.pick(rice)
  #     draft.analyze_bye_weeks(draft.best_available('beer_value')).should eq [jamaal, false, jamaal]
  #   end
  # end



From show view:
  <%= link_to 'Draft', player_path(player, "player[team_id]" => @draft.order[0].id, "player[drafted]" => true), :method => :patch, :class => "btn btn-success" %>



From player index:

      <!-- <ul id='player_list'>
        <li>
          <%= link_to player.name, edit_player_path(player) %></br>
        </li>
      </ul> -->


From player model:

  def change_drafted_status
    if self.drafted == false
      self.drafted = true
    else
      self.drafted = false
    end
  end




