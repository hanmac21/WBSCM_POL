<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common/jsHeader.jsp"%>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>우보테크(관리자)</title>
<link rel="shortcut icon" href="asset/dist/img/wbfavi.ico">
<link rel="icon" href="asset/dist/img/wbfavi.ico">
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="asset/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">

<link rel="stylesheet"
	href="asset/plugins/datatables/dataTables.bootstrap.css">

<link rel="stylesheet"
	href="asset/plugins/daterangepicker/daterangepicker.css">
<!-- bootstrap datepicker -->
<link rel="stylesheet" href="asset/plugins/datepicker/datepicker3.css">
<!-- iCheck for checkboxes and radio inputs -->
<link rel="stylesheet" href="asset/plugins/iCheck/all.css">
<!-- Bootstrap Color Picker -->
<link rel="stylesheet"
	href="asset/plugins/colorpicker/bootstrap-colorpicker.min.css">
<!-- Bootstrap time Picker -->
<link rel="stylesheet"
	href="asset/plugins/timepicker/bootstrap-timepicker.min.css">

<!-- jvectormap -->
<link rel="stylesheet"
	href="asset/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<!-- Theme style -->
<link rel="stylesheet" href="asset/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="asset/dist/css/skins/_all-skins.min.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
  
  
  
</head>

<form id="formdata" name="formdata" method="post">
	<input type="hidden" id="userid" name="userid" value="111">
	
	
	
	
</form>
<input type="hidden" id="option_dt_nm1" name="option_dt_nm1" value="11">
<input type="hidden" id="option_dt_nm2" name="option_dt_nm2" value="22">
<input type="hidden" id="option_dt_nm3" name="option_dt_nm3" value="33	">
<form id="formdata2" name="formdata2" method="post">
	<input type="hidden" name="gubun" value=""> <input
		type="hidden" name="add_do" value=""> <input type="hidden"
		name="com_text" value=""> <input type="hidden" name="pageView"
		value="">
</form>

<form id="form1" name="form1" method="post">
	<input type="hidden" id="contents" name="contents" value="111">
</form>

<style type="text/css" class="init">
	  th, td { white-space: nowrap; }
	div.dataTables_wrapper {
		margin: 0 auto;
	}

 	div.container {

        width: 80%;

    }

	</style>
<style>
  table {
    width: 100%;
    /* border: 1px solid #bbc6d3; */
    border-collapse: collapse;
  }
  th, td {
    /* border: 1px solid #bbc6d3; */
    padding: 10px;
  }
</style>


