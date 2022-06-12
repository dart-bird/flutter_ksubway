import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ksubway/main.dart';
import 'package:flutter_ksubway/preferences/exp_api_preference.dart';
import 'package:flutter_ksubway/preferences/theme_preference.dart';
import 'package:flutter_ksubway/style/textStyles.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final expApiEndpointTextEditingController = TextEditingController();
  final expApiPreference = ExpApiPreference();
  final themePreference = ThemePreference();
  String expApiEndpoint = "";
  void restoreSettings() async {
    expApiEndpoint = await expApiPreference.getApiEndpoint();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    restoreSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
        ],
      ),
    );
  }
}
