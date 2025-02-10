[![pub package](https://img.shields.io/pub/v/ultimate_extension.svg)](https://pub.dev/packages/ultimate_extension)
[![pub points](https://img.shields.io/pub/points/ultimate_extension?color=2E8B57&label=pub%20points)](https://pub.dev/packages/ultimate_extension/score)
[![License: MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://opensource.org/licenses/MIT)

# ultimate_extension

Ultimate Extension provides powerful and easy-to-use extensions for Dart collections and objects. This package extends List, Iterable, Map, and Object with a variety of extension methods, including random selection, copying, partitioning, JSON handling, and more. Whether you need enhanced collection utilities or simplified object manipulation, Ultimate Extension makes Dart programming more efficient.

### Table of contents

- [Getting started](#getting-started)
- [Most Used Extensions Methods](#most-used-extensions-methods)
- [Extensions](#extensions)
  - [Widget Methods](#widget-methods)
  - [Date Extensions](#date-extensions)
  - [String Extensions](#string-extensions )
  - [Color Extensions](#color-extensions )
  - [Iterable Extensions](#iterable-extensions)
  - [Map Extensions](#map-extensions )
  - [Num Extensions](#num-extensions )
  - [Other Extensions](#other-extensions )

## Getting started

First, add ultimate_extension as a dependency in your pubspec.yaml file

```yaml
dependencies:
  flutter:
    sdk: flutter
  ultimate_extension : ^[version]
```

## Import the package

```dart
import 'package:ultimate_extension/ultimate_extension.dart';
```

## **Most Used Extensions Methods**

### **Debounce and Throttle**

**`Debounce`**:-

Debouncing ensures only the last call to a method is executed if multiple calls happen in quick succession. Each call resets a timer, and the target method is only invoked when the timer completes without interruption.

```dart
 UltimateExtension().debounce(
    id: "Debounce",
    delay: Duration(seconds: 1),
    action: () => yourMethod()
  );
````

**`Throttling`**:-

Throttling ensures that a method is called at most once within a specified time period. It prevents multiple calls by allowing only the first call to execute, and subsequent calls within the period are ignored until the period has elapsed.

```dart
UltimateExtension().throttle(
    id: "Throttle",
    delay: Duration(seconds: 1),
    action: () => yourMethod());
    }
```

### **Widget Methods**

**`Shimmer`**:- No need for a separate loading widget anymore! Now, you can use the same widget to display a shimmer effect seamlessly.

```dart
Container(
  width: 100,
  height: 100,
  decoration: BoxDecoration(
    color: Colors.red,
    shape: BoxShape.circle,
  ),
).shimmer(isLoading: true);

```

**`SizeProviderWidget`**: The SizeProviderWidget helps measure its child's dimensions in real time.

```dart
Expanded(
  child: SizeProviderWidget(
    builder: (context, size) {
      return Container(
        child: Text("${size.width} x ${size.height}"),
      );
    },
  ),
);

```

**`TypeWriterText`**: Displays text with a typewriter-style animated effect.

```dart
TypeWriterText(
  text: "Hello World",
  typingSpeed: Duration(milliseconds: 200),
  useSingleWord: false,
  onAnimationFinished: () {
    print("Animation Finished");
  },
);
```

### **Date Extensions**

**`Format Like Ui Date`**:- No more search for dateformat pattern.

```dart
String date = "1998-04-29".formatAsUiDate(uiFormat: "29 Dec 1999");
  // 29 Apr 1998
```

similar methods

- `timeAgoFromNow`: Converts a date string into a human-readable "time ago" format (e.g., "2 hours ago", "3 days ago")

- `isLeapYear` : Returns true if the year is a leap year, otherwise false

- `calculateAge`: Returns the age in years based on the given date of birth.

- `to24HourTime` : Returns a 24 hour date format

- `to12HourTime` : Returns a 12 hour date format

### **String Extensions**

- **`isEqualToIgnoreCase`**: Checks if the current string is the same as another string, ignoring case and leading/trailing whitespace.

```dart
bool isSame = "test".isEqualToIgnoreCase(to: "TeST"); // true
```

similar methods

- **`displayIfNull`**: Provide a default value for null strings.
- **`toMapFromEscapedString()`**: Convert an escaped JSON string to a map.

- **`getQueryParameters()`**: Extract query parameters from URLs.

- **`toSentenceCase`**: Convert a string to sentence case.
- **`toTitleCase`**: Convert a string to title case.

- **`limitCharacters`**: Limit a string to a specified number of characters.

- **`removeAllWhiteSpace`**: Remove all whitespace from a string.
- **`removeOuterWhiteSpace` (Nullable)**: Remove outer whitespace from a nullable string.

- **`isValidEmail()`**: Validate email format.
- **`isValidUrl`**: Check if a string is a valid URL.
- **`isNumericOnly`**: Check if a string consists only of numeric characters.
- **`isAlphabetOnly`**: Check if a string consists only of alphabetic characters.

- **`toBool()`**: Convert a string to a boolean value.
- **`toInt()`**: Convert a string to an integer.
- **`toDouble()`**: Convert a string to a double.
- **`maskString()`**: Mask parts of a string.
- **`toCharacterList()`**: Convert a string to a list of characters.
- **`getListFrom()`**: Convert a string to a list of substrings.
- **`isNumericOnly`**: Check if a string is numeric.
- **`isAlphabetOnly`**: Check if a string is alphabetic.
- **`hasCapitalletter`**: Check if a string contains at least one capital letter.
- **`readTime()`**: Estimate the reading time in seconds.

- **`limitDecimalPlaces()`**: Limit the number of decimal places in numeric strings.

- **`addOrdinalSuffix`**: Add ordinal suffixes to numeric strings. i.e 21st

- **`isVideo`**: Determine if a string represents a video file.
- **`isAudio`**: Determine if a string represents an audio file.
- **`isImage`**: Determine if a string represents an image file.

- **`getFileExtension`** (Nullable): Extract the file extension from a nullable string.

### **Color Extensions**

- **`ColorHelper.fromHex`**: Get Color from hexcode.

``` dart
Color backgroundColor = ColorHelper.fromHex("#aabbcc");
```

similar methods:

- **`getRandomShade`**: getRandom shade of given color.

### **Iterable Extensions**

- **`getFirstElementWithIndex`**: gets the element along with its index.

```dart
List<int> numbers = [1, 2, 3];
IndexValue<int>? result = numbers.getFirstElementWithIndex((element) => element > 1);
print(result?.itemIndex); // 1
print(result?.data); // 2
```

- `getElementAt` Get Element at Index  also supports negative index like python

```dart
List<int> numbers = [1, 2, 3];
int? element = numbers.getElementAt(1);
print(element); // 2

element = numbers.getElementAt(-1);
print(element); // 3
 ```

Similar extensions are:

### List Extensions

- **`getRandomElement`**: Get a random element from the list.
- **`shallowCopy`**: Create a shallow copy of the list.
- **`swap`**: Swap elements at specified indexes in the list.
- **`updateAtIndex`**: Update the element at a specific index.
- **`partition`**: Partition the list into sublists of specified size.
- **`removeDuplicates`**: Remove duplicate elements from the list.
- **`intersect`**: Get the intersection of the list with another iterable.
- **`subtract`**: Subtract elements in another iterable from the list.
- **`union`**: Union the list with another iterable.
- **`pop`**: Remove and return the last element of the list.
- **`deleteElementAt`**: Delete an element at a specific index.
- **`getSublistFrom`**: Get a sublist from specified start and end indexes.

### Iterable Extensions

- **`getLastElement`**: Get the last element.
- **`getFirstElement`**: Get the first element.
- **`containsAll`**: Check if the iterable contains all elements from another iterable.
- **`getStringByJoiningWith`**: Join elements into a string with a specified separator.
- **`indexedForEach`**: Iterate over elements with their index.
- **`find`**: Find a single element matching a predicate.

### Numeric Iterable Extensions

- **`sum`**: Sum all elements in a numeric iterable.
- **`getMinimum`**: Get the minimum value.
- **`getMaximum`**: Get the maximum value.
- **`getSecondMin`**: Get the second minimum value.
- **`getSecondMax`**: Get the second maximum value.

### Null Iterable Extensions

- **`removeNull`**: Remove null values from an iterable.

### **Map Extensions**

- **`prettyPrint`**: Convert the map to a pretty-printed JSON string.
characters.

```dart
    Map<String, dynamic> data = {
      "name": "John",
      "email": "john@example.com",
    };

    print(data.prettyPrint());
//{
    //"name": "John",
    //"email": "john@example.com"
//}
```

- `toEscapedJson`: Convert to Escaped JSON

```dart
Map<String, dynamic> data = {
    "name": "John",
    "email": "john@example.com",
  };

  String escapedJson = data.toEscapedJson();
  print(escapedJson); // {\"name\":\"John\",\"email\":\"john@example.com\"}

```

Similar methods are:

- **`toJsonAndEncode`**: Convert the map to a JSON string and then encode it to Base64.
- **`containsKey`**: Check if the map contains a specified key.
- **`toStringFromJson`**: Convert the map to a JSON string.

- **`forEachEntry`**: Iterate over the map's entries and apply a function.  

## Num Extensions

Calculate percentage change

```dart
  num investedValue = 75;
  num currentValue = 50;

  double returns = currentValue.percentageChangeFrom(original: investedValue);
  print(returns); // -33.33333
```

- **`toCurrency`**: Converts the number to a currency format string.
- **`roundToDecimalPlaces`**: Rounds the number to a specified number of decimal places.
- **`toRadians`**: Converts the number from degrees to radians.
- **`toDegrees`**: Converts the number from radians to degrees.
- **`square`**: Returns the square of the number.
- **`cube`**: Returns the cube of the number.
- **`absolute`**: Returns the absolute value of the number.
- **`toPercentage`**: Converts the number to a percentage string with a specified number of decimal places.

### **Object Extensions**

- **`tryConvertTo`**: Safely converts a value to the desired built-in data type, handling mismatches gracefully on supports build in type .

Example

```dart
double data = "12344.5".tryConvertTo();
```

## Other Extensions

- **`isNull`**: Check if the object is `null`.
- **`getMemoryAddress`**: Get the memory address of the object.
- **`whatsMydataType`**: Get the runtime type of the object.
- **`logSuccess`**: Log the object's string representation to the console with green color.
- **`logFailure`**: Log the object's string representation to the console with red color.
- **`logWarning`**: Log the object's string representation to the console with yellow color.
- **`getBytes`**: Retrieves bytes from the `ImageProvider` asynchronously using a specified `BuildContext` and `ImageByteFormat`.

Feel free to post a feature requests or report a bug [here](https://github.com/Oauth-Celestial/ultimate_extension/issues).

# My Other packages

- [zo_animated_border](https://pub.dev/packages/zo_animated_border): A package that provides a modern way to create gradient borders with animation in Flutter

- [connectivity_watcher](https://pub.dev/packages/connectivity_watcher): A Flutter package to monitor internet connectivity with subsecond response times, even on mobile networks.

- [theme_manager_plus](https://pub.dev/packages/theme_manager_plus): Allows customization of your app's theme with your own theme class, eliminating the need for traditional
- [date_util_plus](https://pub.dev/packages/date_util_plus): A powerful Dart API designed to augment and simplify date and time handling in your Dart projects.
- [pick_color](https://pub.dev/packages/pick_color): A Flutter package that allows you to extract colors and hex codes from images with a simple touch.
