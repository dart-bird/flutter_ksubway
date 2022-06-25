<div align="center">

# K-SUBWAY
![icon](https://user-images.githubusercontent.com/51515055/172831324-6df5f77b-0d2f-4054-9b9a-0ed5da9887e7.svg)

[![Flutter](https://img.shields.io/badge/Flutter-v3.0.1-blue?style=for-the-badge&logo=Flutter)](https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.0.1-stable.zip)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg?style=for-the-badge)](https://www.gnu.org/licenses/gpl-3.0)
[![Last commit](https://img.shields.io/github/last-commit/dart-bird/flutter_ksubway?style=for-the-badge)](https://github.com/dart-bird/flutter_ksubway/commits/main)

![Google Chrome](https://img.shields.io/badge/WEB-4285F4?style=for-the-badge&logo=GoogleChrome&logoColor=white)
![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)
![Android](https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white)

K-SUBWAY is a **Korea subway info Application**, using Flutter Framework.  
(IOS will be supported later)




[Getting started](#getting-started) •
[Dependencies](#dependencies) • 
[Contribution](#contribution)

**DONATION**  
[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/dartbird)
</div>

## Getting Started

***(API key needed. Instead, the information provided by the API is replaced by the json file.)***

1. `git clone https://github.com/dart-bird/flutter_ksubway.git`  
2. `flutter doctor` to check flutter version
3. `pub get` to solve dependencies  
3-1. `flutter run` (with demo)  
3-2. `flutter run --dart-define="subwayAPI={API}"` (with real data)


## Dependencies
* [cupertino_icons: ^1.0.2](https://pub.dev/packages/cupertino_icons)  
* [http: ^0.13.4](https://pub.dev/packages/http)   
* [shared_preferences: ^0.5.7+1](https://pub.dev/packages/shared_preferences)   
* [marquee: ^2.2.2](https://pub.dev/packages/marquee)
* [font_awesome_flutter: ^10.1.0](https://pub.dev/packages/font_awesome_flutter)
* [flutter_custom_license_page: ^0.0.3](https://pub.dev/packages/flutter_custom_license_page)
* [url_launcher: ^6.1.2](https://pub.dev/packages/url_launcher)
* [font: GimpoGothic (included)](https://noonnu.cc/font_page/869)

## Contribution
* Your contribution is always open.
* If you want to add a function, please make an issue using the issue template for bug information.
* **IMPORTANT** : If you need an API address for the function, please contribute with the Json demo file.
If you want to include api, you can configure it like `data/exp_ksubway_api/demo.json` and `lib/services/ksubway_api.dart`
