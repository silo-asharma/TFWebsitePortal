<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_Job.aspx.cs" Inherits="Extuent.Admin.Add_Job" EnableEventValidation="false"%>
<%@ Register Src="~/Admin/UC/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/Admin/UC/foot.ascx" TagPrefix="uc1" TagName="foot" %>
<%@ Register Src="~/Admin/UC/header.ascx" TagPrefix="uc1" TagName="header" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <script src="assets/js/jquery.js"></script>
   
    <script src="assets/js/chart-project.js"></script>
    <uc1:header runat="server" id="header" />
      <!-- Summernote -->
    <link href="./vendor/summernote/summernote.css" rel="stylesheet">
    <link href="./vendor/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet">
    <link href="./vendor/owl-carousel/owl.carousel.css" rel="stylesheet">
    <link href="./css/style.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&family=Roboto:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <script>
        function getCategoryID() {
            var id = document.getElementById('ddlCategory').value;
          
            document.getElementById("<%=hidcategoryID.ClientID%>").value = id;
       }
function add_Id(){
var questionids="";
var evalutionids="";
 $('#myquestions').find('tr').each(function () {
        var row = $(this);
        if (row.find('input[type="checkbox"]').is(':checked') && row.find('label').val().length <= 0) {
            var closestTr = row.find('input[type="checkbox"]').attr('id');
              questionids+=closestTr+","; 
        }
    });
$('#myevaluations').find('tr').each(function () {
        var row = $(this);
        if (row.find('input[type="checkbox"]').is(':checked') && row.find('label').val().length <= 0) {
            var closestTr = row.find('input[type="checkbox"]').attr('id');
              evalutionids+=closestTr+","; 
        }
    });
 document.getElementById("<%=hidQuestion_ID.ClientID%>").value = questionids;
 document.getElementById("<%=hidEvaluation_ID.ClientID%>").value = evalutionids;

}
         
    </script>

    
