<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

# Very simple and light form validation assistant.

## Features

[//]: # (List what your package can do. Maybe include images, gifs, or videos.)

- Very simple.
- Very light.
- Zero dependencies.

## Getting started

[//]: # (List prerequisites and provide or point to information on how to)

[//]: # (start using the package.)

## Usage

[//]: # (Include short and useful examples for package users. Add longer examples)

[//]: # (to `/example` folder. )

```dart

final validationAssistant = ValidationAssistant();

...

// with default messages
TextFormField(
  ...
  validator: validationAssistant
    ..required()
    ..maxLength(10)
)

// with custom messages.
TextFormField(
  ...
  validator: validationAssistant
    ..required('custom error message')
    ..maxLength(10, 'custom error message')
)
```

#### You can add your own function to check.

```dart
final validationAssistant = ValidationAssistant();

...
    
final String customValidationFunction(String? value) {
  if (value < 5) {
    return 'custom error message';  
  }
  return null;
}

...

TextFormField(
  ...
  validator: validationAssistant
    ..required('custom error message')
    ..add(customValidationFunction)
)
```

## Additional information

[//]: # (Tell users more about the package: where to find more information, how to )

[//]: # (contribute to the package, how to file issues, what response they can expect )

[//]: # (from the package authors, and more.)
