<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Simple Chat App</title>
    <script>
        let socket;
        function connect() {
            socket = new WebSocket("ws://localhost:8080/ChatApp/chat");
            socket.onmessage = function(event) {
                const chatBox = document.getElementById("chat");
                chatBox.value += event.data + "\n";
            };
        }
        function sendMessage() {
            const msg = document.getElementById("msg").value;
            socket.send(msg);
            document.getElementById("msg").value = "";
        }
    </script>
</head>
<body onload="connect()">
    <h2>Simple Chat App</h2>
    <textarea id="chat" rows="15" cols="50" readonly></textarea><br>
    <input type="text" id="msg" placeholder="Type a message" />
    <button onclick="sendMessage()">Send</button>
</body>
</html>
