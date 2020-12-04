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
    <div class=topic_header>
      <div id="avatar_topic" class="avatar avatar_topic pull-left">
        <!-- IF showSelect -->
        <div class="select" component="topic/select">
          <!-- IF topics.thumb -->
          <img src="{topics.thumb}" class="user-img not-responsive" />
          <!-- ELSE -->
          {buildAvatar(topics.user, "46", true, "not-responsive avatar_topic")}
          <!-- ENDIF topics.thumb -->
        </div>
        <!-- ENDIF showSelect -->

        <!-- IF !showSelect -->
        <a href="<!-- IF topics.user.userslug -->{config.relative_path}/user/{topics.user.userslug}<!-- ELSE -->#<!-- ENDIF topics.user.userslug -->" class="pull-left">
          <!-- IF topics.thumb -->
          <img src="{topics.thumb}" class="user-img not-responsive" />
          <!-- ELSE -->
          {buildAvatar(topics.user, "46", true, "not-responsive avatar_topic")}
          <!-- ENDIF topics.thumb -->
        </a>
        <!-- ENDIF !showSelect -->
      </div>
      <div class=topic_header_1>
        <div id="name_timeago">
          <div class="topic_header_text hidden-xs">
            <a id="topic_username" href="<!-- IF topics.user.userslug -->{config.relative_path}/user/{topics.user.userslug}<!-- ELSE -->#<!-- ENDIF topics.user.userslug -->">{topics.user.username}</a>
            </br>
            <span id=topic_timeago class="timeago" title="{topics.timestampISO}"></span>
          </div>
        </div>
        <small style="float:right">
          <a id="topic_category" href="{config.relative_path}/category/{topics.category.slug}"><span class="fa-stack fa-lg" style="{function.generateCategoryBackground, topics.category}"><i style="color:{topics.category.color};" class="fa {topics.category.icon} fa-stack-1x"></i></span> {topics.category.name}</a>
        </small>
      </div>
    </div>
    <h2 component="topic/header" class="title">
      <i component="topic/pinned" class="fa fa-thumb-tack <!-- IF !topics.pinned -->hide<!-- ENDIF !topics.pinned -->" title="[[topic:pinned]]"></i>
      <i component="topic/locked" class="fa fa-lock <!-- IF !topics.locked -->hide<!-- ENDIF !topics.locked -->" title="[[topic:locked]]"></i>
      <i component="topic/moved" class="fa fa-arrow-circle-right <!-- IF !topics.oldCid -->hide<!-- ENDIF !topics.oldCid -->" title="[[topic:moved]]"></i>
      {{{each icons}}}{@value}{{{end}}}

      <!-- IF !topics.noAnchor -->
      <a id=topic_title href="{config.relative_path}/topic/{topics.slug}<!-- IF topics.bookmark -->/{topics.bookmark}<!-- ENDIF topics.bookmark -->" itemprop="url">{topics.title}</a><br />
      <!-- ELSE -->
      <span>{topics.title}</span><br />
      <!-- ENDIF !topics.noAnchor -->

      <!-- IF !template.category -->

      <!-- ENDIF !template.category -->

      <!-- IF topics.tags.length -->
      <span class="tag-list hidden-xs">
        {{{each topics.tags}}}
        <a href="{config.relative_path}/tags/{topics.tags.valueEscaped}"><span class="tag" style="<!-- IF topics.tags.color -->color: {topics.tags.color};<!-- ENDIF topics.tags.color --><!-- IF topics.tags.bgColor -->background-color: {topics.tags.bgColor};<!-- ENDIF topics.tags.bgColor -->">{topics.tags.valueEscaped}</span></a>
        {{{end}}}
      </span>
      <!-- ENDIF topics.tags.length -->
      <small class="visible-xs-inline">
        <i class="fa fa-reply"></i> &nbsp;
        <!-- IF topics.teaser.timestamp -->
        <span class="timeago" title="{topics.teaser.timestampISO}"></span>
        <!-- ELSE -->
        <span class="timeago" title="{topics.timestampISO}"></span>
        <!-- ENDIF topics.teaser.timestamp -->
      </small>
    </h2>
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
        <li component="post" class="<!-- IF posts.deleted -->deleted<!-- ENDIF posts.deleted -->" <!-- IMPORT partials/data/topic.tpl -->>
          <a component="post/anchor" data-index="{posts.index}" id="{posts.index}"></a>

          <meta itemprop="datePublished" content="{posts.timestampISO}">
          <meta itemprop="dateModified" content="{posts.editedISO}">

          <!-- IMPORT partials/topic/post.tpl -->
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
