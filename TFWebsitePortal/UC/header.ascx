<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="header.ascx.cs" Inherits="Extuent.UC.header" %>
 <%-- <div id="preloader">
            <div id="status">
                <ul>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                  </ul>
            </div>
        </div>--%>
        <!--end page Loader -->

        <!-- Begin page -->
        <div>

            <!-- START TOP-BAR -->
            <div class="top-bar">
                <div class="container-fluid custom-container">
                    <div class="row g-0 align-items-center">
                        <div class="col-md-7">
                            <ul class="list-inline mb-0 text-center text-md-start">
                                
                                <li class="list-inline-item">
                                    <ul class="topbar-social-menu list-inline mb-0">
                                        <li class="list-inline-item"><a href="javascript:void(0)" class="social-link"><i
                                                    class="uil uil-whatsapp"></i></a></li>
                                        <li class="list-inline-item"><a href="javascript:void(0)" class="social-link"><i
                                                    class="uil uil-facebook-messenger-alt"></i></a></li>
                                        <li class="list-inline-item"><a href="javascript:void(0)" class="social-link"><i
                                                    class="uil uil-instagram"></i></a></li>
                                        <li class="list-inline-item"><a href="javascript:void(0)" class="social-link"><i
                                                    class="uil uil-envelope"></i></a></li>
                                        <li class="list-inline-item"><a href="javascript:void(0)" class="social-link"><i
                                                    class="uil uil-twitter-alt"></i></a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <!--end col-->
                        <div class="col-md-5">
                            <ul class="list-inline mb-0 text-center text-md-end">
                                <li class="list-inline-item py-2 me-2 align-middle">

