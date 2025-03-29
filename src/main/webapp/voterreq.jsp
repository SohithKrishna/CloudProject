<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Voter Chat</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.2/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
</head>
<body>
    <div>
        <h3>Your Requests</h3>
        <ul id="requestsList">
            <!-- Dynamically load voter's requests here -->
        </ul>
    </div>
    <div>
        <h3>Chat</h3>
        <div id="chatBox"></div>
        <input type="text" id="messageInput" placeholder="Enter message">
        <button onclick="sendMessage()">Send</button>
    </div>

    <script>
        var stompClient = null;
        var currentRequestId = null;
        var senderId = 1;  // Current Voter ID

        function connect() {
            var socket = new SockJS('/chat');
            stompClient = Stomp.over(socket);
            stompClient.connect({}, function () {
                loadRequests();
            });
        }

        function loadRequests() {
            fetch('/api/chat/requests/' + senderId)
                .then(response => response.json())
                .then(data => {
                    var requestsList = document.getElementById("requestsList");
                    requestsList.innerHTML = '';
                    data.forEach(request => {
                        var li = document.createElement("li");
                        li.textContent = request.title;
                        li.onclick = function () {
                            openChat(request.id);
                        };
                        requestsList.appendChild(li);
                    });
                });
        }

        function openChat(requestId) {
            if (currentRequestId) {
                stompClient.unsubscribe('/topic/chat/' + currentRequestId);
            }
            currentRequestId = requestId;
            document.getElementById("chatBox").innerHTML = '';
            stompClient.subscribe('/topic/chat/' + requestId, function (msg) {
                var message = JSON.parse(msg.body);
                document.getElementById("chatBox").innerHTML += `<div>${message.sender.name}: ${message.message}</div>`;
            });
        }

        function sendMessage() {
            var messageContent = document.getElementById("messageInput").value;
            stompClient.send("/app/sendMessage", {}, JSON.stringify({
                requestId: currentRequestId,
                sender: { id: senderId },
                message: messageContent
            }));
        }

        connect();
    </script>
</body>
</html>
