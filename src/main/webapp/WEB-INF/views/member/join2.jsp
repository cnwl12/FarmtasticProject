<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>  
<head>   
<meta charset="UTF-8"> 
<title>Farmtastic_Join2</title> 

   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T">


   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" type="text/css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/elegant-icons.css" type="text/css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nice-select.css" type="text/css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css" type="text/css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css" type="text/css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slicknav.min.css" type="text/css"> 
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" type="text/css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member_join.css" type="text/css"> 

   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script src="${pageContext.request.contextPath}/resources/js/joinPost.js"></script>

<style>
input#post {
    padding: 0px 10px 19px 113px;
    margin: -5px 0px 0px 137px;
    width: 329px;
}

button#goMain {
    background-color: #7fad39;
    color : #fff !important; 
    min-width: 115px;
    margin-left: 5px;
    padding-right: 15px;
    min-height: 40px;
}

button#submitBtn {
   background: #7fad39; 
   color : #fff !important;
    min-width: 115px;
    margin-left: 5px;
    padding-right: 15px;
    min-height: 40px;
}

.invalid-feedback {
    display: none;
    width: 100%;
    margin-top: 1.25rem !important; 
    font-size: 80%;
    color: #dc3545;
    margin-left: 3px;
}

li {
    display: flex;
    align-items: center;
}

label {
    margin-right: 5px;
}

form {
        position: relative;
    }
    input#seller_id, #seller_pass, #seller_pass2, #seller_name,
          #seller_licenseNum, #seller_storeName, #seller_accountNum,
          #seller_accountHolder, #seller_phone, #seller_email{
        position: absolute;
        top: 0;
        left: 0;
        padding-left: 20px;
    }
</style>
 
</head>

<body>

<jsp:include page="../top.jsp"></jsp:include>

