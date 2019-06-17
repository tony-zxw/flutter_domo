import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StepperDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Theme(
              data: Theme.of(context).copyWith(primaryColor: Colors.black),
              child: Stepper(
                // controlsBuilder: (BuildContext context,
                //     {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
                //   return Row(
                //     children: <Widget>[
                //       FlatButton(
                //         onPressed: onStepContinue,
                //         child: const Text(
                //           '继续',
                //           style: TextStyle(
                //               color: Colors.white,
                //               backgroundColor: Colors.black),
                //         ),
                //       ),
                //       FlatButton(
                //         onPressed: onStepCancel,
                //         child: const Text('取消'),
                //       ),
                //     ],
                //   );
                // },
                currentStep: _currentStep,
                onStepTapped: (int value) {
                  setState(() {
                    _currentStep = value;
                  });
                },
                onStepContinue: () {
                  setState(() {
                    _currentStep < 2 ? _currentStep++ : _currentStep = 0;
                  });
                },
                onStepCancel: () {
                  setState(() {
                    _currentStep > 2 ? _currentStep-- : _currentStep = 0;
                  });
                },
                steps: [
                  Step(
                    title: Text('Login'),
                    subtitle: Text('Login first'),
                    content:
                        Text('Magna Exercitation duis not sint en nostrud.'),
                    isActive: _currentStep == 0,
                  ),
                  Step(
                    title: Text('Choose Plan'),
                    subtitle: Text('Choose you plan.'),
                    content:
                        Text('Magna Exercitation duis not sint en nostrud.'),
                    isActive: _currentStep == 1,
                  ),
                  Step(
                    title: Text('Confirm payment'),
                    subtitle: Text('Confirm your panyment method.'),
                    content:
                        Text('Magna Exercitation duis not sint en nostrud.'),
                    isActive: _currentStep == 2,
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
