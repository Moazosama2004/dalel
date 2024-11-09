String? validateEmail(String? value) {
  // Check if email is empty
  if (value == null || value.isEmpty) {
    return 'Please enter an email address';
  }
  // Check if email format is valid
  final emailRegex =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  if (!emailRegex.hasMatch(value)) {
    return 'Please enter a valid email address';
  }
  return null;
}

String? validateName(String? value, {required String fieldName}) {
  // Check if name is empty
  if (value == null || value.isEmpty) {
    return 'Please enter your $fieldName';
  }
  // Check if name is at least 2 characters long
  if (value.length < 2) {
    return '$fieldName should be at least 2 characters long';
  }
  return null;
}

String? validatePassword(String? value) {
  // Check if password is empty
  if (value == null || value.isEmpty) {
    return 'Please enter a password';
  }
  // Check if password meets minimum length
  if (value.length < 8) {
    return 'Password should be at least 8 characters long';
  }
  // Check if password contains at least one uppercase letter, one lowercase letter, and one digit
  final passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d).+$');
  if (!passwordRegex.hasMatch(value)) {
    return 'Password must contain at least one uppercase letter, one lowercase letter, and one digit';
  }
  return null;
}

// Combine all validations in a single validator function
Map<String, String?> validateForm({
  required String? email,
  required String? firstName,
  required String? lastName,
  required String? password,
}) {
  return {
    'email': validateEmail(email),
    'firstName': validateName(firstName, fieldName: 'first name'),
    'lastName': validateName(lastName, fieldName: 'last name'),
    'password': validatePassword(password),
  };
}
