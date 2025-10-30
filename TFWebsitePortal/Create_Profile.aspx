<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Create_Profile.aspx.cs" Inherits="Extuent.Create_Profile" EnableEventValidation="false" %>

<%--<%@ Register Src="~/UC/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/UC/header.ascx" TagPrefix="uc1" TagName="header" %>
<%@ Register Src="~/UC/footer.ascx" TagPrefix="uc1" TagName="footer" %>
<%@ Register Src="~/UC/footer-inner.ascx" TagPrefix="uc1" TagName="footerinner" %>
<%@ Register Src="~/UC/headernewui.ascx" TagPrefix="uc1" TagName="headernewui" %>
<%@ Register Src="~/UC/footernewui.ascx" TagPrefix="uc1" TagName="footernewui" %>
<%@ Register Src="~/UC/headnewui.ascx" TagPrefix="uc1" TagName="headnewui" %>
<%@ Register Src="~/UC/headerlatestui.ascx" TagPrefix="uc1" TagName="headerlatestui" %>
<%@ Register Src="~/UC/footerlatestui.ascx" TagPrefix="uc1" TagName="footerlatestui" %>--%>







<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

 <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="stylesheet" type="text/css" href="css_ext/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/multiple-select@1.5.2/dist/multiple-select.min.css">
    <script src="https://unpkg.com/multiple-select@1.5.2/dist/multiple-select.min.js"></script>
    <script type="text/javascript">
        $( document ).ready(function() {
           
            /* Menu */
            $(".menu-link").click(function() {
                $(".navigation").slideToggle();
                return false;
            });

            $('.continue').click(function(){
                $('.nav-tabs > .active').next('li').find('a').trigger('click');
            });
            $('.back').click(function(){
                $('.nav-tabs > .active').prev('li').find('a').trigger('click');
            });

            $('.btn-next2').click(function () {
                var tempva = 0;
                var vfirstname = document.getElementById("txtname");
                var vlastname = document.getElementById("txtlastname");
                var vemail = document.getElementById("txtemail");
                var vphoneno = document.getElementById("txtphoneNumber");
                var vaddress = document.getElementById("txtaddress");
                var vflvpic = document.getElementById("flvUploadProfilePic");
                var vflvResume = document.getElementById("flvResume");
                var btnsubmit = document.getElementById("Button6");
                var lblmsgemail = document.getElementById("lblStatus");

                var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                var maxFileSize = 5242880;//5mb= 5*1024*1024
                // Allowing file type
                var allowedExtensions =
                        /(\.jpg|\.jpeg|\.png)$/i;
                // Allowing file type
                var allowedExtensions1 =
                        /(\.pdf|\.doc|\.docx)$/i;
                
                
                
                if (vfirstname.value == "") {
                   // alert('First Name should not be blank');
                    document.getElementById("txtname").style.borderColor = "Red";
                    tempva = "1";
                    return;
                } else document.getElementById("txtname").style.borderColor = "Gray";



                if (vlastname.value == "") {
                   // alert('Last Name should not be blank');
                    document.getElementById("txtlastname").style.borderColor = "Red";
                    tempva = "1";
                    return;
                } else document.getElementById("txtlastname").style.borderColor = "Gray";

                if (vemail.value == "") {
                    // alert('Email should not be blank');
                    document.getElementById("txtemail").style.borderColor = "Red";
                    tempva = "1";
                    return;
                } else
                {
                    document.getElementById("txtemail").style.borderColor = "Gray";
                    if (vemail.value.match(mailformat)) {
                       
                        // document.getElementById("txtemail").style.borderColor = "Red";
                        tempva = "0";

                    }
                       
                    else {
                        
                        alert('Email format is not valid');
                        // document.getElementById("txtemail").style.borderColor = "Red";
                        tempva = "1";
                    }

                }
                if (lblmsgemail.innerHTML == "You have already applied for this position") {
                    //alert('Address should not be blank');
                    document.getElementById("txtemail").style.borderColor = "Red";
                    tempva = "1";
                } else document.getElementById("txtemail").style.borderColor = "Gray";

                 if (vphoneno.value == "") {
                   // alert('Phone No should not be blank');
                    document.getElementById("txtphoneNumber").style.borderColor = "Red";
                    tempva = "1";
                 } else document.getElementById("txtphoneNumber").style.borderColor = "Gray";

                 if (vaddress.value == "") {
                    //alert('Address should not be blank');
                     document.getElementById("txtaddress").style.borderColor = "Red";
                     tempva = "1";
                 } else document.getElementById("txtaddress").style.borderColor = "Gray";

                 

                 


                 if (vflvpic.value == "") {
                     tempva = "1";
                    alert('Profile Picture should not be blank');
                    return;
                }
                 else if (!allowedExtensions.exec(vflvpic.value)) {
                     tempva = "1";
                     alert('Invalid Profile File Type or Size. Kindly select .png or .jpeg / .jpg.');
                   
                    return;
                 }
                 else if (vflvpic.files[0].size > maxFileSize)
                 {
                     tempva = "1";
                     alert('Invalid Profile File Type or Size. Kindly select .png or .jpeg / .jpg.|Max file size 5 MB|');

                     return;

                 }
                 else if (vflvResume.value == "") {
                     tempva = "1";
                    alert('Resume should not be blank');
                    return;
                }
                 else if (!allowedExtensions1.exec(vflvResume.value)) {
                     tempva = "1";
                     alert('Invalid Resume File Type or Size. Kindly select .pdf or .docx / .doc.|Max file size 5 MB|');
                   
                    return;
                 }
                 else if (vflvResume.files[0].size > maxFileSize) {
                     tempva = "1";
                     alert('Invalid Profile File Type or Size. Kindly select .png or .jpeg / .jpg.|Max file size 5 MB|');

                     return;

                 }

                 
                 if (tempva == 0) {
                     $(".form-step").removeClass("active");
                     $(".form-step2").toggleClass("active");
                     btnsubmit.style.visibility = 'hidden';
                 }
                 else return;
             
            });
            $('.btn-next3').click(function () {
                var vskillsname = document.getElementById("txtskills");
                var vtotalctc = document.getElementById("txttotalctc");
                var vfixedctc = document.getElementById("txtfixedctc");
                let opptmulUsersRoles = document.getElementById("mulUsersRoles");
                var tempva = "0";
               // alert(opptmulUsersRoles.selectedIndex);
                if (opptmulUsersRoles.selectedIndex == -1)
                {
                    //document.getElementById("mulUsersRoles").focus = true;
                    alert("Please select Skills");
                    tempva = "1";
                }
                //if (vskillsname.value == "") {
                //    //alert('Other Skills should not be blank');
                //    document.getElementById("txtskills").style.borderColor = "Red";
                //    tempva = "1";
                //    //return;
                //} else document.getElementById("txtskills").style.borderColor = "Gray";

                 if (vtotalctc.value == "") {
                     document.getElementById("txttotalctc").style.borderColor = "Red";
                     tempva = "1";
                    //return;
                 } else document.getElementById("txttotalctc").style.borderColor = "Gray";

                 if (vfixedctc.value == "") {
                     document.getElementById("txtfixedctc").style.borderColor = "Red";
                     tempva = "1";
                    //return;
                 } else document.getElementById("txtfixedctc").style.borderColor = "Gray";
             
                 if (tempva == 0) {
                     $(".form-step").removeClass("active");
                     $(".form-step3").toggleClass("active");
                 }
                 else return;


           
            });
            $('.btn-next4').click(function () {
                var votherEdu = document.getElementById("txtotheredu");
                var tempva = "0";
                let opptmulRoles = document.getElementById("DropDownList1");
                let opptNoticeP = document.getElementById("ddlNoticeP");
                var tempva = "0";
               //alert(opptmulRoles.selectedIndex);
               // alert(opptNoticeP.selectedIndex);
                if (opptmulRoles.selectedIndex == 0) {
                    //document.getElementById("mulUsersRoles").focus = true;
                    alert("Please select Education");
                    return;
                    tempva = "1";
                }

                else if (opptNoticeP.selectedIndex == 0)
                {
                    //document.getElementById("mulUsersRoles").focus = true;
                    alert("Please select Notice Period");
                    return;
                    tempva = "1";
                }


                //if (votherEdu.value == "") {
                //    document.getElementById("txtotheredu").style.borderColor = "Red";
                //    return;
                //}
               

                //else {
                   
                //}

                if (tempva == 0) {
                    $(".form-step").removeClass("active");
                    $(".form-step4").toggleClass("active");
                }
                else return;
               
            });
            $('.btn-next5').click(function () {
                var text = document.getElementById("chkterms");
                var btnsubmit = document.getElementById("Button6");

                if (text.checked == false) {
                   
                    document.getElementById("lblconfirm").style.backgroundColor="Pink";
                    return;
                }
               

                else {
                    btnsubmit.click();
                  //  $(".form-step4").toggleClass("active");
                }
               
            });
            
            $('.btn-prev1').click(function(){
                $(".form-step").removeClass("active");
                $(".form-step1").toggleClass("active");
            });
            $('.btn-prev2').click(function(){
                $(".form-step").removeClass("active");
                $(".form-step2").toggleClass("active");
            });
            $('.btn-prev3').click(function(){
                $(".form-step").removeClass("active");
                $(".form-step3").toggleClass("active");
            });

        });

        $(function () {
            $('select').multipleSelect()
        });
    </script>


    <%--    <uc1:head runat="server" ID="head" />--%>
    <script>
        function myFunction() {
            var x = document.getElementById("Div1");
            var y = document.getElementById("Div2");
            var z = document.getElementById("Div3");

            x.style.display = "none";
            y.style.display = "block";
            z.style.display = "none";

        }
        function myFunction1() {
            var x = document.getElementById("Div1");
            var y = document.getElementById("Div2");
            var z = document.getElementById("Div3");

            x.style.display = "none";
            y.style.display = "none";
            z.style.display = "block";

        }

        function validateForm() {
            let A = document.getElementById("chkterms");

        }

        function ValidateDate() {
          
            var from = new Date(document.getElementById("<%=from.ClientID%>").value);
            var to = new Date(document.getElementById("<%=to.ClientID%>").value);
            var from1 = new Date(document.getElementById("<%=from1.ClientID%>").value);
            var to1 = new Date(document.getElementById("<%=to1.ClientID%>").value);
            var from2 = new Date(document.getElementById("<%=from2.ClientID%>").value);
            var to2 = new Date(document.getElementById("<%=to2.ClientID%>").value);
           
            var datetoday = new Date();

            if (from > datetoday) {
                alert("Start date can not be greater than today date");
                document.getElementById("<%=from.ClientID%>").value = "";
                return;
            }
            if (from1 >= datetoday) {
                alert("Start date can not be greater than today date");
                document.getElementById("<%=from1.ClientID%>").value = "";
                return;
            }
            if (from2 >= datetoday) {
                alert("Start date can not be greater than today date");
                document.getElementById("<%=from2.ClientID%>").value = "";
                return;
            }
            if (to > datetoday) {
                alert("End date can not be greater than today date");
                document.getElementById("<%=to.ClientID%>").value = "";
                return;
            }
            if (to1 >= datetoday) {
                alert("End date can not be greater than today date");
                document.getElementById("<%=to1.ClientID%>").value = "";
                return;
            }
            if (to2 >= datetoday) {
                alert("End date can not be greater than today date");
                document.getElementById("<%=to2.ClientID%>").value = "";
                return;
            }

            if (from >= to) {
                alert("Start date can not be greater than End date");
                document.getElementById("<%=to.ClientID%>").value = "";
            }
            if (from1 >= to1) {
                alert("Start date can not be greater than End date");
                document.getElementById("<%=to1.ClientID%>").value = "";
            }
            if (from2 >= to2) {
                alert("Start date can not be greater than End date");
                document.getElementById("<%=to2.ClientID%>").value = "";
            }
            if (from1 >= from || from1 >= to) {
                alert("Previous Company experienced Date Can not be greater than current company job periods");
                document.getElementById("<%=from1.ClientID%>").value = "";
            }
            if (to1 >= from || to1 >= to) {
                alert("Previous Company experienced Date Can not be greater than current company job periods");
                document.getElementById("<%=to1.ClientID%>").value = "";
            }
            if (from2 >= from1 || from2 >= to1) {
                alert("Previous Company experienced Date Can not be greater than first/second company job periods");
                document.getElementById("<%=from2.ClientID%>").value = "";
            }
               if (to2 >= from1 || to2 >= to1) {
                alert("Previous Company experienced Date Can not be greater than current company job periods");
                document.getElementById("<%=to2.ClientID%>").value = "";
            }
        }
    </script>
   

   <%--  <script src="js/jquery-1.4.1.js"></script>--%>
