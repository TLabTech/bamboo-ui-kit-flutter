# TLab Bamboo DLS
A custom widget made from TLab for TLab.

## Features

Berikut fitur-fitur utama yang tersedia dalam package ini:

- **Button**: Beragam tombol dengan style dan fungsi berbeda.
- **Checkbox, Radio, Switch**: Komponen input untuk pilihan dan toggle.
- **Text Field & Dropdown**: Form input dan pilihan dropdown.
- **Accordion**: Widget untuk konten yang dapat diperluas.
- **Avatar & Badge**: Tampilan avatar dan badge untuk identitas atau notifikasi.
- **Tile & Header**: Komponen tata letak dan header.
- **Tab & Stepper**: Navigasi tab dan stepper untuk proses bertahap.
- **Alert & Dialog**: Komponen untuk notifikasi dan dialog interaktif.
- **Progress & Slider**: Indikator progres dan slider nilai.
- **Bottom Navigation**: Navigasi bawah dengan berbagai style.
- **Calendar**: Widget kalender.
- **Charts**: Bar chart, pie chart, doughnut chart, line chart, dan lainnya untuk visualisasi data.
- **Breadcrumbs**: Navigasi breadcrumbs.
- **Title Section & Theme**: Komponen judul dan pengelolaan tema.
- **Fondation**: Utilitas seperti font, container, shadow, dan warna hex.
- **Overlay, Feedback, Form, Data Presentation**: Modul tambahan untuk kebutuhan aplikasi modern.

## Getting started

Tambahkan package ke `pubspec.yaml`.
```dart
dependencies:
  flutter_bamboo_ui_kit:
```

## Usage

Contoh penggunaan Text Field:

```dart
TTextField(
  label: "Nama Lengkap",
  hintText: "Masukkan nama Anda",
  onChanged: (value) {
    print("Nama: $value");
  },
)
```
