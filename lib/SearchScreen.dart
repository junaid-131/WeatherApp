import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1B33),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Weather",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Search bar
              TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Search for a city or airport",
                  hintStyle: const TextStyle(color: Colors.white70),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                  prefixIcon: const Icon(Icons.search, color: Colors.white70),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                ),
              ),
              const SizedBox(height: 20),


              Expanded(
                child: ListView(
                  children: const [
                    WeatherCard(
                      city: "Bengaluru, India",
                      temp: "19°",
                      highLow: "H:24°  L:18°",
                      condition: "Mid Rain",
                      icon: Icons.cloud,
                    ),
                    WeatherCard(
                      city: "Chennai, India",
                      temp: "22°",
                      highLow: "H:26°  L:18°",
                      condition: "Fast Wind",
                      icon: Icons.cloud,
                    ),
                    WeatherCard(
                      city: "Mumbai, India",
                      temp: "29°",
                      highLow: "H:32°  L:27°",
                      condition: "Sunny Rain",
                      icon: Icons.sunny,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  final String city, temp, highLow, condition;
  final IconData icon;

  const WeatherCard({
    super.key,
    required this.city,
    required this.temp,
    required this.highLow,
    required this.condition,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF2B25A1), Color(0xFF3C2F9C)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          // Temperature and info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  temp,
                  style: const TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  highLow,
                  style: const TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      city,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Text(
                      condition,
                      style: const TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),

              ],
            ),
          ),

          Icon(icon, color: Colors.white, size: 50),
        ],
      ),
    );
  }
}
