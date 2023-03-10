const form = document.querySelector('form');
const nameInput = document.querySelector('input[name="name"]');
const birthdateInput = document.querySelector('input[name="birthdate"]');

form.addEventListener('submit', function(event) {
    event.preventDefault();
    if (nameInput.value.trim() === '' || birthdateInput.value.trim() === '') {
        alert('Please fill in all fields.');
    } else {
        // Submit the form if all fields are filled in.
        form.submit();
    }
});