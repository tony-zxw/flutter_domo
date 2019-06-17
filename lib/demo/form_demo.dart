import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FormDemo'),
        elevation: 0.0,
      ),
      // body: Theme(
      //   data: ThemeData(primaryColor: Colors.black),
      //   child: ThemeDemo(),
      // ),修改为黑色主题
      body: Theme(
        data: Theme.of(context)
            .copyWith(primaryColor: Colors.black), //只是覆盖primaryColor，其他会保留
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final regiserFormKey = GlobalKey<FormState>();
  String username, password;
  bool autovalidate = false;
  void submitRegisterForm() {
    if (regiserFormKey.currentState.validate()) {
      regiserFormKey.currentState.save();

      debugPrint('username:$username');
      debugPrint('password:$password');
      setState(() {
        autovalidate = false;
      });
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Registing ...'),
      ));
    } else {
      setState(() {
        autovalidate = true;
      });
    }
  }

  String validateUsername(value) {
    if (value.isEmpty) {
      return 'Username is required.';
    }
    return null;
  }

  String validatePassword(value) {
    if (value.isEmpty) {
      return 'Password is required.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: regiserFormKey,
        child: Column(
          children: <Widget>[
            // TextFieldDemo(),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Username',
                hintText: 'Enter username',
                helperText: '',
              ),
              onSaved: (value) {
                username = value;
              },
              validator: validateUsername,
              autovalidate: autovalidate,
            ), //可以看成是下面的TextFieldDemo
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter Password',
                helperText: '',
              ),
              onSaved: (value) {
                password = value;
              },
              validator: validatePassword,
              autovalidate: autovalidate,
            ),
            SizedBox(
              height: 32.0,
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                color: Theme.of(context).accentColor,
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
                elevation: 0.0,
                onPressed: submitRegisterForm,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  final textEditingController = TextEditingController();
  @override
  void dispose() {
    textEditingController.dispose(); //销毁资源
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // textEditingController.text = 'Hi';//初始值
    textEditingController.addListener(//类似余onchange
        () {
      debugPrint('input: ${textEditingController.text}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: textEditingController,
        // onChanged: (value) {
        //   debugPrint('input: $value');
        // },
        onSubmitted: (value) {
          debugPrint('submit: $value');
        },
        decoration: InputDecoration(
          icon: Icon(Icons.subject),
          labelText: 'Title',
          hintText: 'Enter the post title',
          // border: InputBorder.none,
          // border: OutlineInputBorder(),
          filled: true,
          // fillColor: Colors.grey,
        ),
      ),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context)
          .accentColor, //使用主色，会显示黄色，原因时在main.dart中的MaterialApp的theme中的ThemeData primarySwatch Colors.yellow
    );
  }
}
