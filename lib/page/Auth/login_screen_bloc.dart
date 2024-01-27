// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl_phone_number_input/intl_phone_number_input.dart';
// import 'package:invitation/features/auth/login/cubit/login_cubit.dart';
// import 'package:invitation/network/connectivity_helper.dart';
// import 'package:invitation/page/Auth/signup_screen.dart';
// import 'package:invitation/page/Auth/splash_screen.dart';
// import 'package:invitation/page/home_page_bloc.dart';
// import 'package:invitation/utils/services/session_handler.dart';
// import 'package:invitation/widget/loading.dart';
// import 'package:invitation/widget/loading_dialog.dart.dart';
// import 'package:invitation/widget/toast_widget.dart';
// import 'package:nb_utils/nb_utils.dart';
// import 'package:oktoast/oktoast.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../network/provider/auth_provider.dart';
// import '../../utils/colors.dart';
// import '../../utils/utils.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   String? accessToken;
//   _loadToken() async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     bool? isLoggedIn = sharedPreferences.getBool("isLoggedIn");
//     accessToken = sharedPreferences.getString("accessToken");
//     print("Loggin: ${isLoggedIn}");
//     print("********  Access Token ***********");
//     print(accessToken);
//   }

//   @override
//   void initState() {
//     super.initState();
//     _loadToken();
//   }

//   TextEditingController _phoneController = TextEditingController();
//   GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   String? _phone;
//   PhoneNumber number = PhoneNumber(isoCode: 'TZ');

//   TextEditingController _passwordController = TextEditingController();

//   bool _obsecureText = true;

//    final Map<String, dynamic> _authData = {
//     'phone_number': '',
//     'password': '',
//   };

//   void _toggle() {
//     setState(() {
//       _obsecureText = !_obsecureText;
//     });
//   }

//   String code = "TZ";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: GestureDetector(
//       onTap: () {
//         FocusScope.of(context).requestFocus(FocusNode());
//       },
//       child: SingleChildScrollView(
//         child: (Container(
//           height: Utils.displayHeight(context),
//           width: Utils.displayWidth(context),
//           decoration: BoxDecoration(
//               gradient: LinearGradient(
//             colors: [AppColor.prebase, AppColor.base],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             //tileMode: TileMode.repeated,
//           )),
//           child: Padding(
//             padding: const EdgeInsets.only(top: 120.0, left: 20.0, right: 20.0),
//             child:
//                 Form(
//                   key: _formKey,
//                   child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
//                               Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(
//                       Icons.card_giftcard,
//                       color: AppColor.base,
//                     ),
//                     const SizedBox(
//                       width: 10.0,
//                     ),
//                     const Text(
//                       "Invitation",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 25,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     )
//                   ],
//                               ),
//                               SizedBox(
//                   height: Utils.displayHeight(context) * 0.12,
//                               ),
                              
//                               SizedBox(
//                   height: Utils.displayHeight(context) * 0.02,
//                               ),
                             
//                               SizedBox(
//                   height: Utils.displayHeight(context) * 0.02,
//                               ),
//                               Container(
//                   height: 50,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(color: AppColor.border)),
//                   width: Utils.displayWidth(context),
//                   padding: const EdgeInsets.symmetric(horizontal: 15),
//                   child: InternationalPhoneNumberInput(
//                     onInputChanged: (PhoneNumber number) {
//                       _phone = number.phoneNumber?.replaceAll("+", "");
//                        print(_phone);
//                       _authData['phone_number'] = _phone;
//                     },
//                     onInputValidated: (bool value) {
//                       if (value) print(value);
//                     },
    
//                     selectorConfig: const SelectorConfig(
//                       selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
//                     ),
//                     textStyle: const TextStyle(color: Colors.white),
//                     hintText: "",
//                     ignoreBlank: false,
//                     maxLength: 9,
//                     autoValidateMode: AutovalidateMode.disabled,
//                     selectorTextStyle: const TextStyle(color: Colors.white),
                    
