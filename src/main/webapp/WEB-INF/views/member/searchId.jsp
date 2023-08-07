<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
</head>
<body>
    <input type="email" id="target_email" placeholder="Enter Email...">
    <button id="send_email_button">Send Email</button>

    <script>
        $(document).ready(function () {
            $("#send_email_button").click(function () {
                const target_email = $("#target_email").val();

                $.ajax({
                    type: "POST",
                    url: "/sendEmail",
                    data: {email: target_email},
                    success: function () {
                        alert('Email sent successfully');
                    },
                    error: function () {
                        alert('Error while sending email');
                    }
                });
            });
        });
    </script>
</body>
</html>