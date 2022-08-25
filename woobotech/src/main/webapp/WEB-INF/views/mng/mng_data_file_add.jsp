<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<div class="modal-dialog" style="width: 80%">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			<h4 class="modal-title">Archive registration</h4>
			<h4 class="modal-title" style="text-align: center;" id="sp_p_biz_nm"></h4>
		</div>
		<div class="modal-body" id="modalbody1">
			<div class="box box-info">

				<!-- /.box-header -->
				<!-- form start -->
				<form class="form-horizontal" name="form1" id="form1" method="post">
					<div class="box-body">



						<div class="form-group">
							<label for="name" class="col-sm-2 control-label"
								style="font-size: 10px">Title</label>

							<div class="col-sm-10">
								<input type="text" class="form-control" name="p_title"
									id="p_p_title" placeholder="" value="">
							</div>
						</div>

						<div class="form-group">
							<label for="name" class="col-sm-2 control-label"
								style="font-size: 10px">Password</label>

							<div class="col-sm-3">
								<input type="password" class="form-control" name="p_pass"
									id="p_pass" placeholder="" value="">
							</div>
						</div>
						


						<div class="form-group">
							<label for="name" class="col-sm-2 control-label"
								style="font-size: 10px">Contents</label>

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


							<div class="col-xs-7"> <!--col-xs-8 211018 -->
								<button type="button" class="btn btn-success pull-right" style="font-size:20px;"
									onclick="fnclose()">Close</button>
								<button type="button" class="btn btn-info pull-right" style="font-size:20px; margin-right:10px;"
									onclick="fnDataFile_i()">Registration</button>
							</div>

						</div>
						<!-- /.box-footer -->
					</div>
				</form>
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
	
	
	
	
	
	
</script>

