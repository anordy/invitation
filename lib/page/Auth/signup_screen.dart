import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:invitation/network/connectivity_helper.dart';
import 'package:invitation/page/Auth/login_screen.dart';
import 'package:invitation/page/home_page.dart';
import 'package:invitation/widget/loading.dart';
import 'package:invitation/widget/loading_dialog.dart.dart';
import 'package:invitation/widget/toast_widget.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import '../../network/provider/auth_provider.dart';
import '../../utils/colors.dart';
import '../../utils/utils.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController _phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? _phone;
  PhoneNumber number = PhoneNumber(isoCode: 'TZ');

  TextEditingController _firstnameController = TextEditingController();
  TextEditingController _lastnameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  // Initially password is obscure
  bool _obscureText = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  String code = "TZ";
  @override
  Widget build(BuildContext context) {
    final _authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
        body: GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SingleChildScrollView(
        child: (Container(
          height: Utils.displayHeight(context),
          width: Utils.displayWidth(context),
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [AppColor.prebase, AppColor.base],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            //tileMode: TileMode.repeated,
          )),
          child: Padding(
            padding: const EdgeInsets.only(top: 120.0, left: 20.0, right: 20.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.card_giftcard,
                    color: AppColor.base,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  const Text(
                    "Invitations",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: Utils.displayHeight(context) * 0.1,
              ),
              //  const Text(
              //     "Enter Your \n Mobile number",
              //     style: TextStyle(color: Colors.white, fontSize: 18),
              //      textAlign: TextAlign.center,
              //   ),
              SizedBox(
                height: Utils.displayHeight(context) * 0.02,
              ),

              SizedBox(
                height: Utils.displayHeight(context) * 0.02,
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // color: Colors.green,
                    border: Border.all(color: AppColor.border)),
                width: Utils.displayWidth(context),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InternationalPhoneNumberInput(
                  onInputChanged: (PhoneNumber number) {
                    _phone = number.phoneNumber?.replaceAll("+", "");
                    print(_phone);
                  },
                  onInputValidated: (bool value) {
                    if (value) print(value);
                  },
                  // validator: (value) {
                  //   if (value!.length >= 9) {
                  //     return "";
                  //   } else
                  //     return null;
                  // },
                  selectorConfig: const SelectorConfig(
                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  ),
                  ignoreBlank: false,
                  maxLength: 9,
                  autoValidateMode: AutovalidateMode.disabled,
                  selectorTextStyle: const TextStyle(color: Colors.white),
                  hintText: "",
                  initialValue: number,
                  textFieldController: _phoneController,
                  formatInput: false,
                  keyboardType: const TextInputType.numberWithOptions(
                      signed: true, decimal: true),
                  inputBorder:
                      const OutlineInputBorder(borderSide: BorderSide.none),
                  onSaved: (PhoneNumber number) {
                    print('On Saved: $number');
                  },
                ),
              ),
              SizedBox(height: Utils.displayHeight(context) * 0.02),

              Container(
                height: 50,
                width: Utils.displayWidth(context),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0.0),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      enableSuggestions: false,
                      autocorrect: false,
                      controller: _firstnameController,
                      decoration: InputDecoration(
                        labelText: "First Name",
                        labelStyle: const TextStyle(color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColor.border),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0))),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 3,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      onChanged: (value) {
                        print("First name: " + _firstnameController.text);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "* Required";
                        } else
                          return null;
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: Utils.displayHeight(context) * 0.02),
              Container(
                height: 50,
                width: Utils.displayWidth(context),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0.0),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      enableSuggestions: false,
                      autocorrect: false,
                      controller: _lastnameController,
                      decoration: InputDecoration(
                        labelText: "Last Name",
                        labelStyle: const TextStyle(color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColor.border),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0))),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 3,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      onChanged: (value) {
                        print("Last Name: " + _lastnameController.text);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "* Required";
                        } else
                          return null;
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: Utils.displayHeight(context) * 0.02),
              Container(
                height: 50,
                width: Utils.displayWidth(context),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0.0),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      obscureText: _obscureText,
                      enableSuggestions: false,
                      autocorrect: false,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                            onTap: () {
                              _toggle();
                              print(_obscureText);
                            },
                            child: Icon(
                              _obscureText
                                  ? CupertinoIcons.eye
                                  : CupertinoIcons.eye_slash,
                              color: Colors.white,
                            )),
                        labelText: "Password",
                        labelStyle: const TextStyle(color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColor.border),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0))),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 3,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      onChanged: (value) {
                        print("password: " + _passwordController.text);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "* Required";
                        } else
                          return null;
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: Utils.displayHeight(context) * 0.02),

              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: MaterialButton(
                    height: 50,
                    minWidth: Utils.displayWidth(context),
                    color: const Color.fromARGB(179, 1, 59, 101),
                    onPressed: () {
                      ConnectivityHelper.isDeviceConnected()
                          .then((isConnected) {
                        if (isConnected) {
                          print("************   INTERNET CONNECTED  *********");
                          if (!_authProvider.isLoading) {
                            if (_phoneController.text.length <= 9 &&
                                _passwordController.text.length >= 8) {
                              _authProvider
                                  .signup(
                                      phone: _phone.toString(),
                                      fullname: _firstnameController.text +
                                          '  ' +
                                          _lastnameController.text,
                                      password: _passwordController.text)
                                  .then((value) {
                                //     showDialog(
                                // context: context,
                                // barrierDismissible: false,
                                // builder: (_) {
                                //   return LoadingDialog();
                                // });
                                if (!value) {
                                  showToastWidget(
                                    LoggedInToast(
                                        icon: const Icon(
                                          Icons.done,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                        height: 50,
                                        width: 200,
                                        color: AppColor.success,
                                        description: "Login Successfully"),
                                    duration: const Duration(seconds: 2),
                                    position: ToastPosition.top,
                                  );
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomePage()));
                                } else {
                                  showToastWidget(
                                    ToastWidget(
                                        icon: const Icon(
                                          Icons.close,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                        height: 50,
                                        width: 300,
                                        color: AppColor.base,
                                        description:
                                            "${_authProvider.authResponce.message}"),
                                    duration: const Duration(seconds: 2),
                                    position: ToastPosition.bottom,
                                  );
                                }
                              });
                            } else {
                              showToastWidget(
                                ToastWidget(
                                    icon: const Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                    height: 50,
                                    width: 300,
                                    color: AppColor.base,
                                    description: "Invalid Credential"),
                                duration: const Duration(seconds: 2),
                                position: ToastPosition.bottom,
                              );
                            }
                          }
                        } else {
                          print("+===    Device not connected  ============ ");
                        }
                      });
                    },
                    child: const Text(
                      "SIGNUP",
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                  )),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Center(
                      child: Text(
                        "Already have Account?",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white54),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(width: Utils.displayWidth(context) * 0.32),
                        const Text(
                          "Please",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white54),
                        ),
                        const SizedBox(width: 5),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          },
                          child: Text(
                            "Signin",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColor.base),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ]),
          ),
        )),
      ),
    ));
  }
}
