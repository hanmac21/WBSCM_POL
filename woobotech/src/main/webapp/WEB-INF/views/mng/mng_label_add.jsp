<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




<div class="modal-dialog"  style="width:620px;">
	<div class="modal-content" style="overflow-y:scroll; width:650px; height:700px;">
		<div class="modal-header">
			<!-- <button type="button" class="close" data-dismiss="modal"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button> -->
			<h4 class="modal-title"><!-- 라벨발행 -->Label printing</h4>
			<h4 class="modal-title" style="text-align: center;" id="sp_p_biz_nm"></h4>
		</div>
		<div class="modal-body" id="modalbody1" style="width:100%;">
			<div class="box box-info">

				<!-- /.box-header -->
				<!-- form start -->
				<form class="form-horizontal" name="form2" id="form2" method="post">
					<div class="box-body">
							
						<input type="hidden" id="p_custcode" name="p_custcode" value="${custcode}">
						<input type="hidden" id="p_color" name="p_color" value="${color}">
						
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label"
								style="font-size: 14px">Item name</label>

							<div class="col-sm-10">
								<input type="text" class="form-control" name="p_biz_nm" readonly
									id="p_itemname2" value="${itemname}" style="margin-left: 3px;">
							</div>
						</div>
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label"
								style="font-size: 14px">Item code</label>

							<div class="col-sm-10">
								<input type="text" class="form-control" name="p_itemcode1" readonly
									id="p_itemcode1" value="${itemcode1}" style="margin-left: 3px;">
							</div>
						</div>
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label"
								style="font-size: 14px">Car</label>

							<div class="col-sm-10">
								<input type="text" class="form-control" name="p_car_type" readonly
									id="p_car_type" value="${car_type}" style="margin-left: 3px;">
							</div>
						</div>
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label"
								style="font-size: 14px"><!-- 공급업체 -->supplier</label>

							<div class="col-sm-10">
								<%-- <input type="text" class="form-control" name="p_custname"
									id="p_custname" value="${custname}" style="margin-left: 3px;"> --%>
								<input type="text" class="form-control" name="p_custname" readonly
									id="p_custname" value="${custname }" style="margin-left: 3px;">
							</div>
						</div>
						
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label"
								style="font-size: 14px"><!-- 입고일자 -->date</label>

							<div class="col-sm-10">
								<input type="text" class="form-control" name="p_indate" readonly
									id="p_indate" value="${indate}" style="margin-left: 3px;">
							</div>
						</div>	
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label"
								style="font-size: 14px"><!-- 주문수량 -->Order Qty</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="p_qty" readonly
									id="p_qty" placeholder="Only numbers can be entered"  value="${i_qty}"  style="margin-left: 3px;">
							</div>
						</div>
						
						<div class="form-group" style="border-top: 2px solid #bbc6d3; padding-top: 5px;">
							<input type="radio" id="nomal" name="batchMode" value="nomal" checked><label for="rdPink">nomal</label>
							<label for="name" class="col-sm-2 control-label"
								style="font-size: 14px">Production date</label>

							<div class="col-sm-10">
								<input type="text" placeholder="dd-mm-yyyy"  class="form-control" name="p_madate"
									id="p_madate" value="${madate}" placeholder="dd-mm-yyyy"  style="margin-left: 3px; width:145px; float:left; background-color:#ffffff" readonly='true'>
								<input type="text" placeholder="dd-mm-yyyy"  class="form-control" name="p_madate2"
									id="p_madate2" value="${madate2}" placeholder="dd-mm-yyyy"  style="margin-left: 16px; width:145px; float:left;  background-color:#ffffff"" readonly='true'>
								<input type="text" placeholder="dd-mm-yyyy"  class="form-control" name="p_madate3"
									id="p_madate3" value="${madate3}" placeholder="dd-mm-yyyy"  style="margin-left: 16px; width: 145px; float:left;  background-color:#ffffff"" readonly='true'>
							</div>
						</div>

						<div class="form-group">
							<label for="name" class="col-sm-2 control-label"
								style="font-size: 14px; x">QTY per box</label>
							
							<div class="col-sm-10">
								<input type="text" class="form-control" name="p_box_qty" 
								id="p_box_qty" placeholder="Only numbers can be entered" value="${box_qty }" style="margin-left: 3px; width:145px; float:left">
								<input type="text" class="form-control" name="p_box_qty2" 
								id="p_box_qty2" placeholder="Only numbers can be entered" value="${box_qty2 }" style="margin-left: 16px; width:145px; float:left">
								<input type="text" class="form-control" name="p_box_qty3"
								id="p_box_qty3" placeholder="Only numbers can be entered" value="${box_qty3 }" style="margin-left: 16px; width:145px; float:left">
							</div>
						</div>
						
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label"
								style="font-size: 14px">LOT QTY</label>

							<div class="col-sm-10">
								<input type="text" class="form-control" name="p_production"
									id="p_production" value="${production}" placeholder=""  style="margin-left: 3px; width:145px; float:left">
								<input type="text" class="form-control" name="p_production2"
									id="p_production2" value="${production2}" placeholder=""  style="margin-left: 16px; width:145px; float:left">
								<input type="text" class="form-control" name="p_production3"
									id="p_production3" value="${production3}" placeholder=""  style="margin-left: 16px; width: 145px; float:left">
							</div>
						</div>
						
						<div class="form-group" style="border-top: 2px solid #bbc6d3; padding-top: 5px;">
							<input type="radio" id="Batch" name="batchMode" value="batch" ><label for="rdRed">Batch</label>
							<label for="name" class="col-sm-2 control-label" style="font-size: 14px">Batch date</label>
							<div class="col-sm-10">
								<input type="text" placeholder="dd-mm-yyyy"  class="form-control" name="p_date"
									id="p_date"  value="${madate}" placeholder="dd-mm-yyyy"  style="margin-left: 3px; width:145px; float:left; background-color:#ffffff" readonly='true'>								
							</div>
						</div>
						<div class="form-group" >
							<label for="name" class="col-sm-2 control-label" style="font-size: 14px">Batch QTY</label>
							<div class="col-sm-10">
								<textarea name="p_content" id="p_content" cols="100" rows="10" class="form-control" 
								style="overflow-y: scroll;" placeholder="ex) 22.51/10092022" readonly></textarea>
							</div>
						</div>
						<!-- 
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label"
								style="font-size: 10px">LOTNO</label>

							<div class="col-sm-10">
								<input type="text" class="form-control" name="p_lotno"
									id="p_lotno" value="${lotno}">
							</div>
						</div>
 						-->
						
						
						
						
						<div class="form-group">
							<label for="name" class="col-sm-2 control-label"
								style="font-size: 14px">Note</label>

							<div class="col-sm-10">
								<input type="text" class="form-control" name="s_memo"
									id="s_memo" value="" placeholder="Write down"  style="margin-left: 3px;">
							</div>
						</div>
						
						<div class="box-footer" style="text-align: center;">
							<div>
							<button type="button" class="btn btn-info" id ="printBtn"
									onclick="fnLabelPrint()" style="margin-right: 20px; height: 50px;width:100px;">Printing</button>
							<button type="button" class="btn btn-success"
									onclick="fnclose()" style="width:100px; height: 50px" id="cnl">Cancel</button>
							</div>

						</div>
						<!-- /.box-foo
						
						
						<!-- /.box-footer -->
					</div>
				</form>
			</div>

		</div>
	</div>
