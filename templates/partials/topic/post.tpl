<div class="clearfix post-header topic_post_header">
  <div class="icon pull-left">
    <a href="<!-- IF posts.user.userslug -->{config.relative_path}/user/{posts.user.userslug}<!-- ELSE -->#<!-- ENDIF posts.user.userslug -->">
      {buildAvatar(posts.user, "sm2x", true, "", "user/picture")}
    </a>
  </div>

  <small class="pull-left topic_pull-left">
    <strong>
      <a href="<!-- IF posts.user.userslug -->{config.relative_path}/user/{posts.user.userslug}<!-- ELSE -->#<!-- ENDIF posts.user.userslug -->" itemprop="author" data-username="{posts.user.username}" data-uid="{posts.user.uid}">{posts.user.username}</a>
    </strong>

    <!-- IMPORT partials/topic/badge.tpl -->

    <!-- IF posts.user.banned -->
    <span class="label label-danger">[[user:banned]]</span>
    <!-- ENDIF posts.user.banned -->

    <span class="visible-xs-inline-block visible-sm-inline-block visible-md-inline-block visible-lg-inline-block">
      <a class="permalink" href="{config.relative_path}/post/{posts.pid}"><span class="timeago" title="{posts.timestampISO}"></span></a>

      <i component="post/edit-indicator" class="fa fa-pencil-square<!-- IF privileges.posts:history --> pointer<!-- END --> edit-icon <!-- IF !posts.editor.username -->hidden<!-- ENDIF !posts.editor.username -->"></i>

      <small data-editor="{posts.editor.userslug}" component="post/editor" class="hidden">[[global:last_edited_by, {posts.editor.username}]] <span class="timeago" title="{posts.editedISO}"></span></small>

      <!-- IF posts.toPid -->
      <a component="post/parent" class="btn btn-xs btn-default hidden-xs" data-topid="{posts.toPid}" href="{config.relative_path}/post/{posts.toPid}"><i class="fa fa-reply"></i> @<!-- IF posts.parent.username -->{posts.parent.username}<!-- ELSE -->[[global:guest]]<!-- ENDIF posts.parent.username --></a>
      <!-- ENDIF posts.toPid -->

      <span>
        <!-- IF posts.user.custom_profile_info.length -->
        &#124;
        {{{each posts.user.custom_profile_info}}}
        {posts.user.custom_profile_info.content}
        {{{end}}}
        <!-- ENDIF posts.user.custom_profile_info.length -->
      </span>
    </span>
    <span class="bookmarked"><i class="fa fa-bookmark-o"></i></span>

  </small>
</div>

<br />

<div id="content_topic" class="content" component="post/content" itemprop="text">
  {posts.content}
</div>

<hr class="postlinestop"/>

<div id="post-footer_topic" class="clearfix post-footer">
  <!-- IF posts.user.signature -->
  <div component="post/signature" data-uid="{posts.user.uid}" class="post-signature">{posts.user.signature}</div>
  <!-- ENDIF posts.user.signature -->

  <small class="pull-right pull-right_footer">
    <span class="post-tools">
      <a id=footer_reply component="post/reply" href="#" class="reply_topic no-select <!-- IF !privileges.topics:reply -->hidden<!-- ENDIF !privileges.topics:reply -->"><div class=reply_txt>[[topic:reply]]</div><span class=reply_txt></span></a>
      <a component="post/quote" href="#" class="quote_topic no-select <!-- IF !privileges.topics:reply -->hidden<!-- ENDIF !privileges.topics:reply -->">[[topic:quote]]</a>
    </span>

    <!-- IF !reputation:disabled -->
    <span class="votes">
      <a component="post/upvote" href="#" class="upvote_topic <!-- IF posts.upvoted -->upvoted<!-- ENDIF posts.upvoted -->">
        <i class="fa fa-chevron-up"></i>
      </a>

      <span component="post/vote-count" data-votes="{posts.votes}" class="votes_topic">{posts.votes}</span>

      <!-- IF !downvote:disabled -->
      <a component="post/downvote" href="#" class="downvote_topic<!-- IF posts.downvoted -->downvoted<!-- ENDIF posts.downvoted -->">
        <i class="fa fa-chevron-down"></i>
      </a>

      Likes
      <!-- ENDIF !downvote:disabled -->
    </span>
    <!-- ENDIF !reputation:disabled -->

    <!-- IMPORT partials/topic/post-menu.tpl -->
  </small>

  <a component="post/reply-count" href="#" class="threaded-replies no-select <!-- IF !posts.replies.count -->hidden<!-- ENDIF !posts.replies.count -->">
    <span component="post/reply-count/avatars" class="avatars <!-- IF posts.replies.hasMore -->hasMore<!-- ENDIF posts.replies.hasMore -->">
      {{{each posts.replies.users}}}
      {buildAvatar(posts.replies.users, "xs", true, "")}
      {{{end}}}
    </span>

    <span class="replies-count" component="post/reply-count/text" data-replies="{posts.replies.count}">{posts.replies.text}</span>
    <span class="replies-last hidden-xs">[[topic:last_reply_time]] <span class="timeago" title="{posts.replies.timestampISO}"></span></span>

    <i class="fa fa-fw fa-chevron-right" component="post/replies/open"></i>
    <i class="fa fa-fw fa-chevron-down hidden" component="post/replies/close"></i>
    <i class="fa fa-fw fa-spin fa-spinner hidden" component="post/replies/loading"></i>
  </a>
</div>

<hr class="postlinesbottom"/>

<div class="replies_title topanswers"></div>
