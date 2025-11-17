# Rick & Morty Characters — Flutter App
<img width="216" height="480" alt="Screenshot_20251008-180054" src="https://github.com/user-attachments/assets/c51eab87-a50e-49e7-9f0a-65daf9515241" />
<img width="216" height="480" alt="Screenshot_20251008-180054" src="https://github.com/user-attachments/assets/43d5ee2b-9114-41a1-b4fd-67edc316fa52" />

---

Тестовое задание - Flutter приложение для просмотра API rickandmortyapi.com

Поддерживает:
- загрузку данных с API;
- пагинацию;
- оффлайн-режим (кэш персонажей и избранного в Drift);
- добавление в избранное;
- анимацию кнопки избранного;
- сортировку избранного;
- тёмную тему;
- state management через flutter_bloc.

Тестировалось на Android:  
Flutter v3.35.7  
Dart v3.9.2  

---

## Запуск проекта

1. Установить Flutter
2. Подтянуть зависимости
```dart
flutter pub get
```
3. Запустить кодогенерацию
```dart
dart run build_runner build --delete-conflicting-outputs
```
4. Запустить релизную версию
```dart
flutter run --release
```

---

Зависимости:  
  flutter:  
    sdk: flutter  
  flutter_bloc: ^9.1.1  
  drift: ^2.29.0  
  drift_flutter: ^0.2.7  
  json_annotation: ^4.9.0  
  http: ^1.6.0  

dev зависимости:  
  build_runner: ^2.10.2  
  json_serializable: ^6.11.1  
  drift_dev: ^2.29.0  
  flutter_lints: ^5.0.0  