</head>
<body>
    <form id="form1" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server">

    </asp:ScriptManager>
        <uc1:head runat="server" ID="head" />
        <asp:HiddenField ID="hidcategoryID" runat="server" />
         <asp:HiddenField ID="hidQuestion_ID" runat="server" />
         <asp:HiddenField ID="hidEvaluation_ID" runat="server" />
        <div class="content-body">
            <!-- row -->
            <div class="container-fluid">
                <!-- Add Order -->
                <div class="modal fade" id="addOrderModalside">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Add Event</h5>
                                <button type="button" class="close" data-dismiss="modal">
                                    <span>&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="form-group">
                                        <label class="text-black font-w500">Event Name</label>
                                        <input type="text" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label class="text-black font-w500">Event Date</label>
                                        <input type="date" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label class="text-black font-w500">Description</label>
                                        <input type="text" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <button type="button" class="btn btn-primary">Create</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
               <div class="row">
                    <div class="col-xl-12 col-xxl-12">
                       
                           
                           
                                                                              
                            
                      
        
                             
            

				<!-- Add Order -->
				
                <span >&nbsp;Create Job</span>
                        <hr />
                <!-- row -->
                <div class="row">
                    <div class="col-xl-12 col-xxl-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title"></h4>
                            </div>
                            <table style="width:100%;padding: 15px">


                                <tr>


                                    <td style="width:700px;padding: 15px">

                                       <asp:DropDownList ID="ddlCategory" runat="server" class="custom-select form-control" onchange="getCategoryID();" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" AutoPostBack="true"
                                           >
                                           <asp:ListItem Value="">Job Type</asp:ListItem>
                                            
                                        </asp:DropDownList>


                                    </td>
                                    <td style="width:700px;padding: 15px">


                                     	<input type="text" class="form-control" id="txtjob_title"  placeholder="Enter Job Title" runat="server">




                                    </td>
                                </tr>





                                <tr>


                                    <td style="width:700px;padding: 15px">

                                       	<input type="text" class="form-control" id="txtlocation" placeholder="Location" runat="server">



                                    </td>
                                    <td style="width:700px;padding: 15px">
                                        				<input type="text" class="form-control" id="txtcompany_name"  placeholder="Company/Account Name" runat="server">
                                    



                                    </td>
                                </tr>


                                <tr>


                                    <td style="width:700px;padding: 15px">

                                        		<input type="text" class="form-control" id="txtsalary"  placeholder="Salary" runat="server">



                                    </td>
                                    <td style="width:700px;padding: 15px">
                                         <asp:DropDownList ID="ddljobType" runat="server" class="custom-select form-control" >
                                           <asp:ListItem Value="Job Type">Job Type</asp:ListItem>
                                               <asp:ListItem Value="Full-Time">Full-Time</asp:ListItem>
                                               <asp:ListItem Value="Part-Time">Part-Time</asp:ListItem>
                                               <asp:ListItem Value="Remote">Remote</asp:ListItem>
                                        </asp:DropDownList>
										



                                    </td>
                                </tr>



                                <tr>


                                    <td style="width:700px;padding: 15px">

                                    <input type="text" class="form-control" id="txtexperience" placeholder="Exprience" runat="server">



                                    </td>
                                    <td style="width:700px;padding: 15px">
                                        <asp:DropDownList ID="ddlskills" runat="server" class="custom-select form-control" >
                                         
                                        </asp:DropDownList>



                                    </td>
                                </tr>


                            </table>
                            
                            <div class="card-body">
                                <%--<asp:TextBox ID="txtjobdesc" runat="server" TextMode="MultiLine" class="form-control" Height="300px" Width="1070px"></asp:TextBox>--%>
                                <div class="summernote" runat="server" id="txtjobdesc">Job Description</div>
                                <br />
                                <br />
                                
                                <br />
                                 <input type="text" class="form-control" id="Text1" placeholder="Exprience" runat="server" visible="false">
                                <h3>Select Interview Questions</h3>
                                <table id="myquestions">
                                    <tr>
                                        <td></td>
                                    </tr>
                                    <%
                                        if (Questions_Category.Count > 0)
                                        { %>
                                    <%for(int i=0;i<Questions_Category.Count;i++)
                                        { %>
                                    <tr>
                                        <td>
                                            <input type="checkbox" id="<%=Questions_Category[i].id %>" name="vehicle1" value="Bike" />
                                           <label for="vehicle1"> <%=i+1 %>. <%=Questions_Category[i].question %></label><br>

                                        </td>
                                    </tr>
                                    <%} %>
                                    <%} %>
                                    
                                    <tr><td><asp:LinkButton runat="server" ID="addquestion" Text="Add Question" OnClick="addquestion_Click"></asp:LinkButton>
                                     <div id="divquestion" runat="server" visible="false">  <asp:TextBox runat="server" class="form-control" ID="txtquestion" Text=""></asp:TextBox> &nbsp; <asp:Button ID="Button1" runat="server" Text="Add" style="width:200px;border-color:#FF7416;color:white;border-radius:12px;height:35px;margin-left:40%" class="bg-orange" usesubmitbehavior="false" OnClick="Button1_Click"/> </div> 
                                        </td></tr>
                                </table>
                                <br />
                                <br />
                                <h3>Select Evaluation Criteria</h3>
                                                                <table id="myevaluations">
                                                                     <%
                                        if (evaluation.Count > 0)
                                        { %>
                                    <%for(int i=0;i<evaluation.Count;i++)
                                        { %>
                                    <tr>
                                        <td>
                                            <input type="checkbox" id="<%=evaluation[i].id %>" name="vehicle1" value="Bike" />
                                              <label for="vehicle1"><%=i+1 %>. <%=evaluation[i].evaluation_name %></label><br />

                                        </td>
                                    </tr>
                                     <%} %>
                                    <%} %>
                                </table>
                                       
                                
                                	<asp:Button ID="btnAdd" runat="server" Text="Create Job" style="width:200px;border-color:#FF7416;color:white;border-radius:12px;height:35px;margin-left:40%" class="bg-orange" usesubmitbehavior="false"  OnClientClick="add_Id();" OnClick="btnAdd_Click"/>
                                            	<asp:Button ID="btnUpdate" runat="server" Text="Update Job" style="width:200px;border-color:#FF7416;color:white;border-radius:12px;height:35px;margin-left:40%" class="bg-orange"  usesubmitbehavior="false" OnClientClick="add_Id();" OnClick="btnUpdate_Click" Visible="false" />
						
                                        
