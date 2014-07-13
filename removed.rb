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







