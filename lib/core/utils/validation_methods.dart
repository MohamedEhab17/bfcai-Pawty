//validation methods
String? validateUsername(String? value) {
  if (value == null || value.trim().isEmpty) return 'Username is required';
  final regex = RegExp(r'^[A-Za-z][A-Za-z0-9_]{2,19}$');
  if (!regex.hasMatch(value.trim())) {
    return 'Username must start with a letter, be 3-20 characters, and contain only letters, numbers, or underscores';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) return 'Password is required';
  final regex = RegExp(
    r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>_\-\\\/]).{8,}$',
  );
  if (!regex.hasMatch(value)) {
    return 'Password must be at least 8 characters long, and include uppercase, lowercase, number, and special character';
  }
  return null;
}

String? validateEmailOrPhone(String? value) {
  if (value == null || value.trim().isEmpty) return 'This field is required';
  final emailRegex = RegExp(
    r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$',
  );
  final phoneRegex = RegExp(r'^(?:\+?20)?1[0125]\d{8}$');
  if (emailRegex.hasMatch(value.trim()) || phoneRegex.hasMatch(value.trim())) {
    return null;
  }
  return 'Please enter a valid email or phone number';
}
