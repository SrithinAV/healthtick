import 'dart:async';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:audioplayers/audioplayers.dart';

import 'countdown_timer.dart';

class ReusableCard extends StatefulWidget {
  final VoidCallback onTimerFinished;
  final String mainText;
  final String subText;
  final String bottomText;

  ReusableCard(
      {required this.onTimerFinished,
      required this.mainText,
      required this.subText,
      required this.bottomText});

  @override
  _ReusableCardState createState() => _ReusableCardState();
}

class _ReusableCardState extends State<ReusableCard> {
  int seconds = 30;
  late Timer timer;
  bool isTimerRunning = false;

  bool showAdditionalContainer = false; // New variable to control visibility
  final _audioPlayer = AudioCache();
  bool _isSwitched = false;

  @override
  void initState() {
    super.initState();

  }

  void _playAudio() {
    _audioPlayer.play('countdown_tick.mp3');
  }

  void startOrPauseResumeTimer() {
    setState(() {
      if (!isTimerRunning) {
        startTimer();
        showAdditionalContainer =
            true; // Show the additional container when the timer starts
      } else {
        isTimerRunning ? pauseTimer() : resumeTimer();
      }
    });
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        seconds--;
      });
      if (seconds <= 0) {
        timer.cancel();
        widget.onTimerFinished();
        // Call the callback function
      }
      if (seconds <= 5 && seconds > 0) {
        if (_isSwitched) {
          _playAudio();
        }
        //_audioPlayer.play('assets/countdown_tick.mp3', isLocal: true);

      }
    });
    isTimerRunning = true;
  }

  void resumeTimer() {
    timer.cancel();
    isTimerRunning = false;
  }

  void pauseTimer() {
    timer.cancel();
    isTimerRunning = false;
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  // New method to check if the timer has hit 0
  bool isTimerFinished() {
    return seconds <= 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroudColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            widget.mainText,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ),
          Text(
            widget.subText,
            style: const TextStyle(
              color: Colors.white54,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),

          CountDownTimer(
            seconds: seconds,
          ),
          Switch(
            activeColor: Colors.green,
            value: _isSwitched,
            onChanged: (value) {
              setState(() {
                _isSwitched = value;
              });
            },
          ),

          Text(
            _isSwitched ? 'Sound On' : 'Sound Off',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: startOrPauseResumeTimer,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
              backgroundColor:
                  Color(0xFFAFD9AC),
            ),
            child: Text(
              isTimerRunning ? 'Pause' : (seconds == 30 ? 'Start' : 'Resume'),
              style: const TextStyle(
                fontSize: 24, // Adjust font size if needed
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          if (showAdditionalContainer)
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white54, width: 2.0),
                  // Border properties
                  borderRadius: BorderRadius.circular(8.0),
                  color: kBackgroudColor, // Optional: Add border radius
                ),
                padding: EdgeInsets.all(16.0),
                // Set the color as needed
                child: Center(
                  child: Text(
                    widget.bottomText,
                    style: const TextStyle(
                      color: Colors.white54,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

          Text('Timer Finished: ${isTimerFinished()}'),
        ],
      ),
    );
  }
}
