# VIRA

نسخه اولیه اپلیکیشن VIRA برای خرید و فروش طلا و دلار.

## اجرای محلی

```bash
flutter pub get
flutter run
```

## ساخت APK

```bash
flutter build apk --release
```

## ساخت خودکار در GitHub

فایل `.github/workflows/build-apk.yml` با هر push به شاخه `main` یا اجرای دستی، APK را می‌سازد.

بعد از پایان Build:
GitHub → Actions → Build VIRA APK → آخرین اجرای موفق → Artifacts → VIRA-APK
