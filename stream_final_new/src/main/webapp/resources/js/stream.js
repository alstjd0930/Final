function selectOption(e){
	targetPno = $(this).children("[name=pno]").val(); // 중요하다
	console.log(targetPno); 
	if($(e.target).hasClass("dropdown-btn-update")) {
		goUpdateForm(targetPno);
		
	} else if($(e.target).hasClass("dropdown-btn-delete")){
		hideProject(targetPno, $(this));
		
			
	} else {
		$(this).submit();
	}
}

function goUpdateForm(pno) {
	$("#updateProjectModal").modal("toggle");
	$.ajax({
	 	url: contextPath+"/projectOne/"+pno,
	 	type: "get",
	 	dataType: "json",
	 	success: function(result){
	 		console.log(result.pstartdate);
	 		console.log(result.penddate);
			$("#updateProjectModal [name=pno]").val(result.pno);
			$("#updateProjectModal [name=pname]").val(result.pname);
			$("#updateProjectModal [name=pcontent]").val(result.pcontent);
			$("#updateProjectModal [name=pstartdate]").val(result.pstartdate);
			$("#updateProjectModal [name=penddate]").val(result.penddate);
			$("#updateProjectModal [name=mname]").val(result.mname);
			$("#updateProjectModal [id=updateStatus]").val(result.pstatus);
	 	},
	 	error: function() {
	 		console.log("selectOne에서 오류 발생");
	 	}
	 });
}

function doUpdateProject() {
 	$.ajax ({
		url: contextPath+"/doUpdateProject",
		type: "get",
		data: $("#infoProject").serialize(),
		//dataType: "json",
		success: function(result) {
			console.log(result);
			if(result>0){
				location.href=contextPath+"/projectlist";
			} else {
				alert("ek");
			}		
		},
		error: function() {
			console.log("doUpdateProject에서 오류 발생");
		}
	});
}


function hideProject(pno, $thisElement) {
	
	$thisElement.closest(".col-sm-6.list-card[data-pno]").remove();
	// ajax	

}



