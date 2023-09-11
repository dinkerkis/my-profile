import 'package:my_profile/model/form_field_data.dart';

class Common {
  //shared preferences keys
  static final String EMAIL_ADDRESS = 'email_address';
  static final String IS_LOGGED_IN = 'is_logged_in';
  static final String USER_IMAGE = 'user_image';

  //email validation
  static bool isValidEmail(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp('$pattern');
    return regex.hasMatch(email);
  }

  //password validation
  static bool isValidPassword(String password) {
    return password.length < 6 || password.length > 30;
  }

  //error message
  static List<String> getErrors(Map<String, FormFieldData> _data) {
    List<String> errors = [];
    errors.clear();
    _data.values.forEach(
          (element) {
        if (element.isError!) {
          if (element.data == null)
            errors.add('');
          else
            errors.add(element.data!);
        }
      },
    );
    return errors;
  }
}