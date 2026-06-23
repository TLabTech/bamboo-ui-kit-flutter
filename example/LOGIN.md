# Login Feature Documentation

Dokumentasi lengkap fitur login yang telah diintegrasikan dengan Bamboo Design System.

## 📋 Overview

Fitur login yang telah dibuat mencakup:
- ✅ Login Screen dengan validasi form
- ✅ Home/Dashboard Screen setelah login berhasil
- ✅ Routing dan navigasi antar halaman
- ✅ Theme switching (Light/Dark mode)
- ✅ Integrasi penuh dengan Bamboo Design System components
- ✅ Error handling dan user feedback

## 🚀 Quick Start

### 1. Akun Demo

Gunakan akun berikut untuk testing:

```
Email: demo@example.com
Password: password123
```

### 2. Jalankan Aplikasi

```bash
cd example
flutter pub get
flutter run
```

Aplikasi akan membuka halaman login secara default.

## 📁 File Structure

```
example/lib/
├── screens/
│   ├── login_screen.dart      # Login page dengan form validation
│   └── home_screen.dart       # Dashboard setelah login
├── main.dart                   # Updated dengan routing
└── ...
```

## 🎨 Components Used

### Login Screen (`LoginScreen`)

**File**: `example/lib/screens/login_screen.dart`

**Features**:
- Logo & header dengan branding
- Email input field dengan validasi
- Password input field dengan toggle visibility
- Remember me option (siap untuk future)
- Login button dengan loading state
- Error alert untuk pesan kesalahan
- Demo credentials info display
- Dark/Light mode toggle
- Sign up link (placeholder)

**Components Utilized**:
- `THeader` - Logo area styling
- `TTextField.email()` - Email input dengan validasi built-in
- `TTextField.password()` - Password input dengan visibility toggle
- `TButtonPrimary` - Login CTA button
- `TAlert.destructive()` - Error messages
- `TBadge` - Version badge
- `TShadow` - Card styling
- `TFont` - Typography system
- `TTheme` - Color tokens

### Home Screen (`HomeScreen`)

**File**: `example/lib/screens/home_screen.dart`

**Features**:
- Welcome card dengan gradient
- Statistik display (4 cards)
- Features showcase (4 items)
- Action buttons
- Logout functionality dengan confirmation dialog
- Dark/Light mode toggle

**Components Utilized**:
- `THeader` - Top app bar dengan actions
- `TButtonSecondary` - Secondary action button
- `TButtonOutline` - Outline button variant
- `TFontBold` & `TFontRegular` - Typography
- `TShadow` - Elevation system
- `HexColor` - Color palette

## 🔐 Validation Rules

### Email Validation
```dart
if (value?.isEmpty ?? true) {
  return 'Email tidak boleh kosong';
}
if (!value!.contains('@')) {
  return 'Format email tidak valid';
}
```

### Password Validation
```dart
if (value?.isEmpty ?? true) {
  return 'Password tidak boleh kosong';
}
if (value!.length < 6) {
  return 'Password minimal 6 karakter';
}
```

## 🌐 Routing Structure

```
/login          → LoginScreen (Initial Route)
/home           → HomeScreen (After successful login)
/components     → MyHomePage (Component showcase)
```

### Navigation Examples

```dart
// Navigate to home after login
Navigator.of(context).pushReplacementNamed('/home');

// Navigate back to login
Navigator.of(context).pushReplacementNamed('/login');

// Navigate to components
Navigator.of(context).pushNamed('/components');
```

## 🎭 Theme Integration

### Accessing Theme Colors

```dart
final theme = context.watch<TThemeManager>().state;

// Use semantic colors
Container(
  color: theme.primary,              // Brand color
  child: Text('Content', 
    style: TextStyle(color: theme.primaryForeground)
  ),
)
```

### Theme Switching

```dart
// Toggle between light and dark mode
final themeManager = context.read<TThemeManager>();
final isDark = themeManager.state == themeManager.darkTheme;
themeManager.toggleTheme(!isDark);
```

## 📱 Loading & Error States

### Loading State

