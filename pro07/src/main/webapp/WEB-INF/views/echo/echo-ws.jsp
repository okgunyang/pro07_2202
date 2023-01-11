<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	<title>상담 채팅</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-latest.js"></script>
	<script src="../resources/sockjs.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <form id="chatForm">
    	<input type="hidden" id="session_id" name="session_id" value="${sid}" />
        <div class="chat_start_main" style="padding:18px;font-weight:800;">상담 CHAT</div>
        <div class="chat_main" style="display:none;">
            <div class="modal-header" style="height:20%;padding:18px;font-weight:800;">
                상담 CHAT 
            </div>
            
            <div class="modal-content" id="chat" style="height:60%;">
                
            </div>
            <div class="modal-footer">
                <input type="text" id="message" class="form-control" style="height:20%;" placeholder="메세지를 입력하세요"/>    
            </div>
        </div>
<!--         <button class="">send</button> -->
    </form>
    <script>
	//전역변수 선언-모든 홈페이지에서 사용 할 수 있게 index에 저장
	var socket = null;
	$(document).ready(function(){
	    if($("#session_id").val()!=""){
	            connectWS();
	    } else {
	    	$("#message").val("로그인 중이 아닙니다.");
	    }
	});
    $(".chat_start_main").click(function(){
        $(this).css("display","none");
        $(".chat_main").css("display","inline");
    })
    $(".chat_main .modal-header").click(function(){
        $(".chat_start_main").css("display","inline");
        $(".chat_main").css("display","none");
    });
 
    function connectWS(){
        var sock = new SockJS("/echo");
            socket = sock;
        sock.onopen = function() {
               console.log('info: connection opened.');
        };
        sock.onmessage = function(e){
//             console.log(e);
//             var strArray = e.data.split(":");
//             if(e.data.indexof(":") > -1){
//                 $(".chat_start_main").text(strArray[0]+"님이 메세지를 보냈습니다.");
//             }
//             else{
//             }
            $("#chat").append(e.data + "<br/>");
        }
        sock.onclose = function(){
            $("#chat").append("연결 종료");
//              setTimeout(function(){conntectWs();} , 10000); 
        }
        sock.onerror = function (err) {console.log('Errors : ' , err);};
 
        $("#chatForm").submit(function(event){
            event.preventDefault();
                sock.send($("#message").val());
                $("#message").val('').focus();    
        });
    }
</script>
</body>
</html>