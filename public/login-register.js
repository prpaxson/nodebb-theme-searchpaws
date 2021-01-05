var login = undefined;
var register = undefined;
var bb = undefined;
var path = undefined;

$(document).ready(function() {
    fetch('https://www.searchpaws.com/api/register')
    .then((response) => {
      return response.json()
    })
    .then((data) => {
        require(['benchpress'], (benchpress) => {
            benchpress.render('partials/register', data).then((output) => {
              register = output
            });
        });
    })
    .catch((err) => {
      console.log(err)
    })

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

$(document).on("click", ".show-register", function(e) {
  bb.hideAll();
  if (typeof(path) == "undefined") {
    path = window.location.pathname;
  }
  window.history.pushState({}, "Register", "/register");
	var dialog = bb.alert({
		title: 'Join our community!',
    message: register,
    centerVertical: true,
    closeButton: true,
    backdrop: true,
    buttons: {
      "ok": { label: "", className: "hidden" }
    },
    callback: function () {
      window.history.pushState({}, "", path);
      path = undefined;
    }
  });
});

$(document).on("click", ".show-login", function(e) {
    bb.hideAll();
    if (typeof(path) == "undefined") {
      path = window.location.pathname;
    }
    window.history.pushState({}, "Login", "/login");
	  var dialog = bb.alert({
		title: 'Log In',
        message: login,
        centerVertical: true,
        closeButton: true,
        backdrop: true,
        buttons: {
            "ok": { label: "", className: "hidden" }
        },
        callback: function () {
          window.history.pushState({}, "", path);
          path = undefined;
        }
    });
});

$(document).on('click', '.collapse-modal', function (e) {
  bb.hideAll();
  window.history.pushState({}, "", path);
  path = undefined;
});