<%--     <link href="css/jquery.multiselect.css" rel="stylesheet" />--%>

    <script>
        var rolelist = "<%=rolelist%>";
        $(document).ready(function () {
            var selroles = document.getElementsByClassName("form-control form-control-lg default-select ");
         //   alert(selroles.length);
            for (var i = 0; i < selroles.length; i++) {
                document.getElementById(selroles[i].id).innerHTML = rolelist;
                $("#" + selroles[i].id).val(document.getElementById(selroles[i].id.replace('mul', 'hid')).value.split(','));
            }
        });


        function SetChanges(field) {

            var hidfield = document.getElementById(field.id.replace('mul', 'hid'));
            hidfield.value = $("#" + field.id).val() != null ? $("#" + field.id).val().join(', ') : "";

           // alert(hidfield.value);
        }
    </script>
     <script type="text/javascript">
    function blockSpecialChar(e){
        var k;
        document.all ? k = e.keyCode : k = e.which;
        return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || k == 32 || (k >= 48 && k <= 57));
    }
    function myFunction() {
        // Get the checkbox
        var checkBox = document.getElementById("myCheck");
        // Get the output text
        //var text = document.getElementById("to");
        var lbl = document.getElementById("tolbl");
        

        // If the checkbox is checked, display the output text
        if (checkBox.checked == true) {
           // text.style.display = "none";
            lbl.style.visibility = "hidden";
        } else {
           // text.style.display = "block";
            lbl.style.visibility = "visible";
        }
    }
    function myFunction1() {
        // Get the checkbox
        var text = document.getElementById("chkterms");
        // Get the output text
       // var text = document.getElementById("to");
      //  var lbl = document.getElementById("tolbl");


        // If the checkbox is checked, display the output text
        if (text.checked == false) {
            alert('Please check the terms and use');
            return;
        } 
    }
    </script>
    <script type="text/javascript">  
  
        function UserOrEmailAvailability() {
           // alert();
           // alert(<%=Session["JobID"]%>);
            //This function call on text change.             
            $.ajax({  
                type: "POST",  
                url: "Create_Profile.aspx/CheckEmail", // this for calling the web method function in cs code.  
                data: '{useroremail: "' + $("#<%=txtemail.ClientID%>")[0].value + '",userorjobid:  "' + <%=Session["JobID"]%>+ '"}',// user name or email value  
                contentType: "application/json; charset=utf-8",  
                dataType: "json",  
                success: OnSuccess,  
                failure: function (response) {  
                    alert(response);  
                }  
            });  
        }  
  
        // function OnSuccess  
        function OnSuccess(response) {  
            var msg = $("#<%=lblStatus.ClientID%>")[0];  
            switch (response.d) {  
                case "true":  
                    msg.style.display = "block";  
                    msg.style.color = "red";  
                    msg.innerHTML = "You have already applied for this position";  
                    break;  
                case "false":  
                    msg.style.display = "block";  
                    msg.style.color = "green";  
                    msg.innerHTML = "";  
                    break;  
            }  
        }  
  
    </script>  
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-auto">
                <!-- start logo -->
                <div class="logo">
                    <a href="#" title="Extuent"><img src="images/logo.png" width="241" height="42" alt="Extuent"></a>
                </div>
                <!-- end logo -->
            </div>
            <div class="col">
                <div class="menu-link">
                    <img src="images/menu.svg" width="30" height="30" alt="menu">
                </div>
                <!-- start navigation -->
                <div class="navigation">
                    <%--<ul style="list-style: none;">
                        <li><a href="#" title="Features">Features</a></li>
                        <li><a href="#" title="Clients">Clients</a></li>
                        <li><a href="#" title="Login">Login</a></li>
                        <li><a href="#" title="Pricing">Pricing</a></li>
                        <li><a href="#" title="Get Demo">Get Demo</a></li>
                    </ul>--%>
                </div>
                <!-- end navigation -->
            </div>
        </div>
    </div>
