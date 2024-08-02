part of 'json.dart';

/// An abstract class representing a JSON field.
///
/// This class provides the basic structure and functionality for handling
/// JSON fields, including field name, error handling, and value management.
abstract class JsonField<T> {
  /// The name of the field.
  final String fieldName;

  /// Error message associated with the field.
  String? error;

  /// Warning message associated with the field.
  String? warning;

  /// Informational message associated with the field.
  String? information;

  /// Checks if the field has an error.
  bool get hasError => error != null;

  /// Checks if the field has a warning.
  bool get hasWarning => warning != null;

  /// Checks if the field has informational message.
  bool get hasInformation => information != null;

  /// The raw value of the field.
  T? rawValue;

  /// A string representation for null values, used for debugging.
  String get nullString => kDebugMode
      ? '<Null check operator used on a null value, from JsonField.name = $fieldName>'
      : '';

  /// The value of the field.
  T get value;

  /// Sets the value of the field.
  set value(dynamic value) {
    rawValue = value;
  }

  /// Constructs an instance of [JsonField].
  ///
  /// **Parameters:**
  /// - `fieldName`: The name of the field.
  JsonField(this.fieldName);

  /// Converts the field value to JSON.
  ///
  /// **Returns:**
  /// - The raw value of the field in JSON format.
  dynamic toJSON() {
    return rawValue;
  }
}
