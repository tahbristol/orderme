document.addEventListener("DOMContentLoaded", function(event) {
	// temporarily disable search bar
	let searchButton = document.getElementById('topSearchButton');
	if (searchButton){
		searchButton.addEventListener('click', function(event){
			event.preventDefault()
		});
	}

	// guest login feature
	let guestLogin = document.getElementById('signInAsGuest');
	if (guestLogin){
		guestLogin.addEventListener('click', function(event){
			event.preventDefault();
			window.location.href='/users/sign_in?guest=true';
		})
	}
});
