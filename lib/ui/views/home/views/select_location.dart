import 'package:flutter/cupertino.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';
import 'package:postbird/Screens/model/place_model.dart';
import 'package:postbird/core/index.dart';

import '../controllers/select_location_controller.dart';

class SelectLocation extends StatelessWidget {
  const SelectLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
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
                            _controller.setMapStyle(controller.mapStyle);
                            controller.mapController = _controller;
                            //  _controller = ;
                            // controller.markers.add(
                            //   Marker(
                            //       markerId: MarkerId("1"),
                            //       position: LatLng(6.465422, 3.406448),
                            //       // icon: _taxilocation,
                            //       onTap: () {}),
                            // );

                            // controller.markers.add(
                            //   Marker(
                            //       markerId: MarkerId("2"),
                            //       position: LatLng(6.30, 3.2145634),
                            //       // icon: _taxilocation,
                            //       onTap: () {}),
                            // );

                            // controller.markers.add(
                            //   Marker(
                            //       markerId: MarkerId("3"),
                            //       position: LatLng(6.35, 3.2139453),
                            //       // icon: _taxilocation,
                            //       onTap: () {}),
                            // );
                          },
                        ),
                ),
                Positioned(
                  bottom: 20,
                  left: 5,
                  right: 5,
                  child: Visibility(
                    visible: true,
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
                              controller.fromLocation.text =
                                  suggestion.description;

                              await controller.selectSuggestion(
                                  true, suggestion);
                            },
                          ),
                          TypeAheadField(
                            direction: AxisDirection.up,
                            debounceDuration: Duration(milliseconds: 500),
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
                              controller.toLocation.text =
                                  suggestion.description;

                              await controller.selectSuggestion(
                                  false, suggestion);
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.end,
                          //   children: <Widget>[
                          //     MaterialButton(
                          //       onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => SelectDate(name: name)));
                          // },
                          // var senter = _fromLocationController.text;
                          // var denter = _toLocationController.text;
                          // var frmlat = _fromPlaceDetail?.lat;
                          // var frmlng = _fromPlaceDetail?.lng;
                          // var tolat = _toPlaceDetail?.lat;
                          // var tolng = _toPlaceDetail?.lng;
                          // print(senter);
                          // print(_fromPlaceDetail?.lat);
                          // print(_fromPlaceDetail?.lng);
                          // print(_toPlaceDetail?.lat);
                          // print(_toPlaceDetail?.lng);
                          // Navigator.of(context)
                          //     .push(new MaterialPageRoute(builder: (context) {
                          //   return SelectDate(
                          //     name: name,
                          //     fromPlaceDetail: _fromPlaceDetail,
                          //     toPlaceDetail: _toPlaceDetail,
                          //     polylines: _polylines,
                          //     polylineCoordinates: polylineCoordinates,
                          //     stname: senter,
                          //     dtname: denter,
                          //     frmlt: frmlat,
                          //     frmlg: frmlng,
                          //     tolt: tolat,
                          //     tolg: tolng,
                          //   );
                          // }));
                          //       },
                          //       color: Colors.orange,
                          //       textColor: Colors.white,
                          //       child: Icon(
                          //         Icons.arrow_forward,
                          //         size: 15,
                          //       ),
                          //       padding: EdgeInsets.all(6),
                          //       shape: CircleBorder(),
                          //     )
                          //   ],
                          // )
                        ],
                      ),
                    ),
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
              ],
            ),
          ),
        );
      },
    );
  }
}

class MapDatePicker extends StatelessWidget {
  MapDatePicker({
    Key? key,
  }) : super(key: key);

  final controller = Get.find<SelectLocationController>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.5,
      width: width * 0.8,
      color: AppColors.whiteColor,
      child: Column(
        children: [
          Flexible(
            child: CupertinoDatePicker(
              onDateTimeChanged: (val) {
                controller.date = val;
                controller.dateController.text =
                    DateFormat('EEE, dd MMM yyyy').format(val);
              },
              backgroundColor: AppColors.whiteColor,
              initialDateTime: DateTime.now(),
              mode: CupertinoDatePickerMode.date,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyButton(
              label: 'Continue',
              onTap: () {
                controller.date = controller.date ?? DateTime.now();
                controller.dateController.text =
                    DateFormat('EEE, dd MMM yyyy').format(controller.date!);
                Get.back();
              },
            ),
          )
        ],
      ),
    );
  }
}
