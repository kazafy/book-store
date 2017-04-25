$(function(){
	$('.dropdown-toggle').hover(function(){
		$(this).dropdown('toggle');
	},function(){
		$(this).dropdown('toggle');
	});
	$('.dropdown').on('show.bs.dropdown shown.bs.dropdown hide.bs.dropdown hidden.bs.dropdown',function(e){
		//alert(e.type);
	});
});
