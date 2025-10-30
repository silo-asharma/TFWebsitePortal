<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_Category.aspx.cs" Inherits="Extuent.Admin.Add_Category" %>
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
								<h6 class="card-title border-bottom-with-margin">Add New Category</h6>
							<form>
									<div class="form-group">
										<label for="exampleInputText1">Add Category</label>
										<input type="text" class="form-control" id="exampleInputText1" value="" placeholder="Enter Category Name">
									</div>
									
									
									<button class="theme btn btn-primary" type="submit">Add Category</button>
								</form>
								
							</div>
						</div>
            </div>
  </main>

                <uc1:foot runat="server" id="foot" />
    </form>
</body>
</html>
