document.addEventListener('DOMContentLoaded', function () {
    const form = document.getElementById('validationForm');
    const nameField = document.getElementById('name');
    const creditNoField = document.getElementById('credit-no');
    const cvvField = document.getElementById('cvv');
    const monthDropdown = document.getElementById('month');
    const yearDropdown = document.getElementById('year');
    const nameError = document.getElementById('nameError');
    const creditError = document.getElementById('creditError');
    const cvvError = document.getElementById('cvvError');
    const expiryError = document.getElementById('expiryError');

    // Dynamically populate month and year dropdowns
    for (let i = 1; i <= 12; i++) {
        const option = document.createElement('option');
        option.value = i;
        option.textContent = i.toString().padStart(2, '0');
        monthDropdown.appendChild(option);
    }

    const currentYear = new Date().getFullYear();
    for (let i = 0; i < 10; i++) {
        const option = document.createElement('option');
        option.value = currentYear + i;
        option.textContent = currentYear + i;
        yearDropdown.appendChild(option);
    }

    // Form validation on submit
    form.addEventListener('submit', function (event) {
        event.preventDefault(); // Prevent form submission
        let isValid = true;

        // Clear previous error messages
        nameError.textContent = '';
        creditError.textContent = '';
        cvvError.textContent = '';
        expiryError.textContent = '';

        // Name validation: Only alphabets
        if (!/^[A-Za-z\s]+$/.test(nameField.value.trim())) {
            nameError.textContent = 'Please enter a valid name (alphabets only).';
            isValid = false;
        }

        // Credit Card Number validation: Starts with 4/5/6, 16 digits
        if (!/^[456]\d{15}$/.test(creditNoField.value.trim())) {
            creditError.textContent =
                'Card number must start with 4, 5, or 6 and contain 16 digits.';
            isValid = false;
        }

        // CVV validation: 3 or 4 digits
        if (!/^\d{3}$/.test(cvvField.value.trim())) {
            cvvError.textContent = 'CVV must be 3 digits.';
            isValid = false;
        }

        // Expiry Date validation: Must be in the future
        const month = parseInt(monthDropdown.value, 10);
        const year = parseInt(yearDropdown.value, 10);
        const currentDate = new Date();
        const expiryDate = new Date(year, month - 1);
        if (isNaN(month) || isNaN(year) || expiryDate <= currentDate) {
            expiryError.textContent = 'Expiry date must be in the future.';
            isValid = false;
        }

        // If all validations pass
        if (isValid) {
            alert('Form submitted successfully!');
            form.reset();
        }
    });
});
