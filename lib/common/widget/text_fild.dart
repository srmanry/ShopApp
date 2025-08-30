import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final String? textFieldName;
  final String? hinText;
  final bool? obscureText;
  final Widget? priFixIcon;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final bool? obscureCharacter;
  final Color? focusColor;
  final Widget? outLineBorder;

  final Color? textFieldColor;

  const CustomTextfield({
    super.key,
    this.textFieldName,
    this.hinText,
    this.priFixIcon,
    this.suffixIcon,
    this.controller,
    this.textInputType,
    this.obscureCharacter,
    this.outLineBorder,
    this.focusColor,
    this.obscureText,
    this.textFieldColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(height: 45,
      decoration: BoxDecoration( borderRadius: BorderRadius.circular(10),color: textFieldColor,
          boxShadow: [ BoxShadow(color: Theme.of(context).hoverColor, blurRadius: 0,  spreadRadius: 1)]),
      child: TextFormField(
        // obscureText: obscureText,
        controller: controller, keyboardType: textInputType,
        decoration: InputDecoration(
            focusColor: Theme.of(context).hoverColor,
            // fillColor: Colors.green,
            //  focusColor: Colors.white,
            // hoverColor: Colors.white,
            hintText: hinText,hintStyle: const TextStyle(fontSize: 14),
            prefixIcon: priFixIcon,suffixIcon: suffixIcon,
            iconColor: Colors.black, border: InputBorder.none,
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),
              borderSide:  BorderSide( color:Theme.of(context).hoverColor,width: 0.0,), ),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide( color: Theme.of(context).hoverColor, ), )
        ),
      ),
    );
  }
}