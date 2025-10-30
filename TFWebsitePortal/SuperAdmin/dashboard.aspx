<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="Extuent.SuperAdmin.dashboard" %>

<%@ Register Src="~/SuperAdmin/UC/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/SuperAdmin/UC/foot.ascx" TagPrefix="uc1" TagName="foot" %>
<%@ Register Src="~/SuperAdmin/UC/header.ascx" TagPrefix="uc1" TagName="header" %>






<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   <script src="assets/js/jquery.js"></script>
   
    <script src="assets/js/chart-project.js"></script>

    <uc1:header runat="server" id="header" />
        <script>
 window.onload = function () {
  
var options = {
	animationEnabled: true,
	title: {
		text: ""
	},
	data: [{
		type: "funnel",
		indexLabel: "{label} - {y}",
		toolTipContent: "<b>{label}</b>: {y} <b>({percentage}%)</b>",
		neckWidth: 150,
		neckHeight: 100,
		valueRepresents: "area",
		dataPoints: [
			
			{ y: <%= v1%>, label: "All User" },
			{ y: <%= v2%>, label: "Active" },
			{ y: <%= v3%>, label: "In Active" },
			{ y: <%= v4%>, label: "Deleted" }
		]
	}]
};
calculatePercentage();
$("#chartContainer").CanvasJSChart(options);

function calculatePercentage() {
	var dataPoint = options.data[0].dataPoints;
	var total = dataPoint[0].y;
	for (var i = 0; i < dataPoint.length; i++) {
		if (i == 0) {
			options.data[0].dataPoints[i].percentage = 100;
		} else {
			options.data[0].dataPoints[i].percentage = ((dataPoint[i].y / total) * 100).toFixed(2);
		}
	}
}

}
</script>
   <style>
         .logincolor{
              border: 1px solid !important;
              border-color:#FF6700 !important;
              text-align:left;
              
              padding: 10px 10px !important;
          }
          .txtborderradius {

              border-radius:0rem !important;
              background-color:lightgray;
              height:35px;
              color:#000000;
          }
          .tdsize {
            
              padding: 10px 10px !important;
          }
          

.table-responsive {
    display: block;
    width: 100%;
    overflow-x: auto;
    text-align: left;
    -webkit-overflow-scrolling: touch;
}
    </style>
