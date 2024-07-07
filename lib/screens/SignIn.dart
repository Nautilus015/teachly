import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  TextEditingController emailvalue = TextEditingController();
  TextEditingController passvalue = TextEditingController();
  TextEditingController phonevalue = TextEditingController();
  bool _validate = false;
  bool light = true;

  SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/designone.png'),
                  fit: BoxFit.cover)),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 16),
                Text(
                  'Sign In',
                  style: TextStyle(color: Colors.black, fontSize: 40),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: phonevalue,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    errorText: _validate ? "phone Can't Be Empty" : null,
                    hintText: 'Phone Number',
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: passvalue,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    errorText: _validate ? "Password Can't Be Empty" : null,
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    border: OutlineInputBorder(),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 15,
                      child: Transform.scale(
                        scale: 0.8,
                        child: Switch(
                          // This bool value toggles the switch.
                          value: light,
                          activeColor: Colors.blue,
                          onChanged: (bool value) {
                            // This is called when the user toggles the switch.
                          },
                        ),
                      ),
                    ),
                    Expanded(flex: 25, child: Text('Remind Me')),
                    Expanded(
                      flex: 60,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {},
                            child: Text('Forgot Password?',
                                style: TextStyle(
                                  color: Colors.blue,
                                ))),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    // Add your onPressed logic here
                  },
                  child: Container(
                    constraints: BoxConstraints(minWidth: 150, minHeight: 50),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blue.shade500, Colors.lightGreenAccent],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(
                          shadows: [
                            Shadow(
                                color: Colors.black,
                                offset: Offset.zero,
                                blurRadius: 10)
                          ],
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                          style: TextStyle(fontSize: 18),
                          "Don't have an account?"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6, top: 20),
                      child: InkWell(
                        child: Text(
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                            'Sign Up'),
                      ),
                    ),
                  ],
                )
              ]),
        ),
      ])),
    );
  }
}
