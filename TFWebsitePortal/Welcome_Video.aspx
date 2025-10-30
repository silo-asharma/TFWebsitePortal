<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Welcome_Video.aspx.cs" Inherits="Extuent.Welcome_Video" %>

<%@ Register Src="~/UC/footer-inner.ascx" TagPrefix="uc1" TagName="footerinner" %>
<%@ Register Src="~/UC/footer.ascx" TagPrefix="uc1" TagName="footer" %>
<%@ Register Src="~/UC/header.ascx" TagPrefix="uc1" TagName="header" %>
<%@ Register Src="~/UC/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/UC/headnewui.ascx" TagPrefix="uc1" TagName="headnewui" %>
<%@ Register Src="~/UC/footernewui.ascx" TagPrefix="uc1" TagName="footernewui" %>
<%@ Register Src="~/UC/headernewui.ascx" TagPrefix="uc1" TagName="headernewui" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <title></title>
    <uc1:headnewui runat="server" ID="headnewui1" />
</head>
<body>
  <form id="form1" runat="server">
        <!--start page Loader -->
        <uc1:headernewui runat="server" ID="headernewui" />
       
        <div id="main-wrapper">



        <div class="content-body1">

            <!-- Add Order -->

            <div class="row">


         <div class="col-xl-12 col-xxl-12">
          
                   
              <section >
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-6">
                                    <div class="text-center">
                                        <h4>Introduction Video : Extuent</h4>
                                           <img src="images/welvideo.png" alt="" class="img-fluid">
                                       
                                        <div class="mt-5">
                                           
                                      
                                          <%--  <!-- <h1 class="fw-bold display-1">404</h1> -->
                                            <h3 class="text-uppercase mt-3">Interview Successfully Completed </h3>
                                            <p class="text-muted" style="font-weight:bold">You have successfully completed your interview, you can exit the interview process, <br /> by clicking "Exit Interview" button below..<br />
</p>--%>
                                            <div class="mt-4">
                                                <center><asp:Button ID="btnlogin" runat="server" Text="Skip" style="width:150px;border-color:#FF7416;color:white;height:35px;border-radius:12px" class="bg-orange"/>
                                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                       <asp:Button ID="Button1" runat="server" Text="Next" style="width:150px;border-color:#FF7416;color:white;height:35px;border-radius:12px"  class="bg-orange"/>
                               </center> 

                                                <br />
                                                <center><span>Need help with your interview? <a href="#" style="color:#FF7416">Contact Support</a> </span></center>
                                                 <center><br /> <a href="#" style="color:#FF7416">View Help Articles</a> </center>
                                              
                                            </div>
                                        </div>

                                    </div>
                                </div><!--end col-->
                            </div><!--end row-->
                        </div><!--end container-->
                    </section>
            <!-- end main content-->

        </div>
    


                
                </div>
            </div>
            </div>
        <br />
        <br />
        <br />
     
        <!--end back-to-top-->

        <!-- JAVASCRIPT -->
       


        <uc1:footerinner runat="server" ID="footerinner" />
        <uc1:footernewui runat="server" ID="footernewui" />
    </form>
</body>
</html>
