import 'package:postbird/core/index.dart';
import 'package:postbird/ui/shared/app_colors.dart';
import 'package:postbird/ui/views/home/controllers/create_package_controller.dart';

class PackageSize extends StatelessWidget {
  final String label, image;
  final IconData? icon;
  final int index;
  PackageSize({
    Key? key,
    required this.label,
    required this.image,
    required this.index,
    this.icon,
  }) : super(key: key);

  final controller = Get.find<CreatePackageController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.updatePackageSize(index),
        child: Container(
          height: 130,
          padding: const EdgeInsets.only(left: 8),
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: index == controller.packSizeIndex
                  ? AppColors.primaryColor
                  : AppColors.iconGrey,
            ),
            borderRadius: BorderRadius.circular(10),
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(image),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: icon != null,
                    child: Icon(
                      icon,
                      size: 12,
                      color: AppColors.mediumGrey.withOpacity(0.7),
                    ),
                  ),
                  Text(
                    label,
                    style: TextStyle(
                      color: AppColors.mediumGrey.withOpacity(0.7),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
