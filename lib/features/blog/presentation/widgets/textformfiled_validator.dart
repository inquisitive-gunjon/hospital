class TextformFiledValidator {



  // First name validator
  static String? validateFirstName(String value) {
    final RegExp firstNameRegExp = RegExp(r'^[A-Z][a-zA-Z ]*$');
    if (value == null || value.isEmpty) {
      return 'This field must not be empty';
    } else if (!RegExp(r'^[A-Z]').hasMatch(value[0])) {
      return 'First letter must be a capital';
    }else if (!firstNameRegExp.hasMatch(value)) {
      return 'Invalid name';
    }
    return null;
  }


  // Last name validator
  static String? validateLastName(String value) {
    final RegExp lastNameRegExp = RegExp(r'^nn[A-Za-z ]+$');
    if (value == null || value.isEmpty) {
      return 'This field must not be empty';
    } else if (!lastNameRegExp.hasMatch(value)) {
      return 'Invalid name';
    }
    return null;
  }


  // Email validator
  static String? validateEmail(String value) {
    final RegExp emailRegExp = RegExp(
        r'^[\w-]+(\.[\w-]+)*@[A-Za-z0-9]+(\.[A-Za-z0-9]+)*(\.[A-Za-z]{2,})$');
    if (value == null || value.isEmpty) {
      return 'This field must not be empty';
    } else if (!emailRegExp.hasMatch(value)) {
      return 'ex: example.1234@gmail.com';
    }
    return null;
  }




  // shop validation
  static String? validateShop(String value) {
    final RegExp inputRegExp = RegExp(r'^[a-zA-Z0-9\s]*$');
    if (value == null || value.isEmpty) {
      return 'This field must not be empty';
    } else if (!inputRegExp.hasMatch(value)) {
      return 'Only numbers, capital letters, small letters, and spaces are allowed';
    }
    return null;
  }








  //...........phone number validation
  static String? validatePhone(String value) {
    final RegExp phoneRegExp = RegExp(r'^0[0-9]*$'); // Matches numbers starting with 0
    if (value == null || value.isEmpty) {
      return 'This field must not be empty';
    } else if (!phoneRegExp.hasMatch(value)) {
      return 'Phone number must start with 01';
    } else if (value.length != 11) {
      return 'Phone number must be 11 digits';
    }
    return null;
  }


  // address validator
  static String? validateAddress(String value) {
    final RegExp addressRegExp = RegExp(
        r'^[A-Za-z0-9\s.,\-:]+$'
    );

    if (value == null || value.isEmpty) {
      return 'This field must not be empty';
    } else if (!addressRegExp.hasMatch(value)) {
      return 'Ex: address: Dhanmondi-32,';
    }
    return null;
  }





  // password validator

  static String? validatePassword(String value) {
    final RegExp passwordRegExp = RegExp(
        r'^(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[!@#\$%^&*()_+{}|:;"<>?])[A-Za-z0-9!@#\$%^&*()_+{}|:;"<>?]+$');

    if (value == null || value.isEmpty) {
      return 'This field must not be empty';
    } else if (value.length <8) {
      return 'Password must be 8 characters long';
    }
    else if (!passwordRegExp.hasMatch(value)) {
      return 'Format: Wpass!@1';
    } else if (!value.contains(RegExp(r'[!@#\$%^&*()_+{}|:;"<>?]'))) {
      return 'Password must contain at least one special character';
    }
    return null;
  }



  static String? validatePassword2(String value) {
    final RegExp passwordRegExp = RegExp(r'^[0-9]+$');

    if (value == null || value.isEmpty) {
      return 'This field must not be empty';
    } else if (value.length < 8) {
      return 'Password must be 8 characters long';
    } else if (!passwordRegExp.hasMatch(value)) {
      return 'Password must contain only numbers';
    }
    return null;
  }







  static textFormFiledValidator(value){
    if(value == null || value.isEmpty){
      return 'This filed is required';
    }
    return null;
  }



}