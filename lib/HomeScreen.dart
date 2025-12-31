import 'dart:ui';
import 'package:flutter/material.dart';
import 'SearchScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1B33),
      body: Stack(
        children: [

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF2E335A), Color(0xFF1C1B33)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),


          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.search, color: Colors.white),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (v) => SearchScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  // Weather Info

                  Text(
                    "Multan",
                    style: TextStyle(color: Colors.white, fontSize: 28),
                  ),
                  Text(
                    "19°",
                    style: TextStyle(color: Colors.white, fontSize: 72),
                  ),
                  Text("Mostly Clear", style: TextStyle(color: Colors.white70)),
                  Text(
                    "H:24°   L:18°",
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),

          // Bottom Sheet
          DraggableScrollableSheet(
            minChildSize: 0.38,
            initialChildSize: 0.38,
            maxChildSize: 0.88,
            builder: (context, scrollController) {
              return ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.12),
                      borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                    ),
                    child: DefaultTabController(
                      length: 2,
                      child: ListView(
                        controller: scrollController,
                        padding: EdgeInsets.all(20),
                        children: [
                          Center(
                            child: Container(
                              width: 40,
                              height: 5,
                              decoration: BoxDecoration(
                                color: Colors.white38,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(height: 16),

                          // Tabs
                          TabBar(
                            indicatorColor: Colors.white,
                            labelColor: Colors.white,
                            unselectedLabelColor: Colors.white60,
                            tabs: [
                              Tab(text: "Hourly Forecast"),
                              Tab(text: "Weekly Forecast"),
                            ],
                          ),
                          SizedBox(height: 16),

                          // Tab Views
                          Container(
                            height: 180,
                            child: TabBarView(
                              children: [
                                ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 8,
                                  itemBuilder: (_, i) => hourCard(),
                                ),
                                Column(
                                  children: [
                                    weekRow("Mon"),
                                    weekRow("Tue"),
                                    weekRow("Wed"),
                                    weekRow("Thu"),
                                    weekRow("Fri"),
                                    weekRow("Sat"),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 24),
                          AirQualityCard(),
                          // Info Cards Grid
                          GridView.count(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            children: [
                              InfoCard(icon:Icons.sunny,title: "UV INDEX", value: "4", subtitle: "Moderate"),
                              InfoCard(icon:Icons.sunny_snowing,title: "SUNRISE", value: "5:28 AM", subtitle: "Sunset 7:25 PM"),
                              InfoCard(icon:Icons.air,title: "WIND", value: "9.7 km/h", subtitle: "North"),
                              InfoCard(icon:Icons.water_drop,title: "RAIN", value: "1.8 mm", subtitle: "Last hour"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        color: Colors.transparent,
        elevation: 0,
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF2E335A), Color(0xFF1C1B33)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            boxShadow: [
              BoxShadow(color: Colors.black26, blurRadius: 10),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.location_on, color: Colors.white),
                onPressed: () {},
              ),
              SizedBox(width: 50), // space for FAB
              IconButton(
                icon: Icon(Icons.menu, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: Colors.white,

        child: Icon(Icons.add, color: Color(0xFF2E335A)),
        onPressed: () {},
      ),
    );
  }
}


Widget hourCard() {
  return Container(
    width: 75,
    margin: EdgeInsets.only(right: 12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: LinearGradient(
        colors: [Color(0xFF2E335A), Color(0xFF1C1B33)],
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("12 PM", style: TextStyle(color: Colors.white)),
        SizedBox(height: 6),
        Icon(Icons.cloud, color: Colors.white),
        SizedBox(height: 6),
        Text("19°", style: TextStyle(color: Colors.white)),
      ],
    ),
  );
}


Widget weekRow(String s) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 6),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(s, style: TextStyle(color: Colors.white)),
        Icon(Icons.cloud, color: Colors.white),
        Text("23° / 18°", style: TextStyle(color: Colors.white)),
      ],
    ),
  );
}


class InfoCard extends StatelessWidget {
  final String title, value, subtitle;
  final IconData icon;

  const InfoCard({
    super.key,
    required this.title,
    required this.value,
    required this.subtitle, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [Color(0xFF2E335A), Color(0xFF1C1B33)],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon,color: Colors.white60,),
              Text(title, style: TextStyle(color: Colors.white70)),
            ],
          ),

          Spacer(),
          Text(value, style: TextStyle(color: Colors.white, fontSize: 22)),
          Text(subtitle, style: TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}





class AirQualityCard extends StatelessWidget {
  const AirQualityCard({super.key});

  @override
  Widget build(BuildContext context) {

    double sliderValue = 3;
    String healthRisk = "Low Health Risk";


    if (sliderValue <= 1) {
      healthRisk = "Good";
    } else if (sliderValue <= 3) {
      healthRisk = "Low Health Risk";
    } else if (sliderValue <= 4) {
      healthRisk = "Moderate";
    } else {
      healthRisk = "High Health Risk";
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            colors: [Color(0xFF2E335A), Color(0xFF1C1B33)],

        ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              "Air Quality",
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 16),

            Text(
              "$sliderValue - $healthRisk",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 6,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 16),
                activeTrackColor: Colors.blueAccent,
                inactiveTrackColor: Colors.white24,
                thumbColor: Colors.white,
              ),
              child: Slider(
                value: sliderValue,
                min: 0,
                max: 5,
                divisions: 5,
                onChanged:(v){},
              ),
            ),
            const SizedBox(height: 16),
            // See More Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "See More",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.blueAccent,
                  size: 16,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

