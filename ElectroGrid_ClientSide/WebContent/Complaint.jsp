<%@page import="model.Complaint"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<meta charset="ISO-8859-1">
<title>Complaint Management</title>

<link rel="stylesheet" href="Views/bootstrap.min.css"> 
<link rel="stylesheet" type="text/css" href="css\footer.css"> 
<script src="components/jquery-3.6.0.js"></script>
<script src="components/main.js"></script>





 <nav class="navbar navbar-expand-md navbar-dark" style="background-color: 	#5353ff">
                   

                    <ul class="navbar-nav">
                        <li><a href="Index.jsp" class="nav-link">ElectroGrid Online Platform</a></li>
                    </ul>
                 </nav>
</head>

<body>
<br>
<br>
<div class="container"> 
		<div class="row">  
		 <br>
            <div class="container col-md-5">
                <div class="card">
                    <div class="card-body">
                        <caption>
                            <h2>
                                Employee Management
                            </h2>
                        </caption>
		<br>
			
				<form id="formCustomer" name="formCustomer" method="post" action="Customer.jsp">  
					Employee Name:  
					<input id="eName" name="eName" type="text" class="form-control form-control-sm">  
					
					<br> 
					Address:  
					<input id="eAddress" name="eAddress" type="text" class="form-control form-control-sm">  
					
					<br>
					 Email:  
					 <input id="eEmail" name="eEmail" type="text" class="form-control form-control-sm">  
					 
					 <br> 
					 Register Date:  
					 <input id="eDate" name="eDate" type="text" class="form-control form-control-sm">
					 
					  <br> 
					 Phone No:  
					 <input id="pno" name="pno" type="text" class="form-control form-control-sm">  
					 
					
					 
					 
					 <br>  
					 <input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary">  
					 <input type="hidden" id="hideIDSave" name="hideIDSave" value=""> 
					 
					 
				</form> 
				  </div>
                </div>
            </div>
    
				<div id="alertSuccess" class="alert alert-success"></div>  
				<div id="alertError" class="alert alert-danger"></div> 
				
				<br>
					
				
            <div class="row">
               

                <div class="container">
                <br><br><br><br>
                    <center><h3 class="text-center">Employee Details</h3>
                    <hr>
                    
                    <br>
                
                   <div id="divItemsGrid">   
					<%    
						Employee employeeObj = new Employee();
						out.print(employeeObj.readEmployee());   
					%>  
				
					<br>
					<br>
					 
				</div> </center>
                   
                </div>
            </div>
				  
 			</div>
 		 
 		</div>    
 		
<br>
	 

</body>

 <!-- Footer Starts Here -->
   <footer class="site-footer">
      <div class="container">
        <div class="row">
          <div class="col-sm-12 col-md-6">
            <h6>About</h6>
            <p class="text-justify">Avinash W.V.K <i> </i> This project is based on a company named “Gadget Badget (GB) who funds inventors and motivate them by letting them sell their products in the companies online platform. My task was to create the online platform covering the whole scope of the company. I used java , tomcat , mysql and JAX-RS Restful webservice as our tools to create our platform..</p>
          </div>

          <div class="col-xs-6 col-md-3">
            <h6>Categories</h6>
            <ul class="footer-links">
              <li><a href="Payment.jsp">Payment Management</a></li>
              <li><a href="Customer.jsp">Customer Management</a></li>
             
            </ul>
          </div>

          <div class="col-xs-6 col-md-3">
            <h6>Quick Links</h6>
            <ul class="footer-links">
              <li><a href="Index.jsp">HomePage</a></li>
              <li><a href="">Contact Us</a></li>
              <li><a href="">Contribute</a></li>
              <li><a href="">Privacy Policy</a></li>
              
            </ul>
          </div>
        </div>
        <hr>
      </div>
      <div class="container">
        <div class="row">
          <div class="col-md-8 col-sm-6 col-xs-12">
            <p class="copyright-text">Copyright &copy; 2021 All Rights Reserved by 
         <a href="#">Avinash W.V.K</a>.
            </p>
          </div>

          <div class="col-md-4 col-sm-6 col-xs-12">
            <ul class="social-icons">
              <li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
              <li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
              <li><a class="dribbble" href="#"><i class="fa fa-dribbble"></i></a></li>
              <li><a class="linkedin" href="#"><i class="fa fa-linkedin"></i></a></li>   
            </ul>
          </div>
        </div>
      </div>
</footer>
</html>