<%--                                   <button style="width:200px;border-color:#FF7416;color:white;border-radius:12px;height:35px;margin-left:40%"  type="submit" class="bg-orange">Create Job</button>--%>

                            </div>
                        </div>
                    </div>
                </div>
            

                    
                                                </div>
                                            </div>
                                        
                                        </div>

                        </div>



























        





  <main style="visibility:hidden;">
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
						  
                </div>
                <hr />
               
                <div class="col-md-12 col-lg-12">
                    <div class="card bg-light no-shadow">
                         <asp:Button ID="btnActivatedList" runat="server" Text="Activated List" class="theme btn btn-success"  usesubmitbehavior="false" />
                        <div class="table-responsive" style="visibility:hidden;">
                                <table class="table mb-0">
                                    <thead>
                                    <tr>
                                        <th>S.No.</th>
                                        <td>Job Name</td>
                                        <th></th>
                                       
                                 
                                      
                                    </tr>
                                    </thead>
                                    <tbody>
                                      <%
                                          int j=0;
                                          int g = -1;
                                          for (int k = 0; k < JobpostList.Count; k++)
                                          {
                                              j = j + 1;
                                           
                                              {  %>
                                    <tr>
                                        <td><%= j %></td>
                                        <td><%= JobpostList[k].job_title %></td>
                                     
                     
                                      
                                         <td> 
                                        <i class="fa fa-edit" aria-hidden="true"></i>  <a href="add-job?Edit=<%= JobpostList[k].rec_id %>">Edit</a>  |
                                       <i class="fa fa-trash" aria-hidden="true"></i>  <a href="add-job?Del=<%= JobpostList[k].rec_id %>">Delete</a>   |
                                           <i class="fa fa-trash" aria-hidden="true"></i>  <a href="add-job?DeActivate=<%= JobpostList[k].rec_id %>">Deactivate</a>  
</td>
                                    </tr>

                                        <%}
    } %>
                                    
                                      
                                    </tbody>
                                </table>
                            </div>
                        
                        
                        
                        <br /><asp:Button ID="btndeactivatedList" runat="server" Text="Deactivated List" class="theme btn btn-primary"  usesubmitbehavior="false" />
          <div class="table-responsive" style="visibility:hidden;">
                                <table class="table mb-0">
                                    <thead>
                                    <tr>
                                        <th>S.No.</th>
                                        <td>Job Name</td>
                                        <th></th>
                                       
                                 
                                      
                                    </tr>
                                    </thead>
                                    <tbody>
                                      <%
                                          int l=0;
                                          int m = -1;
                                          for (int i = 0; i < JobpostList1.Count; i++)
                                          {
                                              l = l + 1;
                                           
                                              {  %>
                                    <tr>
                                        <td><%= l %></td>
                                        <td><%= JobpostList1[i].job_title %></td>
                                     
                     
                                      
                                         <td> 
                                        
                                       <i class="fa fa-trash" aria-hidden="true"></i>  <a href="add-job?Activate=<%= JobpostList1[i].rec_id %>">Acticate</a>   
                                          
</td>
                                    </tr>

                                        <%}
    } %>
                                    
                                      
                                    </tbody>
                                </table>
                            </div>
                
                                </div>
                    </div>
            </div>
            
            
            
 </div>
 
 </div>
  </main>
 
                <uc1:foot runat="server" id="foot" />
    </form>
   <!-- Required vendors -->
                <script src="./vendor/global/global.min.js"></script>
                <script src="./vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
                <script src="./vendor/chart.js/Chart.bundle.min.js"></script>
                <script src="./js/custom.min.js"></script>
                <script src="./js/deznav-init.js"></script>
                <script src="./vendor/owl-carousel/owl.carousel.js"></script>

                <!-- Chart piety plugin files -->
                <script src="./vendor/peity/jquery.peity.min.js"></script>

                <!-- Apex Chart -->
                <script src="./vendor/apexchart/apexchart.js"></script>

                <!-- Dashboard 1 -->
                <script src="./js/dashboard/dashboard-1.js"></script>
    <script src="./js/custom.min.js"></script>
	<script src="./js/deznav-init.js"></script>

        <!-- Summernote -->
    <script src="./vendor/summernote/js/summernote.min.js"></script>
    <!-- Summernote init -->
    <script src="./js/plugins-init/summernote-init.js"></script>

</body>
</html>
