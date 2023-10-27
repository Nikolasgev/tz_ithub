# Currency App

Данное приложение позволяет просматривать курсы валют, используя API Центрального Банка Российской Федерации.

## Функции

Приложение включает в себя следующие экраны:

1. **Список всех валют**:
    - Загружает данные о всех валютах и показывает их списком. По нажатии на валюту можно перейти на экран подробной информации о валюте.
      <p align="center">
  <img src="https://github.com/Nikolasgev/tz_ithub/assets/109689625/a3923616-7e75-4454-9db4-c1c4c0f349ee" width="350" >
  <img src="https://github.com/Nikolasgev/tz_ithub/assets/109689625/ef16c8d1-c575-4c83-a73b-040624523d27" width="350" >
</p>



2. **Подробная информация о валюте**:
    - Отображает подробную информацию о выбранной валюте.
  <p align="center">
  <img src="https://github.com/Nikolasgev/tz_ithub/assets/109689625/e4f1add9-91d7-47f9-9226-4e6911f14407" width="350" >
  <img src="https://github.com/Nikolasgev/tz_ithub/assets/109689625/0fa9ec5b-d37f-4eee-a652-0d9a82969189" width="350" >
</p>

3. **Экран настроек**:
    - Показывает информацию о текущей версии приложения.
    - Позволяет переключить светлую и тёмную темы.

<p align="center">
  <img src="https://github.com/Nikolasgev/tz_ithub/assets/109689625/2ee3c5d3-638a-4f89-b290-89fb30e0e8c5" width="350" >
  <img src="https://github.com/Nikolasgev/tz_ithub/assets/109689625/4c23cf62-0bcb-4eac-9308-7659a7ba19a8" width="350" >
</p>


## Использованные пакеты

- `http`: Для выполнения сетевых запросов к API ЦБ РФ.
- `shared_preferences`: Для кеширования данных о валютах.
- `package_info_plus`: Для получения информации о текущей версии приложения.

## Как использовать

1. Убедитесь, что у вас установлены все зависимости. Если нет, запустите `flutter pub get`.
2. Запустите приложение с помощью `flutter run`.

