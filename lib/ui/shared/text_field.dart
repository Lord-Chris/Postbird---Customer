import 'package:postbird/core/index.dart';

// ignore: must_be_immutable
class MyTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? initialValue;
  bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final Widget? suffix;
  final Widget? prefix;
  final bool readOnly;
  final bool expands;
  final int? maxLines, maxLength;

  MyTextField(
      {Key? key,
      this.label,
      this.hint,
      this.controller,
      this.validator,
      this.keyboardType,
      this.textCapitalization = TextCapitalization.none,
      this.suffix,
      this.obscureText = false,
      this.prefix,
      this.initialValue,
      this.readOnly = false,
      this.expands = false, this.maxLines, this.maxLength,})
      : assert(initialValue == null || controller == null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      validator: validator,
      keyboardType: keyboardType,
      cursorColor: AppColors.primaryColor,
      textCapitalization: textCapitalization,
      obscureText: obscureText,
      readOnly: readOnly,
      expands: expands,
      maxLines: null,
      minLines: maxLines,
      maxLength: maxLength,
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        suffixIcon: suffix,
        prefixIcon: prefix,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.iconGrey.withOpacity(0.5),
          ),
        ),
        labelStyle: TextStyle(
          fontFamily: 'manrope',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.blackColor,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MyDropDownField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? Function(String?)? validator;
  final Widget? suffix;
  final Widget? prefix;

  MyDropDownField({
    Key? key,
    this.label,
    this.hint,
    this.validator,
    this.suffix,
    this.prefix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: <DropdownMenuItem<String>>[],
      // onTap: ,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        suffixIcon: suffix,
        prefixIcon: prefix,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.iconGrey.withOpacity(0.5),
          ),
        ),
        labelStyle: TextStyle(
          fontFamily: 'manrope',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.blackColor,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
