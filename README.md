MagicRelay Open Relay Testing program 

📌 Overview

This Tool is designed to test an SMTP server for open relay vulnerabilities. It attempts to send an email using user-supplied details to check if the server allows unauthenticated email relay.

🛠 Requirements
**************************************
Nim programming language installed

An active SMTP server to test against

Network connectivity

🚀 Usage
******************************************************
Clone this repository:

git clone https://github.com/threadedsec/MagicRelay.git

cd MagicRelay

🛠 Compile the program using Nim:
***********************************************************
nim c Magicrelay.nim # compile linux binaries

nim c -d:mingw Magicrelay.nim #compile windows binaries

🛠 Run the program:
************************************************************************
#linux$: ./Magicrelay

#cmd$: Magicrelay.exe


Enter the required details when prompted:

Target SMTP Server IP

SMTP port

Sender email address

Recipient email address

Email subject

Email message

Process
****************************************************************************

The  will communicate with the SMTP server and attempt to send an email.

Review the responses to determine if the server is vulnerable to open relay attacks.

⚙️ How It Works
************************************************************************************
The program establishes a socket connection to the provided SMTP server and port.

It sends HELO/EHLO, MAIL FROM, RCPT TO, and DATA commands to simulate an email transaction.

If the server accepts the email without authentication, it may be susceptible to open relay abuse.

The program outputs all responses from the SMTP server for analysis.

📖 **Example Output**
**************************************************************************************

Magic Relay!!!

Enter IP of Target SMTP Server: mail.example.com

Enter SMTP Port: 25

Enter Email Sender address: attacker@example.com

Enter recipient's Email address: victim@example.com

Enter the Email Subject: Test Email

Enter the Email Message: This is a test email.

target : mail.example.com Port : 25 from : attacker@example.com mailto : victim@example.com

[+] Server Response: 220 mail.example.com ESMTP Postfix

[+] HELO Response: 250 mail.example.com

[+] MAIL FROM Response: 250 OK

[+] RCPT TO Response: 250 OK

[+] DATA Response: 250 OK: Message accepted for delivery

⚠️ Disclaimer
*************************************************************************************************************

This program is intended for security testing and educational purposes only. Do not use it on unauthorized systems. The author assumes no responsibility for any misuse of this program.

📜 License
*************************************************************************************************************
This project is licensed under the MIT License - see the LICENSE file for details.

🤝 Contributing
*************************************************************************************************************
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
