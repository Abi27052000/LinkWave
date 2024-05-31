import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linkwave/common/utills/utills.dart';
import 'package:linkwave/common/widgets/custom_button.dart';
import 'package:linkwave/features/auth/controller/auth_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeName = '/login-screen';
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final phoneController = TextEditingController();
  Country? country;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    phoneController.dispose();
  }

  void pickCountry() {
    showCountryPicker(
      context: context,
      onSelect: (Country _country) {
        setState(
          () {
            country = _country;
          },
        );
      },
    );
  }

  void sendPhoneNumber() {
    String phoneNumber = phoneController.text.trim();
    if (country != null && phoneNumber.isNotEmpty) {
      ref
          .read(authControllerProvider)
          .signInWithPhone(context, '+${country!.phoneCode}$phoneNumber');
    } else {
      showSnackBar(context: context, content: 'Fill all the fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter the phone number'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Link-Wave needs to verify your phone number."),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: pickCountry,
                child: Text("Pick your country"),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  if (country != null) Text('+${country!.phoneCode}'),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: size.width * 0.7,
                    child: TextField(
                      controller: phoneController,
                      decoration:
                          const InputDecoration(hintText: 'Phone Numner'),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              SizedBox(
                width: 90,
                child: CustomButton(
                  text: 'Next',
                  onPressed: sendPhoneNumber,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
