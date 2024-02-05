console.log('Hello World');

// Assume the correct answer is initially set
let correctAnswer = "L3";
let score = 0;
let jsonData = null;
let currentQuestion = 0;
let wrongAnswers = [];
let bufquestion = null;


nextBtn = document.getElementById("nextQuestion");
nextBtn.addEventListener("click", function() {
    displayNext();
});

function displayStart() {
    document.getElementById("question").style.display = "flex";
    document.getElementById("result").style.display = "none";
    play_game();
}


function displayNext() {
    const keys = Object.keys(jsonData);

    if (currentQuestion < keys.length) {
        const currentKey = keys[currentQuestion];
        bufquestion = currentKey;
        const currentValue = jsonData[currentKey];
        document.getElementById("question_value").textContent = currentKey;
        correctAnswer = currentValue;
        currentQuestion++;
        resetAnswerButtons();
    } else {
        document.getElementById("question").style.display = "none";
        document.getElementById("result").style.display = "block";
        let stringCorrection = getCorrectionString();
        document.getElementById("result-text").innerHTML = "You have completed the quiz!, your score is: " + score + " out of " + keys.length + "<br><br>" + stringCorrection;
    }
}

function getCorrectionString() {
    let stringCorrection = "";
    for (let i = 0; i < wrongAnswers.length; i++) {
        stringCorrection += "Question: " + wrongAnswers[i][0] + " Correct Answer: " + wrongAnswers[i][1] + " Your Answer: " + wrongAnswers[i][2] + "<br>";
    }
    return stringCorrection;
}


function play_game() {
    fetch('/get_question')
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            console.log('Success:', data);
            jsonData = shuffleArray(data);
            console.log(jsonData);
            displayNext();
        })
        .catch(error => {
            console.error('Error:', error);
        });
}


function shuffleArray(array) {
    for (let i = array.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [array[i], array[j]] = [array[j], array[i]];
    }
    return array;
}


function initializeAnswerButtons() {
    const answerButtons = document.querySelectorAll('.btn-container button');
    answerButtons.forEach((button) => {
        button.style.backgroundColor = '';
        button.addEventListener('click', () => handleAnswer(button.textContent));
    });
}

function resetAnswerButtons() {
    const answerButtons = document.querySelectorAll('.btn-container button');
    answerButtons.forEach((button) => {
        button.style.backgroundColor = '';
    });
}

function handleAnswer(selectedAnswer) {
    const resultTextElement = document.getElementById("result-text");
    const answerButtons = document.querySelectorAll(".btn-container button");

    if (jsonData === null) {
        resultTextElement.textContent = "Please start the game first!";
        return;
    }

    if (selectedAnswer === correctAnswer) {
        // If the selected answer is correct
        resultTextElement.textContent = "Correct! Well done!";
        score++;
        // Set the correct answer button to green
        answerButtons.forEach((button) => {
            button.style.backgroundColor = button.textContent === correctAnswer ? "green" : "";
        });
    } else {
        // If the selected answer is incorrect
        resultTextElement.textContent = "Incorrect. Try again!";
        const correction = [bufquestion, correctAnswer, selectedAnswer];
        if (!wrongAnswers.includes(correction))
            wrongAnswers.push(correction);
        // Set the selected answer button to red
        answerButtons.forEach((button) => {
            button.style.backgroundColor = button.textContent === selectedAnswer ? "red" : "";
        });
    }
}

function displayResult() {
    document.getElementById("question").style.display = "flex";
    document.getElementById("result").style.display = "flex";
}

function reset() {
    document.getElementById("question").style.display = "none";
    document.getElementById("result").style.display = "none";
    const answerButtons = document.querySelectorAll(".btn-container button");
    answerButtons.forEach((button) => {
        button.style.backgroundColor = ""; // Reset button styles
    });
}

// Call initialization functions
initializeAnswerButtons();