```dart
TButtonPrimary(
  text: _isLoading ? 'Memproses...' : 'Masuk',
  loading: _isLoading,
  onPressed: _isLoading ? null : _handleLogin,
  loadingColor: Colors.white,
)
```

### Error Handling

```dart
if (_errorMessage != null)
  TAlert.destructive(
    title: 'Login Gagal',
    subtitle: _errorMessage,
  )
```

## 🔄 State Management

### Form Validation

```dart
final _formKey = GlobalKey<FormState>();

if (!_formKey.currentState!.validate()) {
  return; // Validation failed
}
```

### Form Controllers

```dart
final _emailController = TextEditingController();
final _passwordController = TextEditingController();

@override
void dispose() {
  _emailController.dispose();
  _passwordController.dispose();
  super.dispose();
}
```

## 🎯 Customization Guide

### Change Logo

Ubah bagian header di `LoginScreen`:

```dart
Container(
  width: 80,
  height: 80,
  decoration: BoxDecoration(
    color: theme.primary,
    borderRadius: BorderRadius.circular(20),
  ),
  child: Center(
    child: Text(
      'B',  // ← Change this
      style: TFontBold.headline(context).copyWith(
        color: theme.primaryForeground,
        fontSize: 40,
      ),
    ),
  ),
)
```

### Change Colors

Gunakan semantic tokens dari `TTheme`:

```dart
// Instead of hardcoding
Container(color: Color(0xFF00D89C))

// Use theme
Container(color: theme.primary)
```

### Add Remember Me Feature

```dart
bool _rememberMe = false;

// In form
Checkbox(
  value: _rememberMe,
  onChanged: (value) {
    setState(() => _rememberMe = value ?? false);
  },
)

// Save preference
if (_rememberMe) {
  // Save credentials securely
  await _saveCredentials(email, password);
}
```

### Integrate Real API

```dart
Future<void> _handleLogin() async {
  setState(() => _isLoading = true);

  try {
    final response = await ApiService.login(
      email: _emailController.text,
      password: _passwordController.text,
    );

    if (response.success) {
      // Save token
      await _saveToken(response.token);
      Navigator.of(context).pushReplacementNamed('/home');
    } else {
      setState(() => _errorMessage = response.message);
    }
  } catch (e) {
    setState(() => _errorMessage = 'Terjadi kesalahan: ${e.toString()}');
  } finally {
    setState(() => _isLoading = false);
  }
}
```

## 🧪 Testing

### Manual Testing Checklist

- [ ] Login dengan akun demo berhasil
- [ ] Login dengan email kosong menampilkan error
- [ ] Login dengan password kosong menampilkan error
- [ ] Login dengan email tidak valid menampilkan error
- [ ] Login dengan password < 6 karakter menampilkan error
- [ ] Loading state menampilkan spinner
- [ ] Toggle password visibility bekerja
- [ ] Toggle theme switch bekerja
- [ ] Logout dari home screen berhasil
- [ ] Navigasi antar screen berjalan lancar
- [ ] Responsive layout di berbagai ukuran layar

## 📚 Related Documentation

- [Design System Guide](../DESIGN.md)
- [Component Documentation](../doc/components/)
- [Theme Management](../DESIGN.md#theme-management)

## 🐛 Troubleshooting

### Issue: Theme tidak berubah

**Solution**: Pastikan `TThemeProvider` membungkus aplikasi:
```dart
BlocProvider(
  create: (context) => TThemeManager(),
  child: TThemeProvider(
    child: MyApp(),
  ),
)
```

### Issue: Form validation tidak bekerja

**Solution**: Pastikan `Form` widget membungkus fields dan `GlobalKey<FormState>()` terdaftar:
```dart
Form(
  key: _formKey,
  child: Column(...),
)
```

### Issue: Loading state infinite

**Solution**: Pastikan error handling dalam try-finally:
```dart
try {
  // API call
} finally {
  if (mounted) {
    setState(() => _isLoading = false);
  }
}
```

## 📞 Support

Untuk pertanyaan atau issues, silakan buat issue di repository:
https://github.com/TLabTech/bamboo-ui-kit-flutter/issues

---

**Last Updated**: May 2026  
**Version**: 1.0  
**Status**: Production Ready
