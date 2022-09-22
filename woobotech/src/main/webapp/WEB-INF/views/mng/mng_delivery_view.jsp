<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-label="Close" onclick="fnclose()">
				<span aria-hidden="true">&times;</span>
			</button>
			<h4 class="modal-title">Delivery departure</h4>
			<h4 class="modal-title" style="text-align: center;" id="sp_p_biz_nm"></h4>
		</div>
		<div class="modal-body" id="modalbody1">
			<div class="box box-info">

				<!-- /.box-header -->
				<!-- form start -->
				<form class="form-horizontal" name="form2" id="form2" method="post">
					<div class="box-body">
							
						<input type="hidden" id="p_custcode" name="p_custcode" value="${custcode}">
						<input type="hidden" id="ps_delivery_hour" name="ps_delivery_hour" value="${board.p_deliveryhour}">
						<input type="hidden" id="ps_delivery_min" name="ps_delivery_min" value="${board.p_deliverymin}">
						<input type="hidden" id="us_delivery_hour" name="us_delivery_hour" value="${board.u_deliveryhour}">
						<input type="hidden" id="us_delivery_min" name="us_delivery_min" value="${board.u_deliverymin}">

						<div class="form-group">
							<!-- <label for="name" class="col-sm-2 control-label"
								style="font-size: 10px">출발일자</label> -->
							<div class="col-sm-10">
								<div style="float:left; margin-top:8px;">
									<span>Departure date</span>
								</div>
								<div style="float:left; margin-left:48px;">
								<input type="text"  name="p_delivery_date" readonly placeholder="dd-mm-yyyy"
									id="p_delivery_date" value="">
								</div>	
							</div>
						</div>
						
						<div class="form-group">
							<!-- <label for="password" class="col-sm-2 control-label"
								style="font-size: 10px">출발시간</label> -->
							<div class="col-sm-10">
								<div style="float:left;">
									<span>Departure time</span>
								</div>	

								<div style="float:left; margin-left:48px;">			
								<select id="p_delivery_hour" name="p_delivery_hour" onchange="fnDeliveryTimeSet()">
									<option value="00">00</option>
									<option value="01">01</option>
									<option value="02">02</option>
									<option value="03">03</option>
									<option value="04">04</option>
									<option value="05">05</option>
									<option value="06">06</option>
									<option value="07">07</option>
									<option value="08">08</option>
									<option value="09">09</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
									<option value="13">13</option>
									<option value="14">14</option>
									<option value="15">15</option>
									<option value="16">16</option>
									<option value="17">17</option>
									<option value="18">18</option>
									<option value="19">19</option>
									<option value="20">20</option>
									<option value="21">21</option>
									<option value="22">22</option>
									<option value="23">23</option>
								</select>
								hour
								<select id="p_delivery_min" name="p_delivery_min" onchange="fnDeliveryTimeSet()">
									<option value="00">00</option>
									<option value="10">10</option>
									<option value="20">20</option>
									<option value="30">30</option>
									<option value="40">40</option>
									<option value="50">50</option>
								</select>
								min
								</div>
							</div>
						</div>
						
						
						<div class="form-group">
							<!-- <label for="password" class="col-sm-2 control-label"
								style="font-size: 10px">도착예정시간</label> -->

							<div class="col-sm-10">
								<div style="float:left;">
									<span>Arrival time&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
								</div>
								
								<div style="float:left; margin-left:20px;">
								<select id="p_du_hour" name="p_du_hour">
									<option value="00">00</option>
									<option value="01">01</option>
									<option value="02">02</option>
									<option value="03">03</option>
									<option value="04">04</option>
									<option value="05">05</option>
									<option value="06">06</option>
									<option value="07">07</option>
									<option value="08">08</option>
									<option value="09">09</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
									<option value="13">13</option>
									<option value="14">14</option>
									<option value="15">15</option>
									<option value="16">16</option>
									<option value="17">17</option>
									<option value="18">18</option>
									<option value="19">19</option>
									<option value="20">20</option>
									<option value="21">21</option>
									<option value="22">22</option>
									<option value="23">23</option>
								</select>
								hour
								<select id="p_du_min" name="p_du_min">
									<option value="00">00</option>
									<option value="10">10</option>
									<option value="20">20</option>
									<option value="30">30</option>
									<option value="40">40</option>
									<option value="50">50</option>
								</select>
								min
							</div>
							</div>
						</div>
						
						
						<div class="box-footer">
						
							<div class="col-sm-12" style="text-align: center;">
								<button type="button" class="btn btn-info"
									onclick="fndelivery_u('${deliveryno}','${dstate}')" style="margin-right: 10px;">Shipping start</button>
								<button type="button" class="btn btn-success"
									 data-dismiss="modal" onclick="fnclose()">Cancel</button>
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
$(document).ready(function() {
	var plant = "${plant}";
	//alert(${deliveryno});
	//alert(${plant});
	
	/* let date = new Date();
		
	let time = date;
	let minute = date;
	
	alert(time);
	alert(minute); */
	let date = new Date();
	//alert(getYyyyMmDdHhMmToString(date));
	
	let hhmm = getYyyyMmDdHhMmToString(date);
	//alert(hhmm);
	
	hh = hhmm.substr(8,2);
	mm = hhmm.substr(10,2);
	
	/* alert(hh+"시");
	alert(hh*1+1);
	alert(mm+"분"); */
	
	if(mm*1>=1 && mm*1<=9){
		mm = "10";
	} else if(mm*1>=11 && mm*1<=19){
		mm = "20";
	} else if(mm*1>=21 && mm*1<=29){
		mm = "30";
	} else if(mm*1>=31 && mm*1<=39){
		mm = "40";
	} else if(mm*1>=41 && mm*1<=49){
		mm = "50";
	} else if(mm*1>=51 && mm*1<=59){
		mm = "00";

		if(hh === "23"){
			hh = "00";	
		}else{
			hh = hh*1+1;
			hh += "";
		}
		
	}
	//alert(hh);
	//alert(mm);
	document.getElementById("p_delivery_hour").value=hh;
	document.getElementById("p_delivery_min").value=mm;
	fnDeliveryTimeSet()
	
});

