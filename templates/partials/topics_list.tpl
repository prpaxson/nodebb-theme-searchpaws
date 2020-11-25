<ul component="category" class="topic-list" itemscope itemtype="http://www.schema.org/ItemList" data-nextstart="{nextStart}" data-set="{set}">
  <meta itemprop="itemListOrder" content="descending">
  {{{each topics}}}
  <div class=topic_header>
    <div id="avatar_topic" class="avatar avatar_topic pull-left">
      <!-- IF showSelect -->
      <div class="select" component="topic/select">
        <!-- IF topics.thumb -->
        <img src="{topics.thumb}" class="user-img not-responsive" />
        <!-- ELSE -->
        {buildAvatar(topics.user, "46", true, "not-responsive avatar_topic")}
        <!-- ENDIF topics.thumb -->
        <i class="fa fa-check"></i>
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
          <span class="timeago" title="{topics.timestampISO}"></span>
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
    {{{each icons}}}@value{{{end}}}

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
      <small>&bull;</small>
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


  <!-- IMPORT partials/breadcrumbs.tpl -->
  <div data-widget-area="header">
    {{{each widgets.header}}}
    {{widgets.header.html}}
    {{{end}}}
  </div>
  <div class="row">
    <div class="topic <!-- IF widgets.sidebar.length -->col-lg-9 col-sm-12<!-- ELSE -->col-lg-12<!-- ENDIF widgets.sidebar.length -->">

      <h1 component="post/header" class="hidden-xs" itemprop="name">

        <i class="pull-left fa fa-thumb-tack <!-- IF !pinned -->hidden<!-- ENDIF !pinned -->" title="[[topic:pinned]]"></i>
        <i class="pull-left fa fa-lock <!-- IF !locked -->hidden<!-- ENDIF !locked -->" title="[[topic:locked]]"></i>
        <i class="pull-left fa fa-arrow-circle-right <!-- IF !oldCid -->hidden<!-- ENDIF !oldCid -->" title="[[topic:moved]]"></i>
        {{{each icons}}}@value{{{end}}}

        <span class="topic-title" component="topic/title">{title}</span>
      </h1>

      <!-- IF merger -->
      <div component="topic/merged/message" class="alert alert-warning clearfix">
        <span class="pull-left">[[topic:merged_message, {mergeIntoTid}, {merger.mergedIntoTitle}]]</span>
        <span class="pull-right">
          <a href="{config.relative_path}/user/{merger.userslug}">
            <strong>{merger.username}</strong>
          </a>
          <small class="timeago" title="{mergedTimestampISO}"></small>
        </span>
      </div>
      <!-- ENDIF merger -->

      <!-- IMPORT partials/topic/deleted-message.tpl -->

      <hr class="visible-xs" />

      <ul component="topic" class="posts" data-tid="{tid}" data-cid="{cid}">
        {{{each posts}}}
          <li component="post" class="<!-- IF posts.deleted -->deleted<!-- ENDIF posts.deleted -->" <!-- IMPORT partials/data/topic.tpl -->>
            <a component="post/anchor" data-index="{posts.index}" id="{posts.index}"></a>

            <meta itemprop="datePublished" content="{posts.timestampISO}">
            <meta itemprop="dateModified" content="{posts.editedISO}">

            <!-- IMPORT partials/topic/post.tpl -->
            <!-- IF !posts.index -->
            <div class="post-bar-placeholder"></div>
            <!-- ENDIF !posts.index -->
          </li>
        {{{end}}}
      </ul>

      <!-- IF config.enableQuickReply -->
      <!-- IMPORT partials/topic/quickreply.tpl -->
      <!-- ENDIF config.enableQuickReply -->

      <div class="post-bar">
        <!-- IMPORT partials/post_bar.tpl -->
      </div>

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


  <li component="category/topic" class="row clearfix category-item {function.generateTopicClass}" data-tid="{topics.tid}" data-index="{topics.index}" data-cid="{topics.cid}" itemprop="itemListElement">
    <meta itemprop="name" content="{function.stripTags, title}">

    <div class="mobile-stat col-xs-2 visible-xs text-right">
      <span class="human-readable-number">{topics.postcount}</span> <a href="{config.relative_path}/topic/{topics.slug}/{topics.teaser.index}"><i class="fa fa-arrow-circle-right"></i></a>
    </div>

    <div class="col-md-1 hidden-sm hidden-xs stats stats-votes">
      <!-- IF !reputation:disabled -->
      <span class="human-readable-number" title="{topics.votes}">{topics.votes}</span><br />
      <small>[[global:votes]]</small>
      <!-- END -->
    </div>

    <div class="col-md-1 hidden-sm hidden-xs stats stats-postcount">
      <span class="human-readable-number" title="{topics.postcount}">{topics.postcount}</span><br />
      <small>[[global:posts]]</small>
    </div>

    <div class="col-md-1 hidden-sm hidden-xs stats stats-viewcount">
      <span class="human-readable-number" title="{topics.viewcount}">{topics.viewcount}</span><br />
      <small>[[global:views]]</small>
    </div>

    <div class="col-md-3 col-sm-3 teaser hidden-xs" component="topic/teaser">

    </div>
  </li>
  <div class="card" style="border-color: {topics.category.bgColor}">
    <!-- IF topics.unreplied -->
    <p>
      [[category:no_replies]]
    </p>
    <!-- ELSE -->
    <!-- IF topics.teaser.pid -->
    <p>
      <a href="{config.relative_path}/user/{topics.teaser.user.userslug}">{buildAvatar(topics.teaser.user, "24", true, "not-responsive")}</a>
      <a class="permalink" href="{config.relative_path}/topic/{topics.slug}/{topics.teaser.index}">
        <span class="timeago" title="{topics.teaser.timestampISO}"></span>
      </a>
    </p>
    <div class="post-content">
      {topics.teaser.content}
    </div>
    <!-- ENDIF topics.teaser.pid -->
    <!-- ENDIF topics.unreplied -->
  </div>
  {{{end}}}
</ul>
