import 'package:postbird/core/index.dart';
import '../controllers/create_package_controller.dart';

class ReviewOrder extends StatelessWidget {
  ReviewOrder({Key? key}) : super(key: key);
  final controller = Get.find<CreatePackageController>();

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    // var screenHeight = MediaQuery.of(context).size.height;
    return ListView(
      children: [
        SizedBox(height: 30),
        Text(
          'Shipper',
          textAlign: TextAlign.left,
          style: GoogleFonts.manrope(
            color: Color.fromRGBO(0, 0, 0, 1),
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: screenWidth,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.iconGrey,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Image(
                image: AssetImage(
                  'assets/Path.png',
                ),
                width: 30,
                height: 20,
              ),
              SizedBox(width: 13),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          controller.user.fullName,
                          textAlign: TextAlign.left,
                          style: GoogleFonts.manrope(
                            color: AppColors.blackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          '  |  ',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.manrope(
                            color: AppColors.blackColor.withOpacity(0.4),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          '+234 ' + controller.user.phone.substring(1),
                          textAlign: TextAlign.left,
                          style: GoogleFonts.manrope(
                            color: AppColors.blackColor.withOpacity(0.6),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      controller.origin.formattedAddress,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.manrope(
                        color: AppColors.mediumGrey,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Recipient',
          textAlign: TextAlign.left,
          style: GoogleFonts.manrope(
            color: Color.fromRGBO(0, 0, 0, 1),
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: screenWidth,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.iconGrey,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Image(
                image: AssetImage('assets/ReceipentMarker.png'),
                width: 30,
                height: 30,
              ),
              SizedBox(width: 13),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          controller.recipientName.text,
                          textAlign: TextAlign.left,
                          style: GoogleFonts.manrope(
                            color: AppColors.blackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          '  |  ',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.manrope(
                            color: AppColors.blackColor.withOpacity(0.4),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          '+234 ' + controller.recipientPhone.text,
                          textAlign: TextAlign.left,
                          style: GoogleFonts.manrope(
                            color: AppColors.blackColor.withOpacity(0.6),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      controller.destination.formattedAddress,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.manrope(
                        color: AppColors.mediumGrey,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 30),
        Text(
          'Package Information',
          textAlign: TextAlign.left,
          style: GoogleFonts.manrope(
            color: Color.fromRGBO(0, 0, 0, 1),
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(10.0),
          width: screenWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.iconGrey,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Image(
                image: AssetImage('assets/box.png'),
                width: 30,
                height: 30,
              ),
              SizedBox(width: 13),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Customer Message',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.manrope(
                        color: AppColors.blackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      controller.notes.text,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.manrope(
                        color: AppColors.mediumGrey,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 30),
        Divider(
          color: AppColors.iconGrey,
          thickness: 1,
        ),
        SizedBox(height: 20),
        Visibility(
          visible: controller.isBusy && controller.price == null,
          child: Column(
            children: [
              CircularProgressIndicator(color: AppColors.primaryColor),
              SizedBox(height: 10),
              Text(
                'Calculating Price',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          replacement: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Delivery',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.manrope(
                      color: Color.fromRGBO(70, 70, 70, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    ' ',
                    textAlign: TextAlign.right,
                    style: GoogleFonts.manrope(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Shipping Assurance',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.manrope(
                      color: Color.fromRGBO(70, 70, 70, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    '0',
                    textAlign: TextAlign.right,
                    style: GoogleFonts.manrope(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.manrope(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '${controller.price}' + ' Credits',
                    textAlign: TextAlign.right,
                    style: GoogleFonts.manrope(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MyButton(
            label: "Create Order",
            isBusy: controller.isBusy,
            onTap: () => controller.createOrder(),
          ),
        ),
      ],
    );
  }
}