</div>
<script type="text/javascript">
	//var h_tag_cnt=0;
	$(function() {
	$("#p_madate").datepicker ({ 
		  format: 'dd-mm-yyyy',
		  todayBtn:true,
		  todayBtn:'linked'
		  
	  }).on('change',function(){
			$('.datepicker').hide();
	  });
});
	$(function() {
		$("#p_madate2").datepicker ({ 
			  format: 'dd-mm-yyyy',
			  todayBtn:true,
			  todayBtn:'linked'
			  
		  }).on('change',function(){
				$('.datepicker').hide();
		  });
	});
	$(function() {
		$("#p_madate3").datepicker ({ 
			  format: 'dd-mm-yyyy',
			  todayBtn:true,
			  todayBtn:'linked'
			  
		  }).on('change',function(){
				$('.datepicker').hide();
		  });
	});
	$(function() {
		$("#p_date").datepicker ({ 
			  format: 'dd-mm-yyyy',
			  todayBtn:true,
			  todayBtn:'linked'
			  
		  }).on('change',function(){
				$('.datepicker').hide();
		  });
	});
	$(document).ready(function() {
		var payment = getCookie("payment");
		//★★★★★삭제예정220721★★★★주석 삭제
	    //$("#p_custname").val(payment);
	    // alert(loginId);
	    //document.getElemenyById("p_custname").value = payment
	    //alert("!");
	    //alert(payment);
	    $('input[name=p_custname]').attr('value',payment);
	});
	
	/* var printBtn = document.querySelector("#printBtn");
	printBtn.addEventListener("click", function (e) {
	    this.setAttribute("disabled", "disabled");
	    //폼 서밋
	}); */
	
	$(document).ready(function() {
		var batchM = $('input[name="batchMode"]:checked').val();
		
		$("#nomal").change(function() {
			if(batchM =="batch"){
				console.log("배치");
			}else if(batchM =="nomal"){
				document.getElementById('p_content').readOnly=true;
				document.getElementById('p_date').readOnly=true;
				document.getElementById('p_madate').readOnly=false;
				document.getElementById('p_madate2').readOnly=false;
				document.getElementById('p_madate3').readOnly=false;
				document.getElementById('p_box_qty').readOnly=false;
				document.getElementById('p_box_qty2').readOnly=false;
				document.getElementById('p_box_qty3').readOnly=false;
				document.getElementById('p_production').readOnly=false;
				document.getElementById('p_production2').readOnly=false;
				document.getElementById('p_production3').readOnly=false;
				console.log("노말");
				
			}
		});
		
		
		/* $('#p_content').on("focus",function(){
			var focusElement = document.activeElement.name;
			console.log(focusElement);
		}); */
	});
	$("#Batch").change(function() {
		var batchM = $('input[name="batchMode"]:checked').val();
		if(batchM =="batch"){
			console.log("배치");
			document.getElementById('p_content').readOnly=false;
			document.getElementById('p_date').readOnly=false;
			document.getElementById('p_madate').readOnly=true;
			document.getElementById('p_madate2').readOnly=true;
			document.getElementById('p_madate3').readOnly=true;
			document.getElementById('p_box_qty').readOnly=true;
			document.getElementById('p_box_qty2').readOnly=true;
			document.getElementById('p_box_qty3').readOnly=true;
			document.getElementById('p_production').readOnly=true;
			document.getElementById('p_production2').readOnly=true;
			document.getElementById('p_production3').readOnly=true;
		}else if(batchM =="nomal"){
			
			console.log("노말");
		}
	});
	
	$(function () {
	    //var payment = getCookie("payment");
	    //$("#p_custname").val(payment);
	    // alert(loginId);
	    //document.getElemenyById("p_custname").value = payment
	    //$('input[name=p_custname]').attr('value',payment);
			
	 });
	// 쿠키 가져오기 함수
	function getCookie(cName) {
		cName = cName + '=';
		var cookieData = document.cookie;
		var start = cookieData.indexOf(cName);
		var cValue = '';
		if (start != -1) {
			start += cName.length;
			var end = cookieData.indexOf(';', start);
			if (end == -1)
				end = cookieData.length;
			cValue = cookieData.substring(start, end);
		}
		return unescape(cValue);
	}
		
</script>
