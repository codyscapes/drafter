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
