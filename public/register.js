var register = undefined;
var bb = undefined;

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

    require(["bootbox"], function (boot) {
        bb = boot;
    });
});

$(document).on("click", ".show-register", function(e) {
  var path = window.location.pathname;
  window.history.pushState({}, "Register", "/register");
	var dialog = bb.alert({
		title: 'Join our community!',
    message: register,
    centerVertical: true,
    closeButton: false,
    backdrop: true,
    buttons: {
      "ok": { label: "", className: "hidden" }
    },
    callback: function () {window.history.pushState({}, "", path);}
  });
});

$(document).on('click', '.collapse-modal', function (e) {
  bb.hideAll()
});