</div>
<!-- end header -->
<!-- start main-container -->
<div class="main-container" runat="server" id="divmainnew">
    <div class="container">
        <!-- start candidate-registration -->
        <div class="candidate-registration">
            <div class="row">
                <div class="col-lg-4">
                    <!-- start caption -->
                    <div class="caption">
                  <%--      <h1>Interviews <span>Streamlined.</span></h1>--%>
                    </div>
                    <!-- end caption -->
                </div>
                <div class="col">
                    <div class="form-box">
                        <div class="form-step active form-step1">
                            <div class="row">
                                <div class="col-sm-auto">
                                    <!-- start profile-picture -->
                                    <div class="profile-picture">
                                          <asp:FileUpload ID="flvUploadProfilePic" runat="server" onchange="readURL(this);" class="upload-profile-picture-input"/>
                                     <%--   <input type="file" id="profile-picture" class="upload-profile-picture-input">--%>
                                        <label for="flvUploadProfilePic">
                                            <span class="imgb">
                                                <img src="images/profile_picture.png" id="imageResult1" width="184" height="205" alt="profile picture">
                                            </span>
                                            <span>Upload Profile Picture</span>
                                        </label>
                                    </div>
                                    <!-- end profile-picture -->
                                </div>
                                <div class="col">
                                    <!-- start personal-info -->
                                    <div class="personal-info">
                                        <div class="form-steps">
                                            <p>0 of 3 completed</p>
                                            <div class="step">
                                                <div class="step-active" style="width: 0%;"></div>
                                            </div>
                                        </div>
                                        <h3>Personal Information</h3>
                                        <div class="row">
                                            <div class="col-sm">
                                                <div class="form-group">
                                                          <input type="text" class="form-control" name="firstName" onkeypress="return blockSpecialChar(event)" id="txtname" placeholder="First Name" runat="server" required>
                                                   
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="form-group">
                                                  <input type="text" id="txtlastname" runat="server" name="lastName" onkeypress="return blockSpecialChar(event)" class="form-control" placeholder="Last Name">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <input type="email" class="form-control"  id="txtemail" placeholder="Email Address" runat="server" aria-describedby="inputGroupPrepend2" required onchange="UserOrEmailAvailability()">
                                             <br /> <div id="checkusernameoremail" runat="server">                             
                                                <asp:Label ID="lblStatus" runat="server"></asp:Label>  
                                                  </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm">
                                                <div class="form-group">
                                                      <input type="text" class="form-control" name="phoneNumber" id="txtphoneNumber" placeholder="Phone" runat="server" required>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="form-group">
                                                     <datalist id="countrycityList" runat="server" clientidmode="static"></datalist>
                                                    <input type="text" class="form-control" name="City" id="txtaddress" list="countrycityList" placeholder="City" runat="server" required>
                                                   
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group top-gap">
                                                               <label class="text-label">Drag or Upload Resume
                                                                    <br />
                                                                    (File accepted :.pdf, .doc/.docx- max file size : 5 MB)</label>
                                            <div class="input-group">
                          <div class="custom-file" data-toggle="tooltip" data-placement="top" title="Tooltip on top">
                               <asp:FileUpload ID="flvResume"  runat="server" class="form-control" />
                         
                            <%--<label for="resume-upload" class="custom-file-label">
                               No File Choosen
                            </label>--%>
                          </div>
                                       
                                        </div>
                                        <div class="form-action">
                                             <a  title="Step 2" class="btn btn-next2">Next</a>
                                      <%--      <button type="submit" class="btn btn-next2">Next</button>--%>
                                        </div>
                                    </div>
                                    <!-- end personal-info -->
                                </div>
                            </div>
                        </div>
                       
                    </div>
                         <div class="form-step form-step-width form-step2">
                            <div class="form-steps">
                                <p>1 of 3 completed</p>
                                <div class="step">
                                    <div class="step-active" style="width: 33%;"></div>
                                </div>
                            </div>
                             <br />
                            <label>Select Skills</label>
                            <div class="form-group">
                        <select id="mulUsersRoles" class="form-control form-control-lg default-select " multiple="multiple" onchange="SetChanges(this);">
                        <%

                                 for (int k = 0; k < sklList.Count; k++)
                      {
                            %>



                       <option value="<%= sklList[k].skill_name %>"><%= sklList[k].skill_name %></option>
                        
                  
                            
                            
                            <%  }
                            
                            
                            
                             %>
                         
                            
                            
                        </select>
                      </div>

                                                                    <asp:HiddenField ID="hidUsersRoles" runat="server" />

                            <div class="form-group">
                                <label>Other Skills (Separated by comas)</label>
                                    <textarea class="form-control" id="txtskills" rows="3"  placeholder="Write your skills" runat="server" ></textarea>
                                <%--<input type="text" class="form-control" placeholder="Write your skills">--%>
                            </div>
                            <label>Salary Details</label>
                            <div class="row">
                                <div class="col-sm">
                                    <div class="form-group">
                                       <input type="number" class="form-control" onkeypress="return event.charCode>=48 && event.charCode<=57"  id="txttotalctc" placeholder="Current monthly compensation" runat="server" >
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-group">
                                     <input type="number" class="form-control" onkeypress="return event.charCode>=48 && event.charCode<=57" onkeyup="return event.charCode>=48 && event.charCode<=57" id="txtfixedctc" placeholder="Expected monthly compensation" runat="server" >
                                    </div>
                                </div>
                            </div>
                            <div class="form-action">
                                  <a  title="Step 1" class="btn btn-prev btn-prev1">Prev</a>
                                  <a  title="Step 2" class="btn btn-next3">Next</a>
                             <%--   <button type="submit" class="btn btn-prev btn-prev1">Prev</button>
                                <button type="submit" class="btn btn-next3">Next</button>--%>
                            </div>
                        </div>
                        <div class="form-step form-step-width form-step3">
                            <div class="form-steps">
                                <p>2 of 3 completed</p>
                                <div class="step">
                                    <div class="step-active" style="width: 66%;"></div>
                                </div>
                            </div>
                            <h3>Education & Experience</h3>
                            <div class="form-group">
                                 <asp:DropDownList ID="DropDownList1" runat="server" class="form-select">
                                                                        <asp:ListItem Value="Select Highest Education">Select Highest Education</asp:ListItem>
                                                                        <asp:ListItem Value="Master">Master</asp:ListItem>
                                                                        <asp:ListItem Value="Bachelors">Bachelors</asp:ListItem>
                                                                        <asp:ListItem Value="High School">High School</asp:ListItem>
                                                                        <asp:ListItem Value="Others">Others</asp:ListItem>
                                                                    </asp:DropDownList>
                             
                            </div>
                            <div class="form-group">
                                 <input type="text" name="otherEducation" id="txtotheredu" runat="server" class="form-control" placeholder="Others"  >
                            </div>
                            <div class="form-group">
                                  <asp:DropDownList ID="ddlNoticeP" runat="server" class="form-select" >
                                                                    <asp:ListItem Value="Notice Period">Notice Period</asp:ListItem>
                                                                    <asp:ListItem Value="Immediate">Immediate</asp:ListItem>
                                                                    <asp:ListItem Value="Within 30 days">Within 30 days</asp:ListItem>
                                                                    <asp:ListItem Value="Within 60 days">Within 60 days</asp:ListItem>
                                                                    <asp:ListItem Value="More than 60 days">More than 60 days</asp:ListItem>
                                                                </asp:DropDownList>
                            
                            </div>
                            <!-- start professional-experience -->
                            <div class="professional-experience">
                                <label>Professional Experience</label><br />
                               <input type="checkbox" id="myCheck" onclick="myFunction()" runat="server">&nbsp;I am currently working in this role </><br />
                                <div class="row">
                                    <div class="col-sm">
                                        <div class="form-group"><br />
                                             <label for="from" >Start Date</label>
                                             <input type="date" class="form-control" id="from" onchange="ValidateDate();" placeholder="From" runat="server">
                                        
                                        </div>
                                    </div>
                                    <div class="col-sm">
                                        <div class="form-group" id="tolbl"><br />
                                           <label for="to">End Date</label>
                                        <input type="date" class="form-control" id="to" onchange="ValidateDate();" placeholder="To" runat="server">
                                        </div>
                                    </div>
                                    <div class="col-sm">
                                        <div class="form-group"><br />
                                            <label for="from" >Title</label>
                                            <input type="text" class="form-control" id="title" placeholder="Title" runat="server">
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="form-group"><br />
                                             <label for="from" >Company</label>
                                          <input type="text" class="form-control" id="company" placeholder="Company" runat="server">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm">
                                        <div class="form-group">
                                          
                                           <input type="date" class="form-control" id="from1" onchange="ValidateDate();" placeholder="From" runat="server">
                                        </div>
                                    </div>
                                    <div class="col-sm">
                                        <div class="form-group">
                                           
                                             <input type="date" class="form-control" id="to1" onchange="ValidateDate();" placeholder="To" runat="server">
                                       
                                        </div>
                                    </div>
                                    <div class="col-sm">
                                        <div class="form-group">
                                             <input type="text" class="form-control" id="title1" placeholder="Title" runat="server">
                                       </div>
                                    </div>
                                    <div class="col">
                                        <div class="form-group">
                                              <input type="text" class="form-control" id="company1" placeholder="Company" runat="server">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm">
                                        <div class="form-group">
                                           
                                            <input type="date" class="form-control" id="from2" onchange="ValidateDate();" placeholder="From" runat="server">
                                        </div>
                                    </div>
                                    <div class="col-sm">
                                        <div class="form-group">
                                    
                                      <input type="date" class="form-control" id="to2" onchange="ValidateDate();" placeholder="To" runat="server">
                                        </div>
                                    </div>
                                    <div class="col-sm">
                                        <div class="form-group">
                                  <input type="text" class="form-control" id="title2" placeholder="Title" runat="server">
                                        </div>
                                    </div>
                                    <div class="col col-relative">
                                        <div class="form-group">
                                         <input type="text" class="form-control" id="company2" placeholder="Company" runat="server">
                                        </div>
                                       <%-- <a href="#" title="+Add more" class="add-more">+Add more</a>--%>
                                    </div>
                                </div>
                            </div>
                            <!-- end professional-experience -->
                            <div class="form-action">
                                    <a  title="Step 2" class="btn btn-prev btn-prev2">Prev</a>
                                  <a  title="Step 3" class="btn btn-next4">Next</a>
                                <%--<button type="submit" class="btn btn-prev btn-prev2">Prev</button>
                                <button type="submit" class="btn btn-next4">Next</button>--%>
                            </div>
                        </div>
                        <div class="form-step form-step-width form-step4">
                            <div class="form-steps">
                                <p>3 of 3 completed</p>
                                <div class="step">
                                    <div class="step-active" style="width: 100%;"></div>
                                </div>
                            </div>
                            <!-- start confirmations-message -->
                            <div class="confirmations-message">
                                <center><img src="images/confirmmsg.png"/></center>
                              <center>  <h6>You are only one step away from completing your application. Please proceed to recording your one-way interview for the <%= jobname %> position.<br /><br />

