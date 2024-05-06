import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({Key? key}) : super(key: key);

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Functions'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () {
              setState(() {
                clickCounter = 0;
              });
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$clickCounter',
                style: const TextStyle(
                    fontSize: 160, fontWeight: FontWeight.w100)),
            Text(clickCounter == 1 ? 'Click' : 'Clicks',
                style:
                    const TextStyle(fontSize: 160, fontWeight: FontWeight.w100))
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
              icon: Icons.plus_one,
              color: const Color.fromRGBO(123, 198, 230, 1),
              onPressed: () {
                addOne();
              }),
          const SizedBox(width: 10),
          CustomButton(
              icon: Icons.exposure_minus_1,
              color: const Color.fromRGBO(235, 163, 145, 1),
              onPressed: () {
                removeOne();
              }),
          const SizedBox(width: 10),
          CustomButton(
              icon: Icons.refresh,
              color: const Color.fromARGB(255, 145, 235, 232),
              onPressed: () {
                refreshValue();
              })
        ],
      ),
    );
  }

  void addOne() {
    return setState(() {
                clickCounter++;
              });
  }

  void removeOne() {
    if (clickCounter == 0) return;
    return setState(() {
                clickCounter--;
              });
  }

  void refreshValue() {
    return setState(() {
                clickCounter = 0;
              });
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.icon,
    required this.color,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: color,
      child: Icon(icon),
    );
  }
}
