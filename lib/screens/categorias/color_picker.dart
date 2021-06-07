import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorP extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ColorPState();
}

class ColorPState extends State<ColorP> {
  Color currentColor = Color(0xff131b26);

  void changeColor(Color color) => setState(() => currentColor = color);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 200, height: 40),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xfffc00e3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Center(
                          child: Text(
                            'Selecione uma cor',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'NotoSans',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        backgroundColor: Color(0xff6725D6),
                        titlePadding: const EdgeInsets.all(10.0),
                        contentPadding: const EdgeInsets.all(2.0),
                        content: SingleChildScrollView(
                          child: ColorPicker(
                            pickerColor: currentColor,
                            onColorChanged: changeColor,
                            colorPickerWidth: 350.0,
                            pickerAreaHeightPercent: 0.9,
                            enableAlpha: false,
                            displayThumbColor: true,
                            showLabel: false,
                            paletteType: PaletteType.hsv,
                            pickerAreaBorderRadius: const BorderRadius.only(
                              topLeft: const Radius.circular(0.0),
                              topRight: const Radius.circular(0.0),
                            ),
                          ),
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xfffc00e3),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text('Pronto'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('Selecionar cor'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 17.0),
              child: CircleAvatar(backgroundColor: currentColor, radius: 30.0),
            ),
          ],
        ),
      ),
    );
  }
}