Once your one-way interview is completed, our HR team will get in touch with you regarding the next steps. 
</h6></center>
                                <label class="accept-message" id="lblconfirm">
                                    <input type="checkbox" id="chkterms">
                                    Please accept our <a href="terms-and-conditions" target="_blank" title="Terms and conditions">Terms and conditions</a> before Submit
                                </label>
                                <br />
                        <asp:HyperLink runat="server" ID="lnkVideo" Visible="false"></asp:HyperLink>
                            </div>
                            
                            <!-- end confirmations-message -->
                            <div class="form-action">
                                 <asp:Button ID="Button6" class="btn" runat="server" Text="Submit" UseSubmitBehavior="false" OnClick="btnAdd_Click" />    
                                 <a  title="Step 2" class="btn btn-prev btn-prev3">Prev</a>
                         <%--       <button type="submit" class="btn btn-prev btn-prev3">Prev</button>--%>
                                
                                <a  title="Submit" class="btn btn-next5">Submit</a>
                                 <%-- <button type="submit" class="btn">Submit</button>--%>
                            </div>
                        </div>
                </div>
            </div>
        </div>
        <!-- end candidate-registration -->
    </div>
</div>
    </div>
      <div class="main-container" id="Div2" visible="false" runat="server">
          <div class="container">
              <div class="welcome-box">
          <center><h2>Create Your Profile</h2></center>
           <center><h4>Tips to recording an impressive interview</h4></center>
            <div class="row">
                <div class="col-2"></div>
                <div class="col-sm-8">
                  <div class="row">
                      <div class="col">
                        <div class="imgb">
                            <img src="images/Welcome.png" width="380px" height="450px" />
                        </div>
                      </div>
                      <div class="col">
                          <div class="txtb">
                            <h3>Welcome!</h3>
                            <p>The purpose of this video is to introduce yourself and summarise your relevant qualifications, experience and attributes.</p>
                            <div class="bg-txt">
                              <h4>General guidance</h4>
                            <p><b>Dress to Impress! </b>Suit up and dress as you would for a formal face-to-face interview.</p>
                            <p><b>Look Up! </b>Make sure the camera on your device is at eye level and look at the camera while recording.</p>
                            <p><b>Lighting is important! </b>Natural light is the gold standard. Face the light source or window to let your personality shine through.</p>
                            </div>
                            <center>
                                <asp:Button runat="server" ID="btnStart" Text="Start Interview" class="btn"  style="color:white;align:right;background-color:#FF6700" OnClick="btnStart_Click"/>
                            </center>
                          </div>
                      </div>
                  </div>
                </div>
            </div>
            </div>
        </div>
                        
                    </div>
