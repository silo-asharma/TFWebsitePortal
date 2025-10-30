<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_Job.aspx.cs" validateRequest="false" Inherits="Extuent.Admin.Add_Job" EnableEventValidation="false"%>

<%--<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls" TagPrefix="FTB" %>--%>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v22.1, Version=22.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>
<%@ Register Src="~/Admin/UC/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/Admin/UC/foot.ascx" TagPrefix="uc1" TagName="foot" %>
<%@ Register Src="~/Admin/UC/header.ascx" TagPrefix="uc1" TagName="header" %>
<%--<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>--%>
<%@ Register assembly="DevExpress.Web.v22.1, Version=22.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v22.1, Version=22.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <script src="assets/js/jquery.js"></script>
   
    <script src="assets/js/chart-project.js"></script>
    <uc1:header runat="server" id="header" />
   
      <link href="./vendor/summernote/summernote.css" rel="stylesheet">

   <%-- <link href="./vendor/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet">--%>

    <link href="./vendor/owl-carousel/owl.carousel.css" rel="stylesheet">
    <link href="./css/style.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&family=Roboto:wght@100;300;400;500;700;900&display=swap" rel="stylesheet"/>
   
    <script>
           //function SetChanges(field) {

           // var hidfield = document.getElementById(field.id.replace('mul', 'hid'));
           // hidfield.value = $("#" + field.id).val() != null ? $("#" + field.id).val().join(',') : "";

           //// alert(hidfield.value);
           //}

           $('.dropdown-toggle').click(function (e) {
               e.preventDefault();
               e.stopPropagation();

               return false;
           });
    </script>

    <script src="//cdn.ckeditor.com/4.20.1/standard/ckeditor.js"></script>
<%--     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>--%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
  <%--  <link rel="stylesheet" href="https://unpkg.com/multiple-select@1.5.2/dist/multiple-select.min.css">--%>
    <link href="css_ext/multiple-select.min.css" rel="stylesheet" />

    <script>
        $(function () {
            $('select').multipleSelect()
        });
    </script>
    <style>
          .img-modal{
            height:250px;
        }

        .img-modal img{
            height: 100%;
    object-fit: cover;
    width: 100%;
    border-top-left-radius: 1.25rem;
    border-bottom-left-radius: 1.25rem;
        }

        .input-field{
            background: #95d0e259;
        }

        .send-button{
            color: #fff;
    background-color: #95d0e2;
    border-color: #95d0e2;
        }

        .content-box .form-control {
    height: 35px;
}

        .close-modal-btn{
            position: absolute;
    right: 30px;
    top: 5px;
    background: #eee;
    border-radius: 50%;
    width: 30px;
    border: none;
    height: 30px;
}
 @media only screen and (min-width: 1200px) and (max-width: 1400px){
.content-body {
    margin-left: 17rem !important;
}

.deznav {
    width: 17rem !important;
}
.header {
    padding-left: 18rem !Important;
}

.nav-header .hamburger .line {
    background: #FE634E !important;
}



.header .header-content {
    height: 100%;
    padding-left: 5.3125rem;
    padding-right: 2.4rem;
    align-items: center;
    display: flex;
}
.nav-control{
    display: block !Important;
}

.nav-header .hamburger {
    display: block !important;
}

.deznav .metismenu > li a > i {
    font-size: 1.4rem;
    display: inline-block;
    vertical-align: middle;
    position: relative;
    top: 0;
    height: auto;
    width: auto;
    border-radius: 1.25rem;
    line-height: 1;
    text-align: center;
    -webkit-transition: all 0.5s;
    -ms-transition: all 0.5s;
    transition: all 0.5s;
    margin-right: 15px;
    color: #FE634E;
}
[data-sidebar-style="full"][data-layout="vertical"] .deznav .metismenu > li .has-arrow:after {
    right: 1.5rem;
}

[data-sidebar-style="mini"][data-layout="vertical"] .deznav .metismenu > li.mm-active > a {
     background: unset; 
     color: unset; 
    border-radius: 1.25rem;
}
[data-sidebar-style="mini"] .deznav .nav-text {
     display: block !important;
}


[data-sidebar-style="mini"] .deznav .metismenu li a {
    /* padding: 0.813rem 0.875rem; */
    padding: 20px 30px;
    font-size: 15px;
    display: flex;
    
}

 .deznav .metismenu > li > a:before {
    position: absolute;
    height: 100%;
    width: 11px;
    top: 0;
    border-radius: 0px 10px 10px 0;
    left: -11px;
    content: "";
    background: #FE634E;
    -webkit-transition: all 0.5s;
    -ms-transition: all 0.5s;
    transition: all 0.5s;
}

.deznav .metismenu > li.mm-active > a:before {
    position: absolute !important;
    height: 100% !important;
    width: 11px !important;
    top: 0 !important;
    border-radius: 0px 10px 10px 0 !important;
    left: 0px !important;
    content: "" !important;
    background: #FE634E !important;
    -webkit-transition: all 0.5s;
    -ms-transition: all 0.5s;
    transition: all 0.5s;
}

.deznav .metismenu > li {
   padding: unset !important; 
}

.deznav .metismenu > li:hover > a {
   background: none !important;
    color: #FE634E !important;
    border-radius: 1.25rem;
    position: unset;
}

.metismenu .has-arrow:after {
    position: absolute;
    content: "";
    width: 0.5em;
    height: 0.5em;
    border-width: 1px 0 0 1px;
    border-style: solid;
    border-color: initial;
    right: 1em;
    -webkit-transform: rotate(-45deg) translateY(-50%);
    transform: rotate(-45deg) translateY(-50%);
    -webkit-transform-origin: top;
    transform-origin: top;
    top: 50%;
    transition: all .3s ease-out;
}

.deznav .metismenu .has-arrow:after {
    width: 0.5rem;
    height: 0.5rem;
    right: 1.875rem;
    top: 48%;
    border-color: inherit;
    -webkit-transform: rotate(-225deg) translateY(-50%);
    transform: rotate(-225deg) translateY(-50%);
}

.nav-header .brand-title {
    display: block !important;
}

.nav-header .brand-title {
    margin-left: 150px !important;
    max-width: 120px;
    margin-top: 0px;
} 

}
 input[type="checkbox"]:checked:after {
    width: 1rem;
    height: 1rem;
    display: block;
    content: "\f00c";
    font-family: 'FontAwesome';
    color: #fff;
    font-weight: 100;
    font-size: 12px;
    text-align: center;
    border-radius: 3px;
    line-height: 12px;
    background: #FE634E;
}


