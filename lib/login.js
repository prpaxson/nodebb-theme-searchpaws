$(document).on("click", ".show-login", function(e) {
    var dialog = bootbox.dialog({
        title: 'Log In',
        message: "<!-- IMPORT login.tpl -->",
    });
});