<!-- end main-container -->
<!-- start footer -->
<div class="footer">
    <div class="container">
        <div class="row align-items-center">
            <div class="col">
                <!-- start footer-links -->
                <div class="footer-links">
                <%--    <ul style="list-style: none;">
                        <li><a href="#" title="Terms of Use">Terms of Use</a></li>
                        <li><a href="#" title="Privacy Policy">Privacy Policy</a></li>
                        <li><a href="#" title="Help Articles">Help Articles</a></li>
                        <li><a href="#" title="Accessibility">Accessibility</a></li>
                        <li><a href="#" title="Contact Us">Contact Us</a></li>
                    </ul>--%>
                </div>
                <!-- end footer-links -->
            </div>
            <div class="col-auto">
                <div class="footer-logo">
                    <p>Powered By</p>
                    <!-- start imgb -->
                    <div class="imgb">
                        <a href="#" title="Extuent"><img src="images/logo.png" width="241" height="42" alt="Extuent"></a>
                    </div>
                    <!-- end imgb -->
                </div>
            </div>
        </div>
    </div>
</div>
     <!--*******************
        Preloader start
    ********************-->

<!--*******************
        Preloader end
    ********************--> 

<!-- [Header] -->

<!-- [/Header] --> 


        <!--**********************************
        Main wrapper start
    ***********************************-->


