var html = undefined;
var bootbox = undefined;

$(document).ready(function() {
	ajaxify.loadTemplate('login', function(template) {
        require["templates"], function(templates) {
            html = templates.parse(template, {});
            console.log(html);
        }
    });
    
    require(["bootbox"], function (bb) {
        bootbox = bb;
    }
});

$(document).on("click", ".show-login", function(e) {
	var dialog = bootbox.dialog({
		title: 'Log In',
		message: "<p>hi</p>",
	});
});