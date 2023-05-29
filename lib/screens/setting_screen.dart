import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ksubway/main.dart';
import 'package:flutter_ksubway/models/ksubway_seoulstations.dart';
import 'package:flutter_ksubway/preferences/exp_api_preference.dart';
import 'package:flutter_ksubway/preferences/ksubway_stations_preference.dart';
import 'package:flutter_ksubway/preferences/theme_preference.dart';
import 'package:flutter_ksubway/providers/exp_ksubway_provider.dart';
import 'package:flutter_ksubway/providers/kusbway_provider.dart';
import 'package:flutter_ksubway/services/ksubway_api.dart';
import 'package:flutter_ksubway/style/textStyles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  KsubwaySeoulstations ksubwaySeoulstations = KsubwaySeoulstations(stationList: []);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CupertinoNavigationBar(
              previousPageTitle: "back",
            ),
            CupertinoFormSection.insetGrouped(
              header: const Text(
                'Experimental Section',
                style: textStyleSub2,
              ),
              children: List<Widget>.generate(1, (int index) {
                return CupertinoTextFormFieldRow(
                  initialValue: Provider.of<ExpKsubwayProvider>(context).expksubwayApiUrl,
                  prefix: const Text(
                    'API Endpoint',
                    style: textStyleTextFormFieldTitle,
                  ),
                  placeholder: 'Enter endpoint',
                  placeholderStyle: textStyleTextFormFieldContent,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a value';
                    }
                    if (!Uri.parse(value).isAbsolute) return 'Please enter valid api endpoint';
                  },
                  onChanged: (value) {
                    Provider.of<ExpKsubwayProvider>(context, listen: false).expksubwayApiUrl = value;
                    Provider.of<ExpKsubwayProvider>(context, listen: false).saveExpksubwayApiEndpoint();
                  },
                );
              }),
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
                  onPressed: () => Provider.of<KsubwayProvider>(context, listen: false).updateKsubwayStations(),
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
