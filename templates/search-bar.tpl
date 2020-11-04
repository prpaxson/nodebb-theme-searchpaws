<form id="searchBarWidget" class= "">
    <div class="form-group" id="search-widget-fields">
        <div class="input-group">

             <a id="searchBarButton" class="input-group-addon search-button">
                <i class="fa fa-search fa-fw"></i>
            </a>

	    <input id="searchBarWidgetInput" type="text" class="form-control" placeholder="Search the site" name="query" value="" autocomplete="off"> 
	    	    
        </div>
    </div>
    <ul class='search-bar-suggestions' style="display: none;">
    <!-- BEGIN searchBarWidgetSuggestions -->
        <li>
            <a href='/topic/{searchBarWidgetSuggestions.topic.slug}'>
               <h5>
                    {searchBarWidgetSuggestions.topic.title}
                </h5>
                <p>
                    {searchBarWidgetSuggestions.contentText}
                </p>
            </a>
        </li>
    <!-- END searchBarWidgetSuggestions -->
    </ul>
</form>
