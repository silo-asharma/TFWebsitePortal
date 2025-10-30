<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_Job.aspx.cs" Inherits="Extuent.Admin.Add_Job" %>
<%@ Register Src="~/Admin/UC/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/Admin/UC/foot.ascx" TagPrefix="uc1" TagName="foot" %>
<%@ Register Src="~/Admin/UC/header.ascx" TagPrefix="uc1" TagName="header" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <script src="assets/js/jquery.js"></script>
   
    <script src="assets/js/chart-project.js"></script>
    <uc1:header runat="server" id="header" />
</head>
<body>
    <form id="form1" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server">

    </asp:ScriptManager>
        <uc1:head runat="server" ID="head" />
  <main>
       <div class="container-fluid">
 <div class="title-box">
 <div class="row">
 <div class="col-12 col-sm-6 col-xl-6"><div class="page-title"></div></div>
  <div class="col-12 col-sm-6 col-xl-6 "><div class="breadcrumb">Basic <span><i class="fas fa-angle-right"></i></span> Job details</div></div>
 </div>
 </div>
 <div class="content-box">
 <div class="row">
 
           
              
            </div>
            <div class="col-sm-12 margin-top-30">
            <div class="card">
							<div class="card-body">
								<h6 class="card-title border-bottom-with-margin">Basic Job Details</h6>
							<form>
									<div class="form-group">
										<label for="exampleInputText1">Job Title</label>
										<input type="text" class="form-control" id="job_title"  placeholder="Enter Job Title">
									</div>
									<div class="form-group">
										<label for="exampleInputEmail3">Company Name</label>
										<input type="email" class="form-control" id="company_name"  placeholder="Company Name">
									</div>
									<div class="form-group">
										<label for="exampleInputNumber1">Location</label>
										<input type="number" class="form-control" id="location" placeholder="Location">
									</div>
									<div class="form-group">
										<label for="exampleInputPassword3">Salary</label>
										<input type="password" class="form-control" id="salary"  placeholder="Salary">
									</div>
									<div class="form-group">
										<label for="exampleInputDisabled1">Exprience</label>
										<input type="number" class="form-control" id="experience" placeholder="Exprience">
									</div>
									
									
									<div class="form-group">
										<label for="exampleFormControlSelect1">Job Type</label>
										<select class="form-control" id="exampleFormControlSelect1">
											<option selected="" disabled="">Job Type</option>
											<option>Full-Time</option>
											<option>Part-Time</option>
											<option>Remote</option>
											
										</select>
									</div>
									<div class="form-group">
										<label for="exampleFormControlSelect1">Select Category</label>
										<select class="form-control" id="exampleFormControlSelect1">
											<option selected="" disabled="">Select Category</option>
											<option>Programming</option>
											<option>Customer Support</option>
											<option>Sales & Marketing</option>
											<option>Business Development</option>
											<option>Finance & Banking Services</option>

                                            <option>IT & Networking Services</option>
											<option>Electronics & Communication</option>
											<option>Design & Development</option>
                                            <option>Language Conversion</option>
											<option>Others</option>
										</select>
									</div>
									
									
                                    
									
									<button class="theme btn btn-primary" type="submit">Add Job</button>
								</form>
								
							</div>
						</div>
            </div>
            
            
            
 </div>
 
 </div>
  </main>

                <uc1:foot runat="server" id="foot" />
    </form>
</body>
</html>
