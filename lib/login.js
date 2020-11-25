var login = undefined;
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
              login = output
            });
        });
    })
    .catch((err) => {
      console.log(err)
    })
    

    console.log(login);

    require(["bootbox"], function (boot) {
        bb = boot;
    });
});

$(document).on("click", ".show-login", function(e) {
	var dialog = bb.alert({
		title: 'Sign In',
        message: login,
        centerVertical: true,
        closeButton: false,
        backdrop: true,
	});
});