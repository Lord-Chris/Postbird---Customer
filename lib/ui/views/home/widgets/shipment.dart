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
          initialValue: controller.origin.formattedAddress,
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
        // SizedBox(height: 30),
        // Text(
        //   'Item Type',
        //   textAlign: TextAlign.left,
        //   style: GoogleFonts.manrope(
        //     color: Color.fromRGBO(27, 27, 27, 1),
        //     fontSize: 16,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        // SizedBox(height: 10),
        // Container(
        //   decoration: BoxDecoration(
        //     border: Border.all(
        //       color: Color(
        //         0xFFDEDEDE,
        //       ),
        //     ),
        //     borderRadius: BorderRadius.circular(8),
        //   ),
        //   height: 60,
        //   child: ListTile(
        //     leading: Icon(
        //       Icons.insert_drive_file_outlined,
        //       color: Colors.orangeAccent,
        //     ),
        //     // trailing: Icon(
        //     //   Icons.arrow_drop_down,
        //     // ),
        //     title: Container(
        //       child: SizedBox(
        //         width: 100.0,
        //         child: DropdownButtonFormField<String>(
        //           items: [],
        //           decoration: InputDecoration(
        //               enabledBorder: UnderlineInputBorder(
        //                   borderSide: BorderSide(
        //                       color: Colors.white))),
        //           // value: _btn1SelectedVal,
        //           onChanged: (newValue) {
        //             // setState(() {
        //             //   _btn1SelectedVal = newValue.toString();
        //             //   if (newValue == 'Select Item Type') {
        //             //     setState(() {
        //             //       var sortcode = '0';
        //             //       sorttcode = sortcode;
        //             //       print(sortcode);
        //             //     });
        //             //   } else if (newValue == 'Document') {
        //             //     setState(() {
        //             //       var sortcode = '3';
        //             //       sorttcode = sortcode;
        //             //       print(sortcode);
        //             //     });
        //             //   } else if (newValue == 'Others') {
        //             //     setState(() {
        //             //       var sortcode = '2';
        //             //       sorttcode = sortcode;
        //             //       print(sortcode);
        //             //     });
        //             //   }
        //             // });
        //           },
        //           // items: this._dropDownMenuItems,
        //         ),
        //         //  DropdownButtonFormField<int>(
        //         //   decoration: InputDecoration(
        //         //       border: UnderlineInputBorder(
        //         //           borderSide:
        //         //               BorderSide(color: Colors.white))),
        //         //   value: 2,
        //         //   items: <DropdownMenuItem<int>>[
        //         //     DropdownMenuItem<int>(
        //         //       value: 1,
        //         //       child: Text("Owner"),
        //         //     ),
        //         //     DropdownMenuItem<int>(
        //         //       value: 2,
        //         //       child: Text("Member"),
        //         //     ),
        //         //   ],
        //         // ),
        //       ),
        //     ),
        //   ),
        // ),
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
          'Package Details',
          textAlign: TextAlign.left,
          style: GoogleFonts.manrope(
            color: Color.fromRGBO(27, 27, 27, 1),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10),
        MyTextField(
          keyboardType: TextInputType.name,
          hint: 'Notes',
          controller: controller.notes,
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
                fontWeight: FontWeight.w500,
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
            width: 343,
            height: 48,
            onTap: () {
              if (controller.currentIndex == null)
                return MySnackBar.failure('Select a Package Size');
              controller.onPageChanged(1);
            },
          ),
        ),
      ],
    );
  }
}
