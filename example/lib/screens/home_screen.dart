import 'package:flutter/material.dart';
import 'package:flutter_bamboo_ui_kit/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<TThemeManager>().state;
    final isDarkMode = theme == context.read<TThemeManager>().darkTheme;

    return Scaffold(
      backgroundColor: theme.background,
      appBar: THeader(
        title: 'Home',
        enableCenterTitle: true,
        suffixAction: [
          THeaderAction(
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPress: () {
              final themeManager = context.read<TThemeManager>();
              final isDark = themeManager.state == themeManager.darkTheme;
              themeManager.toggleTheme(!isDark);
            },
          ),
          THeaderAction(
            icon: Icon(Icons.logout),
            onPress: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: theme.card,
                  title: Text(
                    'Logout',
                    style: TextStyle(color: theme.foreground),
                  ),
                  content: Text(
                    'Apakah Anda yakin ingin keluar?',
                    style: TextStyle(color: theme.mutedForeground),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Batal'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.of(context).pushReplacementNamed('/login');
                      },
                      child: Text(
                        'Logout',
                        style: TextStyle(color: HexColor('E8463B')),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Card
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      theme.primary,
                      theme.primary.withValues(alpha: 0.7),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [TShadow.shadowM()],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selamat Datang! 👋',
                      style: TFontBold.headline(context).copyWith(
                        color: theme.primaryForeground,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Anda berhasil masuk ke aplikasi Bamboo Design System',
                      style: TFontRegular.body(context).copyWith(
                        color: theme.primaryForeground.withValues(alpha: 0.9),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 32),

              // Stats Section
              Text(
                'Statistik',
                style: TFontBold.title2(context),
              ),
              SizedBox(height: 16),

              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildStatCard(
                    context,
                    '22',
                    'Komponen',
                    HexColor('00D89C'),
                  ),
                  _buildStatCard(
                    context,
                    '30+',
                    'Color Tokens',
                    HexColor('049CFB'),
                  ),
                  _buildStatCard(
                    context,
                    '5',
                    'Button Variants',
                    HexColor('F5D741'),
                  ),
                  _buildStatCard(
                    context,
                    '2',
                    'Themes',
                    HexColor('10B981'),
                  ),
                ],
              ),

              SizedBox(height: 32),

              // Features Section
              Text(
                'Fitur',
                style: TFontBold.title2(context),
              ),
              SizedBox(height: 16),

              _buildFeatureItem(
                context,
                '🎨',
                'Design System Lengkap',
                'Typography, colors, spacing, shadows, dan banyak lagi',
              ),
              SizedBox(height: 12),
              _buildFeatureItem(
                context,
                '🌙',
                'Dark & Light Mode',
                'Tema yang dapat disesuaikan dengan toggle real-time',
              ),
              SizedBox(height: 12),
              _buildFeatureItem(
                context,
                '📱',
                'Responsive Design',
                'Beradaptasi sempurna di semua ukuran layar',
              ),
              SizedBox(height: 12),
              _buildFeatureItem(
                context,
                '⚡',
                'Performance',
                'Optimized widgets untuk pengalaman yang lancar',
              ),

              SizedBox(height: 32),

              // Action Buttons
              SizedBox(
                width: double.infinity,
                height: 56,
                child: TButtonSecondary(
                  text: 'Pelajari Lebih Lanjut',
                  onPressed: () {
                    Navigator.of(context).pushNamed('/components');
                  },
                ),
              ),

              SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: TButtonOutline(
                  text: 'Kembali ke Login',
                  textStyle: TFontBold.body(context).copyWith(
                    color: theme.primary,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/login');
                  },
                ),
              ),

              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String value,
    String label,
    Color color,
  ) {
    final theme = context.watch<TThemeManager>().state;

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.card,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.border, width: 1),
        boxShadow: [TShadow.shadowS()],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                value,
                style: TFontBold.title2(context).copyWith(
                  color: color,
                ),
              ),
            ),
          ),
          SizedBox(height: 12),
          Text(
            label,
            style: TFontRegular.caption2(context).copyWith(
              color: theme.mutedForeground,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(
    BuildContext context,
    String emoji,
    String title,
    String description,
  ) {
    final theme = context.watch<TThemeManager>().state;

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.muted.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.border, width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji, style: TextStyle(fontSize: 24)),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TFontBold.body(context),
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  style: TFontRegular.caption2(context).copyWith(
                    color: theme.mutedForeground,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
