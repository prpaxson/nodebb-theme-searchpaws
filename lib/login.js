var login = undefined;
var bb = undefined;

$(document).ready(function() {
    fetch('https://www.searchpaws.com/api/login')
    .then((response) => {
      return response.json()
    })
    .then((data) => {
        require(['benchpress'], (benchpress) => {
            benchpress.render('partials/login', data).then((output) => {
                login = output
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
	var dialog = bb.alert({
		title: 'Log In',
        message: login,
        centerVertical: true,
        closeButton: false,
        backdrop: true,
        buttons: {
            "ok": { label: "", className: "hidden" }
        },
        callback: function () {window.history.pushState({}, "", path);}
    });
});