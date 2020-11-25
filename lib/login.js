var html = undefined;

$(window.document).ready(function() {
    ajaxify.loadTemplate('login', function(template) {
        html = templates.parse(template, undefined);
    });
});

$(document).on("click", ".show-login", function(e) {
    var dialog = bootbox.dialog({
        title: 'Log In',
        message: renderHTML(html),
    });
});
