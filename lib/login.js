(function(config, app, ajaxify, $, templates) {
    var html = undefined;

    $(document).ready(function() {
        ajaxify.loadTemplate('login', function(template) {
            html = templates.getBlock(template, 'login-block');
            console.log(html);
        });
    });

    $(document).on("click", ".show-login", function(e) {
        var dialog = bootbox.dialog({
            title: 'Log In',
            message: html(html),
        });
    });
})(config, app, ajaxify, $, window.templates || null);
