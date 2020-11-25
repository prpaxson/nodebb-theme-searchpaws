

$(document).on("click", ".show-login", function(e) {
    ajaxify.loadTemplate('login.tpl', function(login) {
        var html = templates.parse(login, myData);
    
        var dialog = bootbox.dialog({
            title: 'Log In',
            message: html,
        });
    });
});
