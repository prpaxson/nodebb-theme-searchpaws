var login = undefined;
var bb = undefined;

$(document).ready(function() {
    fetch('https://www.searchpaws.com/api/register')
    .then((response) => {
      return response.json()
    })
    .then((data) => {
        console.log(data)
        require(['benchpress'], (benchpress) => {
            benchpress.render('partials/register', data).then((output) => {
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
	var dialog = bb.alert({
		title: 'Sign Up',
        message: login,
        centerVertical: true,
        closeButton: false,
        backdrop: true,
	});
});