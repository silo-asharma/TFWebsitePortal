<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="exportimportbidcp.app.dashboard" EnableEventValidation="false" %>

<%@ Register Src="~/Admin/UC/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/Admin/UC/foot.ascx" TagPrefix="uc1" TagName="foot" %>
<%@ Register Src="~/Admin/UC/header.ascx" TagPrefix="uc1" TagName="header" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="assets/js/jquery.js"></script>
    <%-- 
    <script src="assets/js/chart-project.js"></script>--%>
    <uc1:header runat="server" ID="header" />
    <%--<script>
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


    </script>--%>

    <style>
        /*.deznav{
            position:relative !important;
            top:0 !important;
        }
        .img-modal{
            height:250px;
        }

        .content-body {

            position:absolute;
            top:0;
        }

        .introjs-tooltip{
            min-width:330px !important;
        }*/


        .img-modal img {
            height: 100%;
            object-fit: cover;
            width: 100%;
            border-top-left-radius: 1.25rem;
            border-bottom-left-radius: 1.25rem;
        }

        .input-field {
            background: #95d0e259;
        }

        .send-button {
            color: #fff;
            background-color: #95d0e2;
            border-color: #95d0e2;
        }

        .content-box .form-control {
            height: 35px;
        }

        .close-modal-btn {
            position: absolute;
            right: 30px;
            top: 5px;
            background: #eee;
            border-radius: 50%;
            width: 30px;
            border: none;
            height: 30px;
        }


        @media only screen and (max-width: 1199px) {

            .grid-table {
                width: 100%;
            }

            .grid-table-row {
                display: flex;
                flex-direction: column;
            }

            .grid-table-row-one {
                width: 100% !important;
            }

            .grid-table-row-two {
                width: 100% !Important;
            }
        }

        .h4el {
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }
    </style>
 <%--   <script src="https://cdn.jsdelivr.net/npm/intro.js@7.0.1/intro.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/intro.js@7.0.1/minified/introjs.min.css" rel="stylesheet">--%>


<script>
    
    function getValuefromParamter() {
        const searchParams = new URLSearchParams(window.location.search);
        //alert(searchParams.has('sort'));
        if (searchParams.has('sort'))
        {
            var valfromParam = searchParams.get('sort'); // price_descending

          //  alert(valfromParam);

            document.getElementById("HiddenField2").innerText = valfromParam;
            var hidProfilepic = document.getElementById("HiddenField2");
            if (hidProfilepic.value == "1")
            {
                //alert(hidProfilepic.innerText);
            }
        }
    }
    window.onload = function () {
        getValuefromParamter();
    };
