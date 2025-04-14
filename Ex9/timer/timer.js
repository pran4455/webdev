// countdownTimer.js - jQuery Countdown Timer

$(document).ready(function () {
    let timeLeft = 300;
    let timerDisplay = $("#timer");
    let buyButton = $("#buyNow");
    
    function updateTimer() {
        let minutes = Math.floor(timeLeft / 60);
        let seconds = timeLeft % 60;
        timerDisplay.text(`${minutes}:${seconds < 10 ? '0' : ''}${seconds}`);
        
        if (timeLeft === 0) {
            clearInterval(countdown);
            buyButton.prop("disabled", true).text("Time Expired");
        }
        
        timeLeft--;
    }
    
    let countdown = setInterval(updateTimer, 1000);
});
