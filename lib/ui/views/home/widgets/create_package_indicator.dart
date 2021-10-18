import 'package:postbird/core/index.dart';
import 'package:postbird/ui/shared/app_colors.dart';

class CreatePackageIndicator extends StatelessWidget {
  final String label;
  final int index, currentIndex;

  CreatePackageIndicator({
    Key? key,
    required this.label,
    required this.index,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: 15,
            backgroundColor: AppColors.iconGrey.withOpacity(0.7),
            child: CircleAvatar(
              radius: 10,
              backgroundColor: index <= currentIndex
                  ? AppColors.primaryColor
                  : AppColors.whiteColor,
            ),
          ),
          SizedBox(height: 5),
          Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.manrope(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
