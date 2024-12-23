function showLogin() {
    document.getElementById("login-form").classList.add("active");
    document.getElementById("signup-form").classList.remove("active");
    document.getElementById("login-btn").classList.add("active");
    document.getElementById("signup-btn").classList.remove("active");
}

function showSignup() {
    document.getElementById("signup-form").classList.add("active");
    document.getElementById("login-form").classList.remove("active");
    document.getElementById("signup-btn").classList.add("active");
    document.getElementById("login-btn").classList.remove("active");
}

// Set default to login form
document.getElementById("login-btn").classList.add("active");
document.getElementById("login-form").classList.add("active");


// document.getElementById('signup-form').addEventListener('submit', function(event) {
//     event.preventDefault();
//
//     const username = document.querySelector('input[name="uname"]').value.trim();
//     const email = document.querySelector('input[name="email"]').value.trim();
//     const password = document.querySelector('#signin-form input[name="password"]').value.trim();
//     const phone = document.querySelector('input[name="phone"]').value.trim();
//
//     let isValid = true;
//     let errorMessage = '';
//
//     if (username.length < 3 || username.length > 20) {
//         isValid = false;
//         errorMessage += 'Username must be between 3 and 20 characters.\n';
//     }
//
//     const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
//     if (!emailRegex.test(email)) {
//         isValid = false;
//         errorMessage += 'Please enter a valid email address.\n';
//     }
//
//     if (password.length < 6) {
//         isValid = false;
//         errorMessage += 'Password must be at least 6 characters long.\n';
//     }
//
//     const phoneRegex = /^[0-9]{10}$/; // Ensures phone number is 10 digits
//     if (!phoneRegex.test(phone)) {
//         isValid = false;
//         errorMessage += 'Phone number must be a 10-digit number.\n';
//     }
//
//     if (!isValid) {
//         alert(errorMessage);
//     } else {
//         alert('Signup form validated successfully!');
//         this.submit();
//     }
// });
