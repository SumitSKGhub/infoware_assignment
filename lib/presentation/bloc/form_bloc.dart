import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infoware/presentation/bloc/form_event.dart';
import 'package:infoware/presentation/bloc/form_state.dart';

class FormBloc extends Bloc<FormEvent, FormsState> {
  FormBloc() : super(FormsState.initial()) {
    on<EmailChanged>((event, emit) {
      final updated = state.copyWith(email: event.email);
      emit(updated.copyWith(isValid: _validateAll(updated)));
    });

    on<PasswordChanged>((event, emit) {
      final updated = state.copyWith(password: event.password);
      emit(updated.copyWith(isValid: _validateAll(updated)));
    });

    on<NameChanged>((event, emit) {
      final updated = state.copyWith(name: event.name);
      emit(updated.copyWith(isValid: _validateAll(updated)));
    });

    on<PhoneChanged>((event, emit) {
      final updated = state.copyWith(phone: event.phone);
      emit(updated.copyWith(isValid: _validateAll(updated)));
    });

    on<GenderChanged>((event, emit) {
      final updated = state.copyWith(gender: event.gender);
      emit(updated.copyWith(isValid: _validateAll(updated)));
    });

    on<CountryChanged>((event, emit) {
      final updated = state.copyWith(country: event.country);
      emit(updated.copyWith(isValid: _validateAll(updated)));
    });

    on<StateChanged>((event, emit) {
      final updated = state.copyWith(stateName: event.state);
      emit(updated.copyWith(isValid: _validateAll(updated)));
    });

    on<CityChanged>((event, emit) {
      final updated = state.copyWith(city: event.city);
      emit(updated.copyWith(isValid: _validateAll(updated)));
    });

    on<FormSubmitted>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      await Future.delayed(Duration(seconds: 2)); // fake login
      emit(state.copyWith(isLoading: false));
    });
  }

  bool _validateAll(FormsState state) {
    return state.email.contains('@') &&
        state.password.length >= 6 &&
        state.name.isNotEmpty &&
        state.phone.length == 10 &&
        state.gender.isNotEmpty &&
        state.country.isNotEmpty &&
        state.stateName.isNotEmpty &&
        state.city.isNotEmpty;
  }
}
