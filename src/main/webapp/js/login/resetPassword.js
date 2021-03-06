const newPassword = document.getElementById("newPassword");
const passwordRegex = /.{8,50}/;
const newPasswordValidation = document.getElementById("newPasswordValidation");
const passwordResetConfirmationButton = document.getElementById("passwordResetConfirmationButton");
const passwordResetForm = document.getElementById("passwordResetForm");
const passwordResetSpinner = document.getElementById("passwordResetSpinner");

newPassword.addEventListener('keyup', e => {

    if (passwordRegex.test(newPassword.value)) {
        newPasswordValidation.classList.add('hidden');
        passwordResetConfirmationButton.removeAttribute("disabled");
    } else {
        newPasswordValidation.classList.remove('hidden');
        passwordResetConfirmationButton.setAttribute("disabled", "true");
    }
})


passwordResetForm.addEventListener('submit', e => {
    passwordResetConfirmationButton.classList.add('hidden');
    passwordResetSpinner.classList.remove('hidden');
})