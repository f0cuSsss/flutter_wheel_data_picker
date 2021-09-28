import 'package:flutter/material.dart';

class WheelDataPicker<T> extends StatelessWidget {
  const WheelDataPicker({
    Key? key,
    required this.dataList,
    required this.onChanged,
    this.height = 75,
    this.width = 200,
    this.itemExtent = 22,
    this.magnification = 1.4,
  }) : super(key: key);

  // ==========================
  final List<T> dataList;
  final Function(T value) onChanged;
  // ==========================
  final double height;
  final double width;
  final double itemExtent;
  final double magnification;
  // ==========================

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _drawLine(true),
        _drawLine(false),
        SizedBox(
          height: height,
          // width: double.infinity,
          width: width,
          child: ListWheelScrollView.useDelegate(
            useMagnifier: true,
            magnification: magnification,
            itemExtent: itemExtent,
            physics: const FixedExtentScrollPhysics(),
            onSelectedItemChanged: (index) => onChanged(dataList[index]),
            childDelegate: ListWheelChildBuilderDelegate(
              childCount: dataList.length,
              builder: (context, index) => Text(
                dataList[index].toString(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _drawLine(bool isLeftPosition) {
    final pos = width / 6;
    return Positioned(
      top: (height - itemExtent) / 1.51,
      right: isLeftPosition ? null : pos,
      left: isLeftPosition ? pos : null,
      bottom: (height - itemExtent) / 1.35,
      child: Container(
        color: Colors.black.withOpacity(0.2),
        height: 0.5,
        // width: double.infinity,
        width: 20,
      ),
    );
  }
}

class WheelDataItem<T> extends StatelessWidget {
  const WheelDataItem({
    Key? key,
    required this.value,
  }) : super(key: key);

  final T value;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
      // width: 100,
      width: double.infinity,
      child: Text(value.toString()),
    );
  }
}
