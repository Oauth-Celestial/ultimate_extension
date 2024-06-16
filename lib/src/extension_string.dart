part of '../ultimate_extension.dart';

extension StringHelper on String {
  /// Convert the string to sentence case
  /// Eg
  String toSentenceCase() {
    return isEmpty
        ? this
        : "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  /// Limit string till specific characters can be used when user names needs to be limited
  /// while displaying
  String limitCharacters(int maxLength, {String overflowCharacter = ""}) {
    if (length <= maxLength) {
      return this;
    } else {
      return "${substring(0, maxLength)}$overflowCharacter";
    }
  }

  /// Removes white space from the string
  /// e.g  " test user " --> "testuser"
  String get removeAllWhiteSpace {
    return replaceAll(RegExp(r'\s+'), '');
  }

  /// Validate the email format
  bool isValidEmail() {
    final RegExp emailRegex = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
      caseSensitive: false,
      multiLine: false,
    );
    return emailRegex.hasMatch(this);
  }

  bool toBool() {
    // Convert the string to lowercase for case-insensitive comparison
    String lowercaseStr = toLowerCase();

    // Check if the string represents a truthy value
    if (lowercaseStr == 'true' ||
        lowercaseStr == '1' ||
        lowercaseStr == 'yes' ||
        lowercaseStr == 'y') {
      return true;
    }

    // Check if the string represents a falsy value
    if (lowercaseStr == 'false' ||
        lowercaseStr == '0' ||
        lowercaseStr == 'no' ||
        lowercaseStr == 'n') {
      return false;
    }
    // If the string does not represent a boolean value, return false by default
    return false;
  }

  /// mobileNumber.maskString(3, "x")
  /// unmaskedChars  the length of charcter which should not be  masked
  ///
  String maskString(
      {required int byleavingEndCharacters, String maskWith = "x"}) {
    if (isEmpty || length <= byleavingEndCharacters) {
      return this;
    }

    final maskedPart = substring(0, length - byleavingEndCharacters)
        .replaceAll(RegExp(r'.'), maskWith);
    final unmaskedPart = substring(length - byleavingEndCharacters);

    return maskedPart + unmaskedPart;
  }

  List<String> getListFrom({String splittingCharacter = ""}) {
    return split(splittingCharacter).toList();
  }

  bool hasMatch(String pattern) {
    return RegExp(pattern).hasMatch(this);
  }

  List<String> toCharacterList() => isNotEmpty ? split('') : [];

  /// Checks if string consist only numeric.
  /// Numeric only doesn't accepting "." which double data type have
  bool get isNumericOnly => hasMatch(r'^\d+$');

  /// Checks if string consist only Alphabet. (No Whitespace)
  bool get isAlphabetOnly => hasMatch(r'^[a-zA-Z]+$');

  /// Checks if string contains at least one Capital Letter
  bool get hasCapitalletter => hasMatch(r'[A-Z]');
//Considering  Average read speed of human is 200 words per seconds
  int readTime({int wordsPerMinute = 200}) {
    if (isEmpty) {
      return 0;
    }
    var words = trim().split(RegExp(r'(\s+)'));
    var numberofWords = words.length / wordsPerMinute;
    return (numberofWords * 100).toInt();
  }

  /// Check if the string is a valid url
  /// e.g Testing - > false
  /// https://github.com/Oauth-Celestial -> true
  bool get isValidUrl {
    if (isEmpty) {
      return false;
    }
    var regex = RegExp(
        r'[(http(s)?):\/\/(www\.)?a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)');
    return regex.hasMatch(this);
  }

//
// '3.141592653589793238'.limitDecimalPlaces(4)
// Output -> 3.1415
  String limitDecimalPlaces(int decimalPlaces) {
    String errorString =
        "Input is not a valid number string exepected a decimal string .";
    if (!RegExp(r'^-?\d+(\.\d+)?$').hasMatch(this)) {
      throw ArgumentError(errorString);
    }

    if (!contains('.')) {
      return this;
    }
    List<String> parts = split('.');
    if (parts.length != 2) {
      throw ArgumentError(errorString);
    }
    String integerPart = parts[0];
    String decimalPart = parts[1];

    if (decimalPart.length <= decimalPlaces) {
      return this;
    }

    return '$integerPart.${decimalPart.substring(0, decimalPlaces)}';
  }

  int toInt() {
    return int.tryParse(this) ?? 0;
  }

  double toDouble() {
    return double.tryParse(this) ?? 0.0;
  }

