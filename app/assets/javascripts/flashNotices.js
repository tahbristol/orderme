document.addEventListener("DOMContentLoaded", function(event) {
	if($('#flashAlerts').text().trim()){
		$('#flashAlerts').css('background-color', 'lightblue');
		setTimeout(function(){
			$('#flashAlerts').animate({ opacity: 0 });
		},3000);
	}
});
