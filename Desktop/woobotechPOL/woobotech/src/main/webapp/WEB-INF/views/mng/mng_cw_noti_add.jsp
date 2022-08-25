<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%@ include file="../common/jsHeader.jsp"%>
<div class="modal-dialog modal-dialog-scrollable" style="width: 80%" >
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			<h4 class="modal-title">Registering partner posts</h4>
			<h4 class="modal-title" style="text-align: center;" id="sp_p_biz_nm"></h4>
		</div>
		<div class="modal-body" id="modalbody1">
			<div class="box box-info">

				<!-- /.box-header -->
				<!-- form start -->
				<form class="form-horizontal" name="form1" id="form1" method="post">
					<div class="box-body">
						<%if("master".equals(admin)){%>
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label">Partner</label>
						
							<div class="col-sm-10">
							
								

								
							<div class="input-group input-group-sm"	>
								<input type="text" class="form-control" name="p_cno" id="p_cno"	placeholder="Partner number" 	value=""  style="width: 25%" readonly="readonly" > 
								<input type="text" class="form-control" name="p_cu_sangho" id="p_cu_sangho"	placeholder="Name of partner"	value=""  style="width: 45%" readonly="readonly">
								
								<img alt="Search" src="resources/img/icon_search.png" style="width: auto; height: 26px;" onclick="fnSearch()">
							</div>
						
								
							</div>
						</div>
						<%} else{%>
							<input type="hidden" class="form-control" name="p_cno" id="p_cno"	placeholder="Partner number" 	value="-1"  style="width: 25%" readonly="readonly" > 
								<input type="hidden" class="form-control" name="p_cu_sangho" id="p_cu_sangho"	placeholder="Name of partner"	value=""  style="width: 45%" readonly="readonly">
						<%} %>	

						<div class="form-group">
							<label for="name" class="col-sm-2 control-label"
								>Title</label>

							<div class="col-sm-10">
								<input type="text" class="form-control" name="p_title"
									id="p_p_title" placeholder="" value="">
							</div>
						</div>
						
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label"
								>Password</label>

							<div class="col-sm-3">
								<input type="password" class="form-control" name="p_pass"
									id="p_pass" placeholder="" value="">
							</div>
						</div>

						<div class="form-group">
							<label for="name" class="col-sm-2 control-label"
								>Contents</label>

							<div class="col-xs-10" style="vertical-align: middle;">
								<div id="edit_div2" style="height: 500px">
									<textarea class="ckeditor" id="p_contents" name="p_contents"
										rows="" cols=""
										style="width: 100%; margin-left: 0px;">
					                 </textarea>
								</div>
							</div>
						</div>

						<div class="form-group" style="width: 100%">

							<label for=re_userid class="col-sm-2 control-label">File</label>
							<div class="input-group input-group-sm "
								style="padding-left: 14px; padding-right: 14px;">
								
								<input type="file"
										id="file1" name="file1">
								<input type="file"
										id="file2" name="file2">	
								<input type="file"
										id="file3" name="file3">	
								<input type="file"
										id="file4" name="file4">	
								<input type="file"
										id="file5" name="file5">								

							</div>
						</div>


						<div class="box-footer">


							<div class="col-xs-7"> <!-- 211018  "col-xs-8"-->
								<button type="button" class="btn btn-success pull-right" style="font-size:20px;"
									onclick="fnclose()">Close</button>
								<button type="button" class="btn btn-info pull-right" style="font-size:20px; margin-right:10px;"
									onclick="fnCwNoti_i()">Registration</button>
							</div>

						</div>
						<!-- /.box-footer -->
					</div>
				</form>
			</div>

		</div>
	</div>
	
	
</div>