<body class="hold-transition skin-blue layout-top-nav">
				<div id="tabledata">
					
					<div class="row" style="width: 100%">
						<div class="col-xs-12">
							<div class="box">
								<!-- /.box-header -->
								<div class="box-body">
									<!-- input type="button" class="btn btn-warning navbar-right" onclick="fnCancelPop()" value="삭제"/></td-->
									<table id="tablebody" width="100%"
										class="table table-hover" cellspacing="0">
										<thead>
											<tr>
												<th style="font-size: 18px; text-align:center" width="5%">Sequence</th>
												<th style="font-size: 18px; text-align:center" width="45%">Title</th>
												<th style="font-size: 18px; text-align:center" width="20%">Partner</th>
												<th style="font-size: 18px; text-align:center" width="25%">Date</th>
												<th style="font-size: 18px; text-align:center" width="5%">Hits</th>

											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${ board.size() > 0 }">
													<c:forEach var="vo" items="${ board }">
													<c:set var="i" value="${i+1 }" />
														<tr>
															<td style="font-size: 18px; text-align:center">
															<fmt:parseNumber value="${itemCount }" var="itemCount"/>
																<fmt:parseNumber value="${currentPage }" var="currentPage"/>
																<fmt:parseNumber value="${itemCountPerPage }" var="itemCountPerPage"/>
																<c:set var="no" value="${itemCount - ((currentPage - 1) * itemCountPerPage ) - i + 1}"/>
																${no }
															</td>
															<td style="font-size: 18px"><a href="javascript:fnCwNotiDt(${vo.brd_no})">
																${vo.title} <font size="2pt">[${vo.comment_cnt}]</font>
																
															<c:choose>
																<c:when test="${vo.file_cnt>0 }">
																	<img src="resources/img/attached.png" style="width: 18px; height: 18px;"/>
																</c:when>
																<c:otherwise>
																	
																</c:otherwise>
															</c:choose>
																
																</a></td>
															<td style="font-size: 18px; text-align:center">${ vo.cu_sangho}</td>
															<fmt:parseDate value='${vo.reg_date}' var='regDate' pattern='yyyy-MM-dd HH:mm:ss'/>															
															<td style="font-size: 18px; text-align:center"><fmt:formatDate pattern='dd-MM-yyyy HH:mm:ss' value='${regDate}' /></td>
															<td style="font-size: 18px; text-align:center">${ vo.hit}</td>

														</tr>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<tr>
														<td colspan="6" style="height: 100px; text-align: center;">No data found.</td>
													</tr>
												</c:otherwise>

											</c:choose>
										</tbody>
									</table>

								</div>
							</div>
						</div>
					</div>



	<div class="row" style="display:flex;">

	<div class="" style="padding-top: 0px; width: 33%; float: left;">
		<span style="margin-left: 10px;">number : ${ itemCount }</span>
	</div>
	
	<div class="" style="width: 33%; text-align: center; float: left; padding-top: -10px; margin-top: -10px;">
		<ul class="pagination" style="padding-top:0px;">
			<li><a href="javascript:getUserList( '1' ,'')">&nbsp;&lt;&lt;&nbsp;</a></li>

			<c:if test="${currentPage > 1 }">
				<li><a href="javascript:getUserList(${ currentPage-1 },'');">&nbsp;&lt;&nbsp;</a></li>
			</c:if>
			<c:if test="${currentPage <= 1 }">
				<li><a href="javascript:getUserList(${ currentPage},'');">&nbsp;&lt;&nbsp;</a></li>
			</c:if>


			<c:forEach var="pg" items="${ paging }">
				<c:if test="${ pg == currentPage }">
					<!-- button type="button" class="btn" onclick="getUserList(${ pg },'');" style="font-weight:bold;">&nbsp;${ pg }&nbsp;</button-->
					<li class="active"><a
						href="javascript:getUserList(${ pg},'');">${ pg }</a></li>
				</c:if>
				<c:if test="${ pg != currentPage }">
					<!-- button type="button" class="btn" onclick="getUserList(${ pg },'');">&nbsp;${ pg }&nbsp;</button-->
					<li><a href="javascript:getUserList(${ pg},'');">${ pg }</a></li>
				</c:if>
			</c:forEach>

			<c:if test="${ currentPage < maxPage }">

				<!--button type="button" class="btn1" onclick="getUserList(${currentPage+1},'');">&nbsp;&gt;&nbsp;</button-->
				<li><a href="javascript:getUserList(${ currentPage+1},'');">&nbsp;&gt;&nbsp;</a></li>
			</c:if>
			<c:if test="${ currentPage >= maxPage }">
				<!-- button type="button" class="btn1">&nbsp;&gt;&nbsp;</button-->
				<li><a href="javascript:getUserList(${ currentPage},'');">&nbsp;&gt;&nbsp;</a></li>
			</c:if>
			
			<li><a href="javascript:getUserList(${maxPage},'');">&nbsp;&gt;&gt;&nbsp;</a></li>

		</ul>
	</div>
	
	<div style="float:right; width: 33%;">
		<div class="pull-right hidden-xs">
				<b></b>
		<strong>Copyright &copy; 2022 <a href="#">WOOBOTECH</a>.
		</strong> All rights reserved.
		</div>
	</div>
	
