<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashboardList.aspx.cs" Inherits="Extuent.Admin.dashboardList" %>

<%@ Register Src="~/Admin/UC/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/Admin/UC/foot.ascx" TagPrefix="uc1" TagName="foot" %>
<%@ Register Src="~/Admin/UC/header.ascx" TagPrefix="uc1" TagName="header" %>


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
			
			{ y: <%= v1%>, label: "All Jobs" },
			{ y: <%= v2%>, label: "Active" },
			{ y: <%= v3%>, label: "On Hold" },
			{ y: <%= v4%>, label: "Closed" }
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

</head>
<body>
    
    <form id="form1" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server">

    </asp:ScriptManager>
        <uc1:head runat="server" ID="head" />

        
        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body" style="margin-top:45px;padding-top:45px;">
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
                        <div class="row">
                            <div class="col-xl-6 col-md-3"><br /> <b>Dashboard</b></div>
                            <div class="col-xl-6 col-md-3" style="text-align:right;">

                               <asp:TextBox ID="txtSearch" class="form-control" runat="server"  OnTextChanged="txtSearch_TextChanged"   AutoPostBack="true" placeholder="Search Job.."   Font-Size="Small"></asp:TextBox>
                                 
                           
                              
                            </div>
                        </div>
                    </div>
                </div>
                <hr />
                <div class="row">
                    <div class="col-xl-12 col-xxl-12">
                        <div class="row">
                            <div class="col-xl-12 col-md-3">All Jobs: <%= AllJOB %>  &nbsp;&nbsp;&nbsp;&nbsp;Active: <%= ActiveJob %> &nbsp;&nbsp;&nbsp;&nbsp;On Hold: <%= OnHoldJOb %> &nbsp;&nbsp;&nbsp;&nbsp;Closed: <%= ClosedJob %></div>
                            <div class="col-xl-6 col-md-3">
                                <center>    <img src="./images/line1.png" alt=""></center>

                                </div>
                            </div>
                        </div>
                    </div>
                <br />
                <br />
                        
                                
                             
                            
                                        <table class="table table-striped"  style="background-color:white; padding: 0;margin: 0;    border: 1px;    ">

                                            

                                        <%
                                            int j=0;
                                            int g = -1;
                                            string statusjob = "";
                                            int recid = 0;
                                            string url1 = "images/profile/pro1.jpg";
                                            string url2 = "images/profile/pro1.jpg";
                                            string url3 = "images/profile/pro1.jpg";
                                            string daysleft = "";
                                            //string[] splt = "";
                                            int countword1 = 0;
                                            string marbval = "30px";
                                               string[] resulttitle;
                                            string resulttitledisplay="";
                                            for (int k = 0; k < JobpostList.Count; k++)
                                            {
                                                resulttitledisplay="";
                                                j = j + 1;
                                                url1 = "images/profile/pro1.jpg";
                                                url2 = "images/profile/pro1.jpg";
                                                url3 = "images/profile/pro1.jpg";
                                                {
                                                    if (JobpostList[k].active == true)
                                                        statusjob="Active";
                                                    else if(JobpostList[k].short_jobdesc=="Hold")
                                                        statusjob="On Hold";

                                                    recid = Convert.ToInt32(JobpostList[k].rec_id);
                                                    canloginListimage=context.candidate_login.Where(c => c.active == 1 && c.job_apply_id==recid).OrderByDescending(c => c.rec_id).Take(3).ToList();
                                                    if (canloginListimage != null)
                                                    {
                                                        for (int mn = 0; mn < canloginListimage.Count; mn++)
                                                        {
                                                            if (mn == 0)
                                                                url1 = ImageDisplay+canloginListimage[mn].candidate_profile_pic_url;
                                                            if (mn == 1)
                                                                url2 = ImageDisplay+canloginListimage[mn].candidate_profile_pic_url;
                                                            if (mn == 2)
                                                                url3 = ImageDisplay+canloginListimage[mn].candidate_profile_pic_url;
                                                        }

                                                    }
                                                    if (JobpostList[k].job_deadline_date != null)
                                                    {
                                                        try
                                                        {
                                                            if (Convert.ToInt32((Convert.ToDateTime(JobpostList[k].job_deadline_date) - DateTime.Now).TotalDays) >= 0)
                                                            {
                                                                daysleft = Convert.ToString(Convert.ToInt32((Convert.ToDateTime(JobpostList[k].job_deadline_date) - DateTime.Now).TotalDays));
                                                            }
                                                            else
                                                                daysleft = "0";

                                                        }
                                                        catch { daysleft = "0"; }
                                                    }



                                                    countword1 = CountWords(JobpostList[k].job_title);
                                                        if(countword1>2)
                                                         {
                                                            resulttitle = JobpostList[k].job_title.Split(' ');

                                                            for(int mk=0;mk<resulttitle.Count();mk++)
                                                            {
                                                                if(mk==2 || mk==4 || mk==6)
                                                                 resulttitledisplay +="</br>"+resulttitle[mk]+" ";
                                                                else
                                                                resulttitledisplay +=resulttitle[mk]+" ";
                                                            }
                                                        }
                                                        else 
                                                        {
                                                            resulttitledisplay=JobpostList[k].job_title;
                                                        }

                                                     %>

                                       





                                            <tr style="border-radius: 10px 0 0 10px;">
                                                <td>
                                                      <span style="color:green;font-size:12px"><%= statusjob %></span>
                                                     <h6><%= resulttitledisplay %></h6>
                                                </td>
                                                <td>
                                                    <span class="fs-35 text-black font-w10">
                                                                
                                                               
                                                             <%--   <h6><%= JobpostList[k].employer_login_rec_id %></h6>--%>
                                                                <% if (countword1 < 3)
                                                                    {
                                                                        marbval = "50px";
                                                                    }
                                                                    //else if (countword1 == 3 && JobpostList[k].job_title.Count() < 26)
                                                                    //{
                                                                    //    marbval = "50px";
                                                                    //}
                                                                    else
                                                                    {
                                                                        marbval = "30px";
                                                                    }
                                                                   %>
                                                            
                                                                <div style="margin-top:<%=marbval %>">

                                                                <img src="<%= url1 %>" alt="" width="42" height="42" class="rounded-circle mr-2">
                                                                <img src="<%= url2 %>" alt="" width="42" height="42"  class="rounded-circle mr-2">
                                                                <img src="<%= url3 %>" alt="" width="42" height="42" class="rounded-circle mr-2">
                                                                <a href="candidate-interview-list?type=<%= JobpostList[k].rec_id %>" class="text-black" style="font-size:10px;">View All</a>
                                                               
                                                                </div>
                                                              
                                                                <br />
                                                                

                                                            </span>

                                                </td>
                                              
                                                  
                                                                   
                                                                <% if (JobpostList[k].active == false && JobpostList[k].short_jobdesc == "Hold")
                                                                    { %>
                                                                    <td style="font-size:16px;text-align:left;">

                                                                    &nbsp;&nbsp; <a href="add-job?edit=<%= JobpostList[k].rec_id %>" title="Edit"><i class="fa fa-edit fa-lg"></i></a>
                                                                     <a href="Dashboard?Reactivate=<%= JobpostList[k].rec_id %>" title="Reactivate"> <i class="fa fa-play fa-lg"></i></a>
                                                                     <a href="add-job?Del=<%= JobpostList[k].rec_id %>" title="Closed"> <i class="fa fa-times fa-lg"></i></a>
                                                                    <a href="Email-Send?emailhidden3=<%= JobpostList[k].rec_id %>" title="Share"> <i class="fa fa-share-alt fa-lg"></i></a>
                                                                   

                                                                </td>
                                                                    <% }
                                                                                                                  else
                                                                                                                  { %>
                                                                 <td style="font-size:16px;text-align:left;">

                                                                    &nbsp;&nbsp; <a href="add-job?edit=<%= JobpostList[k].rec_id %>" title="Edit"><i class="fa fa-edit fa-lg"></i></a>
                                                                     <a href="add-job?Hold=<%= JobpostList[k].rec_id %>" title="Hold"> <i class="fa fa-pause fa-lg"></i></a>
                                                                     <a href="add-job?Del=<%= JobpostList[k].rec_id %>" title="Closed"> <i class="fa fa-times fa-lg"></i></a>
                                                                    <a href="Email-Send?emailhidden3=<%= JobpostList[k].rec_id %>" title="Share"> <i class="fa fa-share-alt fa-lg"></i></a>
                                                                    

                                                                </td>
                                                                    <%  } %>

                                                                     <td style="font-size:14px;"><%= getcountinterview(JobpostList[k].rec_id.ToString()) %> interviews</td>
                                                                    <td><span class="badge badge-sm light badge-primary"><i class="las la-clock"></i><%=daysleft %> days left</span></td>
                                                               
                                                
                                               

                                            </tr>
                                       

                                        <%}} %>
                                        
                                        
                                        


                                        
                                        
                                        
                                        

                                
                                                    </table>
                                        
                        
                                  
                               
             <%--   <div class="col-xl-12 col-xxl-12">
                        <div class="row">
                            <div class="col-xl-6 col-md-3"><b>Closed Jobs</b></div>
                            
                        </div>
                    </div>--%>
              <br />
           <table class="table table-striped"  style="background-color:white; padding: 0;margin: 0;    border: 1px; ">

                                            


                     <%
                          int recidclosed = 0;
                         int m=0;
                         int gk = -1;
                         int countword2 = 0;
                         string marbval1 = "5px";
                         string[] resulttitle1;
                         string resulttitledisplay1="";
                             string urlClosed1 = "images/profile/pro1.jpg";
                             string urlClosed2 = "images/profile/pro1.jpg";
                             string urlClosed3 = "images/profile/pro1.jpg";
                         for (int l = 0; l< JobpostList1.Count; l++)
                         {
                             resulttitledisplay1 = "";
                             m = m + 1;
                                                urlClosed1 = "images/profile/pro1.jpg";
                                                urlClosed2 = "images/profile/pro1.jpg";
                                                urlClosed3 = "images/profile/pro1.jpg";
                                               recidclosed = Convert.ToInt32(JobpostList1[l].rec_id);
                                                canloginListClosedimage=context.candidate_login.Where(c => c.active == 1 && c.job_apply_id==recidclosed).OrderByDescending(c => c.rec_id).Take(3).ToList();
                                                    
                                                   if (canloginListClosedimage != null)
                                                    {
                                                        for (int mn = 0; mn < canloginListClosedimage.Count; mn++)
                                                        {
                                                            if (mn == 0)
                                                                urlClosed1 = ImageDisplay+canloginListClosedimage[mn].candidate_profile_pic_url;
                                                            if (mn == 1)
                                                                urlClosed2 = ImageDisplay+canloginListClosedimage[mn].candidate_profile_pic_url;
                                                            if (mn == 2)
                                                                urlClosed3 = ImageDisplay+canloginListClosedimage[mn].candidate_profile_pic_url;
                                                        }

                                                    }
                             countword2 = CountWords(JobpostList1[l].job_title);
                             if(countword2>2)
                             {
                                 resulttitle1 = JobpostList1[l].job_title.Split(' ');

                                 for(int mkl=0;mkl<resulttitle1.Count();mkl++)
                                 {
                                     if(mkl==2 || mkl==4 || mkl==6)
                                         resulttitledisplay1 +="</br>"+resulttitle1[mkl]+" ";
                                     else
                                         resulttitledisplay1 +=resulttitle1[mkl]+" ";
                                 }
                             }
                             else
                             {
                                 resulttitledisplay1=JobpostList1[l].job_title;
                             }


                             {  %>
               <tr>
                    <td>
                                                            <span style="color:red;">Closed</span>
                                                            <span class="fs-35 text-black font-w10">

                                                                <h4><a href="candidate-interview-list?type=Back&&Closed=<%= JobpostList1[l].rec_id %>" class="text-black"><%= resulttitledisplay1%></a></h4>

                                                                </td>
                   <td>
                                                                        <div style="margin-top:<%=marbval %>">
                                                                            
                                                                <img src="<%= urlClosed1 %>" alt="" width="42" height="42" class="rounded-circle mr-2">
                                                                <img src="<%= urlClosed2 %>" alt="" width="42" height="42"  class="rounded-circle mr-2">
                                                                <img src="<%= urlClosed3 %>" alt="" width="42" height="42" class="rounded-circle mr-2">
                                                                <a href="candidate-interview-list?type=Back&&Closed=<%= JobpostList1[l].rec_id %>" class="text-black" style="font-size:10px;">View All</a>
                                                               
                                                                </div>
                                                                 <% if (countword2< 3) { 
                                                                     marbval1 = "25px";
                                                                     }
                                                                    else 
                                                                     {
                                                                     marbval1 = "5px";
                                                                     
                                                                     
                                                                    } %>
                                                                </td>
                                                               <td>
                                                                
                                                                <h4 class="fs-14 mb-0" style="margin-top:<%=marbval1 %>">
                                                                    <a href="#" class="text-black">Published: <%= Convert.ToDateTime(JobpostList1[l].doc).ToString("MMM dd, yyyy") %>   </a>

                                                                </h4>
                                                                   </td>

                                                     

                   </tr>

                     <%}} %>








                    </table>
                  <table style="width:100%">
                                      <tr >
                                          <td style="width:40%"></td>
                                          <td style="width:40%"><div class="card-body" style="text-align:center;">



    <center>
        <nav>
            <ul class="pagination pagination-xs">
                <li class="page-item page-indicator">
                    <a class="page-link" href="javascript:void(0)">
                        <%--<i class="la la-angle-left"></i>--%>
                    </a>
                </li>
                <li class="page-item active">
                  <%--  <a class="page-link" href="javascript:void(0)">1</a>--%>
                </li>
               <%-- <li class="page-item"><a class="page-link" href="javascript:void(0)">2</a></li>
                <li class="page-item"><a class="page-link" href="javascript:void(0)">3</a></li>
                <li class="page-item"><a class="page-link" href="javascript:void(0)">4</a></li>
                <li class="page-item"><a class="page-link" href="javascript:void(0)">5</a></li>
                <li class="page-item"><a class="page-link" href="javascript:void(0)">6</a></li>--%>
                <li class="page-item page-indicator">
                    <a class="page-link" href="javascript:void(0)">
                       <%-- <i class="la la-angle-right"></i>--%>
                    </a>
                </li>
            </ul>
        </nav>
    </center>
