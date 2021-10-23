import 'package:postbird/core/index.dart';
import '../controllers/create_package_controller.dart';

class Recipient extends StatelessWidget {
  Recipient({Key? key}) : super(key: key);
  final controller = Get.find<CreatePackageController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: ListView(
        children: [
          SizedBox(height: 20),
          Text(
            'Recipient Name',
            textAlign: TextAlign.left,
            style: GoogleFonts.manrope(
              color: Color.fromRGBO(27, 27, 27, 1),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10),
          MyTextField(
            validator: controller.validateFullName,
            controller: controller.recipientName,
            keyboardType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
            hint: 'Full Name',
          ),
          SizedBox(height: 10),
          Text(
            'Address',
            textAlign: TextAlign.left,
            style: GoogleFonts.manrope(
              color: Color.fromRGBO(27, 27, 27, 1),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10),
          MyTextField(
            initialValue: controller.destination.formattedAddress,
            keyboardType: TextInputType.streetAddress,
            hint: 'Shipping Destination',
            readOnly: true,
          ),
          SizedBox(height: 30),
          Text(
            'Postal Zip',
            textAlign: TextAlign.left,
            style: GoogleFonts.manrope(
              color: Color.fromRGBO(27, 27, 27, 1),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10),
          MyTextField(
            controller: controller.postCode,
            keyboardType: TextInputType.number,
            hint: 'XXXXX',
          ),
          SizedBox(height: 30),
          Text(
            'Recipient Phone Number',
            textAlign: TextAlign.left,
            style: GoogleFonts.manrope(
              color: Color.fromRGBO(27, 27, 27, 1),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10),
          MyTextField(
            controller: controller.recipientPhone,
            validator: controller.validatePhoneNumber,
            keyboardType: TextInputType.phone,
            hint: '08012345678',
          ),
          SizedBox(height: 30),
          Text(
            'Aditional Notes',
            textAlign: TextAlign.left,
            style: GoogleFonts.manrope(
              color: Color.fromRGBO(27, 27, 27, 1),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10),
          MyTextField(
            controller: controller.notes,
            keyboardType: TextInputType.multiline,
            hint: 'Please Confirm',
            maxLength: 1200,
            maxLines: 7,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: MyButton(
              label: "Continue",
              onTap: () {
                if (!controller.formKey.currentState!.validate()) return;
                FocusScope.of(context).unfocus();
                controller.onPageChanged(2);
              },
            ),
          ),
        ],
      ),
    );
  }
}
