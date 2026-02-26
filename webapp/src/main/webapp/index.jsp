<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DevOps Learning Registration</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .container {
            background: white;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            padding: 40px;
            max-width: 500px;
            width: 100%;
            margin-bottom: 20px;
        }

        .container h1 {
            color: #667eea;
            text-align: center;
            margin-bottom: 10px;
            font-size: 28px;
        }

        .container p {
            color: #666;
            text-align: center;
            margin-bottom: 30px;
            font-size: 14px;
        }

        hr {
            border: none;
            border-top: 2px solid #f0f0f0;
            margin: 20px 0;
        }

        label {
            display: block;
            margin-top: 20px;
            margin-bottom: 8px;
            color: #333;
            font-weight: 600;
            font-size: 14px;
        }

        input[type="text"]{
            width: 100%;
            padding: 12px;
            margin-bottom: 10px;
            border: 2px solid #e0e0e0;
            border-radius: 5px;
            font-size: 14px;
            transition: border-color 0.3s ease;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 5px rgba(102, 126, 234, 0.3);
        }

        .registerbtn {
            width: 100%;
            background-color: #667eea;
            color: white;
            padding: 12px;
            margin-top: 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            transition: background-color 0.3s ease;
        }

        .registerbtn:hover {
            background-color: #764ba2;
        }

        .signin {
            background: #f9f9f9;
            text-align: center;
            margin-top: 20px;
            padding: 20px;
        }

        .signin p {
            margin: 0;
            color: #666;
        }

        .signin a {
            color: #667eea;
            text-decoration: none;
            font-weight: 600;
        }

        .signin a:hover {
            text-decoration: underline;
        }

        .terms {
            text-align: center;
            color: #666;
            font-size: 13px;
            margin: 15px 0;
        }

        .terms a {
            color: #667eea;
            text-decoration: none;
            font-weight: 600;
        }

        .terms a:hover {
            text-decoration: underline;
        }

        .thank-you {
            text-align: center;
            color: #667eea;
            margin-top: 20px;
            display: none;
        }

        .thank-you h1 {
            margin-bottom: 10px;
            color: #764ba2;
        }

        .thank-you h2 {
            color: #667eea;
            font-size: 18px;
        }
    </style>
</head>
<body>
    <div class="main-container">
        <form action="action_page.php" class="form-container">
            <div class="container">
                <h1>Register for DevOps Learning</h1>
                <p>Virtual TechBox Youtube Channel</p>
                <p>Please fill in this form to create an account.</p>
                <hr>

                <label for="Name">Enter Name</label>
                <input type="text" placeholder="Enter Full Name" name="Name" id="Name" required>

                <label for="mobile">Enter Mobile</label>
                <input type="text" placeholder="Enter mobile number" name="mobile" id="mobile" required>

                <label for="email">Enter Email</label>
                <input type="text" placeholder="Enter Email" name="email" id="email" required>

                <label for="psw">Password</label>
                <input type="password" placeholder="Enter Password" name="psw" id="psw" required>

                <label for="psw-repeat">Repeat Password</label>
                <input type="password" placeholder="Repeat Password" name="psw-repeat" id="psw-repeat" required>

                <hr>

                <div class="terms">
                    <p>By creating an account you agree to our <a href="#">Terms & Privacy</a></p>
                </div>

                <button type="submit" class="registerbtn">Register</button>
            </div>

            <div class="container signin">
                <p>Already have an account? <a href="#">Sign in</a></p>
            </div>

            <div class="container thank-you" id="thankYou">
                <h1>Thank You!</h1>
                <h2>Happy Learning. See You Again.</h2>
            </div>
        </form>
    </div>
</body>
</html>