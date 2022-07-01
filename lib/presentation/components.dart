import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget defaultFormField(
    {required TextEditingController controller,
     required String label,
    Function? onChange,
    Function? onSubmit,
    IconButton? suffixIcon,
    Widget? prefixIcon,
    bool obscureText = false,
    Function? validate}) {
  return TextFormField(
    controller: controller,
    obscureText: obscureText,
    decoration: InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.never,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: BorderSide(
          color: Colors.teal,
        ),
      ),
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      label: Text(label),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
    ),
    onChanged: (text) {
      onChange!();
    },
    validator: (v) {
      return validate!(v);
    },
    onFieldSubmitted: (s) {
      onSubmit!();
    },
  );
}

Widget specialButton({Function? onPress, String? text, double height = 50}) {
  return SizedBox(
    width: double.infinity,
    height: height,
    child: ElevatedButton(
        onPressed: () {
          onPress!();
        },
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.resolveWith((states) => Colors.blue),
        ),
        child: Text(text!)),
  );
}

Future<bool?> showToast({
  String? msg,
  Color? backColor,
  Color? txtColor,
}) {
  return Fluttertoast.showToast(
      msg: msg!,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 2,
      backgroundColor: backColor,
      textColor: txtColor,
      fontSize: 16.0);
}

PreferredSizeWidget buildAppBar(
    {required Widget appBarTitleWidget,
    Widget? leading,
    List<Widget>? actions}) {
  return AppBar(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    elevation: 0,
    actions: actions,
    leading: leading,
    title: appBarTitleWidget,
  );
}

Widget buildTextButton({required Function onPress, required Widget child}) {
  return TextButton(
      onPressed: () {
        onPress();
      },
      child: child);
}

Future navigateTo(
    {required BuildContext context, required Widget navigatedScreen}) {
  return Navigator.push(context, MaterialPageRoute(builder: (context) {
    return navigatedScreen;
  }));
}

Future navigateAndFinish(
    {required BuildContext context, required Widget navigatedScreen}) {
  return Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) {
    return navigatedScreen;
  }), (route) => false);
}
