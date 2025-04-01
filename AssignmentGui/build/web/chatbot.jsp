
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PDF Q&A Chatbot</title>
    <script src="https://mozilla.github.io/pdf.js/build/pdf.js"></script>
</head>
<body>
    <h2>Upload PDF & Ask a Question</h2>
    <input type="file" id="pdfUpload" accept="application/pdf">
    <br><br>
    <textarea id="question" placeholder="Enter your question..." rows="3" cols="50"></textarea>
    <br><br>
    <button onclick="processPDF()">Get Answer</button>
    <h3>Answer:</h3>
    <p id="answer"></p>

    <script>
        async function extractTextFromPDF(file) {
            const reader = new FileReader();
            reader.readAsArrayBuffer(file);
            return new Promise((resolve) => {
                reader.onload = async function () {
                    const pdfData = new Uint8Array(reader.result);
                    const pdf = await pdfjsLib.getDocument({ data: pdfData }).promise;
                    let text = "";
                    for (let i = 1; i <= pdf.numPages; i++) {
                        let page = await pdf.getPage(i);
                        let content = await page.getTextContent();
                        text += content.items.map(item => item.str).join(" ") + "\n";
                    }
                    resolve(text);
                };
            });
        }

        async function processPDF() {
            const file = document.getElementById("pdfUpload").files[0];
            if (!file) {
                alert("Please upload a PDF file.");
                return;
            }
            let pdfText = await extractTextFromPDF(file);
            let userQuestion = document.getElementById("question").value;
            if (!userQuestion.trim()) {
                alert("Please enter a question.");
                return;
            }
            let response = await fetch("https://api.openai.com/v1/chat/completions", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    "Authorization": "Bearer YOUR_OPENAI_API_KEY"
                },
                body: JSON.stringify({
                    model: "gpt-3.5-turbo",
                    messages: [
                        { role: "system", content: "You are an AI that answers questions based on the provided document." },
                        { role: "user", content: `Answer based on this text:\n\n${pdfText}\n\nQuestion: ${userQuestion}` }
                    ]
                })
            });
            let result = await response.json();
            document.getElementById("answer").innerText = result.choices[0].message.content;
        }
    </script>
</body>
</html>
