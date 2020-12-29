<!-- IMPORT partials/breadcrumbs.tpl -->

<div data-widget-area="lsidebar" class="col-lg-3 col-sm-12 <!-- IF !widgets.lsidebar.length -->hidden<!-- ENDIF !widgets.lsidebar.length -->">
	{{{each widgets.lsidebar}}}
	{{widgets.lsidebar.html}}
	{{{end}}}
</div>
<div class="tag <!-- IF widgets.sidebar.length --><!-- IF widgets.lsidebar.length --> col-lg-6 col-sm-12 <!-- ELSE --> col-lg-9 col-sm-12 <!-- ENDIF --> <!-- ELSE -->col-lg-12<!-- ENDIF widgets.sidebar.length -->">
	<div class="categoryheader">
        <a id="topic_category" href="{config.relative_path}/tags/{tag}">
      </a>
    </div>

    <hr class="hidden-xs" />
	
	<div class="btn-toolbar">
		<div class="pull-left">
			<!-- IF loggedIn -->
			<!-- IMPORT partials/buttons/newTopic.tpl -->
			<!-- ELSE -->
			<a component="category/post/guest" href="{config.relative_path}/login" class="btn btn-primary">[[category:guest-login-post]]</a>
			<!-- ENDIF loggedIn -->
		</div>
	</div>

	<!-- IF !topics.length -->
	<div class="alert alert-warning">[[tags:no_tag_topics]]</div>
	<!-- ENDIF !topics.length -->

	<div class="category">
		<!-- IMPORT partials/topics_list.tpl -->
		<button id="load-more-btn" class="btn btn-primary hide">[[unread:load_more]]</button>
		<!-- IF config.usePagination -->
			<!-- IMPORT partials/paginator.tpl -->
		<!-- ENDIF config.usePagination -->
	</div>
</div>
<div data-widget-area="sidebar" class="col-lg-3 col-sm-12 <!-- IF !widgets.sidebar.length -->hidden<!-- ENDIF !widgets.sidebar.length -->">
	{{{each widgets.sidebar}}}
	{{widgets.sidebar.html}}
	{{{end}}}
</div>
<script>
var words = "{tag}".split(" ");
for (let i = 0; i < words.length; i++) {
	if (words[i].length == 1) {
		words[i] = words[i][0].toUpperCase() + ".";
	}
	else {
    	words[i] = words[i][0].toUpperCase() + words[i].substr(1);
	}
}
document.getElementById('topic_category').innerHTML = words.join(" ");;
</script>
