// quizApp.js - Dynamic Quiz App

document.addEventListener("DOMContentLoaded", function () {
    let quizData = [
        { question: "What is the capital of France?", options: ["Paris", "London", "Berlin", "Madrid"], answer: "Paris" },
        { question: "Which planet is known as the Red Planet?", options: ["Earth", "Venus", "Mars", "Jupiter"], answer: "Mars" },
        { question: "Who wrote 'To Kill a Mockingbird'?", options: ["Harper Lee", "J.K. Rowling", "Ernest Hemingway", "Jane Austen"], answer: "Harper Lee" }
    ];
    
    let quizContainer = document.getElementById("quizContainer");
    let submitButton = document.getElementById("submitQuiz");
    let resultContainer = document.getElementById("quizResult");

    function loadQuiz() {
        quizData.forEach((q, index) => {
            let div = document.createElement("div");
            div.innerHTML = `<p>${q.question}</p>`;
            q.options.forEach(option => {
                div.innerHTML += `<label><input type="radio" name="question${index}" value="${option}"> ${option}</label><br>`;
            });
            quizContainer.appendChild(div);
        });
    }

    submitButton.addEventListener("click", function () {
        let score = 0;
        quizData.forEach((q, index) => {
            let selected = document.querySelector(`input[name="question${index}"]:checked`);
            if (selected && selected.value === q.answer) {
                score++;
            }
        });
        resultContainer.textContent = `You scored ${score} out of ${quizData.length}`;
    });

    loadQuiz();
});
