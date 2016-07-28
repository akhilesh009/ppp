function addUser(){

    window.location.href = '/customer/add';
}
function cancelAdd(){
    
    window.location.href = '/customer';
}

function checkrole () {
	//Team Member
	if($('#role').val() == 'PM' || $('#role').val() == 'Admin'){
		$("#costforuse").val('');
		$("#costforhour").val('');
		
		$("#costforuse").attr('readonly',true);
		$("#costforhour").attr('readonly',true);	
	} else {
		$("#costforuse").attr('readonly',false);	
		$("#costforhour").attr('readonly',false);
	}
	
	 // body...  
}