//                     initialValue: number,
//                     textFieldController: _phoneController,
//                     formatInput: false,
//                     keyboardType: const TextInputType.numberWithOptions(
//                         signed: true, decimal: true),
//                     inputBorder:
//                         const OutlineInputBorder(borderSide: BorderSide.none),
//                     onSaved: (PhoneNumber number) {
//                       print('On Saved: $number');
//                     },
//                   ),
//                               ),
//                               SizedBox(
//                   height: Utils.displayHeight(context) * 0.035,
//                               ),
//                               Container(
//                   height: 50,
//                   width: Utils.displayWidth(context),
//                   child: Center(
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 0.0),
//                       child: TextFormField(
//                         style: const TextStyle(color: Colors.white),
//                         obscureText: _obsecureText,
//                         enableSuggestions: false,
//                         autocorrect: false,
//                         controller: _passwordController,
//                         decoration: InputDecoration(
//                           suffixIcon: InkWell(
//                               onTap: () {
//                                 _toggle();
//                                 print(_obsecureText);
//                               },
//                               child: Icon(
//                                 _obsecureText
//                                     ? CupertinoIcons.eye
//                                     : CupertinoIcons.eye_slash,
//                                 color: Colors.white,
//                               )),
//                           labelText: "Password",
//                           labelStyle: const TextStyle(color: Colors.white),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10.0),
//                             borderSide: const BorderSide(
//                               color: Colors.white,
//                             ),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: AppColor.border),
//                               borderRadius:
//                                   const BorderRadius.all(Radius.circular(10.0))),
//                           border: const OutlineInputBorder(
//                             borderSide: BorderSide(
//                                 color: Colors.white,
//                                 width: 3,
//                                 style: BorderStyle.solid),
//                             borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                           ),
//                         ),
//                         onChanged: (value) {
//                           _authData['password'] = value;
//                           print("password: " + _passwordController.text);
//                         },
//                           validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter an password';
//                                 } else if (value.length < 8) {
//                                   return 'Password must have 8 or more character long';
//                                 }
//                                 return null;
//                               },
//                       ),
//                     ),
//                   ),
//                               ),
                
//                               const SizedBox(
//                   height: 15.0,
//                               ),
//                               const Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Text(
//                       "Forgot Password?",
//                       style: TextStyle(color: Colors.white54, fontSize: 12),
//                       textAlign: TextAlign.end,
//                     ),
//                   ],
//                               ),
//                               const SizedBox(
//                   height: 15.0,
//                               ),
//                                   BlocConsumer<LoginCubit, LoginState>(
//                             builder: (context, state) {
//                               return state.maybeWhen(loading: () {
//                                 return Loader(
//                                   size: 50,
//                                 );
//                               }, orElse: () {
//                                 return ElevatedButton(
//                                   onPressed: () {
//                                     if (_formKey.currentState!.validate()) {
//                                       _formKey.currentState!.save();
//                                       BlocProvider.of<LoginCubit>(context)
//                                           .login(_authData);
//                                     }
//                                   },
//                                   style: ElevatedButton.styleFrom(
//                                     padding: const EdgeInsets.only(
//                                         top: 15, bottom: 15),
//                                     backgroundColor:
//                                         Theme.of(context).primaryColor,
//                                     textStyle: const TextStyle(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.w500),
//                                     minimumSize: const Size.fromHeight(50),
//                                   ),
//                                   child: const Text("Login with Phone"),
//                                 );
//                               });
//                             },
//                             listener: (context, state) {
//                               state.maybeWhen(
//                                   success: (user) {
//                                     SessionTimer.startTimer(context);

//                                     const HomePage().launch(context);
//                                   },
//                                   failure: (errorMessage) {
//                                     Fluttertoast.showToast(
//                                       msg: errorMessage,
//                                       toastLength: Toast.LENGTH_LONG,
//                                       gravity: ToastGravity.BOTTOM,
//                                       timeInSecForIosWeb: 5,
//                                       backgroundColor: Colors.red,
//                                       textColor: Colors.white,
//                                       fontSize: 16.0,
//                                     );
//                                   },
//                                   orElse: () {});
//                             },
//                           ),
                       
//                               const SizedBox(
//                   height: 10.0,
//                               ),
//                               Container(
//                   margin: const EdgeInsets.only(top: 30),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       const Center(
//                         child: Text(
//                           "Don't have Account?",
//                           style: TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.white54),
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           SizedBox(width: Utils.displayWidth(context) * 0.32),
//                           const Text(
//                             "Please",
//                             style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.white54),
//                           ),
//                           const SizedBox(width: 5),
//                           InkWell(
//                             onTap: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                           const SignupScreen()));
//                             },
//                             child: Text(
//                               "Signup",
//                               style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w500,
//                                   color: AppColor.base),
//                             ),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                               )
//                             ]),
//                 ),
//           ),
//         )),
//       ),
//     ));
//   }
// }
