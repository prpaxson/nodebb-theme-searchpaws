var login = undefined;
var bb = undefined;

$(document).ready(function() {
    fetch('https://www.searchpaws.com/api/login')
    .then((response) => {
      return response.json()
    })
    .then((data) => {
        require(['benchpress'], (benchpress) => {
            benchpress.render('login', data).then((output) => {
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
	var dialog = bb.dialog({
		title: 'Log In',
        message: login,
        size: 'large'
	});
});