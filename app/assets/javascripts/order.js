document.addEventListener("DOMContentLoaded", function(event) {
	$('#addItem').on('click', function(e){
		e.preventDefault()
		addItem();
		initRemoveItemListener()
	})
	
	$('#saveProcessing').on('click', function(e){
		e.preventDefault()
		updateLineItemStatus('purchased')
		showOrderProcessingButton()
	})
	
	$('#completeOrder').on('click', function(e){
		if (!checkAllItemsProcessed()){
			$(this).hide();
			alert('Check off all items to complete an order.')
			return false;
		}
	})
	$('#completeOrder').hide();
});

function checkAllItemsProcessed(){
	
	let lineItems = $('.lineItems td input[name="lineItem"]');
	if (lineItems.length){
		for (let item of lineItems){
			if(!$(item).is(':checked'))
				return false;
		}
	}
	return true;
}

function showOrderProcessingButton(attribute){
	if (checkAllItemsProcessed()) {
		$(`#${attribute}Order`).show();
	}
}

function updateLineItemStatus(attribute){
	let orderNumber = '';
	let lineItems = $('.lineItems');
	
	let checkedLineItems = $.map(lineItems, function(item){
		orderNumber = $(item).attr('id').split("_")[1]
		let item_id = $('input', item).attr('id').split("_")[1];
		let value;
		
		if ($('input', item).is(':checked')) value = 1;
		else value = 0;
		
		return JSON.stringify({id: item_id, value: value, attribute: attribute})
	})
	
	if (purchasedLineItems.length){
		console.log(purchasedLineItems)
		Rails.ajax({
			url: `update_line_items`,
			type: 'POST',
			data: `items=${purchasedLineItems.join('|')}`,
		})
	}
}

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
