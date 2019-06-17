document.addEventListener("DOMContentLoaded", function(event) {
	$('#addItem').on('click', function(e){
		e.preventDefault()
		addItem();
		initRemoveItemListener()
	})
	
	$('#savePurchase').on('click', function(e){
		e.preventDefault()
		updateLineItemPurchaseStatus()
	})
});

function updateLineItemPurchaseStatus(){
	let orderNumber = '';
	let lineItems = $('.lineItems');
	
	let purchasedLineItems = $.map(lineItems, function(item){
		orderNumber = $(item).attr('id').split("_")[1]
		let item_id = $('input', item).attr('id').split("_")[1];
		
		return JSON.stringify({id: item_id, purchased: $('input', item).val()})
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
