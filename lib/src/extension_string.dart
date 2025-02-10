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

    // Check if the string represents a false value
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

  // use this method while comparing upper and lowercase strings
  //Checks if the current string is the same as another string, ignoring case and leading/trailing whitespace.
  bool isEqualToIgnoreCase({required String to}) {
    return toLowerCase().trim() == to.toLowerCase().trim();
  }

  String get removeOuterWhiteSpace {
    if (isEmpty) {
      return this;
    }
    return trim();
  }
}

extension NullableString on String? {
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

extension DateString on String {
  String? detectDateFormat() {
    Map<String, String> regexWithFormat = {
      r'\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}':
          "yyyy-MM-dd HH:mm:ss", // Example: 2022-01-14 12:34:56
      r'\w{3}, \w{3} \d{1,2}, \d{2}':
          "EEE, MMM d, 'yy", // Example: Fri, Jan 14, '22
      r'\w+ \d{1,2}, \d{4}': "MMMM dd, yyyy", // Example: January 14, 2022
      r'\d{2}/\d{2}/\d{4}': "MM/dd/yyyy", // Example: 01/14/2022
      r'\d{2}-\d{2}-\d{4}': "dd-MM-yyyy", // Example: 14-01-2022
      r'\d{2}:\d{2} [APap][Mm]': "hh:mm a", // Example: 12:34 PM
      r'\w+ \d{4}': "MMMM yyyy", // Example: January 2022
      r'\w{3}, \d{1,2} \w{3} \d{4}':
          "EEE, dd MMM yyyy HH:mm:ss", // Example: Fri, 14 Jan 2022 12:34:56
      r'\d{2}/\d{2}/\d{4} \d{2}:\d{2}:\d{2}':
          "dd/MM/yyyy HH:mm:ss", // Example: 14/01/2022 12:34:56
      r'\d{4}-\d{2}-\d{2}': "yyyy-MM-dd", // Example: 2022-01-14 (Date only)
      r'\d{1,2} \w{3} \d{4}': "d MMM yyyy", // Example: 22 Sep 2023
      r'\w{3}, \d{1,2} \w{3} \d{2}':
          "EEE, d MMM 'yy", // Example: Fri, 22 Sep '23
      r'\d{2}:\d{2}': "HH:mm", // Example: 12:34 (Time only)
      r'\d{1,2}/\d{1,2}/\d{2}': "M/d/yy", // Example: 9/22/23
      r'\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}':
          "yyyy-MM-ddTHH:mm:ss", // Example: 2022-01-14T12:34:56
      r'\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}Z':
          "yyyy-MM-ddTHH:mm:ssZ", // Example: 2022-01-14T12:34:56Z
      r'^\d{4}-\d{2}-\d{2}$': 'yyyy-MM-dd', // Example: 2022-01-14
      r'^\d{2}/\d{2}/\d{4}$': 'MM/dd/yyyy', // Example: 01/14/2022
      r'^\d{2}\.\d{2}\.\d{4}$': 'MM.dd.yyyy', // Example: 01.14.2022
      r'^\d{2}\s\d{2}\s\d{4}$': 'MM dd yyyy', // Example: 01 14 2022
      r'^\d{4}/\d{2}/\d{2}$': 'yyyy/MM/dd', // Example: 2022/01/14
      r'^\d{4}\.\d{2}\.\d{2}$': 'yyyy.MM.dd', // Example: 2022.01.14
      r'^\d{4}\s\d{2}\s\d{2}$': 'yyyy MM dd', // Example: 2022 01 14
      r'^\d{2}-\d{2}-\d{4}$': 'dd-MM-yyyy', // Example: 14-01-2022
      r'^\d{2}/\d{2}/\d{2}$': 'dd/MM/yy', // Example: 14/01/22
      r'^\d{2}\.\d{2}\.\d{2}$': 'dd.MM.yy', // Example: 14.01.22
      r'^\d{2}\s\d{2}\s\d{2}$': 'dd MM yy', // Example: 14 01 22
      r'^\d{4}-\d{1,2}-\d{1,2}$': 'yyyy-M-d', // Example: 2022-1-14
      r'^\d{2}/\d{1,2}/\d{1,2}$': 'MM/d/yy', // Example: 01/1/22
      r'^\d{2}\.\d{1,2}\.\d{1,2}$': 'MM.d.yy', // Example: 01.1.22
      r'^\d{2}\s\d{1,2}\s\d{1,2}$': 'MM d yy', // Example: 01 1 22
      r'^\d{1,2}-\d{1,2}-\d{4}$': 'd-M-yyyy', // Example: 14-1-2022
      r'^\d{1,2}/\d{1,2}/\d{4}$': 'd/M/yyyy', // Example: 14/1/2022
      r'^\d{1,2}\.\d{1,2}\.\d{4}$': 'd.M.yyyy', // Example: 14.1.2022
      r'^\d{1,2}\s\d{1,2}\s\d{4}$': 'd M yyyy', // Example: 14 1 2022
      r'^\d{1,2} \w+ \d{4}$': 'd MMMM yyyy', // Example: 29 April 1999
      r'^\d{1,2} \w{3} \d{4}$': 'dd MMM yyyy', // Example: 29 Apr 1999
      r'^\d{8}$': 'yyyyMMdd', // Example: 20220114
      r'^\d{6}$': 'yyMMdd', // Example: 220114
    };

    String? finalPattern;
    List<String> patternsFound = [];

    for (final entry in regexWithFormat.entries) {
      final regex = RegExp(entry.key);
      if (regex.hasMatch(this)) {
        // return entry.value;
        patternsFound.add(entry.value);
      }
    }
    if (patternsFound.isNotEmpty && patternsFound.length > 1) {
      for (String pattern in patternsFound) {
        bool validatePattern =
            validateDatePattern(this, expected: this, pattern: pattern);
        if (validatePattern) {
          finalPattern = pattern;
          break;
        }
      }
    } else {
      if (patternsFound.isNotEmpty) {
        finalPattern = patternsFound[0];
      }
    }

    return finalPattern;
  }

  DateTime getDateFromString({String pattern = "dd-MM-yyyy"}) {
    DateFormat dateFormat = DateFormat(pattern);

    // Parse the date string
    DateTime dateTime = dateFormat.parse(this);

    return dateTime;
  }

  bool validateDatePattern(String dateString,
      {String pattern = "yyyy-MM-dd HH:mm:ss", required String expected}) {
    try {
      DateTime dateTime = DateFormat(pattern).parse(dateString);
      String formattedDate = DateFormat(pattern).format(dateTime);
      return formattedDate == expected;
    } catch (e) {
      return false;
    }
  }

  formatAsUiDate(
      {required String uiFormat, String fallBackFormat = "dd-MM-yyyy"}) {
    String detectedDateFormat = uiFormat.detectDateFormat() ?? fallBackFormat;
    DateTime date = DateTime.parse(this);
    DateFormat outputFormat = DateFormat(detectedDateFormat);
    String result = outputFormat.format(date);
    return result;
  }
}
