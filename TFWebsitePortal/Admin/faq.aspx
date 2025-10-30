<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="faq.aspx.cs" Inherits="Extuent.Admin.faq" %>

<%@ Register Src="~/Admin/UC/header.ascx" TagPrefix="uc1" TagName="header" %>
<%@ Register Src="~/Admin/UC/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/Admin/UC/foot.ascx" TagPrefix="uc1" TagName="foot" %>




<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <uc1:header runat="server" ID="header" />
    <style>
.accordion {
  background-color: #eee;
  color: #4e5764;
  cursor: pointer;
  padding: 14px;
  width: 100%;
  border: none;
  text-align: left;
  outline: none;
  font-size: 16px;
  transition: 0.4s;
  margin-top:10px;
  font-weight:bold;

}

.active, .accordion:hover {
  background-color: #ccc; 
}

.panel {
  padding: 0 18px;
  display: none;
  background-color: white;
  overflow: hidden;
  color:#011633;
}
.accordion:after {
  content: '\25BC'; /* Unicode character for "plus" sign (+) */
  font-size: 16px;
  color: #011633;
  float: right;
  margin-left: 5px;
}

.active:after {
  content: "\2796"; /* Unicode character for "minus" sign (-) */
}
</style>
</head>
<body>
    <form id="form1" runat="server">
        <uc1:head runat="server" ID="head" />
        <div class="content-body">
            <div class="container-fluid">
				<!-- Add Order -->
				
      
                <!-- row -->
                <div class="row">
                    <div class="col-xl-12 col-xxl-12">
                        <div class="card">
                            
                            <div class="card-body">
                            <button class="accordion">How do I create a job using Extuent's Digital Interview Platform?</button>
<div class="panel">
<span><ul><li>Once you have created the relevant libraries, Start by selecting the appropriate job category and enter the job title, work location, and company name.</li></ul></span>
<span><ul><li>Set the salary range, job type, minimum experience level, and required skills.</li></ul></span>
<span><ul><li>Enter the deadline date for applications and provide a job summary with detailed information about the role.</li></ul></span>
<span><ul><li>Select interview questions and evaluation criteria.</li></ul></span>
<span><ul><li>Click on the "Create Job" button to create the job.</li></ul></span>

</div>
    <br />
<button class="accordion">How can I create a comprehensive data bank in the Library section?</button>
<div class="panel">
<span><ul><li>The First Step is to Create the Job Categories.</li></ul></span>
<span><ul><li>Select the desired Job Category to add new questions or edit existing ones to tailor them to the job category.</li></ul></span>
<span><ul><li>Select the desired Job Category to add or edit evaluation criteria to establish assessment criteria for the job category.</li></ul></span>
<span><ul><li>Select the desired Job Category to add new skills or modify existing ones within the job category.</li></ul></span>


</div>
<br />
<button class="accordion">What can I do in the Dashboard section?</button>
<div class="panel">
<span><ul><li>View a comprehensive overview of all the created jobs, including active and closed jobs.</li></ul></span>
<span><ul><li>Edit a job by clicking on the edit button to make necessary changes.</li></ul></span>
<span><ul><li>Place a job on hold or close it as needed.</li></ul></span>
<span><ul><li>Use the share button to distribute the job or post the job link on various job portals.</li></ul></span>

</div>
<br />
<button class="accordion">What information do candidates need to provide in the Candidate Interface?</button>
<div class="panel">
<span><ul><li>Candidates need to enter their First Name, Last Name, Email Address, Phone Number, and City.</li></ul></span>
<span><ul><li>They should upload their CV and profile photo.</li></ul></span>
<span><ul><li>Select skills from a predefined list and provide any additional skills not mentioned.</li></ul></span>
<span><ul><li>Enter current and expected monthly compensation.</li></ul></span>
<span><ul><li>Provide education and experience details.</li></ul></span>

</div>
<br />
<button class="accordion">How does the digital interview process work for candidates?</button>
<div class="panel">
<span><ul><li>Candidates receive tips on conducting a successful interview.</li></ul></span>
<span><ul><li>They start recording their answers to interview questions with a time limit of 2 minutes per question.</li></ul></span>
<span><ul><li>Candidates can review and retake their recorded answers if needed.</li></ul></span>
<span><ul><li>They can proceed to the next question and click "Finish" when all questions are completed.</li></ul></span>

</div>
<br />
<button class="accordion">How do recruiters view the final interview?</button>
<div class="panel">
<span><ul><li>Recruiters see a snapshot of the candidate's essential details, including phone number and email address.</li></ul></span>
<span><ul><li>They can view all the answers one by one.</li></ul></span>
<span><ul><li>Recruiters have access to a summary of the candidate's professional skills, salary details, availability, and experience summary.</li></ul></span>
<span><ul><li>They can review the candidate's CV and rate them based on the evaluation criteria.</li></ul></span>
<span><ul><li>Recruiters can enter comments and make a decision to pass, hold, or reject the candidate.</li></ul></span>

</div>
<br />
<button class="accordion">What can I do in the Reports section?</button>
<div class="panel">
<span><ul><li>Filter candidate details based on job category, job title, application status, and decision status.</li></ul></span>
<span><ul><li>Select a specific date range for the report.</li></ul></span>
<span><ul><li>Download the report in CSV format for further analysis and decision-making.</li></ul></span>


</div>
<br />
<button class="accordion">What do I do if I need help?</button>
<div class="panel">
  <span><ul><li>You can e-mail your questions to us on: <a href="mailto:support@extuentai.com" style="color:darkblue;">support@extuentai.com</a></li></ul></span>
</div>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
     






        <uc1:foot runat="server" ID="foot" />
        <script>
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.display === "block") {
      panel.style.display = "none";
    } else {
      panel.style.display = "block";
    }
    event.preventDefault();
  });
}
</script>
    </form>
</body>
</html>
