abstract class FormEvent {}

class EmailChanged extends FormEvent {
  final String email;
  EmailChanged(this.email);
}

class PasswordChanged extends FormEvent {
  final String password;
  PasswordChanged(this.password);
}

class NameChanged extends FormEvent {
  final String name;
  NameChanged(this.name);
}

class PhoneChanged extends FormEvent {
  final String phone;
  PhoneChanged(this.phone);
}

class GenderChanged extends FormEvent {
  final String gender;
  GenderChanged(this.gender);
}

class CountryChanged extends FormEvent {
  final String country;
  CountryChanged(this.country);
}

class StateChanged extends FormEvent {
  final String state;
  StateChanged(this.state);
}

class CityChanged extends FormEvent {
  final String city;
  CityChanged(this.city);
}

class FormSubmitted extends FormEvent {}
