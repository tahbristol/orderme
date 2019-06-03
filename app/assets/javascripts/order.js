document.addEventListener("DOMContentLoaded", function(event) {
	$('#addItem').on('click', function(e){
		e.preventDefault()
		addItem();
		initRemoveItemListener()
	})
});

function addItem(){
	let itemTableRows = $('#orderLineItems tr');
	let lastRow = $(itemTableRows).last();
	// in a new form this is 0
	let lastIndex = parseInt($(lastRow).attr('id').split('_')[1]);
	let newIndex = String(lastIndex + 1);
	// the count is the enumeration the user sees in the table, initial index is 0, count is one more than index
	let newCount = lastIndex + 2;
	
	let tr_insert = $(lastRow).html();
	
	let source = $('#itemTemplate').html();
	let template = Handlebars.compile(source);
	
	let html = template({entryIndex: newIndex, itemFormIndex: newIndex, itemCount: newCount})
	
	$('#orderLineItems').append(html);
}

function initRemoveItemListener(){
	$('.removeItem').on('click', function(e){
		e.preventDefault()
		removeItem(e.target);
	})
}

function removeItem(link){
	let itemToRemove = $(link).parent().parent();
	$(itemToRemove).remove();
}
