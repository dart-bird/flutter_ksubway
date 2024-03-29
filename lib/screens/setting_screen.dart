import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ksubway/main.dart';
import 'package:flutter_ksubway/models/ksubway_seoulstations.dart';
import 'package:flutter_ksubway/preferences/exp_api_preference.dart';
import 'package:flutter_ksubway/preferences/ksubway_stations_preference.dart';
import 'package:flutter_ksubway/preferences/theme_preference.dart';
import 'package:flutter_ksubway/services/ksubway_api.dart';
import 'package:flutter_ksubway/style/textStyles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  KsubwaySeoulstations ksubwaySeoulstations = KsubwaySeoulstations(stationList: []);
  final KsubwayStationsPreference _ksubwayStationsPreference = KsubwayStationsPreference();
  final expApiEndpointTextEditingController = TextEditingController();
  final expApiPreference = ExpApiPreference();
  final themePreference = ThemePreference();
  String expApiEndpoint = "";
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  void fetchKsubwayStations() async {
    ksubwaySeoulstations = await KsubwayApi.fetchKsubwayStations(city: 'seoul');
    _ksubwayStationsPreference.setSeoulstations(ksubwaySeoulstations);
  }

  void restoreSettings() async {
    expApiEndpoint = await expApiPreference.getApiEndpoint();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchKsubwayStations();
    restoreSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CupertinoNavigationBar(
              previousPageTitle: "back",
            ),
            Form(
              autovalidateMode: AutovalidateMode.always,
              onChanged: () {
                Form.of(primaryFocus!.context!)?.save();
              },
              child: CupertinoFormSection.insetGrouped(
                header: const Text(
                  'Experimental Section',
                  style: textStyleSub2,
                ),
                children: List<Widget>.generate(1, (int index) {
                  return CupertinoTextFormFieldRow(
                    controller: expApiEndpointTextEditingController..text = expApiEndpoint,
                    prefix: const Text(
                      'API Endpoint',
                      style: textStyleTextFormFieldTitle,
                    ),
                    placeholder: 'Enter text',
                    placeholderStyle: textStyleTextFormFieldContent,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a value';
                      }
                      if (!Uri.parse(value).isAbsolute) return 'Please enter valid api endpoint';
                    },
                    onSaved: (value) {
                      expApiPreference.setApiEndpoint(value ?? "");
                    },
                    onEditingComplete: () => expApiEndpointTextEditingController.clear(),
                  );
                }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '서울 역정보 업데이트',
                  style: textStyleSub1,
                ),
                CupertinoButton(
                  child: const FaIcon(FontAwesomeIcons.arrowsRotate),
                  onPressed: () => fetchKsubwayStations(),
                )
              ],
            ),
            Center(
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () async {
                  setState(() {});
                  themePreference.setDarkTheme(MyApp.themeNotifier.value == ThemeMode.light);
                  MyApp.themeNotifier.value = MyApp.themeNotifier.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
                },
                icon: Icon(MyApp.themeNotifier.value == ThemeMode.light ? Icons.dark_mode : Icons.light_mode),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Divider(thickness: 0.2, color: Colors.grey),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(bottom: 32),
              height: 120,
              child: Column(
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      _launchInBrowser(Uri(
                        scheme: 'https',
                        host: 'github.com',
                        path: '/dart-bird/flutter_ksubway',
                      ));
                    },
                    icon: const FaIcon(FontAwesomeIcons.github),
                  ),
                  const Text(
                    'Created by dart-bird',
                    style: textStyleFooter,
                  ),
                  const SizedBox(height: 5),
                  OutlinedButton(
                    onPressed: () {
                      showLicensePage(context: context);
                    },
                    child: const Text("License", style: textStyleFooter),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
