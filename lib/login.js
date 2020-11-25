var html = undefined;
var bootbbbox = undefined;

$(document).ready(function() {
	html = ajaxify.data.template['login'];
    console.log(html)
    require(["bootbox"], function (boot) {
        bb = boot;
    });
});

$(document).on("click", ".show-login", function(e) {
	var dialog = bb.dialog({
		title: 'Log In',
        message: html(html),
        size: 'large'
	});
});