</head>
<body>
    
    <form id="form1" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server">

    </asp:ScriptManager>
        <uc1:head runat="server" ID="head" />

        
        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
            <!-- row -->
             <div class="container-fluid">
				<!-- Add Order -->
				
                
                <!-- row -->
                <div class="row">
                    <div class="col-xl-12 col-xxl-12">
                        <div class="card">
                          
                            <div class="card-body">
            <div class="row">
												<div class="col-12">
													<div class="skip-email text-center">
                                                        <div class="table-responsive">
														<table class="table mb-0">
                                    <thead>
                                    <tr style="background-color:#FF6700;color:white;">
                                        <th class="tdsize">Company</th>
                                        <td class="tdsize">Admins</td>
                                        <td class="tdsize">Users</td>
                                        <td class="tdsize">Jobs</td>
                                        <th class="tdsize">Interviews</th>
                                       <th class="tdsize">Minutes</th>
                                       <th class="tdsize">Plan</th>
                                      <th class="tdsize">Sign Up</th>
                                      <th class="tdsize">Details</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                      <%
                                          //int j=0;
                                          //int g = -1;
                                          int adminscount = 1;
                                          int userscount = 0;
                                          int jobscount = 0;
                                          int interviewscount = 0;
                                          int Minutescount = 500;
                                          string planname = "Basic";

                                          for (int k = 0; k < usrloginlist.Count; k++)
                                          {
                                              // j = j + 1;

                                              {  %>
                                    <tr>
                                     <%--   <td><%= j %></td>--%>
                                        <td class="logincolor"><%= usrloginlist[k].company_name %></td>
                                           <td class="logincolor"><%= adminscount %></td>
                                         <td class="logincolor"><%= userscount %></td>
                                       <td class="logincolor"><%= jobscount %></td>
                                         <td class="logincolor"><%= interviewscount %></td>
                                         <td class="logincolor"><%= Minutescount %></td>
                                         <td class="logincolor"><%= planname %></td>
                                         <td class="logincolor"><%= Convert.ToDateTime(usrloginlist[k].doc).ToString("dd/MM/yyyy") %></td>
                                         <td class="logincolor"> 
                                                         <a href="Company-Details?Edit=<%= usrloginlist[k].rec_id %>"> <i class="fa fa-edit" aria-hidden="true"></i> </a> 
                                      <%-- <a href="Company-Details?Del=<%= usrloginlist[k].rec_id %>"> <i class="fa fa-trash" aria-hidden="true"></i> </a>   
                                      --%>    
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













            <div class="container-fluid" style="display:none">
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
                        <div class="row">
                            <div class="col-xl-6 col-md-3"> </div>
                            <div class="col-xl-6 col-md-3" style="text-align:right;">

                                <select id="inputState" class="form-control default-select">
                                    <option selected>20 result per page</option>
                                    <option>30 result per page</option>
                                    <option>40 result per page</option>
                                    <option>50 result per page</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <hr />
                <div class="row">
                    <div class="col-xl-12 col-xxl-12">
                        <div class="row">
                            <div class="col-xl-12 col-md-3">All Customer: <%= AllJOB %>  &nbsp;&nbsp;&nbsp;&nbsp;Active : <%= ActiveJob %> &nbsp;&nbsp;&nbsp;&nbsp;In active :<%= OnHoldJOb %> &nbsp;&nbsp;&nbsp;&nbsp;Deleted :<%= ClosedJob %></div>
                            <div class="col-xl-6 col-md-3">
                                <center>    <img src="./images/line1.png" alt=""></center>

                                </div>
                            </div>
                        </div>
                    </div>
                <br />
                <br />
                            <div class="row">
                                
                                <div class="col-xl-12 col-xxl-12">
                                    <div class="row">
                                        <%
                                            int j=0;
                                            int g = -1;
                                            string statusjob = "";
                                            for (int k = 0; k < JobpostList.Count; k++)
                                            {
                                                j = j + 1;

                                                { 
                                                     if (JobpostList[k].active == true) 
                                                statusjob="Active";
                                        
                                                    
                                                    
                                                     %>

                                       






                                        <div class="col-xl-3 col-xxl-6 col-lg-3 col-sm-6">
                                            <div class="card">
                                                <div class="card-body">
                                                    <div class="d-flex align-items-end">
                                                        <div>
                                                            <span style="color:green;"><%= statusjob %></span>
                                                            <span class="fs-35 text-black font-w10">

                                                                <h4><%= JobpostList[k].company_name %></h4>
                                                                <h6><%= JobpostList[k].company_name %></h6>
                                                             <%--   <img src="images/profile/p1.jpg" alt="" width="42" class="rounded-circle mr-2">
                                                                <img src="images/profile/p2.jpg" alt="" width="42" class="rounded-circle mr-2">
                                                                <img src="images/profile/p3.jpg" alt="" width="42" class="rounded-circle mr-2">--%>
                                                              <%--  <a href="candidate-interview-list?type=<%= JobpostList[k].rec_id %>" class="text-black" style="font-size:10px;">View All</a>--%>
                                                                <br />
                                                                <br />


                                                            </span>
                                                            <table style="width:100%">
                                                                <tr><td style="font-size:11px;"><%--<i class="las la-sms"></i><%--<%= getcountinterview(JobpostList[k].rec_id.ToString()) %>--%> interviews--%></td>
                                                                <td style="font-size:11px;text-align:right;">
                                                                    <%--<a href="Email-Send?emailhidden2=<%= JobpostList[k].rec_id %>"> <i class="fa fa-share-alt fa-lg"></i></a>--%>
                                                                  <%--  <span class="badge badge-sm light badge-primary"><i class="las la-clock"></i>2 weeks left</span>--%></td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                        <!--<canvas class="lineChart" id="chart_widget_2" height="85"></canvas>-->
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <%}} %>
                                        
                                        
                                        


                                        
                                        
                                        
                                        

                                  <table style="width:100%">
                                      <tr >
                                          <td style="width:40%"></td>
                                          <td style="width:40%"><div class="card-body" style="text-align:center;">



    <center>
        <nav>
            <ul class="pagination pagination-xs">
                <li class="page-item page-indicator">
                    <a class="page-link" href="javascript:void(0)">
                        <i class="la la-angle-left"></i>
                    </a>
                </li>
                <li class="page-item active">
                    <a class="page-link" href="javascript:void(0)">1</a>
                </li>
               <%-- <li class="page-item"><a class="page-link" href="javascript:void(0)">2</a></li>
                <li class="page-item"><a class="page-link" href="javascript:void(0)">3</a></li>
                <li class="page-item"><a class="page-link" href="javascript:void(0)">4</a></li>
                <li class="page-item"><a class="page-link" href="javascript:void(0)">5</a></li>
                <li class="page-item"><a class="page-link" href="javascript:void(0)">6</a></li>--%>
                <li class="page-item page-indicator">
                    <a class="page-link" href="javascript:void(0)">
                        <i class="la la-angle-right"></i>
                    </a>
                </li>
            </ul>
        </nav>
    </center>
</div></td>
                                          <td style="width:20%"></td>
                                      </tr>
                                  </table>
                                            
                                        
                                    </div>
                                  
                                </div>
                                
                                
                                </div>
                <div class="row">
                    <div class="col-xl-4 col-xxl-4">
                        <div class="row">

                            <div class="col-xl-12 col-md-6">
                                <div class="card">
                                    <div class="card-header border-0 pb-0">
                                        <h4 class="fs-20">Inactive Company </h4>

                                    </div>
                                    <div class="card-body pb-0 dz-scroll height530 loadmore-content" id="latestSalesContent">
                                         <%
                                          int m=0;
                                          int gk = -1;
                                          for (int l = 0; l< JobpostList1.Count; l++)
                                          {
                                              m = m + 1;
                                           
                                              {  %>


                                        <div class="pb-3 mb-3 border-bottom">
                                            <p class="font-w600"><a href="candidate-interview-list?type=<%= JobpostList1[l].rec_id %>" class="text-black"><%= JobpostList1[l].company_name %></a></p>
                                            <div class="d-flex align-items-end">
                                                <!--<img src="images/profile/20.jpg" alt="" width="42" class="rounded-circle mr-2">-->
                                                <div class="mr-auto">
                                                    <h4 class="fs-14 mb-0"><a href="candidate-interview-list?type=<%= JobpostList1[l].rec_id %>" class="text-black">Published : <%= JobpostList1[l].doc %>   </a></h4>
                                                    <span class="fs-12">28 interview</span>
                                                </div>
                                                <!--<span class="badge badge-sm light badge-primary">4 Ticket</span>-->
                                            </div>
                                        </div>


                                        
                                        <%}} %>
                                        
                                        
                                        

                                    </div>
                                    <!--<div class="card-footer text-center border-0">
                            <a class="btn btn-primary btn-sm dz-load-more" id="latestSales" href="javascript:void(0)" rel="ajax/latest-sales.html">View More</a>
                        </div>-->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-8 col-xxl-8">
                        <div class="row">

                            <div class="col-xl-12 col-md-6">
                                <div class="card">
                                    <div class="card-header border-0 pb-0">
                                        <h4 class="fs-20">Funnel</h4>

                                    </div>
                                    <%--<img src="images/funal.png" alt="" width="100%" >--%>
                                    <div id="chartContainer" style="height: 500px; width: 100%;"></div>
                                    
                                    <!--<div class="card-footer text-center border-0">
                            <a class="btn btn-primary btn-sm dz-load-more" id="latestSales" href="javascript:void(0)" rel="ajax/latest-sales.html">View More</a>
                        </div>-->
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
                        </div>

                            </div>
                        </div>
                    </div>
                 </div>
            </div>





















 <!-- Main content end here -->
  
        <uc1:foot runat="server" id="foot" />

             
<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
    </form>

 
    
</body>
</html>