<div id="container"> 
   <div class="join_wrap">
      <div id="join_container" role="main">
         <div class="join_header">
            <h2>사업자 회원가입</h2>
         </div>  
         <div class="join_content">  
            <div class="form">
               <form enctype="multipart/form-data" class="validation-form" novalidate action="${pageContext.request.contextPath}/insertPro2" id="join2" name="join2" method="post">
                  <fieldset>
                     <legend>팜타스틱 사업자 회원가입 정보입력</legend>
                     <p class="">회원정보를 입력해주세요. 모두 입력하셔야 가입이 가능합니다.</p>
                      
                     <ul class="form_list">
                     
                        <li>
                        <input type="hidden" name="join_date" id="join_date">
                        <input type="text"  placeholder="ID 입력" name="seller_id" id="seller_id" maxlength="10" >
                        <div id = "idcheckdiv"></div>
                        <div id="invalid_id" class="invalid-feedback">
                             </div>
                             <div id="invalid_id2" class="invalid-feedback">
                             최소 2자 이상 최대 10자 / 영문 대소문자, 숫자만 입력하세요. 
                             </div>
                        </li>   
                        
                        <li>
                        <input type="password" placeholder="비밀번호를 작성해주세요" name="seller_pass" id="seller_pass" maxlength="15">
                        <div id= "invalid_pass" class="invalid-feedback">
                             </div>
                             <div id="invalid_pass2" class="invalid-feedback">
                             최소 2자 이상 최대 15자 / 영문 대소문자, 숫자만 입력하세요. 
                             </div>
                             <div id="invalid_pass3" class="invalid-feedback">
                             아이디와 일치한 비밀번호는 사용이 불가능합니다. 
                             </div>
                        </li>
                        
                        <li> 
                        
                        <input type="password" placeholder="위와 동일한 비밀번호를 작성해주세요" name="seller_pass2" id="seller_pass2" maxlength="15">
                        <div id= "invalid_pass4" class="invalid-feedback">
                            비밀번호가 일치하지 않습니다.
                             </div>
                        </li>
                        
                        <li>   
                        <input type="text" placeholder="이름" name="seller_name" id="seller_name" maxlength="10">
                        <div id= "invalid_name" class="invalid-feedback">
                             </div>
                             <div id= "invalid_name2" class="invalid-feedback">
                            최소 2글자 이상, 한글과 영어만 입력하세요.
                             </div>
                        </li>
                        
                        <li>   
                        <input type="text" placeholder="상점명" name="seller_storeName" id="seller_storeName" maxlength="10">
                        <div id= "invalid_storeName" class="invalid-feedback">
                            상점명을 입력해주세요.
                             </div>
                             <div id= "invalid_storeName2" class="invalid-feedback">
                            최소 2글자 이상 10글자 이내, 한글과 영어만 입력하세요.
                             </div>
                        </li>
                        
                        <li>   
                        <input type="text" placeholder="사업자 번호" name="seller_licenseNum" id="seller_licenseNum" maxlength="12">
                        <div id= "invalid_licenseNum" class="invalid-feedback">
                            사업자번호 입력해주세요.
                             </div>
                             <div id= "invalid_licenseNum2" class="invalid-feedback">
                            양식에 맞추어 작성해주세요.(Ex.123-45-67890)
                             </div>
                        </li>                       
                        <li>
                           <label for="seller_bank" style= "margin-top: 9px; color: gray;">은행명</label>
                           <select name="seller_bank" id="seller_bank">
                               <option value="Kookmin">국민은행</option>
                                <option value="Busan">부산은행</option>
                                <option value="Kakao">카카오뱅크</option>
                                <option value="Shinhan">신한은행</option>
                                <option value="Woori">우리은행</option>
                                <option value="KEB">기업은행</option>
                                <option value="Nonghyup">농협은행</option>
                                <option value="Suhyup">수협은행</option>
                                <option value="Shinhyup">신협은행</option>
                                <option value="Hana">하나은행</option>
                                <option value="Beobwoon">저축은행</option>
                                <option value="Gwangju">광주은행</option>
                                <option value="Jeju">제주은행</option>
                                <option value="Daegu">대구은행</option>
                             </select>
                        </li>
                        
                        <li>   
                        <input type="text" placeholder="계좌번호(-없이)" name="seller_accountNum" id="seller_accountNum" oninput="removeHyphen(event);" maxlength="14">
                        <div id= "invalid_accountNum" class="invalid-feedback">
                            계좌번호를 입력해주세요.
                             </div>
                             <div id= "invalid_accountNum" class="invalid-feedback">
                            하이픈(-)없이 숫자만 입력해주세요.
                             </div>
                        </li>
                        
                        <li>   
                        <input type="text" placeholder="예금주" name="seller_accountHolder" id="seller_accountHolder" maxlength="10">
                        <div id= "invalid_accountHolder" class="invalid-feedback">
                            예금주를 입력해주세요.
                             </div>
                             <div id= "invalid_accountHolder" class="invalid-feedback">
                            최소 2글자 이상, 한글과 영어만 입력하세요.
                             </div>
                        </li>
                          
                          <li>
                        <input type="text" placeholder="연락처(휴대폰)번호 작성" name="seller_phone" id="seller_phone" oninput="removeHyphen(event);" maxlength="11">
                        <div id= "invalid_phone" class="invalid-feedback">
                           
                             </div>
                             <div id= "invalid_phone2" class="invalid-feedback">
                            연락처를 올바르게 입력해주세요.
                             </div>
                        </li>
                        
                        <li>
                        <input type="email" placeholder="이메일" name="seller_email" id="seller_email" >
                        <div id= "invalid_email" class="invalid-feedback">
                            이메일을 입력해주세요.
                             </div>
                             <div id= "invalid_email2" class="invalid-feedback">
                            이메일을 올바른 형식으로 입력해주세요.
                             </div>
                        </li>
                     
                        <li>
                        <input type="text" name="seller_post" id="sample4_postcode" placeholder="사업장주소" style="width: 75px;;">
                        <input type="button" id="seller_post" onclick="sample4_execDaumPostcode()" value="[우편번호 찾기]" required style="margin: 0px 0px 0px 3px; height: 22px; width: 100px; color: gray;">
                        <div id="invalid_post" class="invalid-feedback">
                             주소를 입력해주세요.
                        </div>
                        </li>
                        <li>
                        <input type="text" name="seller_addMain" id="sample4_roadAddress" placeholder="도로명주소">
                        </li>
                        <li>
                        <input type="text" id="sample4_jibunAddress" placeholder="지번주소">
                        <span id="guide" style="color:#999;display:none"></span>
                        </li>
                        <li>
                        <input type="text" name="seller_addSub" id="sample4_detailAddress" placeholder="상세주소">
                        </li>
                        <li>
                        <input type="text" id="sample4_extraAddress" placeholder="참고항목">
                        </li>
                        
                        <li>
                        <label for="attachment" style= "margin-top: 9px; color: gray;">첨부파일</label>
                        <input type="file" id="seller_file" name="file" style= "height:37px;"/>
                        </li>
                        
                        <li>
                           <label for="seller_type" style= "margin-top: 9px; color: gray;">사업자 분류</label>
                           <select name="seller_type" id="seller_type">
						        <option value="">카테고리를 선택해주세요</option>
						        <c:forEach  var="type" items="${typeList}">
						            <option value="${type.seller_type}">${type.type_name}</option>
						        </c:forEach>
					       </select>
                             <div id="invalid_type" class="invalid-feedback">
                             	사업자 분류를 선택해주세요.
                             </div>
                        </li>
                     </ul>
                     
                        
                     
                     <div class="btn_zone" style="margin-left: 100px;"> 
                     <button type="button" id="goMain" class="site-btn">처음으로</button>
                     <button type="button" id="submitBtn" class="site-btn">가입</button>
                     </div>
                      
                     
                  </fieldset>  
               </form> 
            </div>
         </div>
      </div> 
   </div>
</div>

   <jsp:include page="../bottom.jsp"></jsp:include>

</body>
   <script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/join2.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/mixitup.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</html> 