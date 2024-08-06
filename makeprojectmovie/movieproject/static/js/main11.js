document.getElementById("logoutButton").addEventListener("click", function(event) {
    event.preventDefault(); // Prevent the default action (following the link)

    // Show confirmation dialog
    if (confirm("Are you sure you want to logout?")) {
        // If user confirms, proceed with logout
        window.location.href = "{% url 'signout' %}"; // Redirect to logout URL
    }
});