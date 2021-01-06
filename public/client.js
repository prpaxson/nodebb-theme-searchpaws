/*
	Hey there!

	This is the client file for your theme. If you need to do any client-side work in javascript,
	this is where it needs to go.

	You can listen for page changes by writing something like this:

	  $(window).on('action:ajaxify.end', function(data) {
		var	url = data.url;
		console.log('I am now at: ' + url);
	  });
*/
$(document).ready(function() {
	$(window).on('action:ajaxify.end', function(event, data) {
		console.log(data.url);
		console.log(typeof data.url);
		if (data.url.includes("edit")) {
			$("#newSubmitBtn").click(function () {
				var userData = {
					uid: $('#inputUID').val(),
					fullname: $('#inputFullname').val(),
					website: $('#inputWebsite').val(),
					birthday: $('#inputBirthday').val(),
					location: $('#inputLocation').val(),
					groupTitle: $('#groupTitle').val(),
					signature: $('#inputSignature').val(),
					aboutme: $('#inputAboutMe').val(),
					firstname: $('#inputFirstName').val(),
					lastname: $('#inputLastName').val(),
					zip: $('#inputZIP').val(),
					dog: $('#inputDog').val(),
					cat: $('#inputCat').val(),
					other: $('#inputOther').val()
				};
			
				userData.groupTitle = JSON.stringify(Array.isArray(userData.groupTitle) ? userData.groupTitle : [userData.groupTitle]);
			
				$(window).trigger('action:profile.update', userData);
			});
		}
	  });
});

