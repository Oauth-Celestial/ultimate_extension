# ultimate_extension

Ultimate_extension provides powerful and easy-to-use extensions for Dart collections and objects. This package extends `List`, `Iterable`, `Map`, and Object with various utilities including random selection, copying, partitioning, JSON handling, and more.


### Table of contents

- [Ultimate Extension](#ultimate_extension)
 
  - [Getting started](#getting-started)
  - [Extensions](#extensions)
    - [String Extensions](#string-extensions )
    - [Color Extensions](#color-extensions )
    - [Iterable Extensions](#iterable-extensions)
    - [Map Extensions ](#map-extensions )
    - [Other Extensions ](#other-extensions )
 



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


## **String Extensions**

### Currency Formatting
Format a string as currency:

```dart
String currency = "1234567.89".formatCurrency(",", "₹", true); // ₹1,234,567.89

String abbreviation = "12345678".toIndianAbbreviatedString(); // 1.23 Cr

```

## Default Values and Fallbacks
Provide a default value for null strings:

```dart 
String display = null.displayIfNull(displayString: "N/A"); // N/A

```

Similar extensions are:
### Case Conversion
- **`toSentenceCase()`**: Convert a string to sentence case.
- **`toTitleCase`**: Convert a string to title case.

### Character Limitation
- **`limitCharacters()`**: Limit a string to a specified number of characters.

### Whitespace Management
- **`removeAllWhiteSpace`**: Remove all whitespace from a string.
- **`removeOuterWhiteSpace` (Nullable)**: Remove outer whitespace from a nullable string.

### Validation
- **`isValidEmail()`**: Validate email format.
- **`isValidUrl`**: Check if a string is a valid URL.
- **`isNumericOnly`**: Check if a string consists only of numeric characters.
- **`isAlphabetOnly`**: Check if a string consists only of alphabetic characters.

### Conversion
- **`toBool()`**: Convert a string to a boolean value.
- **`toInt()`**: Convert a string to an integer.
- **`toDouble()`**: Convert a string to a double.

### String Masking
- **`maskString()`**: Mask parts of a string.

### List Conversion
- **`toCharacterList()`**: Convert a string to a list of characters.
- **`getListFrom()`**: Convert a string to a list of substrings.

### Numeric and Alphabet Checks
- **`isNumericOnly`**: Check if a string is numeric.
- **`isAlphabetOnly`**: Check if a string is alphabetic.
- **`hasCapitalletter`**: Check if a string contains at least one capital letter.

### Reading Time Calculation
- **`readTime()`**: Estimate the reading time in seconds.

### Decimal Place Limitation
- **`limitDecimalPlaces()`**: Limit the number of decimal places in numeric strings.

### Ordinal Suffix Addition
- **`addOrdinalSuffix`**: Add ordinal suffixes to numeric strings. i.e 21st

### JSON Conversion
- **`toMapFromEscapedString()`**: Convert an escaped JSON string to a map.

### Query Parameter Extraction
- **`getQueryParameters()`**: Extract query parameters from URLs.



### File Type Checks
- **`isVideo`**: Determine if a string represents a video file.
- **`isAudio`**: Determine if a string represents an audio file.
- **`isImage`**: Determine if a string represents an image file.



### File Extension Handling
- **`getFileExtension`** (Nullable): Extract the file extension from a nullable string.

### Color Extensions 

Get Color from hexcode 

``` dart
Color backgroundColor = ColorHelper.fromHex("#aabbcc");
```


Get hexcode from color 

``` dart 
String hexcode = Colors.red.toHex();
```

Get Random color 
```dart
Color backgroundColor = ColorHelper.getRandomColor();
```

### Iterable Extensions 

Get Element at Index  also supports negative index like python

```dart
List<int> numbers = [1, 2, 3];
int? element = numbers.getElementAt(1);
print(element); // 2

element = numbers.getElementAt(-1);
print(element); // 3
 ```

Get First Element with Index

some time we have a condition to get the element but then have to add another search for the index but no more you can achieve this with single method . If the value is not present it **return -1 in index and data is null**

```dart 
List<int> numbers = [1, 2, 3];
IndexValue<int>? result = numbers.getFirstElementWithIndex((element) => element > 1);
print(result?.itemIndex); // 1
print(result?.data); // 2
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


### Map Extensions

Convert to Escaped JSON

```dart
Map<String, dynamic> data = {
    "name": "John",
    "email": "john@example.com",
  };

  String escapedJson = data.toEscapedJson();
  print(escapedJson); // {\"name\":\"John\",\"email\":\"john@example.com\"}

```
Similar extensions are:

- **`toJsonAndEncode`**: Convert the map to a JSON string and then encode it to Base64.
- **`prettyPrint`**: Convert the map to a pretty-printed JSON string.
characters.
- **`containsKey`**: Check if the map contains a specified key.
- **`toStringFromJson`**: Convert the map to a JSON string.

- **`forEachEntry`**: Iterate over the map's entries and apply a function.  





## Other Extensions

- **`isNull`**: Check if the object is `null`.
- **`getMemoryAddress`**: Get the memory address of the object.
- **`whatsMydataType`**: Get the runtime type of the object.
- **`log`**: Log the object's string representation to the console.

- **`getBytes`**: Retrieves bytes from the `ImageProvider` asynchronously using a specified `BuildContext` and `ImageByteFormat`.


Feel free to post a feature requests or report a bug [here](https://github.com/Oauth-Celestial/ultimate_extension/issues).








