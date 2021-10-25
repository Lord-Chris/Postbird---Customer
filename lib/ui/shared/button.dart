import 'package:postbird/core/index.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final double? width, height;
  final Color? buttonColor;
  final String label;
  final Color? labelColor, loaderColor;
  final bool hasShadow, hasBorder, isBusy;
  const MyButton({
    Key? key,
    this.onTap,
    this.width,
    this.height,
    this.buttonColor = AppColors.primaryColor,
    required this.label,
    this.labelColor = AppColors.whiteColor,
    this.loaderColor = AppColors.whiteColor,
    this.hasShadow = false,
    this.hasBorder = false,
    this.isBusy = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? screenWidth * 0.94,
        height: height ?? screenHeight * 0.075,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(8),
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
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: labelColor,
                fontFamily: 'Manrope',
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
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
