import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;
  String? _errorMessage;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      // Mock validation
      if (_emailController.text == 'demo@example.com' &&
          _passwordController.text == 'password123') {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Login berhasil!'),
              backgroundColor: HexColor('10B981'),
              duration: Duration(seconds: 2),
            ),
          );

          // Navigate to home
          Navigator.of(context).pushReplacementNamed('/home');
        }
      } else {
        setState(() {
          _errorMessage = 'Email atau password salah';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Terjadi kesalahan: ${e.toString()}';
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<TThemeManager>().state;
    final isDarkMode = theme == context.read<TThemeManager>().darkTheme;

    return Scaffold(
      backgroundColor: theme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),

                // Header
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: theme.primary,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            'B',
                            style: TFontBold.headline(context).copyWith(
                              color: theme.primaryForeground,
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      Text(
                        'Bamboo UI Kit',
                        style: TFontBold.headline(context),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Masuk ke akun Anda',
                        style: TFontRegular.body(context).copyWith(
                          color: theme.mutedForeground,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 40),

                // Error Message
                if (_errorMessage != null)
                  Column(
                    children: [
                      TAlert.destructive(
                        title: 'Login Gagal',
                        subtitle: _errorMessage,
                      ),
                      SizedBox(height: 24),
                    ],
                  ),

                // Form
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Email Field
                      Text(
                        'Email',
                        style: TFontBold.body(context),
                      ),
                      SizedBox(height: 8),
                      TTextField.email(
                        controller: _emailController,
                        hintText: 'Masukkan email Anda',
                        enabled: !_isLoading,
                        onChange: (_) {
                          if (_errorMessage != null) {
                            setState(() => _errorMessage = null);
                          }
                        },
                      ),

                      SizedBox(height: 24),

                      // Password Field
                      Text(
                        'Password',
                        style: TFontBold.body(context),
                      ),
                      SizedBox(height: 8),
                      TTextField.password(
                        controller: _passwordController,
                        hintText: 'Masukkan password Anda',
                        obscureText: _obscurePassword,
                        enabled: !_isLoading,
                        actionWidget: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                          child: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: theme.mutedForeground,
                          ),
                        ),
                        onChange: (_) {
                          if (_errorMessage != null) {
                            setState(() => _errorMessage = null);
                          }
                        },
                      ),

                      SizedBox(height: 12),

                      // Forgot Password Link
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'Fitur lupa password akan segera datang'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },
                          child: Text(
                            'Lupa password?',
                            style: TFontRegular.footNote(context).copyWith(
                              color: theme.primary,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 32),

                      // Login Button
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: TButtonPrimary(
                          text: _isLoading ? 'Memproses...' : 'Masuk',
                          loading: _isLoading,
                          onPressed: _isLoading ? null : _handleLogin,
                          loadingColor: Colors.white,
                        ),
                      ),

                      SizedBox(height: 16),

                      // Sign Up Link
                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: 'Belum punya akun? ',
                            style: TFontRegular.footNote(context)
                                .copyWith(color: theme.foreground),
                            children: [
                              TextSpan(
                                text: 'Daftar di sini',
                                style: TFontBold.footNote(context).copyWith(
                                  color: theme.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 32),

                // Demo Credentials Info
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: theme.muted,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: theme.border, width: 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '📝 Akun Demo',
                        style: TFontBold.title2(context),
                      ),
                      SizedBox(height: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email: demo@example.com',
                            style: TFontRegular.footNote(context).copyWith(
                              color: theme.mutedForeground,
                              fontFamily: 'monospace',
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Password: password123',
                            style: TFontRegular.footNote(context).copyWith(
                              color: theme.mutedForeground,
                              fontFamily: 'monospace',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 24),

                // Theme Toggle
                Center(
                  child: GestureDetector(
                    onTap: () {
                      final themeManager = context.read<TThemeManager>();
                      final isDark =
                          themeManager.state == themeManager.darkTheme;
                      themeManager.toggleTheme(!isDark);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: theme.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: theme.primary, width: 1),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            isDarkMode ? Icons.light_mode : Icons.dark_mode,
                            color: theme.primary,
                            size: 16,
                          ),
                          SizedBox(width: 8),
                          Text(
                            isDarkMode ? 'Mode Terang' : 'Mode Gelap',
                            style: TFontRegular.caption2(context).copyWith(
                              color: theme.primary,
                            ),
                          ),
                        ],
                      ),
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
