import 'package:flutter/cupertino.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:postbird/models/place_model.dart';
import 'package:postbird/core/index.dart';

import '../controllers/select_location_controller.dart';
import '../widgets/date_picker.dart';

class SelectLocation extends StatelessWidget {
  const SelectLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;
    return GetBuilder<SelectLocationController>(
      init: SelectLocationController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height, //- 230.0,
                  child: controller.myLocation == null
                      ? Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        )
                      : GoogleMap(
                          key: controller.mapKey,
                          mapType: MapType.normal,
                          zoomGesturesEnabled: true,
                          // myLocationEnabled: true,
                          markers: controller.markers,
                          polylines: controller.polylines,
                          initialCameraPosition: CameraPosition(
                              target: controller.myLocation!, zoom: 15),
                          onMapCreated: (GoogleMapController _controller) {
                            // _controller.setMapStyle(controller.mapStyle);
                            controller.mapController = _controller;
                          },
                        ),
                ),
                Positioned(
                  top: 15.0,
                  left: 10.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: AppColors.primaryColor,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 15.0,
                  right: 10.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextButton(
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 20,
                        ),
                      ),
                      onPressed: () => controller.onNextTap(),
                    ),
                  ),
                ),
                _buildLocationPicker(),
                _buildCourierSearch(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLocationPicker() {
    final controller = Get.find<SelectLocationController>();
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
              child: Column(
                children: <Widget>[
                  Theme(
                    data: ThemeData(
                        accentColor: AppColors.primaryColor,
                        brightness: Brightness.light,
                        primaryColor: AppColors.primaryColor),
                    child: TextField(
                      controller: controller.dateController,
                      style: TextStyle(fontSize: 12),
                      cursorColor: AppColors.primaryColor,
                      readOnly: true,
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
        );
      },
    );
  }

  Widget _buildCourierSearch() {
    final controller = Get.find<SelectLocationController>();
    return Builder(
      builder: (context) {
        final height = MediaQuery.of(context).size.height;
        final width = MediaQuery.of(context).size.width;
        return Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Visibility(
            visible: controller.showCourierSearchBox,
            child: Container(
              height: height * 0.4,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Wait, while we find a courier for you',
                          style: TextStyle(
                            color: AppColors.whiteColor,
                          ),
                        ),
                        Text(
                          "${controller.searchCount}s",
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      child: Column(
                        children: [
                          Spacer(),
                          Container(
                            width: 102.00020599365234,
                            height: 91.00017547607422,
                            child: Image(
                              image: AssetImage(controller.findingCourier
                                  ? 'assets/anim.gif'
                                  : 'assets/anim.png'),
                            ),
                          ),
                          Text(
                            'Finding Courier',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color:
                                  Color.fromRGBO(0, 0, 0, 0.8999999761581421),
                              fontFamily: 'Manrope',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: height * 0.009),
                          Text(
                            'A  Courier will pick up your package soon.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color:
                                  Color.fromRGBO(0, 0, 0, 0.6000000238418579),
                              fontFamily: 'Manrope',
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const Spacer(),
                          MyButton(
                            label: controller.findingCourier
                                ? "Cancel"
                                : "Try Again",
                            labelColor: AppColors.blackColor,
                            buttonColor: AppColors.whiteColor,
                            hasBorder: true,
                            width: width * 0.7,
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
