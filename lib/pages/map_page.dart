import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../features/data/models/app_lat_long.dart';
import '../features/data/service/app_location_service.dart';
import '../generated/assets.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final mapControllerCompleter = Completer<YandexMapController>();

  List<MapObject> mapObjects = [];
  List<Point> collections = [
    Point(latitude: 37.7936200222476, longitude: -122.40509846794693),
    Point(latitude: 37.78896498714174, longitude: -122.41228291218164),
    Point(latitude: 37.77994133646248, longitude: -122.40968855275194),
    Point(latitude: 37.78344553414069, longitude: -122.39938189540584),
    Point(latitude: 37.777578865997775, longitude: -122.40669047153352),
    Point(latitude: 37.80449165151585, longitude: -121.79736856857409),
  ];

  bool zoomer = false;

  @override
  void initState() {
    super.initState();
    _initPermission().ignore();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  AppLatLong currentLocation = ToshkentLocation();

  void openNewSheet(BuildContext context) {
    showMaterialModalBottomSheet(
      context: context,
      shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    "A Port",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.4),
                  ),
                  subtitle: Text(
                    "Улица Мирзо Улугбекаб Ташкент",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff8E8E93)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xffF5F5F5),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                Assets.iconsSpeedometerIcon,
                                height: 18,
                                width: 18,
                              ),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: " 18.50",
                                    style: TextStyle(
                                        color: Color(0xff111111),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14)),
                                TextSpan(
                                    text: " КВт",
                                    style: TextStyle(
                                        color: Color(0xff111111),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11)),
                              ]))
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Скорость",
                            style: TextStyle(
                                color: Color(0xff101828),
                                fontWeight: FontWeight.w400,
                                fontSize: 11),
                          )
                        ],
                      ),
                      Divider(
                        thickness: 20,
                        height: 40,
                        indent: 0,
                        color: Colors.red,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                Assets.iconsBatteryIcon,
                                height: 18,
                                width: 18,
                              ),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: " 3107.00",
                                    style: TextStyle(
                                        color: Color(0xff111111),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14)),
                                TextSpan(
                                    text: " КВт",
                                    style: TextStyle(
                                        color: Color(0xff111111),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11)),
                              ]))
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Потраченные",
                            style: TextStyle(
                                color: Color(0xff101828),
                                fontWeight: FontWeight.w400,
                                fontSize: 11),
                          )
                        ],
                      ),
                      Divider(
                        thickness: 20,
                        height: 40,
                        indent: 0,
                        color: Colors.red,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                Assets.iconsDollarIcon,
                                height: 18,
                                width: 18,
                              ),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: " 6 524 700",
                                    style: TextStyle(
                                        color: Color(0xff111111),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14)),
                                TextSpan(
                                    text: " сум",
                                    style: TextStyle(
                                        color: Color(0xff111111),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11)),
                              ]))
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Стоимость",
                            style: TextStyle(
                                color: Color(0xff101828),
                                fontWeight: FontWeight.w400,
                                fontSize: 11),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Column(
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "10",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 16)),
                        TextSpan(
                            text: " мин время зарядки",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 14)),
                      ])),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 130,
                        height: 270,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Color(0xffF1F1F1)),
                        child: Stack(
                          children: [
                            Positioned(
                                bottom: 0,
                                child: Opacity(
                                  opacity: 0.5,
                                  child: SvgPicture.asset(
                                      Assets.imagesWaterFlowImage,
                                      fit: BoxFit.fill),
                                )),
                            Center(
                              child: Text(
                                "53%",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 40,
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: CupertinoButton(
                          child: Text(
                            "Прекратить зарядку",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w600),
                          ),
                          onPressed: () {},
                          color: Color(0xff9A22F9),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void openSheet(BuildContext context) {
    showMaterialModalBottomSheet(
      context: context,
      shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      builder: (context) => Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: Text(
                  "Станция 2",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.4),
                ),
                subtitle: Text(
                  "Улица Мирзо Улугбекаб Ташкент",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff8E8E93)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffF5F5F5),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        openNewSheet(context);
                      },
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "A Port",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                              ),
                              Chip(
                                label: Text(
                                  "Свободен",
                                  style: TextStyle(
                                      color: Color(0xff0073FF),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11),
                                ),
                                side: BorderSide(color: Color(0xffc8d9ed)),
                                shape: StadiumBorder(),
                                backgroundColor: Color(0xffc8d9ed),
                              ),
                            ],
                          ),
                          Container(
                            height: 1,
                            color: Color(0xffC7C7CC),
                            width: MediaQuery.of(context).size.width,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        openNewSheet(context);
                      },
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "A Port",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                              ),
                              Chip(
                                label: Text(
                                  "Свободен",
                                  style: TextStyle(
                                      color: Color(0xff0073FF),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11),
                                ),
                                side: BorderSide(color: Color(0xffc8d9ed)),
                                shape: StadiumBorder(),
                                backgroundColor: Color(0xffc8d9ed),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    addObjects(appLatLong: currentLocation);

    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          child: YandexMap(
            mapObjects: mapObjects,
            onMapTap: (point) {
              print(point.latitude);
              print(point.longitude);
            },
            onCameraPositionChanged: (cameraPosition, reason, finished) {
              if (cameraPosition.zoom < 13) {
                zoomer = true;
              } else {
                zoomer = false;
              }
              print(finished);
            },
            logoAlignment: MapAlignment(
                horizontal: HorizontalAlignment.left,
                vertical: VerticalAlignment.top),
            mapType: MapType.vector,
            onMapCreated: (controller) {
              mapControllerCompleter.complete(controller);
            },
          ),
        ),
        Positioned(
          right: 20,
          bottom: 120,
          child: IconButton(
              color: Color(0xff9A22F9),
              style: ButtonStyle(
                minimumSize: WidgetStatePropertyAll(Size(50, 50)),
                backgroundColor: WidgetStatePropertyAll(Color(0xff9A22F9)),
              ),
              onPressed: () {
                _moveToCurrentLocation(currentLocation);
              },
              icon: SvgPicture.asset(Assets.iconsFilterIcon)),
        )
      ],
    );
  }

  Future<void> _initPermission() async {
    if (!await LocationService().checkPermission()) {
      await LocationService().requestPermission();
    }
    await _fetchCurrentLocation();
  }

  Future<void> _moveToCurrentLocation(
    AppLatLong appLatLong,
  ) async {
    currentLocation = appLatLong;
    (await mapControllerCompleter.future).moveCamera(
      animation: const MapAnimation(type: MapAnimationType.linear, duration: 1),
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Point(
            latitude: appLatLong.lat,
            longitude: appLatLong.long,
          ),
          zoom: 14,
        ),
      ),
    );
  }

  Future<void> _moveToPickedLocation(
    AppLatLong appLatLong,
  ) async {
    currentLocation = appLatLong;
    (await mapControllerCompleter.future).moveCamera(
      animation: const MapAnimation(type: MapAnimationType.linear, duration: 1),
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Point(
            latitude: appLatLong.lat,
            longitude: appLatLong.long,
          ),
          zoom: 14,
        ),
      ),
    );
  }

  Future<void> _fetchCurrentLocation() async {
    AppLatLong location;
    const defLocation = ToshkentLocation();
    try {
      location = await LocationService().getCurrentLocation();
    } catch (_) {
      location = defLocation;
    }
    addObjects(appLatLong: location);
    _moveToCurrentLocation(location);
  }

  void addObjects({required AppLatLong appLatLong}) {
    final myLocationCircle = CircleMapObject(
      mapId: MapObjectId("currentLocationCircle"),
      circle: Circle(
          center: Point(latitude: appLatLong.lat, longitude: appLatLong.long),
          radius: 55),
      strokeWidth: 0,
      fillColor: Color(0xff9A22F9).withOpacity(0.2),
    );
    final myLocationCircle_2 = CircleMapObject(
      mapId: MapObjectId("currentLocationCircle_2"),
      circle: Circle(
          center: Point(latitude: appLatLong.lat, longitude: appLatLong.long),
          radius: 30),
      strokeWidth: 0,
      fillColor: Color(0xff9A22F9).withOpacity(0.4),
    );
    final myLocationMaker = PlacemarkMapObject(
        opacity: 1,
        mapId: MapObjectId("currentLocationMarker"),
        point: Point(latitude: appLatLong.lat, longitude: appLatLong.long),
        icon: PlacemarkIcon.single(PlacemarkIconStyle(
            scale: 3,
            image: BitmapDescriptor.fromAssetImage(
              Assets.iconsMarkerIcon,
            ),
            rotationType: RotationType.rotate)));

    final clusterizedCollections = ClusterizedPlacemarkCollection(
      mapId: MapObjectId("clusterizedMarks"),
      placemarks: List.generate(
        collections.length,
        (index) {
          return PlacemarkMapObject(
              mapId: MapObjectId("clusterizedCollection_$index"),
              point: collections[index],
              icon: PlacemarkIcon.single(PlacemarkIconStyle(
                  scale: 3,
                  image: BitmapDescriptor.fromAssetImage(
                    Assets.iconsStationIcon,
                  ))),
              opacity: 1);
        },
      ),
      radius: 100,
      minZoom: 9,
      isVisible: true,
      onTap: (mapObject, point) {
        if (zoomer == true) {
          _moveToPickedLocation(
              AppLatLong(lat: point.latitude, long: point.longitude));
        } else {
          openSheet(context);
        }
      },
    );

    mapObjects.addAll([
      myLocationMaker,
      myLocationCircle,
      myLocationCircle_2,
      clusterizedCollections
    ]);

    setState(() {});
  }
}
