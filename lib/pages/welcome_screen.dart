// import 'package:flutter/material.dart';
// import 'package:arbitri/pages/login_screen.dart';
// import 'package:arbitri/pages/register_screen.dart';

// class WelcomeScreen extends StatelessWidget {
//   const WelcomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           children: [
//             Image.asset(
//               "assets/img-3.png",
//               height: MediaQuery.of(context).size.height * 0.55,
//               width: MediaQuery.of(context).size.width,
//               fit: BoxFit.cover,
//             ),
//             Image.asset(
//               "assets/images/logo.png",
//               fit: BoxFit.cover,
//             ),
//             const SizedBox(height: 25),
//             //login button
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 40,
//                 vertical: 5,
//               ),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: MaterialButton(
//                       color: const Color(0xFF1E232C),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const LoginScreen()));
//                       },
//                       child: const Padding(
//                         padding: EdgeInsets.all(15.0),
//                         child: Text(
//                           "Login",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             //register button
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 40,
//                 vertical: 5,
//               ),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: MaterialButton(
//                       shape: RoundedRectangleBorder(
//                         side: const BorderSide(
//                           color: Color(0xFF1E232C),
//                         ),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const RegisterScreen()));
//                       },
//                       child: const Padding(
//                         padding: EdgeInsets.all(15.0),
//                         child: Text(
//                           "Register",
//                           style: TextStyle(
//                             color: Color(0xFF1E232C),
//                             fontSize: 16,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const Spacer(),
//             GestureDetector(
//               onTap: () {},
//               child: const Text(
//                 "Continue as a guest",
//                 style: TextStyle(
//                   color: Color(0xFF35C2C1),
//                 ),
//               ),
//             ),
//             const Spacer(),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:arbitri/pages/login_screen.dart';
import 'package:arbitri/pages/register_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset(
            "assets/img-3.png",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              const Spacer(),
              Center(
                child: Image.asset(
                  "assets/images/arbitri.png",
                  fit: BoxFit.cover,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 5,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: MaterialButton(
                        color: const Color(0xFF1E232C),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 5,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreen(),
                            ),
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            "Register",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  "Continue as a guest",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
