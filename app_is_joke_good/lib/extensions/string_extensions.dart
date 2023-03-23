extension StringExtensions on String {
  bool get isPassword {
    final regex = RegExp(r'[\^$*.\[\]{}()?\-"!@#%&/\,><:;_~`+=]');
    return contains(regex);
  }
}