function getYyyyMmDdHhMmToString(date){
	var dd = date.getDate();
	var mm = date.getMonth()+1; //Jan is 0
	var yyyy = date.getFullYear();

	if(dd<10){dd='0'+dd}
	if(mm<10){mm='0'+mm}
	
	yyyy = yyyy.toString();
	mm = mm.toString();
	dd = dd.toString();
	
	var m = date.getHours();
	var s = date.getMinutes();
	
	if(m<10){m='0'+m}
	if(s<10){s='0'+s}
	
	m = m.toString();
	s = s.toString();
	
	var s1 = yyyy+mm+dd+m+s;
	return s1;
}

$(function() {
	/* $('#p_delivery_date').datepicker({
		format : 'dd-mm-yyyy'
	}); */
	
	$("#p_delivery_date").datepicker ({ 
		  format: 'dd-mm-yyyy',
		  todayBtn:true,
		  todayBtn:'linked'
		  
	  }).on('change',function(){
			$('.datepicker').hide();
	  });
	
	//$("#p_delivery_date").datepicker().datepicker("setDate", new Date());
});

//alert(plant);

/* if(plant==="000"){
	alert("평택");
}else if(plant==="001"){
	alert("울산");
} */

function fnDeliveryTimeSet(){
	var plant = "${plant}";
	
	if(plant==="000"){
		//alert("평택");
		var psHour = $('#ps_delivery_hour').val();
		var pHour = $('#p_delivery_hour').val();
		
		var psMin = $('#ps_delivery_min').val();
		var pMin = $('#p_delivery_min').val();
		
		var hour  = Number(psHour)+Number(pHour);
		var min  = Number(psMin)+Number(pMin);
		
		if(pHour==''){
			alert('Please select delivery time (hour)');
			return;
		}
		if(pMin==''){
			alert('Please select a delivery time (minutes)');
			return;
		}
		
		if(hour<10){
			hour = "0"+hour;
		}
		if(hour>23){
			hour=23;
		}
		
		if(min>50){
			min=50;
		}
		
		$('#p_du_hour').val(hour).prop("selected",true);
		$('#p_du_min').val(min).prop("selected",true);
		
	}else if(plant==="001"){
		//alert("울산");
		var usHour = $('#us_delivery_hour').val();
		var uHour = $('#p_delivery_hour').val();
		
		var usMin = $('#us_delivery_min').val();
		var uMin = $('#p_delivery_min').val();
		
		var hour  = Number(usHour)+Number(uHour);
		var min  = Number(usMin)+Number(uMin);
		
		if(uHour==''){
			alert('Please select delivery time (hour)');
			return;
		}
		if(uMin==''){
			alert('Please select a delivery time (minutes)');
			return;
		}
		
		if(hour<10){
			hour = "0"+hour;
		}
		if(hour>23){
			hour=23;
		}
		
		if(min>50){
			min=50;
		}
		
		$('#p_du_hour').val(hour).prop("selected",true);
		$('#p_du_min').val(min).prop("selected",true);
		
	}
	
}
	
	
</script>