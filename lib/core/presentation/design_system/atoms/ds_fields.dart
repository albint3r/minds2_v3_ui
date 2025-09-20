import "package:reactive_forms/reactive_forms.dart";
import "package:reactive_phone_form_field/reactive_phone_form_field.dart";

class DSFields {
  static FormControl get userName => FormControl<String>(
    validators: [
      Validators.required,
      Validators.email,
      Validators.maxLength(50),
    ],
  );

  static FormControl get userLastName => FormControl<String>(
    validators: [
      Validators.required,
      Validators.email,
      Validators.maxLength(50),
    ],
  );

  static FormControl get phone => FormControl<PhoneNumber>(
    value: const PhoneNumber(
      isoCode: IsoCode.MX, //   país “MX +52”
      nsn: "", //   sin número aún
    ),
    validators: [PhoneValidators.required, PhoneValidators.valid],
  );

  static FormControl get email => FormControl<String>(
    validators: [
      Validators.required,
      Validators.email,
      Validators.maxLength(50),
    ],
  );

  static FormControl get password => FormControl<String>(
    validators: [
      Validators.required,
      Validators.minLength(8),
      Validators.maxLength(20),
    ],
  );

  static FormControl get confirmPassword => FormControl<String>(
    validators: [
      Validators.required,
      Validators.minLength(8),
      Validators.maxLength(20),
    ],
  );
}
