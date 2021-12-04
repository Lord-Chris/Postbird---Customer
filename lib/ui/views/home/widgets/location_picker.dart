import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:postbird/core/index.dart';
import '../controllers/select_location_controller.dart';
import 'date_picker.dart';

class LocationPicker extends StatelessWidget {
  final controller = Get.find<SelectLocationController>();
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final height = MediaQuery.of(context).size.height;
        return Positioned(
          bottom: 20,
          left: 5,
          right: 5,
          child: Visibility(
            visible: controller.showLocationPicker,
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 5,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: <Widget>[
                    Theme(
                      data: ThemeData(
                          accentColor: AppColors.primaryColor,
                          brightness: Brightness.light,
                          primaryColor: AppColors.primaryColor),
                      child: TextFormField(
                        controller: controller.dateController,
                        style: TextStyle(fontSize: 12),
                        cursorColor: AppColors.primaryColor,
                        readOnly: true,
                        validator: controller.validateNotEmpty,
                        onTap: () async {
                          await Get.bottomSheet(MapDatePicker());
                        },
                        decoration: InputDecoration(
                          labelText: "Select Date",
                          icon: Image.asset(
                            'assets/clock.png',
                            height: height * 0.035,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.close,
                              color: Colors.grey,
                              size: 15,
                            ),
                            onPressed: () {
                              controller.fromLocation.clear();
                            },
                          ),
                        ),
                      ),
                    ),
                    TypeAheadField(
                      direction: AxisDirection.up,
                      debounceDuration: Duration(milliseconds: 500),
                      loadingBuilder: (context) => Center(
                        child: CircularProgressIndicator(
                            color: AppColors.primaryColor),
                      ),
                      textFieldConfiguration: TextFieldConfiguration(
                        controller: controller.fromLocation,
                        style: TextStyle(fontSize: 12),
                        decoration: InputDecoration(
                          labelText: "Pickup Location",
                          icon: Image.asset(
                            'assets/Path.png',
                            height: height * 0.035,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.close,
                              color: Colors.grey,
                              size: 15,
                            ),
                            onPressed: () {
                              controller.fromLocation.clear();
                            },
                          ),
                        ),
                      ),
                      suggestionsCallback: (pattern) async {
                        return await controller.fetchSuggestions(pattern);
                      },
                      itemBuilder: (context, Place suggestion) {
                        return ListTile(
                          title: Text(
                            suggestion.description,
                            style: TextStyle(fontSize: 12),
                          ),
                        );
                      },
                      onSuggestionSelected: (Place suggestion) async {
                        controller.fromLocation.text = suggestion.description;

                        await controller.selectSuggestion(true, suggestion);
                      },
                    ),
                    TypeAheadField(
                      direction: AxisDirection.up,
                      debounceDuration: Duration(milliseconds: 500),
                      loadingBuilder: (context) => Center(
                        child: CircularProgressIndicator(
                            color: AppColors.primaryColor),
                      ),
                      textFieldConfiguration: TextFieldConfiguration(
                        controller: controller.toLocation,
                        autofocus: false,
                        style: TextStyle(fontSize: 12),
                        decoration: InputDecoration(
                          labelText: "Destination To",
                          icon: Image.asset(
                            'assets/roundgreen.png',
                            height: height * 0.035,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.close,
                              color: Colors.grey,
                              size: 15,
                            ),
                            onPressed: () {
                              controller.toLocation.clear();
                            },
                          ),
                        ),
                      ),
                      suggestionsCallback: (pattern) async {
                        return await controller.fetchSuggestions(pattern);
                      },
                      itemBuilder: (context, Place suggetion) {
                        return ListTile(
                          title: Text(
                            suggetion.description,
                            style: TextStyle(fontSize: 12),
                          ),
                        );
                      },
                      onSuggestionSelected: (Place suggestion) async {
                        controller.toLocation.text = suggestion.description;

                        await controller.selectSuggestion(false, suggestion);
                      },
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
