import 'package:flutter/material.dart';
import 'package:genaiproject/core/constants/app_colors.dart';
import 'package:genaiproject/core/constants/app_texts.dart';

class SignUpFormPage extends StatefulWidget {
  const SignUpFormPage({super.key});

  @override
  State<SignUpFormPage> createState() => _SignUpFormPageState();
}

class _SignUpFormPageState extends State<SignUpFormPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/images/signup_page_image.png',
                  height: 200,
                  color: Colors.white,
                ),
                const SizedBox(height: 32),
                const Text(
                  AppTexts.createAccount,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: AppTexts.fullName,
                    prefixIcon:
                        const Icon(Icons.person_outline, color: Colors.black54),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) =>
                      value?.isEmpty ?? true ? AppTexts.pleaseEnterName : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: AppTexts.email,
                    prefixIcon:
                        const Icon(Icons.email_outlined, color: Colors.black54),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true)
                      return AppTexts.pleaseEnterEmail;
                    if (!value!.contains('@'))
                      return AppTexts.pleaseEnterValidEmail;
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: AppTexts.password,
                    prefixIcon:
                        const Icon(Icons.lock_outline, color: Colors.black54),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.black54,
                      ),
                      onPressed: () => setState(
                          () => _isPasswordVisible = !_isPasswordVisible),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true)
                      return AppTexts.pleaseEnterPassword;
                    if (value!.length < 6) return AppTexts.passwordMinLength;
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Form validation başarılı
                      // Backend işlemleri buraya gelecek
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    AppTexts.signUp,
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
