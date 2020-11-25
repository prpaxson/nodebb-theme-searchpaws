var login = undefined;
var bb = undefined;

$(document).ready(function() {

    require(['benchpress'], function (benchpress) {
        benchpress.parse('partials/login', {}, function (html) {
            login = html;
            console.log("TEST!")
        });
      });

    console.log(login);

    require(["bootbox"], function (boot) {
        bb = boot;
    });
});

$(document).on("click", ".show-login", function(e) {
	var dialog = bb.dialog({
		title: 'Log In',
        message: login,
        size: 'large'
	});
});