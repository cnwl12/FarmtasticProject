<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
    // 이벤트를 탭에 추가하여 1:1 문의 탭을 클릭했을 때 작동하게 합니다.
    $('a[data-toggle="tab"][href="#tabs-4"]').on('click', function() {
        fetch('/getInquiryList')
            .then(function(response) {
                return response.json();
            })
            .then(function(inquiryList) {
                let inquiryListHtml = '';

                inquiryList.forEach(function(inquiry) {
                    inquiryListHtml += `
                        <tr>
                            <td>${inquiry.id}</td>
                            <td>${inquiry.title}</td>
                            <td>${inquiry.author}</td>
                            <td>${inquiry.date}</td>
                        </tr>
                    `;
                });

                // 가져온 문의 내용을 테이블에 렌더링합니다.
                $('#inquiryList').html(inquiryListHtml);
            })
            .catch(function(error) {
                console.error('Error:', error);
            });
    });
</script>
</body>
</html>