<!--**********************************
        Main wrapper end
    ***********************************--> 

    <!-- [Profile Image Modal] -->

<!-- [/Profile Image Modal] -->


<!-- Chart piety plugin files --> 


<!-- Apex Chart --> 



<!-- asColorPicker --> 

<!-- Material color picker --> 

<!-- pickdate --> 


<!-- Daterangepicker --> 

<!-- Clockpicker init --> 

<!-- asColorPicker init --> 

<!-- Material color picker init --> 



<script>
       
        

/*  [SHOW UPLOADED IMAGE] */
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
          
            $('#imageResult1')
                .attr('src', e.target.result);
        };
        

        reader.readAsDataURL(input.files[0]);
    }
}

$(function () {
    $('#upload').on('change', function () {
        readURL(input);
    });
});
/*  [/SHOW UPLOADED IMAGE] */
    </script>











       
        <!-- Begin page -->

        <!--end container-->

        <!-- Navbar End -->


        <!-- START SIGN-UP MODAL -->

        <!-- END SIGN-UP MODAL -->

      





   
          
  <%--  <uc1:footerlatestui runat="server" id="footerlatestui" />--%>
        <%--     <uc1:footer runat="server" ID="footer" />--%>
<%--        <uc1:footernewui runat="server" ID="footernewui" />--%>


          <div id="Div4" runat="server" visible="false">
             <input id="txtvarctc" runat="server" class="form-control" placeholder="Variable CTC" required="" type="number" />
 <input type="text" class="form-control" id="txtnoticeperiod" placeholder="Notice Period" runat="server" required>
  <input type="text" class="form-control" id="txtHighertitle" placeholder="title" runat="server" required>
