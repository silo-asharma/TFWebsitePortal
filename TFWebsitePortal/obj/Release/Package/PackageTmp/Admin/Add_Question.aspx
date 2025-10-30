<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_Question.aspx.cs" Inherits="Extuent.Admin.Add_Question" %>
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
      <div class="col-sm-12 margin-top-30">
            <div class="card">
							<div class="card-body">
								<h6 class="card-title border-bottom-with-margin">Add New Job</h6>
							<form>
									
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
									<div class="form-group">
										<label for="exampleFormControlSelect1">Select Job</label>
										<select class="form-control" id="exampleFormControlSelect1">
											<option selected="" disabled="">Select Job</option>
											<option>Web Developer</option>
											<option>Business Associate</option>
											<option>Digital Marketing Manager</option>
											<option>Product Director</option>
											
										</select>
									</div>

									<div class="form-group">
										<label for="exampleFormControlTextarea1">Enter Question</label>
										<textarea class="form-control" id="exampleFormControlTextarea1" rows="5"></textarea>
									</div>
									
								
								
									
									<button class="theme btn btn-primary" type="submit">Add Questions</button>
								</form>
								
							</div>
						</div>
            </div>
  </main>

                <uc1:foot runat="server" id="foot" />
    </form>
</body>
</html>
