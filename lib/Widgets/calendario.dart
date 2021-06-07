import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projeto_flutter/Cores.dart';

class Calendario extends StatefulWidget {
  @override
  _CalendarioState createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: TextButton(
            child: Text(
              'Abrir calendário',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'NotoSans',
                color: Colors.white,
              ),
            ),
            onPressed: () async {
              final data = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2040),
                locale: Locale("pt", "BR"),
                fieldLabelText: 'Insira uma data!',
                fieldHintText: 'Dia/Mês/Ano',
                builder: (BuildContext context, Widget child) {
                  return Theme(
                    data: ThemeData.light().copyWith(
                      colorScheme: ColorScheme.light().copyWith(
                        primary: customPurple,
                      ),
                    ),
                    child: child,
                  );
                },
              );
              if (data != null) {
                final datapt = //colocando data no padrão br
                    DateFormat(DateFormat.YEAR_MONTH_DAY, 'pt_Br').format(data);
                print(datapt);
              }
            },
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.date_range,
            color: Colors.white,
          ),
          onPressed: () async {
            final data = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2040),
              locale: Locale("pt", "BR"),
              fieldLabelText: 'Insira uma data!',
              fieldHintText: 'Dia/Mês/Ano',
              builder: (BuildContext context, Widget child) {
                return Theme(
                  data: ThemeData.light().copyWith(
                    colorScheme: ColorScheme.light().copyWith(
                      primary: customPurple,
                    ),
                  ),
                  child: child,
                );
              },
            );
            if (data != null) {
              final datapt = //colocando data no padrão br
                  DateFormat(DateFormat.YEAR_MONTH_DAY, 'pt_Br').format(data);
              print(datapt);
            }
          },
        ),
      ],
    );
  }
}
