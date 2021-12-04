import 'package:postbird/core/index.dart';

class MyButton extends StatefulWidget {
  final void Function()? onTap;
  final double? width, height, borderRadius;
  final Color? buttonColor;
  final String label;
  final Color? labelColor, loaderColor, borderColor;
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
    this.borderColor,
    this.hasShadow = false,
    this.hasBorder = false,
    this.isBusy = false,
    this.fontWeight = FontWeight.w600,
    this.borderRadius,
  }) : super(key: key);

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool isTappedDown = false;
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return RepaintBoundary(
      child: GestureDetector(
        onTap: widget.onTap,
        onTapDown: (tapDownDetails) {
          // if (widget.disabled) {
          //   return;
          // }

          setState(() {
            isTappedDown = true;
          });

          // if (widget.onTapDown != null) {
          //   widget.onTapDown!();
          // }
        },
        onTapUp: (tapUpDetails) {
          setState(() {
            isTappedDown = false;
          });

          // if (widget.onTapUp != null) {
          //   widget.onTapUp!();
          // }
        },
        onTapCancel: () {
          setState(() {
            isTappedDown = false;
          });

          // if (widget.onTapCancel != null) {
          //   widget.onTapCancel!();
          // }
        },
        child: Opacity(
          opacity: isTappedDown ? 0.6 : 1.0,
          child: Container(
            width: widget.width ?? screenWidth * 0.8,
            height: widget.height ?? screenHeight * 0.075,
            decoration: BoxDecoration(
              color: widget.buttonColor,
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 15),
              border: widget.hasBorder
                  ? Border.all(
                      color: widget.borderColor ?? Colors.grey[400]!,
                      width: 1,
                    )
                  : null,
              boxShadow: [
                if (widget.hasShadow)
                  BoxShadow(
                    color: AppColors.blackColor.withOpacity(0.2),
                    offset: Offset(0, 10),
                    blurRadius: 20,
                  )
              ],
            ),
            child: Center(
              child: Visibility(
                visible: !widget.isBusy,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (widget.icon != null)
                      Container(
                        padding: EdgeInsets.only(right: 5),
                        child: widget.icon,
                      ),
                    Text(
                      widget.label,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: widget.labelColor,
                        fontSize: 18,
                        fontWeight: widget.fontWeight,
                      ),
                    ),
                  ],
                ),
                replacement: CircularProgressIndicator(
                  color: widget.loaderColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
