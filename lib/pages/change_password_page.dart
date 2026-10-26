import 'dart:ui'; // Wajib ditambahkan untuk ImageFilter (efek blur/kaca)
import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;

  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _currentPasswordVisible = false;
  bool _newPasswordVisible = false;
  bool _confirmPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 850),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.08), 
      end: Offset.zero
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutCubic,
      ),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String? _requiredPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password tidak boleh kosong';
    }
    return null;
  }

  String? _newPasswordValidator(String? value) {
    final requiredError = _requiredPasswordValidator(value);
    if (requiredError != null) {
      return requiredError;
    }
    if (value!.length < 8) {
      return 'Password baru minimal 8 karakter';
    }
    return null;
  }

  String? _confirmPasswordValidator(String? value) {
    final requiredError = _requiredPasswordValidator(value);
    if (requiredError != null) {
      return requiredError;
    }
    if (value != _newPasswordController.text) {
      return 'Konfirmasi password tidak cocok';
    }
    return null;
  }

  // Membuat style input decoration khusus untuk Glass Theme
  InputDecoration _glassInputDecoration({
    required String labelText, 
    required bool isVisible,
    required VoidCallback onVisibilityPressed,
  }) {
    return InputDecoration(
      prefixIcon: const Icon(
        Icons.lock_outline_rounded,
        color: Color(0xff6b7280),
      ),
      labelText: labelText,
      labelStyle: const TextStyle(color: Color(0xff6b7280)),
      filled: true,
      fillColor: const Color(0xfff1f3f5),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xffe5e7eb)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xff17191c), width: 1.2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xffb42318), width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xffb42318), width: 1.2),
      ),
      suffixIcon: IconButton(
        tooltip: isVisible ? 'Sembunyikan password' : 'Tampilkan password',
        onPressed: onVisibilityPressed,
        icon: Icon(
          isVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          color: Color(0xff6b7280),
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String label,
    required bool isVisible,
    required VoidCallback onVisibilityPressed,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: !isVisible,
      textInputAction: TextInputAction.next,
      style: const TextStyle(color: Color(0xff24282d)),
      decoration: _glassInputDecoration(
        labelText: label,
        isVisible: isVisible,
        onVisibilityPressed: onVisibilityPressed,
      ),
      validator: validator,
    );
  }

  Widget _buildHeader() {
    return const Column(
      children: [
        CircleAvatar(
          radius: 38,
          // Disesuaikan warnanya agar masuk dengan tema glass
          backgroundColor: Color(0xfff1f3f5),
          child: Icon(
            Icons.lock_reset_rounded,
            size: 36,
            color: Color(0xff17191c),
          ),
        ),
        SizedBox(height: 16),
        Text(
          'Change Password',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w800,
            color: Color(0xff24282d),
            letterSpacing: 0.2,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Buat password baru untuk menjaga akunmu tetap aman',
          textAlign: TextAlign.center,
          style: TextStyle(color: Color(0xff6b7280)),
        ),
      ],
    );
  }

  void _submitChangePassword() {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Password berhasil diperbarui')),
    );
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/account_page',
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f9fa),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 430),
                  // Menerapkan efek Glassmorphism
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(24, 30, 24, 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xffeceff1)),
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    tooltip: 'Kembali ke akun',
                                    onPressed: () => Navigator.pop(context),
                                    icon: const Icon(
                                      Icons.arrow_back_rounded,
                                      color: Color(0xff6b7280),
                                    ),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                              _buildHeader(),
                              const SizedBox(height: 28),
                              _buildPasswordField(
                                controller: _currentPasswordController,
                                label: 'Password saat ini',
                                isVisible: _currentPasswordVisible,
                                onVisibilityPressed: () {
                                  setState(() {
                                    _currentPasswordVisible = !_currentPasswordVisible;
                                  });
                                },
                                validator: _requiredPasswordValidator,
                              ),
                              const SizedBox(height: 16),
                              _buildPasswordField(
                                controller: _newPasswordController,
                                label: 'Password baru',
                                isVisible: _newPasswordVisible,
                                onVisibilityPressed: () {
                                  setState(() {
                                    _newPasswordVisible = !_newPasswordVisible;
                                  });
                                },
                                validator: _newPasswordValidator,
                              ),
                              const SizedBox(height: 16),
                              _buildPasswordField(
                                controller: _confirmPasswordController,
                                label: 'Konfirmasi password baru',
                                isVisible: _confirmPasswordVisible,
                                onVisibilityPressed: () {
                                  setState(() {
                                    _confirmPasswordVisible = !_confirmPasswordVisible;
                                  });
                                },
                                validator: _confirmPasswordValidator,
                              ),
                              const SizedBox(height: 24),
                              SizedBox(
                                width: double.infinity,
                                height: 54,
                                child: ElevatedButton.icon(
                                  onPressed: _submitChangePassword,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff17191c),
                                    foregroundColor: Colors.white,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  icon: const Icon(Icons.check_rounded),
                                  label: const Text(
                                    'Simpan Password',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}