<%--                                       <p class="mb-0"><a href="Create_Profile" class="form-text text-primary text-decoration-underline"><i class="uil uil-lock"></i>  Create Your video Interview </a></p>--%>
                                  <%--  <a href="home#signupModal" class="text-dark fw-medium fs-13" data-bs-toggle="modal"><i class="uil uil-lock"></i>
                                        Create Your video Interview</a>--%>
                                </li>
                                <li class="list-inline-item align-middle">
                                    <div class="dropdown d-inline-block language-switch">
                                        <button type="button" class="btn" data-bs-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">
                                            <img id="header-lang-img" src="assets/images/flags/india.jpg" alt="Header Language" height="16" />
                                        </button>
                                        <div class="dropdown-menu dropdown-menu-end">
                                            <!-- item-->
											 <a href="javascript:void(0);" class="dropdown-item notify-item language" data-lang="eng">
                                                <img src="assets/images/flags/india.jpg" alt="user-image" class="me-1" height="12" />
                                                <span class="align-middle">Indian</span>
                                            </a>
                                            <a href="javascript:void(0);" class="dropdown-item notify-item language" data-lang="eng">
                                                <img src="assets/images/flags/us.jpg" alt="user-image" class="me-1" height="12" />
                                                <span class="align-middle">English</span>
                                            </a>
                                            <!-- item-->
                                            <a href="javascript:void(0);" class="dropdown-item notify-item language" data-lang="sp">
                                                <img src="assets/images/flags/spain.jpg" alt="user-image" class="me-1" height="12" />
                                                <span class="align-middle">Spanish</span>
                                            </a>
                                            <!-- item-->
                                            <a href="javascript:void(0);" class="dropdown-item notify-item language" data-lang="gr">
                                                <img src="assets/images/flags/germany.jpg" alt="user-image" class="me-1" height="12" />
                                                <span class="align-middle">German</span>
                                            </a>
                                            <!-- item-->
                                            <a href="javascript:void(0);" class="dropdown-item notify-item language" data-lang="it">
                                                <img src="assets/images/flags/italy.jpg" alt="user-image" class="me-1" height="12" />
                                                <span class="align-middle">Italian</span>
                                            </a>
                                            <!-- item-->
                                            <a href="javascript:void(0);" class="dropdown-item notify-item language" data-lang="ru">
                                                <img src="assets/images/flags/russia.jpg" alt="user-image" class="me-1" height="12" />
                                                <span class="align-middle">Russian</span>
                                            </a>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <!--end col-->
                    </div>
                    <!--end row-->
                </div>
                <!--end container-->
            </div>
            <!-- END TOP-BAR -->

            <!--Navbar Start-->
            <nav class="navbar navbar-expand-lg fixed-top sticky" id="navbar">
                <div class="container-fluid custom-container">
                    <a class="navbar-brand text-dark fw-bold me-auto" href="home">
                        <img src="assets/images/logo.png" height="22" alt="" class="logo-dark" />
                        <img src="assets/images/logo.png" height="22" alt="" class="logo-light" />
                    </a>
                    <div>
                        <button class="navbar-toggler me-3" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-label="Toggle navigation">
                            <i class="mdi mdi-menu"></i>
                        </button>
                    </div>
                    <div class="collapse navbar-collapse" id="navbarCollapse">
                        <ul class="navbar-nav mx-auto navbar-center">
                            <li class="nav-item dropdown dropdown-hover">
                                <li class="nav-item">
                                <a href="Home" class="nav-link">Home</a>
                            </li>
                                
                            </li>
                            
							<li class="nav-item">
                                <a href="#" class="nav-link">About Us</a>
                            </li>
							<li class="nav-item">
                                <a href="job_list" class="nav-link">Job List</a>
                            </li>
                            <li class="nav-item dropdown dropdown-hover">
                                <a class="nav-link" href="#" id="jobsdropdown" role="button" data-bs-toggle="dropdown">
                                    Categories <div class="arrow-down"></div>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-center" aria-labelledby="jobsdropdown">
                                    <%
                                          int j=0;
                                          int g = -1;
                                          for (int k = 0; k < categoryList.Count; k++)
                                          {
                                              j = j + 1;
                                           
                                              {  %>


                                    <li><a class="dropdown-item" href="#"><%= categoryList[k].category_name %></a></li>
                                    
                                  
                                    <%}} %>
                                </ul>
                            </li>
                           
                                
                            <li class="nav-item">
                                <a href="#" class="nav-link">Contact</a>
                            </li>
                        </ul><!--end navbar-nav-->
                    </div>
                    <!--end navabar-collapse-->
                    
                <!--end container-->
            </nav>
            <!-- Navbar End -->


            <!-- START SIGN-UP MODAL -->
            <div class="modal fade" id="signupModal" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-body p-5">
                            <div class="position-absolute end-0 top-0 p-3">
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="auth-content">
                                <div class="w-100">
                                    <div class="text-center mb-4">
                                        <h5>Sign Up</h5>
                                        <p class="text-muted">Sign Up and get access to all the features of EXTUENT</p>
                                    </div>
                                
                                        <div class="mb-3">
                                            <label for="usernameInput" class="form-label">Username</label>
                                            <input type="text" class="form-control" id="usernameInput" placeholder="Enter your username">
                                        </div>
                                        <div class="mb-3">
                                            <label for="passwordInput" class="form-label">Email</label>
                                            <input type="email" class="form-control" id="emailInput" placeholder="Enter your email">
                                        </div>
                                        <div class="mb-3">
                                            <label for="emailInput" class="form-label">Password</label>
                                            <input type="password" class="form-control" id="passwordInput" placeholder="Password">
                                        </div>
                                        <div class="mb-4">
                                            <div class="form-check"><input class="form-check-input" type="checkbox" id="flexCheckDefault">
                                                <label class="form-check-label" for="flexCheckDefault">I agree to the <a href="javascript:void(0)" class="text-primary form-text text-decoration-underline">Terms and conditions</a></label>
                                            </div>
                                        </div>
                                        <div class="text-center">
                                                         <p class="mb-0">Already a member ? <a href="Create_Profile" class="form-text text-primary text-decoration-underline"> Sign-in </a></p>
                                            <button type="submit" class="btn btn-primary w-100" runat="server" id="sigupnew">Sign Up</button>
                                        </div>
                            
                                    <div class="mt-3 text-center">
                                        <p class="mb-0">Already a member ? <a href="sign-in.html" class="form-text text-primary text-decoration-underline"> Sign-in </a></p>
                                    </div>
                                </div>
                            </div>
                        </div><!--end modal-body-->
                    </div><!--end modal-content-->
                </div><!--end modal-dialog-->
            </div>
            <!-- END SIGN-UP MODAL -->