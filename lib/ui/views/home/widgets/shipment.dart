import 'package:postbird/core/index.dart';
import '../controllers/create_package_controller.dart';
import 'package_size.dart';

class Shipment extends StatelessWidget {
  Shipment({Key? key}) : super(key: key);

  final controller = Get.find<CreatePackageController>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 20),
        Text(
          'Sender Name',
          textAlign: TextAlign.left,
          style: GoogleFonts.manrope(
            color: Color.fromRGBO(27, 27, 27, 1),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        MyTextField(
          initialValue: controller.user.fullName,
          keyboardType: TextInputType.name,
          hint: 'Name',
          readOnly: true,
        ),
        SizedBox(height: 30),
        Text(
          'Pick up address',
          textAlign: TextAlign.left,
          style: GoogleFonts.manrope(
            color: Color.fromRGBO(27, 27, 27, 1),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        MyTextField(
          initialValue: controller.origin.address,
          keyboardType: TextInputType.text,
          hint: 'Shipping Destination',
          readOnly: true,
        ),
        SizedBox(height: 30),
        Text(
          'Shipper Phone Number',
          textAlign: TextAlign.left,
          style: GoogleFonts.manrope(
            color: Color.fromRGBO(27, 27, 27, 1),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        MyTextField(
          keyboardType: TextInputType.phone,
          initialValue: controller.user.phone,
          readOnly: true,
        ),
        SizedBox(height: 30),
        Text(
          'Item Type',
          textAlign: TextAlign.left,
          style: GoogleFonts.manrope(
            color: Color.fromRGBO(27, 27, 27, 1),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        MyDropDownField(
          items: ['Document', 'Others'],
          hint: 'Select Item Type',
          initialValue: controller.itemType,
          onChanged: (val) {
            controller.itemType = val;
          },
          validator: (val) => val == null ? 'Select an item type' : null,
          prefix: Icon(
            Icons.insert_drive_file_outlined,
            color: AppColors.primaryColor,
          ),
        ),
        SizedBox(height: 30),
        Text(
          'Package Size',
          textAlign: TextAlign.left,
          style: GoogleFonts.manrope(
            color: Color.fromRGBO(27, 27, 27, 1),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            PackageSize(
              label: '1kg',
              image: 'assets/envelope.png',
              index: 0,
              icon: Icons.arrow_back_ios_sharp,
            ),
            SizedBox(width: 10),
            PackageSize(
              label: '3kg - 10kg',
              image: 'assets/transistbox.png',
              index: 1,
            ),
            SizedBox(width: 10),
            PackageSize(
              label: '10kg',
              image: 'assets/cargo.png',
              index: 2,
              icon: Icons.arrow_forward_ios_sharp,
            ),
          ],
        ),
        SizedBox(height: 30),
        Text(
          'Package Name',
          textAlign: TextAlign.left,
          style: GoogleFonts.manrope(
            color: Color.fromRGBO(27, 27, 27, 1),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 10),
        MyTextField(
          keyboardType: TextInputType.name,
          textCapitalization: TextCapitalization.words,
          hint: 'Package Name',
          controller: controller.packageName,
          validator: controller.validateNotEmpty,
        ),
        SizedBox(height: 30),
        Text(
          'Package Details',
          textAlign: TextAlign.left,
          style: GoogleFonts.manrope(
            color: Color.fromRGBO(27, 27, 27, 1),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 10),
        MyTextField(
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.sentences,
          hint: 'Package Details',
          controller: controller.packageDetails,
          validator: controller.validateNotEmpty,
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Fragile',
              textAlign: TextAlign.left,
              style: GoogleFonts.manrope(
                color: Colors.grey[700],
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            Checkbox(
              activeColor: AppColors.primaryColor,
              checkColor: Colors.white,
              value: controller.checkBoxValue,
              onChanged: (val) => controller.togglerCheckValue(val),
            ),
          ],
        ),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: MyButton(
            label: 'Continue',
            // width: 343,
            // height: 48,
            onTap: () {
              if (!controller.formKey.currentState!.validate()) return;
              if (controller.packSizeIndex == null)
                return MySnackBar.failure('Select a Package Size');
              FocusScope.of(context).unfocus();
              controller.onPageChanged(1);
            },
          ),
        ),
      ],
    );
  }
}
