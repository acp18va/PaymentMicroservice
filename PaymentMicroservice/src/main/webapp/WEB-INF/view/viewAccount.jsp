<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %> 
<!DOCTYPE html>
<html>
<title>User Transactions</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
<style>
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover {
  background-color: #111;
}

div{
  max-width:600px; 
}

p{
  max-width:600px; 
}

form{
  max-width:600px;
  margin: 0 auto;
  margin-top: 200px;
}

label{
  font-size: 18px;
  text-align: center;

}
</style>
<body>
<%
String username=(String)session.getAttribute("loginName");
int userID=0;		        
int sessionID=0;
String app_name = "";
if(username != null){
userID=(Integer)session.getAttribute("userID");				        
sessionID=(Integer)session.getAttribute("sessionID");
}
%>
<ul>
  <li><a class="active" href="/SingleSignIn/index">Dashboard</a></li>
</ul>

<form action="/SingleSignIn/index" class="w3-container w3-card-4 w3-light-grey w3-text-pink" method=POST>
<div class="w3-center">
  <h2>Transaction Details</h2>
</div>
 <c:if test = "${DataUnavailable!=null}">
			<p class="error" align = "center" style="color:blue;"> ${DataUnavailable}</p>
	</c:if>
	<c:if test = "${NoTransaction!=null}">
			<p class="error" align = "center" style="color:blue;"> ${NoTransaction}</p>
	</c:if>
<div class="w3-row w3-section">
  
  <div class="w3-col" style="width:200px"> <label><b>Available Balance</b></label></div>
    <div class="w3-rest">
      <input class="w3-input w3-border" name="${available_balance}" type="text" placeholder="${available_balance}" disabled>
    </div>
</div>

<div class="w3-container" style="overflow-x:auto;">      
        <table class="w3-table-all" style="overflow-x:auto;">
          <thead>
            <tr class="w3-light-grey">
              <th>Transaction_ID</th>
              <th>Application Name</th>
              <th>Peanut Amount</th>
            </tr>
          </thead>
         	<c:if test="${empty transactionList }">
					<tr>
						<td align="center" colspan="8" class="error"> No Records Present. </td>
					</tr>
			</c:if>
			<c:forEach var="c" items="${transactionList}" varStatus="st">
					<tr>
						<td> ${c.trans_id} </td>
						<td> ${c.app_name} </td>
						<td> 5 </td>

					</tr>
				</c:forEach>
        
        </table>
      </div>

<p class="w3-center">
<button class="w3-button w3-section w3-pink w3-ripple" href="/SingleSignIn/index"> Close </button>

</p>
</form>

</body>
</html>