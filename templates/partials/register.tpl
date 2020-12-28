<div class="row register">
	<div class="col-md-12>
		<div class="register-block">
			<div class="alert alert-danger<!-- IF !error --> hidden<!-- ENDIF !error -->" id="register-error-notify" >
				<strong>[[error:registration-error]]</strong>
				<p>{error}</p>
			</div>
			<form component="register/local" class="form-horizontal" role="form" action="{config.relative_path}/register" method="post">
				<div class="form-group">
					<label for="email" class="col-lg-4 control-label">[[register:email_address]]</label>
					<div class="col-lg-8">
						<input class="form-control" type="email" placeholder="[[register:email_address_placeholder]]" name="email" id="email" autocorrect="off" autocapitalize="off" />
						<span class="register-feedback" id="email-notify"></span>
						<span class="help-block">[[register:help.email]]</span>
					</div>
				</div>
				<div class="form-group">
					<label for="username" class="col-lg-4 control-label">[[register:username]]</label>
					<div class="col-lg-8">
						<input class="form-control" type="text" placeholder="[[register:username_placeholder]]" name="username" id="username" autocorrect="off" autocapitalize="off" autocomplete="off" />
						<span class="register-feedback" id="username-notify"></span>
						<span class="help-block">[[register:help.username_restrictions, {minimumUsernameLength}, {maximumUsernameLength}]]</span>
					</div>
				</div>
				<div class="form-group">
					<label for="password" class="col-lg-4 control-label">[[register:password]]</label>
					<div class="col-lg-8">
						<input class="form-control" type="password" placeholder="[[register:password_placeholder]]" name="password" id="password" />
						<span class="register-feedback" id="password-notify"></span>
						<span class="help-block">[[register:help.minimum_password_length, {minimumPasswordLength}]]</span>
					</div>
				</div>
				<div class="form-group">
					<label for="password-confirm" class="col-lg-4 control-label">[[register:confirm_password]]</label>
					<div class="col-lg-8">
						<input class="form-control" type="password" placeholder="[[register:confirm_password_placeholder]]" name="password-confirm" id="password-confirm" />
						<span class="register-feedback" id="password-confirm-notify"></span>
					</div>
				</div>

				{{{each regFormEntry}}}
				<div class="form-group">
					<label for="register-{regFormEntry.styleName}" class="col-lg-4 control-label">{regFormEntry.label}</label>
					<div id="register-{regFormEntry.styleName}" class="col-lg-8">
						{{regFormEntry.html}}
					</div>
				</div>
				{{{end}}}

				<div class="form-group">
					<div class="col-md-8">
						<button class="btn btn-primary btn-lg btn-block btn-register" id="register" type="submit">[[register:register_now_button]]</button>
					</div>
				</div>
				<div class="form-group">
					<p class="col-md-8 help-block" style="text-align: center;">By continuing you indicate that you agree to SearchPaws’ 
					<a href="{config.relative_path}/terms-of-service" class="terms">Terms of Service</a> and <a href="{config.relative_path}/privacy-policy" class="terms">Privacy Policy</a>.</p>
				</div>
				<input id="referrer" type="hidden" name="referrer" value="" />
				<input id="token" type="hidden" name="token" value="" />
				<input id="noscript" type="hidden" name="noscript" value="true" />
				<input type="hidden" name="_csrf" value="{config.csrf_token}" />
			</form>
		</div>
	</div>

	<!-- IF alternate_logins -->
	<div class="col-md-12 text-center" style="margin-top: 30px;">
		<div class="alt-register-block">
			<h4 style="display: inline;">Or sign in with:</h4>
			<ul class="alt-logins">
				{{{each authentication}}}
				<li class="{authentication.name}"><a rel="nofollow noopener noreferrer" target="_top" href="{config.relative_path}{authentication.url}"><i class="fa {authentication.icon} fa-3x"></i></i></a></li>
				{{{end}}}
			</ul>
		</div>
	</div>
	<!-- ENDIF alternate_logins -->
</div>
