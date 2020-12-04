<!-- IMPORT partials/breadcrumbs.tpl -->
<div data-widget-area="header">
  {{{each widgets.header}}}
  {{widgets.header.html}}
  {{{end}}}
</div>
<div class="row">
  <div data-widget-area="lsidebar" class="col-lg-3 col-sm-12 <!-- IF !widgets.lsidebar.length -->hidden<!-- ENDIF !widgets.lsidebar.length -->">
    {{{each widgets.lsidebar}}}
    {{widgets.lsidebar.html}}
    {{{end}}}
  </div>
  <div class="category <!-- IF widgets.sidebar.length --><!-- IF widgets.lsidebar.length --> col-lg-6 col-sm-12 <!-- ELSE --> col-lg-9 col-sm-12 <!-- ENDIF --> <!-- ELSE -->col-lg-12<!-- ENDIF widgets.sidebar.length -->">
    <!-- IMPORT partials/category/subcategory.tpl -->

    <!-- IF children.length --><hr class="hidden-xs"/><!-- ENDIF children.length -->
    <div class="categoryheader">
      <a id="topic_category" href="{config.relative_path}/category/{slug}">
        <span class="fa-stack fa-lg" style="{function.generateCategoryBackground, topics.category}">
          <i style="color:{color};" class="fa {icon} fa-stack-1x"></i>
        </span>
        {name}
      </a>
    </div>

    <hr class="hidden-xs" />

    <div class="clearfix">
      <a href="{url}" class="inline-block">
        <div class="alert alert-warning hide" id="new-topics-alert"></div>
      </a>

      <span component="category/controls">
        <!-- IMPORT partials/category/watch.tpl -->
        <!-- IMPORT partials/category/sort.tpl -->
        <!-- IMPORT partials/category/tools.tpl -->
      </span>
    </div>

    <!-- IF !topics.length -->
    <!-- IF privileges.topics:create -->
    <hr class="visible-xs" />
    <div class="alert alert-warning" id="category-no-topics">
      [[category:no_topics]]
    </div>
    <!-- ENDIF privileges.topics:create -->
    <!-- ENDIF !topics.length -->

    <!-- IMPORT partials/topics_list.tpl -->

    <!-- IF config.usePagination -->
      <!-- IMPORT partials/paginator.tpl -->
    <!-- ENDIF config.usePagination -->
  </div>
  <div data-widget-area="sidebar" class="col-lg-3 col-sm-12 <!-- IF !widgets.sidebar.length -->hidden<!-- ENDIF !widgets.sidebar.length -->">
    {{{each widgets.sidebar}}}
    {{widgets.sidebar.html}}
    {{{end}}}
  </div>
</div>
<div data-widget-area="footer">
  {{{each widgets.footer}}}
  {{widgets.footer.html}}
  {{{end}}}
</div>

<!-- IF !config.usePagination -->
<noscript>
  <!-- IMPORT partials/paginator.tpl -->
</noscript>
<!-- ENDIF !config.usePagination -->
