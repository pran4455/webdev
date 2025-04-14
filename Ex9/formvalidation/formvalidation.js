// formValidation.js - JavaScript validation for a registration form

document.addEventListener("DOMContentLoaded", function () {
    document.getElementById("registerForm").addEventListener("submit", function (event) {
        event.preventDefault();
        
        let username = document.getElementById("username").value;
        let email = document.getElementById("email").value;
        let password = document.getElementById("password").value;
        let confirmPassword = document.getElementById("confirmPassword").value;
        
        let errors = [];

        if (username.length < 5) {
            errors.push("Username must be at least 5 characters long.");
        }
        
        let emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailPattern.test(email)) {
            errors.push("Invalid email format.");
        }
        
        if (password.length < 8 || !/[0-9]/.test(password)) {
            errors.push("Password must be at least 8 characters long and contain at least one number.");
        }
        
        if (password !== confirmPassword) {
            errors.push("Passwords do not match.");
        }
        
        let errorDiv = document.getElementById("errorMessages");
        errorDiv.innerHTML = "";
        
        if (errors.length > 0) {
            errors.forEach(error => {
                let p = document.createElement("p");
                p.style.color = "red";
                p.textContent = error;
                errorDiv.appendChild(p);
            });
        } else {
            alert("Registration Successful!");
        }
    });
});