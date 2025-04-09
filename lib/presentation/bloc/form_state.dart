class FormsState {
  final String email, password, name, phone, gender, country, stateName, city;
  final bool isValid;
  final bool isLoading;

  FormsState({
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
    required this.gender,
    required this.country,
    required this.stateName,
    required this.city,
    required this.isValid,
    required this.isLoading,
  });

  factory FormsState.initial() => FormsState(
    email: '',
    password: '',
    name: '',
    phone: '',
    gender: '',
    country: '',
    stateName: '',
    city: '',
    isValid: false,
    isLoading: false,
  );

  FormsState copyWith({
    String? email,
    String? password,
    String? name,
    String? phone,
    String? gender,
    String? country,
    String? stateName,
    String? city,
    bool? isValid,
    bool? isLoading,
  }) {
    return FormsState(
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      country: country ?? this.country,
      stateName: stateName ?? this.stateName,
      city: city ?? this.city,
      isValid: isValid ?? this.isValid,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