</script>
    <script type="text/javascript">
    var skip = 0;
    var take = 6;
    var loading = false;

    function loadJobs() {
        if (loading) return;
        loading = true;
        document.getElementById("loader").style.display = "block";
        const yourComprecid = 3;
        $.ajax({
            type: "POST",
            url: "dashboard.aspx/GetJobs",
            data: JSON.stringify({ skip: skip, take: take, comprecid: yourComprecid }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                var jobs = response.d;
                if (jobs.length === 0) {
                    $(window).off("scroll");
                    $('#loader').hide();
                    return;
                }

                jobs.forEach(function (job) {
                    var status = job.active ? "Active" : (job.short_jobdesc === "Hold" ? "On Hold" : "");
                    var daysLeft = "0";
                    try {
                        var deadline = new Date(job.job_deadline_date);
                        var now = new Date();
                        var diffDays = Math.floor((deadline - now) / (1000 * 60 * 60 * 24));
                        daysLeft = diffDays >= 0 ? diffDays : "0";
                    } catch (e) { }

                    let titleWords = job.job_title.split(' ');
                    let displayTitle = '';
                    for (let i = 0; i < titleWords.length; i++) {
                        if (i === 2 || i === 4 || i === 6) {
                            displayTitle += '<br>' + titleWords[i] + ' ';
                        } else {
                            displayTitle += titleWords[i] + ' ';
                        }
                    }

                    var html = `
                <div class="col-xl-3 col-xxl-4 col-lg-3 col-sm-6">
                    <div class="card">
                        <div class="card-body">
                            <div>
                                <span style="color: ${status === 'Active' ? 'green' : 'red'};">${status}</span>
                                <span class="fs-35 text-black font-w10">
                                    <h4 class="h4el">${displayTitle}</h4>
                                    <div style="margin-top: ${titleWords.length < 3 ? '50px' : '10px'}">
                                        <a href="candidate-interview-list?type=${job.rec_id}" class="text-black" style="font-size: 10px;">View All</a>
                                    </div>
                                    <br/>
                                </span>
                                <table class="grid-table" style="width: 300px">
                                    <tr class="grid-table-row">
                                        <td class ="grid-table-row-one" style="font-size: 11px; width: 30%;">{job.interviewCount} interviews</td>
                                        <td class="grid-table-row-two" style="font-size: 11px; text-align: left; width: 70%;">
                                            <a href="add-job?edit=${job.rec_id}" title="Edit"><i class="fa fa-edit fa-lg"></i></a>
                                            ${status === 'On Hold' ?
                                                    `<a href="Dashboard?Reactivate=${job.rec_id}" title="Reactivate"><i class="fa fa-play fa-lg"></i></a>` :
                                                    `<a href="add-job?Hold=${job.rec_id}" title="Hold"><i class="fa fa-pause fa-lg"></i></a>`}
                                            <a href="add-job?Del=${job.rec_id}" title="Closed"><i class="fa fa-times fa-lg"></i></a>
                                            <a href="Email-Send?emailhidden3=${job.rec_id}" title="Share"><i class="fa fa-share-alt fa-lg"></i></a>
                                            <span class="badge badge-sm light badge-primary"><i class="las la-clock"></i>${daysLeft} days left</span>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>`;

                    $("#jobContainer").append(html);
                });

                skip += take;
                loading = false;
                $("#loader").hide();
            },
            error: function (err) {
                console.log(err);
                loading = false;
                $("#loader").hide();
            }
        });
    }


    function formatDate(input) {
        const date = new Date(input);
        const options = { year: 'numeric', month: 'short', day: 'numeric' };
        return date.toLocaleDateString(undefined, options);
    }

    $(document).ready(function () {
        loadJobs(); // initial load

        $(window).scroll(function () {
            if ($(window).scrollTop() + $(window).height() >= $(document).height() - 150) {
                loadJobs(); // load more
            }
        });
    });
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
        <div class="content-body" style="margin-top: 45px; padding-top: 45px;">
            <!-- row -->
            <div class="container-fluid" style="margin-top: 0px; padding-top: 0px;">
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
                            <div class="col-xl-6 col-md-3">
                                <br />
                                <b>Dashboard</b></div>
                            <div class="col-xl-6 col-md-3" style="text-align: right;">

                                <asp:TextBox ID="txtSearch" class="form-control" runat="server" OnTextChanged="txtSearch_TextChanged" AutoPostBack="true" placeholder="Search Job.." Font-Size="Small"></asp:TextBox>



                            </div>
                        </div>
                    </div>
                </div>
                <hr />
                <div class="row">
                    <div class="col-xl-12 col-xxl-12">
                        <div class="row">
                            <div class="col-md-12">All Jobs: <%= AllJOB %>  &nbsp;&nbsp;&nbsp;&nbsp;Active: <%= ActiveJob %> &nbsp;&nbsp;&nbsp;&nbsp;On Hold: <%= OnHoldJOb %> &nbsp;&nbsp;&nbsp;&nbsp;Closed: <%= ClosedJob %></div>
                            <div class="col-md-12">
                                <div class="orangeline"></div>

                            </div>
                        </div>
                    </div>
                </div>
                <%--  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
        Launch demo modal
    </button>--%>

                <!-- Modal -->
                
                <br />
                <br />
                <div class="row">

                    <div class="col-xl-12 col-xxl-12" style="display:none">
                        <div class="row">
                            <%
                                int j = 0;
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
                                string resulttitledisplay = "";
                                int loopvalue = 6;
                                string valloop = "";
                                if (Request.QueryString["sort"] != null)
                                {
                                    valloop=Request.QueryString["sort"].ToString();
                                   
                                    if (valloop == "ALL")
                                    {
                                        loopvalue = JobpostList.Count;
                                    }
                                    else
                                        loopvalue = 6;
                                }
                                 if (txtSearch.Text != "")
                                    {
                                        loopvalue = JobpostList.Count;
                                    }
                                for (int k = 0; k < loopvalue; k++)
                                {
                                    resulttitledisplay = "";
                                    j = j + 1;
                                    url1 = "images/profile/pro1.jpg";
                                    url2 = "images/profile/pro1.jpg";
                                    url3 = "images/profile/pro1.jpg";
                                    {
                                        if (JobpostList[k].active == true)
                                            statusjob = "Active";
                                        else if (JobpostList[k].short_jobdesc == "Hold")
                                            statusjob = "On Hold";

                                        recid = Convert.ToInt32(JobpostList[k].rec_id);
                                        canloginListimage = context.candidate_login.Where(c => c.active == 1 && c.job_apply_id == recid).OrderByDescending(c => c.rec_id).Take(3).ToList();
                                        if (canloginListimage != null)
                                        {
                                            for (int mn = 0; mn < canloginListimage.Count; mn++)
                                            {
                                                if (mn == 0)
                                                    url1 = ImageDisplay + canloginListimage[mn].candidate_profile_pic_url;
                                                if (mn == 1)
                                                    url2 = ImageDisplay + canloginListimage[mn].candidate_profile_pic_url;
                                                if (mn == 2)
                                                    url3 = ImageDisplay + canloginListimage[mn].candidate_profile_pic_url;
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
                                        if (countword1 > 2)
                                        {
                                            resulttitle = JobpostList[k].job_title.Split(' ');

                                            for (int mk = 0; mk < resulttitle.Count(); mk++)
                                            {
                                                if (mk == 2 || mk == 4 || mk == 6)
                                                    resulttitledisplay += "</br>" + resulttitle[mk] + " ";
                                                else
                                                    resulttitledisplay += resulttitle[mk] + " ";
                                            }
                                        }
                                        else
                                        {
                                            resulttitledisplay = JobpostList[k].job_title;
                                        }

                            %>








                            <div class="col-xl-3 col-xxl-4 col-lg-3 col-sm-6">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="">
                                            <div>
                                                <span style="color: green;"><%= statusjob %></span>
                                                <span class="fs-35 text-black font-w10">

                                                    <h4 class="h4el"><%= resulttitledisplay %></h4>
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
                                                            marbval = "10px";
                                                        }
                                                    %>

                                                    <div style="margin-top: <%=marbval %>">

                                                     <%--   <img src="<%= url1 %>" alt="" width="42" height="42" class="rounded-circle mr-2">
                                                        <img src="<%= url2 %>" alt="" width="42" height="42" class="rounded-circle mr-2">
                                                        <img src="<%= url3 %>" alt="" width="42" height="42" class="rounded-circle mr-2">
                                                      --%>  <a href="candidate-interview-list?type=<%= JobpostList[k].rec_id %>" class="text-black" style="font-size: 10px;">View All</a>

                                                    </div>

                                                    <br />


                                                </span>

                                                <table class="grid-table" style="width: 300px">
                                                    <tr class="grid-table-row">
                                                        <td class="grid-table-row-one" style="font-size: 11px; width: 30%;"> interviews</td>
                                                        <% if (JobpostList[k].active == false && JobpostList[k].short_jobdesc == "Hold")
                                                            { %>
                                                        <td class="grid-table-row-two" style="font-size: 11px; text-align: left; width: 70%;">

                                                            <a href="add-job?edit=<%= JobpostList[k].rec_id %>" title="Edit"><i class="fa fa-edit fa-lg"></i></a>
                                                            <a href="Dashboard?Reactivate=<%= JobpostList[k].rec_id %>" title="Reactivate"><i class="fa fa-play fa-lg"></i></a>
                                                            <a href="add-job?Del=<%= JobpostList[k].rec_id %>" title="Closed"><i class="fa fa-times fa-lg"></i></a>
                                                            <a href="Email-Send?emailhidden3=<%= JobpostList[k].rec_id %>" title="Share"><i class="fa fa-share-alt fa-lg"></i></a>
                                                            <span class="badge badge-sm light badge-primary"><i class="las la-clock"></i><%=daysleft %> days left</span>

                                                        </td>
                                                        <% }
                                                            else
                                                            { %>
                                                        <td class="grid-table-row-two" style="font-size: 11px; text-align: left; width: 70%;">

                                                            <a href="add-job?edit=<%= JobpostList[k].rec_id %>" title="Edit"><i class="fa fa-edit fa-lg"></i></a>
                                                            <a href="add-job?Hold=<%= JobpostList[k].rec_id %>" title="Hold"><i class="fa fa-pause fa-lg"></i></a>
                                                            <a href="add-job?Del=<%= JobpostList[k].rec_id %>" title="Closed"><i class="fa fa-times fa-lg"></i></a>
                                                            <a href="Email-Send?emailhidden3=<%= JobpostList[k].rec_id %>" title="Share"><i class="fa fa-share-alt fa-lg"></i></a>
                                                            <span class="badge badge-sm light badge-primary"><i class="las la-clock"></i><%=daysleft %> days left</span>

                                                        </td>
                                                        <%  } %>
                                                    </tr>
                                                </table>
                                            </div>
                                            <!--<canvas class="lineChart" id="chart_widget_2" height="85"></canvas>-->
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <%}
                                } if (loopvalue == 6)
                                { %>

                            <div  style="width: 98%;text-align: right;margin-bottom: 20px;margin-top: -5px;color: #101049;"><span><a style="color: #fff;
    background: #fe634e;
    padding: 10px 20px;
    border-radius: 100px;
    display: flex;
    justify-content: flex-end;
    align-items:center;
    float: right;" href="/admin/dashboard?sort=ALL"><i class="fa fa-eye mr-2"></i> View More</a></span></div>
                        <%} %>
                        </div>

                    </div>


                </div>
                <%--   <div class="col-xl-12 col-xxl-12">
                        <div class="row">
                            <div class="col-xl-6 col-md-3"><b>Closed Jobs</b></div>
                            
                        </div>
                    </div>--%>
                <div id="jobContainer" class="row"></div>
                <div id="loader" style="text-align:center; display:none;">
    <img src="/images/loading.gif" alt="Loading..." />
</div>
                <div class="row">


                    <%
                        int recidclosed = 0;
                        int m = 0;
                        int gk = -1;
                        int countword2 = 0;
                        string marbval1 = "5px";
                        string[] resulttitle1;
                        string resulttitledisplay1 = "";
                        int loopvalue2 = 3;
                         
                        string urlClosed1 = "images/profile/pro1.jpg";
                        string urlClosed2 = "images/profile/pro1.jpg";
                        string urlClosed3 = "images/profile/pro1.jpg";
                         if (valloop == "ALL")
                         {
                             loopvalue2 = JobpostList1.Count;
                         }
                          else
                             loopvalue2 = 3;
                          if (txtSearch.Text != "")
                                    {
                                        loopvalue2 = JobpostList1.Count;
                                    }

                        for (int l = 0; l < loopvalue2; l++)
                        {
                            resulttitledisplay1 = "";
                            m = m + 1;
                            urlClosed1 = "images/profile/pro1.jpg";
                            urlClosed2 = "images/profile/pro1.jpg";
                            urlClosed3 = "images/profile/pro1.jpg";
                            recidclosed = Convert.ToInt32(JobpostList1[l].rec_id);
                            canloginListClosedimage = context.candidate_login.Where(c => c.active == 1 && c.job_apply_id == recidclosed).OrderByDescending(c => c.rec_id).Take(3).ToList();

                            if (canloginListClosedimage != null)
                            {
                                for (int mn = 0; mn < canloginListClosedimage.Count; mn++)
                                {
                                    if (mn == 0)
                                        urlClosed1 = ImageDisplay + canloginListClosedimage[mn].candidate_profile_pic_url;
                                    if (mn == 1)
                                        urlClosed2 = ImageDisplay + canloginListClosedimage[mn].candidate_profile_pic_url;
                                    if (mn == 2)
                                        urlClosed3 = ImageDisplay + canloginListClosedimage[mn].candidate_profile_pic_url;
                                }

                            }
                            countword2 = CountWords(JobpostList1[l].job_title);
                            if (countword2 > 2)
                            {
                                resulttitle1 = JobpostList1[l].job_title.Split(' ');

                                for (int mkl = 0; mkl < resulttitle1.Count(); mkl++)
                                {
                                    if (mkl == 2 || mkl == 4 || mkl == 6)
                                        resulttitledisplay1 += "</br>" + resulttitle1[mkl] + " ";
                                    else
                                        resulttitledisplay1 += resulttitle1[mkl] + " ";
                                }
                            }
                            else
                            {
                                resulttitledisplay1 = JobpostList1[l].job_title;
                            }


                            {  %>


                    <div class="col-xl-3 col-xxl-4 col-lg-3 col-sm-4">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex align-items-end">
                                    <div>
                                        <span style="color: red;">Closed</span>
                                        <span class="fs-35 text-black font-w10">

                                            <h4><a href="candidate-interview-list?type=Back&&Closed=<%= JobpostList1[l].rec_id %>" class="text-black"><%= resulttitledisplay1%></a></h4>
                                            <div style="margin-top: <%=marbval %>">

                                           <%--     <img src="<%= urlClosed1 %>" alt="" width="42" height="42" class="rounded-circle mr-2">
                                                <img src="<%= urlClosed2 %>" alt="" width="42" height="42" class="rounded-circle mr-2">
                                                <img src="<%= urlClosed3 %>" alt="" width="42" height="42" class="rounded-circle mr-2">
                                             --%>   <a href="candidate-interview-list?type=Back&&Closed=<%= JobpostList1[l].rec_id %>" class="text-black" style="font-size: 10px;">View All</a>

                                            </div>
                                            <% if (countword2 < 3)
                                                {
                                                    marbval1 = "25px";
                                                }
                                                else
                                                {
                                                    marbval1 = "5px";


                                                } %>
                                            <br />


                                            <h4 class="fs-14 mb-0" style="margin-top: <%=marbval1 %>">
                                                <a href="#" class="text-black">Published: <%= Convert.ToDateTime(JobpostList1[l].doc).ToString("MMM dd, yyyy") %>   </a>

                                            </h4>


                                        </span>

                                    </div>
                                    <!--<canvas class="lineChart" id="chart_widget_2" height="85"></canvas>-->
                                </div>
                            </div>
                        </div>
                    </div>

                    <%}
                    } if (loopvalue == 6)
                                { %>

                            <div  style="width: 98%;text-align: right;margin-bottom: 20px;margin-top: -5px;color: #101049;"><span><a style="color: #fff;
    background: #fe634e;
    padding: 10px 20px;
    border-radius: 100px;
    display: flex;
    justify-content: flex-end;
    align-items:center;
    float: right;" href="/admin/dashboard?sort=ALL"><i class="fa fa-eye mr-2"></i> View More</a></span></div>
                        <%} %>
                </div>
                <table style="width: 100%">
                    <tr>
                        <td style="width: 40%"></td>
                        <td style="width: 40%">
                            <div class="card-body" style="text-align: center;">



                                <center>
        <nav>
            <ul class="pagination pagination-xs" >
                <li class="page-item page-indicator">
                    <a class="page-link" href="javascript:void(0)">
                        <%--<i class="la la-angle-left"></i>--%>
                    </a>
                </li>
                <li class="page-item active">
                    <a class="page-link" href="javascript:void(0)">1</a>
                </li>
                <li class="page-item"><a class="page-link" href="javascript:void(0)">2</a></li>
                <li class="page-item"><a class="page-link" href="javascript:void(0)">3</a></li>
                <li class="page-item"><a class="page-link" href="javascript:void(0)">4</a></li>
                <li class="page-item"><a class="page-link" href="javascript:void(0)">5</a></li>
                <li class="page-item"><a class="page-link" href="javascript:void(0)">6</a></li>
                <li class="page-item page-indicator">
                    <a class="page-link" href="javascript:void(0)">
                      <%--  <i class="la la-angle-right"></i>--%>
                    </a>
                </li>
            </ul>
        </nav>
    </center>
                            </div>
                        </td>
                        <td style="width: 20%"></td>
                    </tr>
                </table>
                <table style="width: 100%">
                    <tr>
                        <td style="width: 40%"></td>
                        <td style="width: 40%">
                            <div class="card-body" style="text-align: center;">



                                <center>
        <nav>
            <ul class="pagination pagination-xs" style="display:none">
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
                            </div>
                        </td>
                        <td style="width: 20%"></td>
                    </tr>
                </table>

                <div class="col-xl-12 col-xxl-12" style="display: none">
                    <div class="row">

                        <div class="col-xl-12 col-md-6">
                            <div class="card">
                                <div class="card-header border-0 pb-0">
                                    <h4 class="fs-20"></h4>

                                </div>
                                <%--<img src="images/funal.png" alt="" width="100%" >--%>
                                <%--<div id="chartContainer" style="height: 500px; width: 100%; display: none;"></div>--%>

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























        <asp:HiddenField ID="HiddenField2" runat="server" />
        <!-- Main content end here -->

        <uc1:foot runat="server" ID="foot" />


        <%--<script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>--%>
    </form>

    <script>
        var hidProfilepic = document.getElementById("HiddenField2");
        if (hidProfilepic.value == "1")
        { }
       
    </script>




</body>
</html>
