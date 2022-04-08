// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:care_navigation/utils/app_libraries.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? labelText;
  final Color? fillcolor;
  final Color? bordercolor;
  final bool isTextHidden;
  final String? hintText;
  final IconData? buttonIcon;
  final IconData? prefixIcon;
  final bool? togglePassword;
  final int? maxLength;
  final Function()? toggleFunction;
  final IconData? toggleIcon;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final Function()? onTap;
  final Function()? prefixIconTap;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focus;
  final TextInputAction? textInputAction;
  final Widget? suffixicon;
  final changeObscureStatus;
  const CommonTextField(
      {Key? key,
      @required this.controller,
      this.validator,
      this.bordercolor,
      this.labelText,
      this.fillcolor,
      this.hintText,
      this.isTextHidden = false,
      this.buttonIcon,
      this.prefixIcon,
      this.onChanged,
      this.togglePassword = false,
      this.toggleFunction,
      this.toggleIcon,
      this.keyboardType = TextInputType.text,
      this.textInputAction = TextInputAction.done,
      this.maxLength,
      this.readOnly,
      this.onTap,
      this.inputFormatters,
      this.prefixIconTap,
      this.changeObscureStatus,
      this.focus,
      this.suffixicon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.left,
      textAlignVertical: TextAlignVertical.center,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      obscureText: isTextHidden,
      readOnly: readOnly == null ? false : true,
      onTap: onTap,
      maxLength: maxLength,
      focusNode: focus,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        //suffix:suffixicon,
        prefixIcon: prefixIcon != null
            ? GestureDetector(
                child: Icon(
                  prefixIcon,
                  color: Color(0xffACACAC),
                  size: 20.0,
                ),
                onTap: prefixIconTap,
              )
            : null,
        suffixIcon: suffixicon,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: bordercolor ?? Colors.transparent,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: bordercolor ?? Color(0xfff7fbff),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        hintText: hintText,
        fillColor: fillcolor,
        filled: true,
        hintStyle: const TextStyle(color: Colors.grey),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        labelText: labelText,

        labelStyle: const TextStyle(color: Colors.black, fontSize: 10.0),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xfff7fbff)),
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
      ),
      style: const TextStyle(color: Colors.black, fontSize: 15),
      controller: controller,
      validator: validator,
    );
  }
}

class CommonTextFormField1 extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final bool readOnly;
  final bool obsecure;
  final TextInputType? type;
  // ignore: prefer_typing_uninitialized_variables
  final validator;
  final Color? bordercolor;
  final Widget? preicon;
  final List<TextInputFormatter>? inputFormatter;

  // ignore: prefer_typing_uninitialized_variables
  final showSuffix;
  // ignore: prefer_typing_uninitialized_variables
  final changeObscureStatus;

  // ignore: use_key_in_widget_constructors
  CommonTextFormField1(this.controller, this.hintText, this.labelText,
      this.obsecure, this.type, this.preicon, this.validator,
      {this.showSuffix = false,
      this.bordercolor,
      this.changeObscureStatus,
      this.inputFormatter,
      this.readOnly = false});

  @override
  _CommonTextFormField1State createState() => _CommonTextFormField1State();
}

class _CommonTextFormField1State extends State<CommonTextFormField1> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      keyboardType: widget.type,
      obscureText: widget.obsecure,
      readOnly: widget.readOnly,
      inputFormatters: widget.inputFormatter,
      controller: widget.controller,
      decoration: InputDecoration(
        fillColor: const Color(0xffF8F7FB),
        filled: true,
        prefixIcon: widget.preicon,
        hintStyle: const TextStyle(
            color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w400),

        hintText: widget.hintText,
        labelText: widget.labelText,
        //hintStyle: const TextStyle(color: Color(0xFF797a7a)),
        labelStyle: const TextStyle(color: Color(0xffD2D2D2)),
        errorStyle: const TextStyle(color: Colors.red),
        suffixIcon: widget.showSuffix
            ? InkWell(
                onTap: widget.changeObscureStatus,
                child: Icon(
                    widget.obsecure ? Icons.visibility_off : Icons.visibility),
              )
            : const SizedBox(),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.symmetric(vertical: 20),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffD2D2D2),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffD2D2D2),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.red),
          gapPadding: 10,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.red),
          gapPadding: 10,
        ),
      ),
    );
  }
}

class CommonTextFormField2 extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final bool readOnly;
  final bool obsecure;
  final TextInputType type;
  final validator;
  final showSuffix;
  final changeObscureStatus;

  const CommonTextFormField2(this.controller, this.hintText, this.labelText,
      this.obsecure, this.type, this.validator,
      {this.showSuffix = false,
      this.changeObscureStatus,
      this.readOnly = false});

  @override
  _CommonTextFormField1State createState() => _CommonTextFormField1State();
}

// ignore: unused_element
class _CommonTextFormField2State extends State<CommonTextFormField1> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      keyboardType: widget.type,
      obscureText: widget.obsecure,
      readOnly: widget.readOnly,
      //cursorColor: fLabelTextColor,
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        hintStyle: const TextStyle(color: Color(0xFF797a7a)),
        labelStyle: const TextStyle(color: Color(0xff83b7b8)),
        errorStyle: TextStyle(color: Colors.red),
        suffixIcon: widget.showSuffix
            ? InkWell(
                onTap: widget.changeObscureStatus,
                child: Icon(
                    widget.obsecure ? Icons.visibility_off : Icons.visibility),
              )
            : SizedBox(),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Color(0xff83b7b8)),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Color(0xff83b7b8)),
          gapPadding: 10,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.red),
          gapPadding: 10,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.red),
          gapPadding: 10,
        ),
      ),
    );
  }
}
