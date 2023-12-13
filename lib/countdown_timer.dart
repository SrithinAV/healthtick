import 'package:flutter/material.dart';

class CountDownTimer extends StatelessWidget {
  CountDownTimer({super.key, required this.seconds});
  final int seconds;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(35),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: SizedBox(
            width: 300,
            height: 300,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  color: Colors.green,
                  value: seconds / 60,
                ),
                Center(
                  child: Text(
                    '00: $seconds',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Center(
                  child: Text(
                    '\n\n\nminutes remaining',
                    style: TextStyle(color: Colors.black54, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