<div class="modal fade" id="modal_contact">
  <div class="modal-dialog" style="margin-top: 40px;">
    <div class="modal-content div-modal-content-wrap">
    
      <div class="modal-header init-custom div-modal-header">
      		<img style="float: right; width: auto; height: 25px;" alt="팝업창 닫기" src="resources/img/close.png" onclick="fnPopClose();">
      </div>
    
      <div class="modal-body init-custom div-modal-body-wrap">
      
        	<p class="p-modal-contact-title" style="display: inline-block;" >Search</p>
        	
			<input type="button"
				class="btn btn-info" onclick="fnUserSave()" value="apply" style="float: right;" />
				
        	<hr class="hr-1-black init-custom" style="margin-top: 20px;" />
        	
        	<div class="div-ad-srds-modal" style="margin-top: 15px;">
				
				<input type="text" id="pp_cu_sangho"> 
				<img alt="Search" src="resources/img/icon_search.png" style="width: auto; height: 26px;" onclick="fnSearch()">				
        	</div>
        	
      	
			<div class="row">
				<div class="col-xs-12">
					<div class="box">
						<!-- /.box-header -->
						<div class="box-body" id="table_user">
							<!-- input type="button" class="btn btn-warning navbar-right" onclick="fnCancelPop()" value="삭제"/></td-->
							<table id="tablebody1" width="100%" class="stripe row-border order-column" cellspacing="0" >
								<thead>
									<tr>
										<th><input type="checkbox" name="chk_info" value=""></th>
										<th>Partner number</th>
										<th>Name of partner</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>

						</div>
					</div>
				</div>
			</div>
      </div>
    </div>
  </div>
</div>


<script type="text/javascript">
	$(document).ready(function() {
		CKEDITOR.replace('p_contents',{height:400});

		$("#file1").change(function() {
			fileCheck(this, 'file1', 'img1');
		});

		$("#file2").change(function() {
			fileCheck(this, 'file2', 'img2');
		});

		$("#file3").change(function() {
			fileCheck(this, 'file3', 'img3');
		});

		$("#file4").change(function() {
			fileCheck(this, 'file4', 'img4');
		});

		$("#file5").change(function() {
			fileCheck(this, 'file5', 'img5');
		});

	});
	
	
	function fnSearch() {
	    var cu_sangho = $("#pp_cu_sangho").val();
	 	//alert(userid);
		if(cu_sangho==''){
			$("#modal_contact").modal('show');
			return;
		}	    
	 	$.ajax({
	 		type:"post",
	 		url:"mng_cu_sangho",
	 		dataType:"html",
	 		data:{
	 			cu_sangho :cu_sangho
	 		}	
	 		}).done(function(data){
	 			//$("#modalPop").modal('hide');
	 			$("#modal_contact").modal('show');
	 			$("#table_user").html("");
	 			$("#table_user").html(data);
	 		
	 		//	$('span.number').number( true, 0 );
	 		});

	}
	function fnUserSave(){
		var cno='';
		var cu_sangho='';
		var j=0;
		private_yn ="N";
		for (var i = 1; i < $('#tablebody3').find('tr').size(); i++) {
				
			// table 중 tr이 i번째 있는 자식중에 체크박스가 체크중이면

			var chk = $('#tablebody3').find('tr').eq(i).children().find('input[type="checkbox"]').is(':checked');
			
			 
			
			if (chk == true) {
				cno = $('#tablebody3').find('tr').eq(i).find('input[type="checkbox"]').val();
				cu_sangho = $('#tablebody3').find('tr').eq(i).find('.d_cu_sangho').text();
				cno = $('#tablebody3').find('tr').eq(i).find('.d_cno').text();
				
				
				j++;

			}
		}
		
		if(j==0){
			alert("Please select a user.");
			return;
		}else if(j>=2){
			alert("Please select only one user.");
			return;
		}else if(j==1){
			$('#p_cno').val(cno);
			$('#p_cu_sangho').val(cu_sangho);
			//$('#h_name').val(name);
			private_yn="Y";
		}
		$("#modal_contact").modal('hide');
		
		
	}   
	
	function fnPopClose(){
		$('#modal_contact').modal('hide');
	}
</script>

