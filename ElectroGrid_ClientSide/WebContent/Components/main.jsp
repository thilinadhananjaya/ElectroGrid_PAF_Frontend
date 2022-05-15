$(document).ready(function() 
{  
	if ($("#alertSuccess").text().trim() == "")  
	{   
		$("#alertSuccess").hide();  
	} 
	$("#alertError").hide(); 
}); 

//SAVE ============================================ 
$(document).on("click", "#btnSave", function(event) 
{  
	// Clear alerts---------------------  
	$("#alertSuccess").text("");  
	$("#alertSuccess").hide();  
	$("#alertError").text("");  
	$("#alertError").hide(); 

	// Form validation-------------------  
	var status = validateComplaintForm();  
	if (status != true)  
	{   
		$("#alertError").text(status);   
		$("#alertError").show();   
		return;  
	} 

	// If valid------------------------  
	var t = ($("#hideIDSave").val() == "") ? "POST" : "PUT";
	
	$.ajax(
	{
		url : "EmployeeApi",
		type : t,
		data : $("#formComplaint").serialize(),
		dataType : "text",
		complete : function(response, status)
		{
			onComplaintSaveComplete(response.responseText, status);
		}
	});
}); 

function onComplaintSaveComplete(response, status){
	if(status == "success")
	{
		var resultSet = JSON.parse(response);
			
		if(resultSet.status.trim() == "success")
		{
			$("#alertSuccess").text("Successfully Saved.");
			$("#alertSuccess").show();
					
			$("#divItemsGrid").html(resultSet.data);
	
		}else if(resultSet.status.trim() == "error"){
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	}else if(status == "error"){
		$("#alertError").text("Error While Saving.");
		$("#slertError").show();
	}else{
		$("#alertError").text("Unknown Error while Saving.");
		$("#alertError").show();
	}
	$("#hideIDSave").val("");
	$("#formComplaint")[0].reset();
}

//UPDATE========================================== 
$(document).on("click", ".btnUpdate", function(event) 
		{     
	$("#hideIDSave").val($(this).closest("tr").find('#hideIDUpdate').val());     
	$("#CName").val($(this).closest("tr").find('td:eq(0)').text());    
	$("#Date").val($(this).closest("tr").find('td:eq(1)').text());     
	$("#CDetails").val($(this).closest("tr").find('td:eq(2)').text());     
	$("#CCategory").val($(this).closest("tr").find('td:eq(3)').text());
	
	

});


//Remove Operation
$(document).on("click", ".btnRemove", function(event){
	$.ajax(
	{
		url : "ComplaintApi",
		type : "DELETE",
		data : "eID=" + $(this).data("eid"),
		dataType : "text",
		complete : function(response, status)
		{
			onComplaintDeletedComplete(response.responseText, status);
		}
	});
});

function onComplaintDeletedComplete(response, status)
{
	if(status == "success")
	{
		var resultSet = JSON.parse(response);
			
		if(resultSet.status.trim() == "success")
		{
			$("#alertSuccess").text("Successfully Deleted.");
			$("#alertSuccess").show();
					
			$("#divItemsGrid").html(resultSet.data);
	
		}else if(resultSet.status.trim() == "error"){
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	}else if(status == "error"){
		$("#alertError").text("Error While Deleting.");
		$("#alertError").show();
	}else{
		$("#alertError").text("Unknown Error While Deleting.");
		$("#alertError").show();
	}
}

//CLIENTMODEL
function validateComplaintForm() {  
	// Complaint Name  
	if ($("#CName").val().trim() == "")  {   
		return "Insert CName.";  
		
	} 
	
	 // Date 
	if ($("#Date").val().trim() == "")  {   
		return "Insert Date.";  
	} 
	
	
	//ComplaintDetails
	if ($("#CDetails").val().trim() == "")  {   
		return "Insert CDetails."; 
		 
	}
	
	//ComplaintCategory
	if ($("#CCategory").val().trim() == "")  {   
		return "Insert CCategory."; 
		 
	}
	 
	 // is numerical value  
	var tmpMobile = $("#pno").val().trim();  
	if (!$.isNumeric(tmpMobile))  {   
		return "Insert a numerical value for Mobile Number.";  
		
	}
	 
	
		

	 
	 return true; 
	 
}
