<div class="row">
	<!-- IF allowLocalLogin -->
	<div class="col-md-12">
		<div class="login-block">
			<div class="alert alert-danger" id="login-error-notify" <!-- IF error -->style="display:block"<!-- ELSE -->style="display: none;"<!-- ENDIF error -->>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
				<strong>[[login:failed_login_attempt]]</strong>
				<p>{error}</p>
			</div>

			<form class="form-horizontal" role="form" method="post" id="login-form">
				<div class="form-group">
					<div class="col-lg-8">
						<input class="form-control" type="text" placeholder="{allowLoginWith}" name="username" id="username" autocorrect="off" autocapitalize="off" value="{username}"/>
					</div>
				</div>
				<div class="form-group">
					<div class="col-lg-8">
						<input class="form-control" type="password" placeholder="[[user:password]]" name="password" id="password" <!-- IF username -->autocomplete="off"<!-- ENDIF username -->/>
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-6">
						<div class="checkbox">
							<label>
								<input type="checkbox" name="remember" id="remember" checked /> [[login:remember_me]]
							</label>
						</div>
					</div>
					<div class="col-md-6">
						<!-- IF allowPasswordReset -->
						<a id="reset-link" href="{config.relative_path}/reset" class="collapse-modal">[[login:forgot_password]]</a>
						<!-- ENDIF allowPasswordReset -->
					</div>
				</div>
				{{{each loginFormEntry}}}
				<div class="form-group loginFormEntry">
					<label for="login-{loginFormEntry.styleName}" class="col-lg-4 control-label">{loginFormEntry.label}</label>
					<div id="login-{loginFormEntry.styleName}" class="col-lg-8">{{loginFormEntry.html}}</div>
				</div>
				{{{end}}}
				<input type="hidden" name="_csrf" value="{config.csrf_token}" />
				<input type="hidden" name="noscript" id="noscript" value="true" />
				<div class="form-group">
					<div class="col-lg-8">
						<button class="btn btn-primary btn-lg btn-block btn-login" id="login" type="submit">[[global:login]]</button>
						<span class="help-block" style="text-align: center;">[[login:dont_have_account]] <a href="#" class="show-register">[[register:register]]</a></span>						
					</div>
				</div>
			</form>

		</div>
	</div>
	<!-- ENDIF allowLocalLogin -->

	<!-- IF alternate_logins -->
	<div class="col-md-12 text-center">
		<div class="alt-login-block">
			<h4 style="display: inline;">Or sign in with:</h4>
			<ul class="alt-logins">
				{{{each authentication}}}
				<li class="{authentication.name}"><a rel="nofollow noopener noreferrer" target="_top" href="{config.relative_path}{authentication.url}"><i class="fa {authentication.icon} fa-3x"></i></a></li>
				{{{end}}}
			</ul>
		</div>
	</div>
	<!-- ENDIF alternate_logins -->
</div>