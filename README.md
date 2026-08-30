- name: Set up Flutter
  uses: subosito/flutter-action@v2
  with:
    channel: stable

- name: Get dependencies
  run: flutter pub get

- name: Build APK
  run: flutter build apk --release
