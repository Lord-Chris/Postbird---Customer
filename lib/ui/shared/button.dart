import 'package:postbird/core/index.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final double? width, height;
  final Color? buttonColor;
  final String label;
  final Color? labelColor, loaderColor;
  final bool hasShadow, hasBorder, isBusy;
  final FontWeight fontWeight;
  final Widget? icon;
  const MyButton({
    Key? key,
    this.onTap,
    this.width,
    this.height,
    this.icon,
    this.buttonColor = AppColors.primaryColor,
    required this.label,
    this.labelColor = AppColors.whiteColor,
    this.loaderColor = AppColors.whiteColor,
    this.hasShadow = false,
    this.hasBorder = false,
    this.isBusy = false,
    this.fontWeight = FontWeight.w600,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? screenWidth * 0.8,
        height: height ?? screenHeight * 0.075,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(15),
          border: hasBorder
              ? Border.all(
                  color: Colors.grey[400]!,
                  width: 1,
                )
              : null,
          boxShadow: [
            if (hasShadow)
              BoxShadow(
                color: AppColors.blackColor.withOpacity(0.2),
                offset: Offset(0, 10),
                blurRadius: 20,
              )
          ],
        ),
        child: Center(
          child: Visibility(
            visible: !isBusy,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(child: icon),
                const SizedBox(width: 5),
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: labelColor,
                    fontFamily: 'Manrope',
                    fontSize: 18,
                    fontWeight: fontWeight,
                  ),
                ),
              ],
            ),
            replacement: CircularProgressIndicator(
              color: loaderColor,
            ),
          ),
        ),
      ),
    );
  }
}
