<!DOCTYPE html>
<html>
<head>
    <title>TravelEase Registration & Booking</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <div class="container">
        <h2>Register & Book Your Trip</h2>
        <!-- Registration Form -->
        <form action="RegistrationServlet" method="POST">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>
            
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            
            <label for="from">From:</label>
            <input type="text" id="from" name="from" required>
            
            <label for="to">To:</label>
            <input type="text" id="to" name="to" required>
            
            <label for="adults">Adults:</label>
            <input type="number" id="adults" name="adults" required>
            
            <label for="children">Children:</label>
            <input type="number" id="children" name="children" required>
            
            <label for="class">Class:</label>
            <select id="class" name="class" required>
                <option value="Economy">Economy</option>
                <option value="Business">Business</option>
                <option value="First">First</option>
            </select>
            
            <label for="departure">Departure Date:</label>
            <input type="date" id="departure" name="departure" required>
            
            <label for="journeyType">Journey Type:</label>
            <select id="journeyType" name="journeyType">
                <option value="One-way">One-way</option>
                <option value="Round-trip">Round-trip</option>
            </select>
            
            <!-- Register & Book Button -->
            <button type="submit">Register & Book</button>
        </form>

        <hr>

        <!-- Separate form for the Login button -->
        <form action="login.jsp" method="GET">
            <!-- Login Button -->
            <button type="submit">Already Registered? Login Here</button>
        </form>
    </div>
</body>
</html>
