<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobDetails.aspx.cs" Inherits="Extuent.JobDetails" %>
<%@ Register Src="~/UC/footer-inner.ascx" TagPrefix="uc1" TagName="footerinner" %>
<%@ Register Src="~/UC/footer.ascx" TagPrefix="uc1" TagName="footer" %>
<%@ Register Src="~/UC/header.ascx" TagPrefix="uc1" TagName="header" %>
<%@ Register Src="~/UC/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/UC/headernewui.ascx" TagPrefix="uc1" TagName="headernewui" %>
<%@ Register Src="~/UC/headnewui.ascx" TagPrefix="uc1" TagName="headnewui" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <meta charSet="utf-8" />
    <title>Extuent</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="stylesheet" type="text/css" href="css_ext/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript">
        $( document ).ready(function() {

            /* Menu */
            $(".menu-link").click(function() {
                $(".navigation").slideToggle();
                return false;
            });

        });
    </script>
</head>
<body>
   <form id="form1" runat="server">
<%--        <uc1:headernewui runat="server" ID="headernewui" />--%>
            <!-- END SIGN-UP MODAL -->

        <!-- start header -->
<div class="header">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-auto">
                <!-- start logo -->
                <div class="logo">
                    <a href="index" title="Extuent"><img src="images/logo.png" width="241" height="42" alt="Extuent"></a>
                </div>
                <!-- end logo -->
            </div>
          
        </div>
    </div>
</div>
<!-- end header -->
<!-- start main-container -->
<div class="main-container">
    <div class="container">
        <!-- start page-heading -->
        <div class="page-heading">

        </div>
        <!-- end page-heading -->
        <!-- start job-listing -->
        <div class="job-listing">
           
            <div class="row">
                <%
                    int j=0;
                    int g = -1;
                    string postdesc="";
                    string fulldesc = "";
                    for (int k = 0; k < JobpostList.Count; k++)
                    {
                        j = j + 1;

                        if(JobpostList[k].job_desc_short!=null)
                        {
                            if (JobpostList[k].job_desc_short.Count() > 50)
                            {
                                postdesc = JobpostList[k].job_desc_short.ToString().Substring(0, 50);
                            }
                            else
                            {
                                postdesc = JobpostList[k].job_desc_short;
                            }

                        }
                        if (JobpostList[k].job_desc != null)
                        {
                            fulldesc = JobpostList[k].job_desc;
                            fulldesc = fulldesc.Replace ("list-style-type: none;", "");
                            fulldesc = fulldesc.Replace ("list-style-type: none", "");
                            fulldesc = fulldesc.Replace ("list-style-type:none;", "");
                             fulldesc = fulldesc.Replace ("list-style-type:none", "");
                            fulldesc = fulldesc.Replace ("list-style:none;", "");
                             fulldesc = fulldesc.Replace ("list-style:none", "");
                            fulldesc = fulldesc.Replace ("list-style: none;", "");
                            fulldesc = fulldesc.Replace ("list-style: none", "");
                        }

                        {  %>


                
                
                 
             <div class="job-listing">
            <div class="row">
                <div class="col-md-12 col-xl-12">
    
            
            
            <!-- start job-description -->

            <div class="job-description" style="background-color:white;">
                <h3>
         <%=  JobpostList[k].job_title  %>
                    <%--<a href="#" title="Share" class="share-link"><img src="images/icon_share.svg" width="24" height="24" alt="Share"></a>--%>
                </h3>
                <div class="tags">
                    <span><img src="images/icon_location.svg" width="24" height="24" alt="<%=  JobpostList[k].job_locations  %>"><%=  JobpostList[k].job_locations  %></span>
                    <span><img src="images/icon_fulltime.svg" width="24" height="24" alt=" <%=  JobpostList[k].job_type  %>"> <%=  JobpostList[k].job_type  %></span>
                </div>
                <div class="txtb">
                    <h4>Job Summary</h4>
                   <div><%=  JobpostList[k].job_desc_short  %></div>
              
                </div>
                <div class="txtb">
                    <h4>Job Description</h4>
                   <div><%=  fulldesc  %></div>
              
                </div>
                     <p>Deadline Date : <%= JobpostList[k].job_deadline_date %></p>
                <a href="Create_Profile?id=<%= JobpostList[k].rec_id%>" title="Register & Apply" class="btn">Register & Apply</a>
            </div>
            <!-- end job-description -->
    
</div>
                </div>
                 </div>

           <%} }%>


                
                
                
            </div>
        </div>
        <!-- end job-listing -->
        <!-- start page-pagination -->
     <%--   <div class="page-pagination">
            <ul class="pagination">
                <li class="page-item disabled">
                    <a class="page-link">
                        <img src="images/icon_previous.svg" width="24" height="24" alt="previous">
                    </a>
                </li>
                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                    <a class="page-link" href="#">
                        <img src="images/icon_next.svg" width="24" height="24" alt="Next">
                    </a>
                </li>
            </ul>
        </div>--%>
        <!-- end page-pagination -->
    </div>
</div>
<!-- end main-container -->
<!-- start footer -->
<div class="footer">
    <div class="container">
        <div class="row align-items-center">
            <div class="col">
                <!-- start footer-links -->
                <div class="footer-links" style="list-style-type:none;">
                   
                </div>
                <!-- end footer-links -->
            </div>
            <div class="col-auto">
                <div class="footer-logo">
                        
                        <!-- start imgb -->
                        <div class="imgb">
                         <p style="font-size:10px">Powered By</p>   <a href="index" title="Extuent"><img src="images/logo.png" style="width:80px;height:25px"  
                                    alt="Extuent"></a>
                        </div>
                        <!-- end imgb -->
                    </div>
            </div>
        </div>
    </div>
</div>
<!-- end footer -->
<!-- Modal -->









        
            <!-- end main content-->
   <%--    <uc1:footer runat="server" id="footer" />--%>
       
    </form>
</body>
</html>
