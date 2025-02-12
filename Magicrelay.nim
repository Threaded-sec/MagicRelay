import std/[strutils, net,os]

let asciiArt = """

      +      
     +:+     
             
     + +     
 +         + 
+=    =+   =+
+:+   +   +:+
+::+     +::+
+::::+:+::::+
+:::+:::+:::+
+:::::::::::+
++:::::::::++
*+++++++++++*
"""
echo "\r\n Magic Relay!!!\r\n",asciiArt


# Read target domain
stdout.write("Enter IP of Target SMTP Server: ")

let server = readLine(stdin)

# Read target SMTP port
stdout.write("Enter SMTP Port: ")

let port = Port(parseUInt(readLine(stdin)).uint16)

# Read Email source address
stdout.write("Enter Email Sender address: ")

let mailfrom = readLine(stdin)

# Read Email recipient address
stdout.write("Enter recipient's Email address: ")

let mailto = readLine(stdin)

# Read User Subject
stdout.write("Enter the Email Subject: ")

let subject = readLine(stdin)


# Read User Message
stdout.write("Enter the Email Message: ")

let message = readLine(stdin)


echo "target :", server, "Port :", port, "from :", mailfrom, "mailto :", mailto

var socket = newSocket()
socket.connect(server, Port(port))

# Read server's initial response
var response: string
response = socket.recvLine(timeout = 1000)  # Assign the return value to 'response'
echo "[+] Server Response: ", response

# Send HELO/EHLO command
socket.send("HELO test.com\r\n")
response = socket.recvLine(timeout = 1000)  # Assign the return value to 'response'
echo "[+] HELO Response: ", response

# Try sending an email
socket.send("MAIL FROM:<" & mailfrom & ">\r\n")
response = socket.recvLine(timeout = 1000)  # Assign the return value to 'response'
echo "[+] MAIL FROM Response: ", response

socket.send("RCPT TO:<" & mailto & ">\r\n")
response = socket.recvLine(timeout = 1000)  # Assign the return value to 'response'
echo "[+] RCPT TO Response: ", response

socket.send("DATA\r\n")
response = socket.recvLine(timeout = 1000)  # Assign the return value to 'response'
socket.send("Subject: " & subject & " \r\n\r\n" & message & ".\r\n")
response = socket.recvLine(timeout = 1000)  # Assign the return value to 'response'
echo "[+] DATA Response: ", response

# Close connection
socket.send("QUIT\r\n")
socket.close()