<input type="text" class="form-control" id="txtdegree" placeholder="degree" runat="server" required>
      <input type="text" class="form-control" id="txtinstitute" placeholder="Institute" runat="server" required>
       <input type="text" class="form-control" id="txtyear" placeholder="Year" runat="server" required>
                 <asp:RadioButton ID="rdoGender" runat="server" Text="Male" GroupName="Gen" Checked="true" Visible="false" />
                                    <asp:RadioButton ID="rdoFemale" runat="server" Text="Female" GroupName="Gen" Visible="false" />
                                    <asp:RadioButton ID="rdoTransgen" runat="server" Text="Transgender" GroupName="Gen" Visible="false" />
               <label style="color: white; align: center; background-color: #808080" for="salary" class="form-label" id="lblapplied" runat="server"></label>
                 <input type="text" class="form-control" id="txtjobtitle" placeholder="Title" runat="server">
          <asp:Button runat="server" ID="applynow" Text="Apply Now" class="btn btn-primary" Style="color: white; align: right; background-color: #FF6700" OnClick="applynow_Click" />
        <textarea class="form-control" id="txtjobdescription" rows="35" placeholder="Enter Job Description" runat="server"></textarea>
             </div>
        
    </form>

   <!-- Required vendors --> 




  <%--  <script src="./js/plugins-init/select2-init.js"></script>

      <script src="js/NewJs.js"></script>
    <script src="js/jquery.multiselect.js"></script>--%>
 

   <%-- <script type="text/javascript">

       var js= jQuery.noConflict();

        (function ($) {
            // Your jQuery code here, using the $
        })(jQuery);

        js(document).ready(function () {
            js('.listroles').multiselect({ texts: { placeholder: 'Select Role(s)' }, minHeight: 'auto', selectAll: true });
        });

    </script>--%>
</body>
</html>
