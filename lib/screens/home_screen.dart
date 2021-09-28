import 'package:flutter/material.dart';
import 'package:flutter_number_picker/widgets/wheel_data_picker.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  List<String> stringDataList = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
    'Item 9',
  ];

  List<num> numDataList = [
    1,
    1.5,
    2,
    2.5,
    3,
    3.5,
    4,
    4.5,
    5,
    5.5,
    6,
    6.5,
    7,
    7.5,
    8,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
      children: [
        const SizedBox(height: 200.0),
        const Text(
          'String picker',
          style: TextStyle(color: Colors.black),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: WheelDataPicker<String>(
            dataList: stringDataList,
            onChanged: (value) {
              // ignore: avoid_print
              print('string changed: $value');
            },
          ),
        ),
        const Divider(),
        const Text('Number picker'),
        WheelDataPicker<num>(
          dataList: numDataList,
          onChanged: (value) {
            // ignore: avoid_print
            print('num changed: $value');
          },
        ),
        Row(
          children: [
            Expanded(
              child: WheelDataPicker<num>(
                dataList: numDataList,
                onChanged: (value) {
                  // ignore: avoid_print
                  print('num changed: $value');
                },
              ),
            ),
            Expanded(
              child: WheelDataPicker<num>(
                dataList: numDataList,
                onChanged: (value) {
                  // ignore: avoid_print
                  print('num changed: $value');
                },
              ),
            ),
          ],
        ),
      ],
    )));
  }
}