</style>
  <script>

        function ShowPopup(title, body) {
            $("#exampleModalCenter .modal-title").html(title);
            $("#exampleModalCenter .content-desc").html(body);
            $("#exampleModalCenter").modal("show");
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
          <asp:HiddenField ID="hidJobDescriptions" runat="server" />
        <div class="content-body">
            <!-- row -->
            <div class="container-fluid" style="margin-top:0px;padding-top:0px;">
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
				
                <span >&nbsp;</span>
                        <hr />
                <!-- row -->
                <div class="row">
                    <div class="col-xl-12 col-xxl-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Create Jobs</h4>
                            </div>
                            <table style="width:100%;padding: 15px">


                                <tr>


                                    <td style="width:700px;padding: 15px;">

                                       <asp:DropDownList ID="ddlCategory" runat="server" class="custom-select form-control" onchange="getCategoryID();" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" AutoPostBack="true" ForeColor="#808080">
                                           <asp:ListItem Value="">Job Type</asp:ListItem>
                                            
                                        </asp:DropDownList>


                                    </td>
                                    <td style="width:700px;padding: 15px">


                                     	<input type="text" class="form-control" id="txtjob_title"  placeholder="Job Title" runat="server" style="color:#000">




                                    </td>
                                </tr>





                                <tr>


                                    <td style="width:700px;padding: 15px">

                                       	<input type="text" class="form-control" id="txtlocation" placeholder="Work Location" runat="server" style="color:#000000">



                                    </td>
                                    <td style="width:700px;padding: 15px">
                                        				<input type="text" class="form-control" id="txtcompany_name"  placeholder="Company/Account Name" runat="server" style="color:#000000">
                                    



                                    </td>
                                </tr>


                                <tr>


                                    <td style="width:700px;padding: 15px">

                                        		<input type="text" class="form-control" id="txtsalary"  placeholder="Salary" runat="server" style="color:#000000">



                                    </td>
                                    <td style="width:700px;padding: 15px">
                                         <asp:DropDownList ID="ddljobType" runat="server" class="custom-select form-control" ForeColor="#B1B1B1">
                                           <asp:ListItem Value="Job Type">Select Job Type</asp:ListItem>
                                               <asp:ListItem Value="Full-Time">Full-Time</asp:ListItem>
                                               <asp:ListItem Value="Part-Time">Part-Time</asp:ListItem>
                                               <asp:ListItem Value="Remote">Remote</asp:ListItem>
                                        </asp:DropDownList>
										



                                    </td>
                                </tr>



                                <tr>


                                    <td style="width:700px;padding: 15px">

                                    <input type="text" class="form-control" id="txtexperience" placeholder="Minimum Work Experience" runat="server" style="color:#000000">



                                    </td>
                                    <td style="width:700px;padding: 15px">
                                 
                                        
                                         <asp:ListBox id="ListBox1" class="form-control default-select "    Rows="6"  SelectionMode="Multiple" runat="server">
                                          
                                                    
                                 
     

                                                
      </asp:ListBox>

                                         
                                        
                                                                    <asp:HiddenField ID="hidUsersRoles" runat="server" />
                                      <%--  <asp:DropDownList ID="ddlskills" runat="server" class="custom-select form-control" ForeColor="#808080" disabled  style=" display: block;  background-color: lightgray;">
                                         
                                        </asp:DropDownList>--%>

                                 

                                    </td>
                                </tr>
                                <tr>


                                    <td style="width:700px;padding: 15px;text-align:right">
                                        <label for="from" >   Deadline Date: </label>
                                

                                    </td>

                                      <td style="width:700px;padding: 15px">

                              <input type="date" class="form-control" id="txtDedlines" placeholder="Deadline" runat="server" style="color:#000000">





                                    </td>
                                    </tr>
                                 <tr>


                                    <td colspan="2" style="width:700px;padding: 15px">

                                         <textarea type="text" class="form-control" id="txtShortDesc" placeholder="Job Summary" runat="server"  style="height:100px;color:black"></textarea>



                                    </td>

                                    </tr>
                            </table>
                            
                            <div class="card-body">
                                <center>

                                 <asp:TextBox ID="text" runat="server" TextMode="MultiLine"></asp:TextBox>
 <script>
   CKEDITOR.replace("text"); 
 </script> 

                                  


                                <dx:ASPxHtmlEditor ID="ASPxHtmlEditor1" runat="server" class="form-control" Width="900" Height="550" Border-BorderColor="Red" Visible="false"></dx:ASPxHtmlEditor>
                                </center>

                                <%--<asp:TextBox ID="txtjobdesc" runat="server" TextMode="MultiLine" class="form-control" Height="300px" Width="1070px"></asp:TextBox>--%>
                          <%--      <div class="summernote"  runat="server" id="txtjobdesc" >Job Description</div>--%>
                              <%--  <div class="summernote" runat="server" id="Div1">Job Description</div>--%>
                                  <%--<CKEditor:CKEditorControl ID="CKEditor" BasePath="~/ckeditor/" runat="server" AutoParagraph="false" HtmlEncodeOutput="true" Height="400"></CKEditor:CKEditorControl>--%>
                                <br />
                                <br />
                                
                                <br />
                                 <input type="text" class="form-control" id="Text1" placeholder="Exprience" runat="server" visible="false">
                                <h5>Select Interview Questions</h5>
                                <table id="myquestions">
                                    <tr>
                                        <td></td>
                                    </tr>
                                    <%
                                        if (Questions_Category.Count > 0)
                                        { %>
                                    <%for(int i=0;i<Questions_Category.Count;i++)
                                        {
                                            string ques = Questions_Category[i].question;
                                            string flag = Questionslist.Contains(ques) == true ? "checked" : "";
                                            %>
                                    <tr>
                                        <td>
                                            <input type="checkbox" id="<%=Questions_Category[i].id %>" <%=flag %> name="vehicle1" value="Bike" />
                                           <label for="vehicle1" style="display: inline;"> <%=i+1 %>. <%=Questions_Category[i].question %></label><br>

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
                                <h5>Select Evaluation Criteria</h5>
                                                                <table id="myevaluations">
                                                                     <%
                                        if (evaluation.Count > 0)
                                        { %>
                                    <%for(int i=0;i<evaluation.Count;i++)
                                        { string eva_id = evaluation[i].id.ToString();
                                            string flag = evaluitions_id.Contains(eva_id) == true ? "checked" : "";
                                            %>
                                    <tr>
                                        <td>
                                            <input type="checkbox" id="<%=evaluation[i].id %>" <%=flag %> name="vehicle1" value="Bike" onchange="countcheckedcheckbox(this);" />
                                              <label for="vehicle1" style="display: inline;"><%=i+1 %>. <%=evaluation[i].evaluation_name %></label><br />

                                        </td>
                                    </tr>
                                     <%} %>
                                    <%} %>
                                </table>
                                       
                                
                                	<asp:Button ID="btnAdd" runat="server" Text="Create Job" style="width:200px;border-color:#FF7416;color:white;border-radius:12px;height:35px;margin-left:40%" class="bg-orange" usesubmitbehavior="false" OnClientClick="add_Id();" OnClick="btnAdd_Click"/>
                                            	<asp:Button ID="btnUpdate" runat="server" Text="Update Job" style="width:200px;border-color:#FF7416;color:white;border-radius:12px;height:35px;margin-left:40%" class="bg-orange"  usesubmitbehavior="false" OnClientClick="add_Id();" OnClick="btnUpdate_Click" Visible="false" />
                                <asp:Button ID="btnalertCheck" runat="server" Text="Update Job" style="width:200px;border-color:#FF7416;color:white;border-radius:12px;height:35px;margin-left:40%" class="bg-orange"  usesubmitbehavior="false"  OnClick="btnalertCheck_Click" Visible="false" />
				<%--		   <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
        Launch demo modal
    </button>
                    --%>                    
<%--                                   <button style="width:200px;border-color:#FF7416;color:white;border-radius:12px;height:35px;margin-left:40%"  type="submit" class="bg-orange">Create Job</button>--%>

                            </div>
                        </div>
                    </div>
                </div>
            

                    
                                                </div>
                                            </div>
                                        
                                        </div>

                        </div>




        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
        aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content p-0">
                <div class="modal-body p-0">
                    <div class="">
                        <div class="row">
                            <div class="col-4 pr-0">
                                <div class="img-modal">
                                    <img src="images/alertimagesuccess.png" alt="" class="">
                                </div>
                            </div>
                            <div class="col-8 pl-0 d-flex align-items-center">
                                <button type="button" class="close-modal-btn" data-dismiss="modal">&times;</button>
                                <div class="content-box p-3 text-center">

                                    <h3 class="modal-title"></h3>
                                    <p class="content-desc">
                                        
                                    </p>
                                    <%--<input type="email" name="" id="" class="form-control input-field"
                                        placeholder="Enter Email Address">--%>
                                    <a href="dashboard" class="btn btn-sm send-button mt-2" style="background:#FE634E">Close</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-primary">Save changes</button>
            </div> -->
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
        function countcheckedcheckbox(id) {
            var count = 0;
            var chkId = id;
            $('#myevaluations').find('tr').each(function () {
                var row = $(this);
                if (row.find('input[type="checkbox"]').is(':checked') && row.find('label').val().length <= 0) {
                    count = count + 1;
                    if (count > 5) {
                        alert("You can select maximum 5 Evalutions area.");
                        chkId.checked = false;
                        return false;
                    }
                      
                }
            });
        }

    </script>
   <!-- Required vendors -->
                <script src="./vendor/global/global.min.js"></script>
                <script src="./vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
                

                <!-- Chart piety plugin files -->
                <script src="./vendor/peity/jquery.peity.min.js"></script>

                <!-- Apex Chart -->
                <script src="./vendor/apexchart/apexchart.js"></script>

                <!-- Dashboard 1 -->
                <script src="./js/dashboard/dashboard-1.js"></script>
    <script src="./js/custom.min.js"></script>
	<script src="./js/deznav-init.js"></script>

   <script src="./vendor/summernote/js/summernote.min.js"></script>
    <!-- Summernote init -->
    <script src="./js/plugins-init/summernote-init.js"></script>
    <script src="js/multiple-select.min.js"></script>
<%--    <script src="https://unpkg.com/multiple-select@1.5.2/dist/multiple-select.min.js"></script>--%>
</body>
</html>
