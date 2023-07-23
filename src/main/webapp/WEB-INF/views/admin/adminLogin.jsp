<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
* {
    margin: 0;
    padding: 0;

}
.wrap {
    height: 100%;
    width: 100%;
    background-image: url(img/background.jpg);
    background-position: center;
    background-size: cover;
    position: absolute;
}
.form-wrap {
    width: 490px;
    height: 480px;
    position: relative;
    margin: 6% auto;
    background: #ffffff;
    padding: 5px;
    overflow: hidden;
}
h3 {
    font-size: 25px;
    color: #8db952;
    text-align: center;
}
.button-wrap {
    width: 230px;
    margin: 35px auto;
    position: relative;
    /* box-shadow: 0 0 600px 9px #635d41; */
    border-radius: 30px;
}
.togglebtn {
    padding: 10px 91px;
    cursor: pointer;
    background: transparent;
    border: 0;
    outline: none;
    position: relative;
}
#btn {
    top: 0;
    left: 0;
    position: absolute;
    width: 230px;
    height: 100%;
    background: #E3DFC8;
    border-radius: 30px;
    transition: .5s;
}

.input-group {
    top: 180px;
    position: absolute;
    width: 280px;
    transition: .5s;
}
.input-field {
    width: 100%;
    padding: 10px 0;
    margin: 5px 0;
    border: none;
    border-bottom: 1px solid #999;
    outline: none;
    background: transparent;
}
.submit {
    width: 85%;
    padding: 10px 30px;
    cursor: pointer;
    display: block;
    margin: auto;
    margin-top: 2rem;
    background: #79a268;
    border: 0;
    outline: none;
    border-radius: 30px;
}

#login {
    left: 50px;
}

</style>    
			<div class="form-wrap">
                <div class="button-wrap">
                    <h3>ADMIN LOGIN</h3>
                </div>
                 <!-- 로그인 실패 메시지 출력 -->
   				 <c:if test="${not empty msg}">
        			<div class="alert alert-danger" role="alert">${msg}</div>
   				 </c:if>
             
           		<form action="${pageContext.request.contextPath}/Login" id="join" method="post">
            		<input type="text" class="input-field" name="admin_id" placeholder="Admin Id" required>
            		<input type="password" class="input-field" name="admin_pass" placeholder="Enter Password" required>
            		<button class="submit" value="Submit">Login</button>
        		</form>
            </div>