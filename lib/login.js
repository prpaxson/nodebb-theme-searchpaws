var register = undefined;
var bb = undefined;

$(document).ready(function() {
    fetch('https://www.searchpaws.com/api/login')
    .then((response) => {
      return response.json()
    })
    .then((data) => {
        console.log(data)
        require(['benchpress'], (benchpress) => {
            benchpress.render('partials/login', data).then((output) => {
                register = output
            });
        });
    })
    .catch((err) => {
      console.log(err)
    })

    require(["bootbox"], function (boot) {
        bb = boot;
    });
});

$(document).on("click", ".show-login", function(e) {
    var path = window.location.pathname;
    window.history.pushState({}, "Login", "/login");
	var dialog = bb.dialog({
		title: 'Sign In',
        message: register,
        centerVertical: true,
        closeButton: false,
        backdrop: true,
        onEscape: true,
        callback: function () {window.history.pushState({}, "", path);}
    });
});