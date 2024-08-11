//========================================================================================fetch login==
document.getElementById('loginForm').addEventListener('submit', function(event) {
    event.preventDefault();
    
    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;
    
    fetch('/login', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: new URLSearchParams({
        username: username,
        password: password
      })
    })
    .then(response => {
      if (response.ok) {
        window.location.href = '/admin.html';
      } else {
        alert('Invalid credentials');
      }
    });
  });
//========================================================================================admin button==
  document.addEventListener('DOMContentLoaded', function() {
    const adminButton = document.getElementById('adminButton');
    const loginContainer = document.getElementById('loginContainer');
    const overlay = document.createElement('div');
    overlay.className = 'overlay';
    document.body.appendChild(overlay);

    adminButton.addEventListener('click', function(event) {
        event.preventDefault(); // Prevent the default link behavior
        loginContainer.style.display = 'block';
        overlay.style.display = 'block';
    });

    overlay.addEventListener('click', function() {
        loginContainer.style.display = 'none';
        overlay.style.display = 'none';
    });
});