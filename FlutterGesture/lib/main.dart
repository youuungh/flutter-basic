import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: HomeWidget(),
  ));
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Gesture & Callback'),
      ),
      body: const Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TestCheckBox(),
        TestRadioButton(),
        TestSlider(),
        TestSwitch(),
        TestPopupMenu(),
        TestCallback()
      ],
    );
  }
}

class TestCheckBox extends StatefulWidget {
  const TestCheckBox({super.key});

  @override
  State<TestCheckBox> createState() => _TestCheckBoxState();
}

class _TestCheckBoxState extends State<TestCheckBox> {
  late List<bool> values;

  @override
  void initState() {
    values = [false, false, false];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: values[0], onChanged: (value) => changeValue(0, value)),
        Checkbox(value: values[1], onChanged: (value) => changeValue(1, value)),
        Checkbox(value: values[2], onChanged: (value) => changeValue(2, value))
      ],
    );
  }

  void changeValue(int index, bool? value) {
    setState(() {
      values[index] = value!;
    });
  }
}

enum TestValue {
  test1,
  test2,
  test3;
}

class TestRadioButton extends StatefulWidget {
  const TestRadioButton({super.key});

  @override
  State<TestRadioButton> createState() => _TestRadioButtonState();
}

class _TestRadioButtonState extends State<TestRadioButton> {
  TestValue? selectValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Radio<TestValue>(
            value: TestValue.test1,
            groupValue: selectValue,
            onChanged: (value) => setState(
              () => selectValue = value!,
            ),
          ),
          title: Text(TestValue.test1.name),
          onTap: () => setState(() {
            if (selectValue != TestValue.test1) {
              selectValue = TestValue.test1;
            }
          }),
        ),
        Radio<TestValue>(
          value: TestValue.test2,
          groupValue: selectValue,
          onChanged: (value) => setState(
            () => selectValue = value!,
          ),
        ),
        Radio<TestValue>(
          value: TestValue.test3,
          groupValue: selectValue,
          onChanged: (value) => setState(
            () => selectValue = value!,
          ),
        ),
      ],
    );
  }
}

class TestSlider extends StatefulWidget {
  const TestSlider({super.key});

  @override
  State<TestSlider> createState() => _TestSliderState();
}

class _TestSliderState extends State<TestSlider> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('${value.round()}'),
        Slider(
          value: value,
          onChanged: (newValue) => setState(() => value = newValue),
          divisions: 100,
          max: 100,
          min: 0,
          label: value.round().toString(),
          activeColor: Colors.blue,
        ),
      ],
    );
  }
}

class TestSwitch extends StatefulWidget {
  const TestSwitch({super.key});

  @override
  State<TestSwitch> createState() => _TestSwitchState();
}

class _TestSwitchState extends State<TestSwitch> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Switch(
            value: value,
            onChanged: (newValue) => setState(() => value = newValue)),
        CupertinoSwitch(
            value: value,
            onChanged: (newValue) => setState(() => value = newValue))
      ],
    );
  }
}

class TestPopupMenu extends StatefulWidget {
  const TestPopupMenu({super.key});

  @override
  State<TestPopupMenu> createState() => _TestPopupMenuState();
}

class _TestPopupMenuState extends State<TestPopupMenu> {
  TestValue selectValue = TestValue.test1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(selectValue.name),
        PopupMenuButton(
          itemBuilder: (context) {
            return TestValue.values
                .map((value) =>
                    PopupMenuItem(value: value, child: Text(value.name)))
                .toList();
          },
          onSelected: (newValue) => setState(() => selectValue = newValue),
        ),
      ],
    );
  }
}

class TestCallback extends StatefulWidget {
  const TestCallback({super.key});

  @override
  State<TestCallback> createState() => _TestCallbackState();
}

class _TestCallbackState extends State<TestCallback> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'count : $value',
          style: const TextStyle(fontSize: 30),
        ),
        TestButton(addCounter)
      ],
    );
  }

  //void addCounter() => setState(() => ++value);
  void addCounter(int addValue) => setState(() => value = addValue + value);
}

class TestButton extends StatelessWidget {
  const TestButton(this.callback, {super.key});

  //final VoidCallback callback;
  final Function(int) callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0),
      width: double.infinity,
      child: InkWell( // or GestureDetector
        //onTap: () => callback.call(),
        onTap: () => callback.call(1),
        onDoubleTap: () => callback.call(5),
        onLongPress: () => callback.call(10),
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(border: Border.all()),
            child: const Text(
              'Up Counter',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}
