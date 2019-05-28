

document.addEventListener("DOMContentLoaded", function(event) { 
	if($('#flashAlerts').text().trim()){
		setTimeout(function(){
			$('#flashAlerts').animate({ opacity: 0 });
		},3000);
	}
});