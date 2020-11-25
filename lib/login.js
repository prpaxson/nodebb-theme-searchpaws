var html;

$(document).ready(function () {
    ajaxify.loadTemplate('login', function(template) {
        html = templates.parse(template, {});
        console.log(html);
    });
});

$(document).on("click", ".show-login", function(e) {
    bootbox.dialog({
        title: 'Log In',
        message: html,
    });
});
