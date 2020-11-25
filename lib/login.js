var html = undefined;
var bootbbbox = undefined;

$(document).ready(function() {
	document.ajaxify.loadTemplate('login', function(data) {
        console.log(data);
    });   

    console.log(html)
    require(["bootbox"], function (boot) {
        bb = boot;
    });
});

$(document).on("click", ".show-login", function(e) {
	var dialog = bb.dialog({
		title: 'Log In',
        message: html,
        size: 'large'
	});
});