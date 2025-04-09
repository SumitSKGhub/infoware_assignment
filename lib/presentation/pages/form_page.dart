import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infoware/presentation/bloc/form_bloc.dart';
import 'package:infoware/presentation/bloc/form_event.dart';
import 'package:infoware/presentation/bloc/form_state.dart';
import 'package:infoware/presentation/dry_widgets/dynamic_text_field.dart';

class FormPage extends StatelessWidget {
  FormPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FormBloc(),
      child: Scaffold(
        backgroundColor: Color(0xFFFFEBEB),
        appBar: AppBar(
          title: Text("Login"),
          backgroundColor: Color(0xFFFAE1EB),
        ),
        body: BlocBuilder<FormBloc, FormsState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DynamicTextField(
                      controller: _emailController,
                      onChanged:
                          (val) =>
                          context.read<FormBloc>().add(EmailChanged(val)),
                      icon: Icon(Icons.email),
                      label: 'Email',
                      actual_context: context,
                    ),
                
                    DynamicTextField(
                      controller: _passwordController,
                      onChanged:
                          (val) =>
                              context.read<FormBloc>().add(PasswordChanged(val)),
                      icon: Icon(Icons.password),
                      label: 'Password',
                      actual_context: context,
                    ),
                
                    DynamicTextField(
                      controller: _nameController,
                      onChanged:
                          (val) =>
                          context.read<FormBloc>().add(NameChanged(val)),
                      icon: Icon(Icons.person),
                      label: 'Name',
                      actual_context: context,
                    ),
                
                    DynamicTextField(
                      controller: _phoneController,
                      onChanged:
                          (val) =>
                          context.read<FormBloc>().add(PhoneChanged(val)),
                      icon: Icon(Icons.phone),
                      label: 'Phone',
                      actual_context: context,
                    ),
                
                    DynamicTextField(
                      controller: _genderController,
                      onChanged:
                          (val) =>
                          context.read<FormBloc>().add(GenderChanged(val)),
                      icon: Icon(Icons.accessibility),
                      label: 'Gender',
                      actual_context: context,
                    ),
                
                    DynamicTextField(
                      controller: _countryController,
                      onChanged:
                          (val) =>
                          context.read<FormBloc>().add(CountryChanged(val)),
                      icon: Icon(Icons.flag_outlined),
                      label: 'Country',
                      actual_context: context,
                    ),
                
                    DynamicTextField(
                      controller: _stateController,
                      onChanged:
                          (val) =>
                          context.read<FormBloc>().add(StateChanged(val)),
                      icon: Icon(Icons.flag_circle_outlined),
                      label: 'State',
                      actual_context: context,
                    ),
                
                    DynamicTextField(
                      controller: _cityController,
                      onChanged:
                          (val) =>
                          context.read<FormBloc>().add(CityChanged(val)),
                      icon: Icon(Icons.location_city),
                      label: 'City',
                      actual_context: context,
                    ),
                
                    SizedBox(height: 20),
                    state.isLoading
                        ? CircularProgressIndicator(color: Colors.pinkAccent)
                        : ElevatedButton(
                          onPressed:
                              state.isValid
                                  ? () => context.read<FormBloc>().add(
                                    FormSubmitted(),
                                  )
                                  : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pinkAccent,
                          ),
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
