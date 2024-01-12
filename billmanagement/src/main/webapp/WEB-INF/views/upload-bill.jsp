<!DOCTYPE html>
<html>
 <jsp:include page="header.jsp" />
<body>


<jsp:include page="page-header.jsp" />
  <jsp:include page="setting.jsp" />
 <jsp:include page="menu.jsp" />
	<div class="mobile-menu-overlay"></div>

	<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">
				
				<!-- Default Basic Forms Start -->
				<div class="pd-20 card-box mb-30">
					<div class="clearfix">
						<div class="pull-left">
							<h4 class="text-blue h4">Upload Invoice</h4>
							<p class="mb-30">Fill All Details</p>
						</div>
						<!-- <div class="pull-right">
							<a href="#basic-form1" class="btn btn-primary btn-sm scroll-click" rel="content-y"  data-toggle="collapse" role="button"><i class="fa fa-code"></i> Source Code</a>
						</div> -->
					</div>
					<form>
					<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">Invoice For</label>
							<div class="col-sm-12 col-md-10">
								<select class="custom-select col-12">
									<option selected="">Choose...</option>
									<option value="1">One</option>
									<option value="2">Two</option>
									<option value="3">Three</option>
								</select>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">Text</label>
							<div class="col-sm-12 col-md-10">
								<input class="form-control" type="text" placeholder="">
							</div>
						</div>
						
						<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">Total Amount</label>
							<div class="col-sm-12 col-md-10">
								<input class="form-control" value="₹" type="number">
							</div>
						</div>
						
						<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">Status Of work</label>
							<div class="col-sm-12 col-md-10">
								<input class="form-control month-picker" placeholder="" type="text">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">Upload Invoice in PDF</label>
							<div class="col-sm-12 col-md-10">
								<input class="form-control month-picker" placeholder=""type="file">
							</div>
						</div>
						
						<div class="form-group row">
							<label class="col-sm-12 col-md-2 col-form-label">Remark</label>
							<div class="col-sm-12 col-md-10">
								<!-- <input class="form-control placeholder="Select time" type="text"> -->
								<textarea rows="5" cols="50"  class="form-control placeholder="Remarks.." type="text"></textarea>
							</div>
						</div>
						
						
					</form>
					
				</div>
				

			</div>
			<!-- <div class="footer-wrap pd-20 mb-20 card-box">
				DeskApp - Bootstrap 4 Admin Template By <a href="https://github.com/dropways" target="_blank">Ankit Hingarajiya</a>
			</div> -->
		</div>
	</div>
	<!-- js -->
	<!-- <script src="vendors/scripts/core.js"></script>
	<script src="vendors/scripts/script.min.js"></script>
	<script src="vendors/scripts/process.js"></script>
	<script src="vendors/scripts/layout-settings.js"></script> -->
	
	 <jsp:include page="footer.jsp" />
</body>
</html>