</div></td>
                                          <td style="width:20%"></td>
                                      </tr>
                                  </table>
                 <table style="width:100%">
                                      <tr >
                                          <td style="width:40%"></td>
                                          <td style="width:40%"><div class="card-body" style="text-align:center;">



    <center>
        <nav>
            <ul class="pagination pagination-xs">
                <li class="page-item page-indicator">
                    <a class="page-link" href="javascript:void(0)">
                       <%-- <i class="la la-angle-left"></i>--%>
                    </a>
                </li>
                <li class="page-item active">
                <%--    <a class="page-link" href="javascript:void(0)">1</a>--%>
                </li>
               <%-- <li class="page-item"><a class="page-link" href="javascript:void(0)">2</a></li>
                <li class="page-item"><a class="page-link" href="javascript:void(0)">3</a></li>
                <li class="page-item"><a class="page-link" href="javascript:void(0)">4</a></li>
                <li class="page-item"><a class="page-link" href="javascript:void(0)">5</a></li>
                <li class="page-item"><a class="page-link" href="javascript:void(0)">6</a></li>--%>
                <li class="page-item page-indicator">
                    <a class="page-link" href="javascript:void(0)">
                       <%-- <i class="la la-angle-right"></i>--%>
                    </a>
                </li>
            </ul>
        </nav>
    </center>
</div></td>
                                          <td style="width:20%"></td>
                                      </tr>
                                  </table>
                    
                    <div class="col-xl-12 col-xxl-12" style="display:none">
                        <div class="row">

                            <div class="col-xl-12 col-md-6">
                                <div class="card">
                                    <div class="card-header border-0 pb-0">
                                        <h4 class="fs-20"></h4>

                                    </div>
                                    <%--<img src="images/funal.png" alt="" width="100%" >--%>
                                    <div id="chartContainer" style="height: 500px; width: 100%;display:none;" ></div>
                                    
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
























 <!-- Main content end here -->
  
        <uc1:foot runat="server" id="foot" />

             
<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
    </form>

 
    
</body>
</html>
