<?php include 'includes/header.php'; ?>


<main class="container">
  <div class="starter-template text-center">
    <h1>CONTACT</h1>
    <p class="lead">THE CONTACT FORM WILL BE HERE

        <form method="POST" name="contactform" action="contact-form-handler.php">

        <p>
        <label for='name'>Your Name:</label> <br>
        <input type="text" name="name" required><br><br>
        </p>

        <p>
            <label for="birthdate">Birthdate:</label> <br>
            <input type="date" id="birthdate" name="birthdate" required><br><br>
        </p>

        <p>
        <label for="gender">Gender:</label> <br>
			<select id="gender" name="gender" required>
				<option value="">-- Select Gender--</option>
				<option value="male">Male</option>
				<option value="female">Female</option>
				<option value="other">Other</option>
			</select><br><br>
        </p>

        <p>
            <label for='email'>Email Address:</label> <br>
            <input type="text" name="email" required><br><br>
        </p>

        <p>
            <label for="phone">Enter a phone number:</label> <br>
            <input type="tel" name="phone"
            required><br><br>
        </p>

        <p>
            <label for="country">Country:</label>   <br>
                <input type="text" id="country" name="country" list="country-list">
                <datalist id="country-list">
                    <option value="Ireland">
                    <option value="Canada">
                    <option value="Mexico">
                    <option value="Japan">
                    <option value="China">
                    <option value="Denmark">
                    <option value="Norway">
                    <option value="Iceland">
                    <option value="Peru">
                    <option value="Guatemala">
                    <option value="China">
                    <option value="Brazil" required>
			</datalist><br><br>
        </p>



        <p>
            <label for="terms">Agree to terms and conditions:</label>
            <input type="checkbox" id="terms" name="terms" required><br><br>
        </p>

        <p>
            <label for='message'>Message:</label> <br>
            <textarea name="message"></textarea> required><br><br>
        </p>

        <p>
            <label for="datetime">Date and time:</label> <br>
		    <input type="datetime-local" id="datetime" name="datetime" required><br><br>
        </p>

        <p>
            <label for="file">Upload file:</label> <br>
			<input type="file" id="file" name="file"><br><br>
        </p>

        <input type="submit" value="Submit"> <br>
        </form>

        <br> All you get is this text and a mostly barebones HTML document.</p>
  </div>

</main><!-- /.container -->


<?php include 'includes/footer.php'; ?>