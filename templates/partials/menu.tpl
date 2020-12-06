			<div class="col-md-9">
			<div class="navbar-header col-md-3">
				<button type="button" class="navbar-toggle pull-left" id="mobile-menu">
					<span component="notifications/icon" class="notification-icon fa fa-fw fa-bell-o unread-count" data-content="{unreadCount.notification}"></span>
					<i class="fa fa-lg fa-fw fa-bars"></i>
				</button>
				<button type="button" class="navbar-toggle hidden" id="mobile-chats">
					<span component="chat/icon" class="notification-icon fa fa-fw fa-comments unread-count" data-content="{unreadCount.chat}"></span>
					<i class="fa fa-lg fa-comment-o"></i>
				</button>

				<a href="<!-- IF title:url -->{title:url}<!-- ELSE -->{relative_path}/<!-- ENDIF title:url -->">
					<!-- IF brand:logo -->
					<img alt="{brand:logo:alt}" class="{brand:logo:display} forum-logo" src="{brand:logo}?{config.cache-buster}" />
					<!-- ENDIF brand:logo -->
					<!-- IF config.showSiteTitle -->
					<h1 class="navbar-brand forum-title">{config.siteTitle}</h1>
					<!-- ENDIF config.showSiteTitle -->
				</a>

				<div component="navbar/title" class="visible-xs hidden">
					<span></span>
				</div>
			</div>

			<ul class="nav navbar-nav navbar-search col-md-9">
					<li class="li-search">					
					<!-- IMPORT search-bar.tpl -->
					</li>
			</ul>
			</div>

			<div id="nav-dropdown col-md-3" class="hidden-xs">
				<!-- IF !maintenanceHeader -->
				<!-- IF config.loggedIn -->

				<ul id="logged-in-menu" class="nav navbar-nav navbar-right">
					<li class="notifications dropdown text-center hidden-xs" component="notifications">
						<a href="{relative_path}/notifications" title="[[global:header.notifications]]" class="dropdown-toggle" data-toggle="dropdown" id="notif_dropdown" data-ajaxify="false" role="button">
							<i component="notifications/icon" class="fa fa-fw fa-bell-o unread-count" data-content="{unreadCount.notification}"></i>
						</a>
						<ul class="dropdown-menu" aria-labelledby="notif_dropdown">
							<li>
								<ul component="notifications/list" class="notification-list">
									<li class="loading-text">
										<a href="#"><i class="fa fa-refresh fa-spin"></i> [[global:notifications.loading]]</a>
									</li>
								</ul>
							</li>
							<li class="notif-dropdown-link"><a href="#" class="mark-all-read">[[notifications:mark_all_read]]</a></li>
							<li class="notif-dropdown-link"><a href="{relative_path}/notifications">[[notifications:see_all]]</a></li>
						</ul>
					</li>

					<!-- IF !config.disableChat -->
					<li class="chats dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="{relative_path}/user/{user.userslug}/chats" title="[[global:header.chats]]" id="chat_dropdown" component="chat/dropdown" data-ajaxify="false" role="button">
							<i component="chat/icon" class="fa fa-comment-o fa-fw unread-count" data-content="{unreadCount.chat}"></i> <span class="visible-xs-inline">[[global:header.chats]]</span>
						</a>
						<ul class="dropdown-menu" aria-labelledby="chat_dropdown">
							<li>
								<ul component="chat/list" class="chat-list chats-list">
									<li class="loading-text">
										<a href="#"><i class="fa fa-refresh fa-spin"></i> [[global:chats.loading]]</a>
									</li>
								</ul>
							</li>
							<li class="notif-dropdown-link"><a href="#" class="mark-all-read" component="chats/mark-all-read">[[modules:chat.mark_all_read]]</a></li>
							<li class="notif-dropdown-link"><a href="{relative_path}/user/{user.userslug}/chats">[[modules:chat.see_all]]</a></li>
						</ul>
					</li>
					<!-- ENDIF !config.disableChat -->

					<li id="user_label" class="dropdown">
						<label for="user-control-list-check" class="dropdown-toggle" data-toggle="dropdown" id="user_dropdown" title="[[global:header.profile]]" role="button">
							{buildAvatar(user, "md", true)}
							<span id="user-header-name" class="visible-xs-inline">{user.username}</span>
						</label>
						<input type="checkbox" class="hidden" id="user-control-list-check" aria-hidden="true">
						<ul id="user-control-list" component="header/usercontrol" class="dropdown-menu" aria-labelledby="user_dropdown">
							<li>
								<a component="header/profilelink" href="{relative_path}/user/{user.userslug}">
									<span component="header/username">{user.username}</span>
								</a>
							</li>
							<li role="presentation" class="divider"></li>
							<li>
								<a component="header/profilelink/edit" href="{relative_path}/user/{user.userslug}/edit">
									<i class="fa fa-fw fa-edit"></i> <span>[[user:edit-profile]]</span>
								</a>
							</li>
							<li>
								<a component="header/profilelink/settings" href="{relative_path}/user/{user.userslug}/settings">
									<i class="fa fa-fw fa-gear"></i> <span>[[user:settings]]</span>
								</a>
							</li>
							<!-- IF showModMenu -->
							<li role="presentation" class="divider"></li>
							<li class="dropdown-header">[[pages:moderator-tools]]</li>
							<li>
								<a href="{relative_path}/flags">
									<i class="fa fa-fw fa-flag"></i> <span>[[pages:flagged-content]]</span>
								</a>
							</li>
							<li>
								<a href="{relative_path}/post-queue">
									<i class="fa fa-fw fa-list-alt"></i> <span>[[pages:post-queue]]</span>
								</a>
							</li>
							<li>
								<a href="{relative_path}/ip-blacklist">
									<i class="fa fa-fw fa-ban"></i> <span>[[pages:ip-blacklist]]</span>
								</a>
							</li>
							<!-- ENDIF showModMenu -->
							<li role="presentation" class="divider"></li>
							<li component="user/logout">
								<form method="post" action="{relative_path}/logout">
									<input type="hidden" name="_csrf" value="{config.csrf_token}">
									<input type="hidden" name="noscript" value="true">
									<button type="submit" class="btn btn-link">
										<i class="fa fa-fw fa-sign-out"></i><span> [[global:logout]]</span>
									</button>
								</form>
							</li>
						</ul>
					</li>

				</ul>
				<!-- ELSE -->
				<ul id="logged-out-menu" class="nav navbar-nav navbar-right logged-out-menu">
					<!-- IF allowRegistration -->
					<li>
						<a href="#" class="show-register">
							<i class="fa fa-pencil fa-fw hidden-sm hidden-md hidden-lg"></i>
							<span>[[global:register]]</span>
						</a>
					</li>
					<!-- ENDIF allowRegistration -->
					<li>
						<a href="#" class="show-login">
							<i class="fa fa-sign-in fa-fw hidden-sm hidden-md hidden-lg"></i>
							<span>[[global:login]]</span>
						</a>
					</li>
				</ul>
				<!-- ENDIF config.loggedIn -->
				
				<ul class="nav navbar-nav">
					<a href="/compose?cid=1" component="category/post" data-ajaxify="false" role="button" id="new_topic" class="btn question-btn">Ask a Question</a>
				</ul>
				
				<ul class="nav navbar-nav navbar-right hidden-xs">
					<li>
						<a href="#" id="reconnect" class="hide" title="[[global:reconnecting-message, {config.siteTitle}]]">
							<i class="fa fa-check"></i>
						</a>
					</li>
				</ul>

				<ul id="main-nav" class="nav navbar-nav navbar-right">
					{{{each navigation}}}
					<!-- IF function.displayMenuItem, @index -->
					<li class="{navigation.class}">
						<a class="navigation-link" href="{navigation.route}" title="{navigation.title}" <!-- IF navigation.id -->id="{navigation.id}"<!-- ENDIF navigation.id --><!-- IF navigation.properties.targetBlank --> target="_blank"<!-- ENDIF navigation.properties.targetBlank -->>
							<!-- IF navigation.iconClass -->
							<i class="fa fa-fw {navigation.iconClass}" data-content="{navigation.content}"></i>
							<!-- ENDIF navigation.iconClass -->

							<!-- IF navigation.text -->
							<span class="{navigation.textClass}">{navigation.text}</span>
							<!-- ENDIF navigation.text -->
						</a>
					</li>
					<!-- ENDIF function.displayMenuItem -->
					{{{end}}}
				</ul>

				<!-- ELSE -->
				<ul class="nav navbar-nav navbar-right">
					<li>
						<a href="{relative_path}/login">
							<i class="fa fa-sign-in fa-fw hidden-sm hidden-md hidden-lg"></i>
							<span>[[global:login]]</span>
						</a>
					</li>
				</ul>
				<!-- ENDIF !maintenanceHeader -->
			</div>
