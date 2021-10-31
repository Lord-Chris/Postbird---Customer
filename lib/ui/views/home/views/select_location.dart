import 'package:flutter/cupertino.dart';
import 'package:postbird/core/index.dart';

import '../controllers/select_location_controller.dart';
import '../widgets/location_picker.dart';
import '../widgets/courier_search.dart';

class SelectLocation extends StatelessWidget {
  final Package? package;
  SelectLocation({Key? key, this.package}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectLocationController>(
      init: SelectLocationController(package != null, package),
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
                        Get.back();
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 15.0,
                  right: 10.0,
                  child: Visibility(
                    visible: !controller.showCourierSearchBox,
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
                ),
                LocationPicker(),
                CourierSearch(show: package == null ? null : true),
              ],
            ),
          ),
        );
      },
    );
  }
}
