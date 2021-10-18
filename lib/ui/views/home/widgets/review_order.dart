import 'package:postbird/core/index.dart';
import '../controllers/create_package_controller.dart';

class ReviewOrder extends StatelessWidget {
  ReviewOrder({Key? key}) : super(key: key);
  final controller = Get.find<CreatePackageController>();

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
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
              '2',
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
            FutureBuilder(
                // future: pricegetting(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Text(
                  'Calculating Price',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                );
              } else {
                return Column(
                  children: [
                    new Visibility(
                        visible: false,
                        child: TextFormField(
                            enabled: false,
                            keyboardType: TextInputType.phone,
                            // controller: rateConroller
                            //   ..text =
                            //       snapshot.data.toString(),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'You\'re getting' +
                                  '₦\' 00'.replaceAllMapped(
                                      new RegExp(
                                          r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                      (Match m) => "${m[1]},") +
                                  '.00' +
                                  ' to ',
                              hintStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey),
                            ),
                            style: TextStyle(color: Colors.red))),
                    Row(
                      children: [
                        Text('           '),
                        Text(
                          'Credits ' + snapshot.data,
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
                );
              }
            }),
            //  Text(
            //   '₦1042.23',
            //   textAlign: TextAlign.right,
            //   style: GoogleFonts.manrope(
            //       color: Color.fromRGBO(0, 0, 0, 1),
            //       fontSize: 24,
            //       letterSpacing: 0,
            //       fontWeight: FontWeight.w700,
            //       height: 1),
            // ),
          ],
        ),
        SizedBox(height: 30),
        MyButton(
          label: "Create Order",
        ),
      ],
    );
  }
}
