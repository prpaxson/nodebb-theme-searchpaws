<ul component="category" class="topic-list" itemscope itemtype="http://www.schema.org/ItemList" data-nextstart="{nextStart}" data-set="{set}">
  <meta itemprop="itemListOrder" content="descending">
  {{{each topics}}}
  <div class=topic_container>
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

  <div id="main-post-content-{topics.tid}" class="mainpost_content">
  </div>

  <hr class="postlinestop">

  <li component="category/topic" class="row clearfix category-item {function.generateTopicClass}" data-tid="{topics.tid}" data-index="{topics.index}" data-cid="{topics.cid}" itemprop="itemListElement">
    <meta itemprop="name" content="{function.stripTags, title}">

    <div class="mobile-stat col-xs-2 visible-xs text-right">
      <span class="human-readable-number">{topics.postcount}</span> <a href="{config.relative_path}/topic/{topics.slug}/{topics.teaser.index}"><i class="fa fa-arrow-circle-right"></i></a>
    </div>

    <div class="col-md-2 hidden-sm hidden-xs stats stats-votes">
      <!-- IF !reputation:disabled -->
      <div class="footer_detail_count">{topics.votes}</div>

      <div class="footer_detail_title">Likes</div>
      <!-- END -->
    </div>

    <div class="col-md-8 hidden-sm hidden-xs stats stats-postcount">
      <div class=footer_detail_count id="comments-{topics.tid}">
      </div>
      <div class=footer_detail_title id="comments-label-{topics.tid}">
      Comments
      </div>
    </div>

    <div class="col-md-2 hidden-sm hidden-xs stats stats-viewcount">
      <a href="{config.relative_path}/topic/{topics.slug}<!-- IF topics.bookmark -->/{topics.bookmark}<!-- ENDIF topics.bookmark -->" itemprop="url" id=footer_reply class="footer_detail_title">Reply</a>
    </div>

    <div class="col-md-3 col-sm-3 teaser hidden-xs" component="topic/teaser">

    </div>
  </li>

  <hr class="postlinesbottom">

  <div class="topanswers"> Top Answers </div>

  <div class="card" style="border-color: {topics.category.bgColor}">
    <!-- IF topics.unreplied -->
    <p>
      [[category:no_replies]]
    </p>
    <!-- ELSE -->
    <!-- IF topics.teaser.pid -->
    <div id=teaser_header class=topic_header>
      <a id="avater_teaser" href="{config.relative_path}/user/{topics.teaser.user.userslug}">{buildAvatar(topics.teaser.user, "32", true, "not-responsive")}</a>
      <div id="name_timeago" class = teaser_header_text>
        <div class="topic_header_text hidden-xs">
          <a id="topic_username" href="<!-- IF topics.teaser.user.userslug -->{config.relative_path}/user/{topics.teaser.user.userslug}<!-- ELSE -->#<!-- ENDIF topics.teaser.user.userslug -->">{topics.teaser.user.username}</a>
          </br>
          <span id=topic_timeago class="timeago" title="{topics.teaser.timestampISO}"></span>
        </div>
      </div>
      <!-- <a class="permalink" href="{config.relative_path}/topic/{topics.slug}/{topics.teaser.index}">
        <span class="timeago" title="{topics.teaser.timestampISO}"></span>
      </a> -->
    </div>
    <div class="post-content">
      <hr class="teaserlinetop1">
      {topics.teaser.content}
      <hr class="teaserlinebottom">
    </div>
    <!-- ENDIF topics.teaser.pid -->
    <!-- ENDIF topics.unreplied -->
  </div>
  </div>
  {{{end}}}
</ul>
{{{ each topics }}}
<script>
    fetch("https://www.searchpaws.com/api/topic/{topics.slug}").then((response) => {
      return response.json()
    }).then((data) => {
        document.getElementById('main-post-content-{topics.tid}').innerHTML = data.posts[0].content;
        var count = {topics.postcount}-1
        document.getElementById('main-post-content-{topics.tid}').innerHTML = count;
        if (count == 1) {
          document.getElementById('comments-label-{topics.tid}').innerHTML = "Comment";
        }
    }).catch((err) => {
      console.log(err)
    })
</script>
{{{end}}}
