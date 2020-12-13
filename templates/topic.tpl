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
  <div class="topic_container topic <!-- IF widgets.sidebar.length --> <!-- IF widgets.lsidebar.length --> col-lg-6 col-sm-12 <!-- ELSE --> col-lg-9 col-sm-12 <!-- ENDIF --> <!-- ELSE -->col-lg-12<!-- ENDIF widgets.sidebar.length -->">
    <div class=topic_header_topics>
      <small style="margin-bottom:10px;" class="category_topic">
        <a id="topic_category" href="{config.relative_path}/category/{category.slug}"><span class="fa-stack fa-lg" style="{function.generateCategoryBackground, category}"><i style="color:{category.color};" class="fa {category.icon} fa-stack-1x"></i></span> {category.name}</a>
      </small>
      <h2 component="topic/header" class="title_topic">
        <i component="topic/pinned" class="fa fa-thumb-tack <!-- IF !topics.pinned -->hide<!-- ENDIF !topics.pinned -->" title="[[topic:pinned]]"></i>
        <i component="topic/locked" class="fa fa-lock <!-- IF !topics.locked -->hide<!-- ENDIF !topics.locked -->" title="[[topic:locked]]"></i>
        <i component="topic/moved" class="fa fa-arrow-circle-right <!-- IF !topics.oldCid -->hide<!-- ENDIF !topics.oldCid -->" title="[[topic:moved]]"></i>
        {{{each icons}}}{@value}{{{end}}}

        <!-- IF !topics.noAnchor -->
        <a id=topic_title href="{config.relative_path}/topic/{slug}<!-- IF topics.bookmark -->/{bookmark}<!-- ENDIF topics.bookmark -->" itemprop="url">{title}</a><br />
        <!-- ELSE -->
        <span>{title}</span><br />
        <!-- ENDIF !topics.noAnchor -->

        <!-- IF !template.category -->

        <!-- ENDIF !template.category -->

        <!-- IF topics.tags.length -->
        <span class="tag-list hidden-xs">
          {{{each tags}}}
          <a href="{config.relative_path}/tags/{tags.valueEscaped}"><span class="tag" style="<!-- IF tags.color -->color: {tags.color};<!-- ENDIF tags.color --><!-- IF tags.bgColor -->background-color: {tags.bgColor};<!-- ENDIF tags.bgColor -->">{tags.valueEscaped}</span></a>
          {{{end}}}
        </span>
        <!-- ENDIF topics.tags.length -->
        <small class="visible-xs-inline">
          <i class="fa fa-reply"></i> &nbsp;
          <!-- IF topics.teaser.timestamp -->
          <span class="timeago" title="{teaser.timestampISO}"></span>
          <!-- ELSE -->
          <span class="timeago" title="{timestampISO}"></span>
          <!-- ENDIF topics.teaser.timestamp -->
        </small>
      </h2>
    </div>

    <!-- IF merger -->
    <div component="topic/merged/message" class="alert alert-warning clearfix">
      <span class="pull-left">[[topic:merged_message, {config.relative_path}/topic/{mergeIntoTid}, {merger.mergedIntoTitle}]]</span>
      <span class="pull-right">
        <a href="{config.relative_path}/user/{merger.userslug}">
          <strong>{merger.username}</strong>
        </a>
        <small class="timeago" title="{mergedTimestampISO}"></small>
      </span>
    </div>
    <!-- ENDIF merger -->

    <!-- IMPORT partials/topic/deleted-message.tpl -->

    <ul component="topic" class="posts" data-tid="{tid}" data-cid="{cid}">
      {{{each posts}}}
        <li component="post" class="<!-- IF posts.deleted -->deleted<!-- ENDIF posts.deleted --> data_{posts.index} post_outercontainer" <!-- IMPORT partials/data/topic.tpl -->>
          <a component="post/anchor" data-index="{posts.timestampISO}" id="{posts.timestampISO}"></a>

          <meta itemprop="datePublished" content="{posts.timestampISO}">
          <meta itemprop="dateModified" content="{posts.editedISO}">

          <div class="{{{ if posts.toPid && (posts.toPid != posts.0.pid) }}} col-lg-3 {{{end}}}"></div>
          <div class="post_container pid_{posts.index} {{{ if posts.toPid && (posts.toPid != posts.0.pid) }}} col-lg-9 {{{end}}}">
            <!-- IMPORT partials/topic/post.tpl -->
          </div>
        </li>
      {{{end}}}
    </ul>

    <!-- IF config.enableQuickReply -->
    <!-- IMPORT partials/topic/quickreply.tpl -->
    <!-- ENDIF config.enableQuickReply -->

    <!-- IF config.usePagination -->
    <!-- IMPORT partials/paginator.tpl -->
    <!-- ENDIF config.usePagination -->

    <div class="navigator-thumb text-center hidden">
      <strong class="text"></strong><br/>
      <span class="time"></span>
    </div>
    <div class="visible-xs visible-sm pagination-block text-center">
      <div class="progress-bar"></div>
      <div class="wrapper">
        <i class="fa fa-2x fa-angle-double-up pointer fa-fw pagetop"></i>
        <i class="fa fa-2x fa-angle-up pointer fa-fw pageup"></i>
        <span class="pagination-text"></span>
        <i class="fa fa-2x fa-angle-down pointer fa-fw pagedown"></i>
        <i class="fa fa-2x fa-angle-double-down pointer fa-fw pagebottom"></i>
      </div>
    </div>
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
