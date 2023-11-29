import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indana_app/presentacion/widgets/custom_bottom_navigatorbar.dart';

class HomeMapsScreen extends StatefulWidget {
  static const name = 'home';
  const HomeMapsScreen({Key? key}) : super(key: key);

  @override
  State<HomeMapsScreen> createState() => _HomeMapsScreenState();
}

class _HomeMapsScreenState extends State<HomeMapsScreen> {
  Set<Marker> markers = Set();
  late GoogleMapController mapController;
  late TextEditingController searchController;
  bool showPlacesAutoComplete = false;

  @override
  void initState() {
    super.initState();
    _addMarker();
    searchController = TextEditingController();
  }

  void _addMarker() {
    final MarkerId markerId = MarkerId('Indana');
    Marker marker = Marker(
      markerId: markerId,
      position: LatLng(-17.791129, -63.204914),
      infoWindow: InfoWindow(title: 'Indana'),
      icon: BitmapDescriptor.defaultMarker,
    );
    setState(() {
      markers.add(marker);
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
            },
            initialCameraPosition: CameraPosition(
              target: LatLng(-17.791129, -63.204914),
              zoom: 15.0,
            ),
            markers: markers,
          ),
          // Imagen desde assets que cubre toda la pantalla
          Image.asset(
            'assets/1.jpg', // Ruta de tu imagen en assets
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Positioned(
            top: 40.0,
            left: 16.0,
            right: 16.0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(Icons.search),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Buscar lugares',
                        border: InputBorder.none,
                      ),
                      onTap: () {
                        // Abre la pantalla de búsqueda al tocar el TextField
                        // Aquí puedes navegar a una nueva pantalla para la búsqueda
                      },
                      readOnly: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigator(),
    );
  }
}