  /// String test = "how are you"
  /// print(test.toTitleCase) -> How are you
  String? get toTitleCase {
    if (isEmpty) {
      return this;
    }

    var sentenceWords = trim().toLowerCase().split(' ');
    for (var i = 0; i < sentenceWords.length; i++) {
      sentenceWords[i] = sentenceWords[i].substring(0, 1).toUpperCase() +
          sentenceWords[i].substring(1);
    }
    return sentenceWords.join(' ');
  }

  bool get isVideo {
    var fileExtension = toLowerCase();

    return fileExtension.endsWith(".mp4") ||
        fileExtension.endsWith(".avi") ||
        fileExtension.endsWith(".wmv") ||
        fileExtension.endsWith(".rmvb") ||
        fileExtension.endsWith(".mpg") ||
        fileExtension.endsWith(".mpeg") ||
        fileExtension.endsWith(".3gp");
  }

  /// Checks if string is an audio file.
  bool get isAudio {
    final fileExtension = toLowerCase();

    return fileExtension.endsWith(".mp3") ||
        fileExtension.endsWith(".wav") ||
        fileExtension.endsWith(".wma") ||
        fileExtension.endsWith(".amr") ||
        fileExtension.endsWith(".ogg");
  }

  /// Checks if string is an image file.
  bool get isImage {
    final fileExtension = toLowerCase();

    return fileExtension.endsWith(".jpg") ||
        fileExtension.endsWith(".jpeg") ||
        fileExtension.endsWith(".png") ||
        fileExtension.endsWith(".gif") ||
        fileExtension.endsWith(".bmp");
  }

  String get addOrdinalSuffix {
    if (isNumericOnly) {
      int number = int.tryParse(this)!;

      if (number >= 11 && number <= 13) {
        return '${this}th';
      }
      switch (number % 10) {
        case 1:
          return '${this}st';

        case 2:
          return '${this}nd';

        case 3:
          return '${this}rd';

        default:
          return '${this}th';
      }
    } else {
      return this;
    }
  }

  ///Add escaping characters to map
  ///  e.g  "{\"name\":\"ravi\",\"email\":\"test@yopmail.com\"}" ->  {"name":"ravi","email":"test@yopmail.com"}
  Map<String, dynamic> toMapFromEscapedString() {
    try {
      return json.decode(this);
    } catch (e) {
      return {};
    }
  }

  Map<String, dynamic> getQueryParameters() {
    if (isValidUrl) {
      final uri = Uri.parse(this);
      return uri.queryParameters;
    } else {
      return {};
    }
  }

  String toIndianAbbreviatedString() {
    String suffix = "";
    double value = toDouble();

    if (value >= 10000000) {
      value = value / 10000000;
      suffix = "Cr";
    } else if (value >= 100000) {
      value = value / 100000;
      suffix = "L";
    } else if (value >= 1000) {
      value = value / 1000;
      suffix = "K";
    }

    return '${value.toStringAsFixed(2)} $suffix';
  }

  String formatCurrency(
    String separator,
    String symbol,
    bool includeSymbol, {
    String decimalSeparator = '.',
  }) {
    String formatted = '';
    int count = 0;

    // Handle integer part and decimal part separately
    List<String> parts = split(decimalSeparator);
    String integerPart = parts[0];
    String decimalPart = parts.length > 1 ? parts[1] : '';

    // Format the integer part with separators
    for (int i = integerPart.length - 1; i >= 0; i--) {
      count++;
      formatted = integerPart[i] + formatted;
      if (count % 3 == 0 && i != 0) {
        formatted = separator + formatted;
      }
    }

    // Add decimal part if exists
    if (decimalPart.isNotEmpty) {
      formatted = formatted + decimalSeparator + decimalPart;
    }

    return includeSymbol ? '$symbol$formatted' : formatted;
  }
}

extension NullableString on String? {
  String? defaultValue(String defaultValue) {
    if (this != null) {
      return this;
    }
    return defaultValue;
  }

  String? get removeOuterWhiteSpace {
    if (this?.isEmpty ?? false) {
      return this;
    }
    return this!.trim();
  }

  String displayIfNull({String displayString = "-"}) {
    if (isNull) {
      return displayString;
    } else {
      return this!;
    }
  }

  String get getFileExtension {
    if (isNull) {
      return "";
    }
    List<String> fileSplit = this!.trim().split(".");
    return ".${fileSplit.last}";
  }
}