</div>

				</div>


				
				


				<div id="modalPop" class="modal fade">
				</div>
				<div id="modalPop4" class="modal fade">
				</div>
				<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	
	<div id="modalPop2" class="modal fade">
		<!-- /.modal-dialog -->
	</div>

	
	<div id="modalPop3" class="modal fade">
		
	</div>

	<!-- /.modal -->


	<!-- /.content-wrapper -->


	<!-- Control Sidebar -->

	<!-- /.control-sidebar -->
	<!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
	<div class="control-sidebar-bg"></div>

	<!-- ./wrapper -->


	<!-- jQuery 2.2.3 -->
	<script src="asset/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="asset/bootstrap/js/bootstrap.min.js"></script>

	<!-- FastClick -->
	<script src="asset/plugins/fastclick/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="asset/dist/js/app.min.js"></script>
	<!-- Sparkline -->
	<script src="asset/plugins/sparkline/jquery.sparkline.min.js"></script>
	<!-- jvectormap -->
	<script src="asset/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script
		src="asset/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>

	<script src="asset/plugins/datepicker/bootstrap-datepicker.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
	<!-- DataTables -->
	<script src="asset/plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="asset/plugins/datatables/dataTables.bootstrap.min.js"></script>
	<!-- SlimScroll 1.3.0 -->
	<script src="asset/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- ChartJS 1.0.1 -->
	<script src="asset/plugins/chartjs/Chart.min.js"></script>
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<!-- script src="asset/dist/js/pages/dashboard2.js"></script-->
	
	<script src="asset/dist/js/demo.js"></script>

	<script src="asset/plugins/ckeditor/ckeditor.js"></script>
	<script src="asset/plugins/ckeditor/samples/js/sample.js"></script>
	
	<!-- AdminLTE for demo purposes -->
	<script src="asset/dist/js/demo.js"></script>

	<script src="resources/js/jquery.number.min.js"></script>
	<script src="resources/js/jquery.number.js"></script>
	<script type="text/javascript">
		
		//$('td.number').number( true, 0 );
		$('.clickBtn').bind('click', function() {
			var trNum = $(this).closest('tr').prevAll().length;
			//alert(trNum);
			
			fnSeletedRow(trNum);
			
		});
	</script>


	<script type="text/javascript">
	
	

	
	
	
	function fnCwNotiDt_u(){
		
		var contents = CKEDITOR.instances.p_contents.getData();	
		
		if($("#p_cno").val()==''){
			alert("Please select a partner");
			return;
		}
		
		if($("#p_p_title").val()==''){
			alert("Please enter a title");
			return;
		}
		if($("#cw_noti_pass").val()==''){
			alert("Please enter your password.");
			return;
		}
		if(contents==''){
			alert("Please enter the contents.");
			return;
		}
		
	   $("#contents").val(contents);
	   var form = $('#form1')[0];
       var formData = new FormData(form);
       //formData.append("img1",  $("#file1")[0].files[0]);
     //  formData.append("img2",  $("#file2")[0].files[0]);
     //  formData.append("img3",  $("#file3")[0].files[0]);
     //  formData.append("img4",  $("#file4")[0].files[0]);
      // formData.append("img5",  $("#file5")[0].files[0]);
       formData.append("brd_no", $("#p_brd_no").val());
       formData.append("good_group_cd", $("#p_good_group_cd").val());
       formData.append("title", $("#p_p_title").val());
       formData.append("cno", $("#p_cno").val());
       formData.append("pass", $("#cw_noti_pass").val());
      // formData.append("contents",contents);


      $.ajax({
           url: 'mng_cw_noti_dt_u',
           processData: false,
           contentType: false,
           data: formData,
           type: 'POST',
           success: function(result){
                	   
                	   if(result=='1'){
                		   alert("Successfully registered");
                		   location.reload();
                	   }else{
                		   alert("Please contact the administrator!");
                	   }
                   	
                   }
           });
		
	}
	
	//★★★★★삭제예정220721★★★★★ 끝
	//★★★★★삭제예정220721★★★★★ 시작
	 function fnCwNotiDt(brd_no) {
		 	
		 	$.ajax({
		 		type:"post",
		 		url:"mng_cw_noti_dt",
		 		dataType:"html",
		 		data:{
		 			brd_no : brd_no
		 		}	
		 		}).done(function(data){
		 			$("#modalPop").html("");
		 			$("#modalPop").html(data);
		 			$('#modalPop').modal('show');
		 		//	$('span.number').number( true, 0 );
		 		});
		 	
		 }	
	
	
	function fnclose(){
		$('#modalPop').modal('hide');
 	}
	
	function fnCwNoti_i(){
		
		var contents = CKEDITOR.instances.p_contents.getData();	
		
		
		if($("#p_cno").val()==''){
			alert("Please select a partner");
			return;
		}
		
		
		if($("#p_p_title").val()==''){
			alert("Please enter a title.");
			return;
		}
		
		if($("#p_pass").val()==''){
			alert("Please enter your password.");
			return;
		}
		
		if(contents==''){
			alert("Please enter the contents.");
			return;
		}
		//if($("#p_option1").val()==''){
		///	alert("옵션명1 입력해주세요");
		//	return;
		//}
		//if($("#p_option2").val()==''){
		//	alert("옵션명2 입력해주세요");
		//	return;
		//}
		
		//if($("#p_option3").val()==''){
		//	alert("옵션명3 입력해주세요");
		//	return;
		//}
		
		
	   $("#contents").val(contents);
	   var form = $('#form1')[0];
       var formData = new FormData(form);
       formData.append("img1",  $("#file1")[0].files[0]);
       formData.append("img2",  $("#file2")[0].files[0]);
       formData.append("img3",  $("#file3")[0].files[0]);
       formData.append("img4",  $("#file4")[0].files[0]);
       formData.append("img5",  $("#file5")[0].files[0]);
       formData.append("title", $("#p_p_title").val());
       formData.append("cno", $("#p_cno").val());
       formData.append("pass", $("#p_pass").val());
      // formData.append("contents",contents);

		
      $.ajax({
           url: 'mng_cw_noti_add_i',
           processData: false,
           contentType: false,
           data: formData,
           type: 'POST',
           success: function(result){
                	   
              	   if(result=='1'){
              		   alert("Successfully registered.");
              		   location.reload();
              	   }else{
              		   alert("Please contact the administrator.");
              	   }
                 	
                 }
           });
		
       
		
       
		
		
	}
	//★★★★★삭제예정220721★★★★★ 끝
	//★★★★★삭제예정220721★★★★★ 시작
	function fileCheck(obj,id,imgId){
		
		
		var ext = $('#'+id).val().split('.').pop().toLowerCase();

		if ($('#'+id).val() == '') {
			return;
		}
		/*
		if ($.inArray(ext, [ 'jpg' ]) == -1) {

			alert('jpg 파일만 업로드 할수 있습니다.');

			return;

		}
		*/

		//파일 사이즈 체크
		var iSize = 0;
		if (window.ActiveXObject) {
			var objFSO = new ActiveXObject("Scripting.FileSystemObject");

			var sPath = $('#'+id)[0].value;
				
			var objFile = objFSO.getFile(sPath);
			
			iSize = objFile.size;

			iSize = iSize / 1024;

		} else {
			iSize = ($('#'+id)[0].files[0].size / 1024);
		}

		iSize = (Math.round(iSize * 100) / 100)
		if (iSize > 500) {
			//alert('500kb 이하 이미지만 첨부할 수 있습니다.');
			//////return;
		}

		readURL(obj, imgId,id);
		
	}
	//★★★★★삭제예정220721★★★★★ 끝
	////★★★★★삭제예정220721★★★★★ 시작
	function readURL(input, imgId,id) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#' + imgId).attr('src', e.target.result);
			}
			
			
			reader.readAsDataURL(input.files[0]);
			
			//if(!confirm("서버에 업로드 하시겠습니까?")){
			//	return;
			//}
			//uploadFile(imgId,id);
		}
	}
	
	
	
	function fnCwNotiAdd() {
		
	 	$.ajax({
	 		type:"post",
	 		url:"mng_cw_noti_add",
	 		dataType:"html",
	 		data:{
	 			
	 		}	
	 		}).done(function(data){
	 			$("#modalPop").html("");
	 			$("#modalPop").html(data);
	 			$('#modalPop').modal('show');
	 		//	$('span.number').number( true, 0 );
	 		});
		
	 }	
	
	//상세조회
	function fnOrderDtlList(order_no) {
		
		//alert('aa');
		//fnSeletedTopTable(obj);
		
		$("#selected_code").val(order_no);
		$.ajax({
			type : "post",
			url : "mng_order_dt_list",
			dataType : "html",
			data : {
				order_no:order_no
			}
		}).done(function(data) {
			//alert(data);
			$("#tabledata2").html("");
			$("#tabledata2").html(data);
		});

	}
	
	//★★★★★삭제예정220721★★★★★ 끝

	/* function getUserList(page, keyword) {
		//alert("serch2!2222");
		var form = document.formdata;
		var title = $('#p_title').val();
		var s_contents = $('#s_contents').val();
		var startdate = $('#startdate').val();
	 	var enddate = $('#enddate').val();
		var pageView = "mng_cw_noti_table";
		var itemCountPerPage =  $('#itemCountPerPage').val();
		var custname =  $('#p_cu_sangho').val();
		$.ajax({
			type : "post",
			url : "mng_cw_noti",
			dataType : "html",
			data : {
				startdate:startdate,
				enddate:enddate,
				page : page,
				pageView : pageView,
				s_contents : s_contents,
				title : title,
				custname : custname,
				itemCountPerPage : itemCountPerPage
				
			}
		}).done(function(data) {
			$("#tabledata").html("");
			$("#tabledata").html(data);
			//	$('td.number').number( true, 0 );
			//	$('span.number').number( true, 0 );
		});
	} */
	//협력사에 댓글 수정
	
	function fnqna_cw_u(idx,brd_no,id,pass_id,vi_pass,cont){//인덱스값,게시판번호,id,입력한 비밀번호,댓글에대한 비밀번호,수정하는 내용
		
		//var contents = CKEDITOR.instances.p_contents.getData();	
		//var cont=$("#update_qna_${vo.idx}").val();
		var pass=$('#'+pass_id).val();//입력하는 비밀번호
		var temp=$('#'+vi_pass).val();
		var cont=$('#'+cont).val();
		if(cont==''){
			alert("Please enter the comments.");
			return;
		}
		
		if(pass ==''){
			alert("Please enter your comment password.");
			return;
		}
		
		if(pass != temp){
			alert("Passwords don't match. Please check the password.");
			return;
		}
		//alert ("idx값 :"+idx);
		//alert ("댓글비밀번호"+pass);
	   //$("#contents").val(contents) 	;
	   var form = $('#form2')[0];
       var formData = new FormData(form);
       //formData.append("img1",  $("#file1")[0].files[0]);
     //  formData.append("img2",  $("#file2")[0].files[0]);
      // formData.append("img3",  $("#file3")[0].files[0]);
      // formData.append("img4",  $("#file4")[0].files[0]);
      // formData.append("img5",  $("#file5")[0].files[0]);
       formData.append("brd_no", $("#p_brdno").val());
       formData.append("content", cont);
       formData.append("pass", pass);
       formData.append("idx",idx);
      // formData.append("contents",contents);

      

      $.ajax({
           url: 'mng_cw_qna_u',
           processData: false,
           contentType: false,
           data: formData,
           type: 'POST',
           //success: function(result){
                	   //if(result=='1'){
                		   //alert("정상 등록되었습니다.");
                		   //location.reload();
                	   //}else{
                		   //alert("관리자에게 문의 하세요!");
                	   //}
                   	
                  // }
           }).done(function(data){
        	   var isOk= data;
        	   if(isOk ==1){
        		   alert("Successfully registered.");
        		   fnCwNotiDt(brd_no);
        	   }else{
        		   alert('Failed to register comments');
        	   }
           });
		
	}
	
	//협력사 댓글 입력
	
	function fnQna_cw_i(brd_no){
		
		//var contents = CKEDITOR.instances.p_p_contents.getData();
		
		if($("#p_pass").val()==''){
			alert("Please enter your password.");
			return;
		}
		
		if($("#p_p_content").val()==''){
			alert("Please enter the comments.");
			return;
		}
		
		 //$("#contents").val(contents) 	;
		   var form = $('#form2')[0];
	       var formData = new FormData(form);
	       formData.append("brdno", $("#p_brdno").val());
	       formData.append("contents", $("#p_p_content").val());
	       formData.append("pass", $("#p_pass").val());
			
	       $.ajax({
	           url: 'mng_cw_qna_add_i',
	           processData: false,
	           contentType: false,
	           data: formData,
	           type: 'POST',
	           //success: function(result){
	                	   
	                		  // alert("정상 등록되었습니다.");
	                		   //location.reload();
	                	  // }else{
	                		   //alert("관리자에게 문의 하세요!");
	                	   //}
	                   	
	                  // }
	           }).done(function(data){
	        	   var isOk= data;
	        	   if(isOk ==1){
	        		   alert("Successfully registered.");
	        		   fnCwNotiDt(brd_no);
	        	   }else{
	        		   alert('Failed to register comments');
	        	   }
	           });
	}
	//★★★★★삭제예정220721★★★★★ 끝
	</script>

	<script>
		$(function() {
			$('#startdate').datepicker({
				format : 'dd-mm-yyyy'
			}).on('change',function(){
				$('.datepicker').hide();
			});
			$('#enddate').datepicker({
				format : 'dd-mm-yyyy'
			}).on('change',function(){
				$('.datepicker').hide();
			});
		});
	</script>
</body>
</html>
