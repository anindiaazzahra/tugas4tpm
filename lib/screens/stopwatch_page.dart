import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas4tpm/screens/bantuan_page.dart';
import 'package:tugas4tpm/screens/home_page.dart';
import 'package:tugas4tpm/screens/login_page.dart';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({super.key});

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  int _selectedIndex = 0; // Indeks tab yang aktif saat ini

  int seconds = 0, minutes = 0, hours = 0;
  String digitSeconds = '00', digitMinutes = '00', digitHours = '00';
  Timer? timer;
  bool started = false;
  List laps = [];

  void stopTime() {
    timer!.cancel();
    setState(() {
      started = false;
    });
  }

  void resetTime() {
    timer!.cancel();
    setState(() {
      seconds = 0;
      minutes = 0;
      hours = 0;

      digitSeconds = '00';
      digitMinutes = '00';
      digitHours = '00';

      started = false;
    });
  }

  void addLaps() {
    String lap = '$digitHours:$digitMinutes:$digitSeconds';
    setState(() {
      laps.add(lap);
    });
  }

  void startTime() {
    started = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      int localSeconds = seconds + 1;
      int localMinutes = minutes;
      int localHours = hours;

      if (localSeconds > 59) {
        if (localMinutes > 59) {
          localHours++;
          localMinutes = 0;
        } else {
          localMinutes++;
          localSeconds = 0;
        }
      }
      setState(() {
        seconds = localSeconds;
        minutes = localMinutes;
        hours = localHours;
        digitSeconds = (seconds >= 10) ? '$seconds' : '0$seconds';
        digitMinutes = (minutes >= 10) ? '$minutes' : '0$minutes';
        digitHours = (hours >= 10) ? '$hours' : '0$hours';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stopwatch'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout,
            ),
            onPressed: () async {
              final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
              sharedPreferences.remove('email');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            }
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  '$digitHours:$digitMinutes:$digitSeconds',
                  style: const TextStyle(
                    fontSize: 80.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 0.0),
                child: Container(
                  height: 400.0,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ListView.builder(
                    itemCount: laps.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
                        child: Container(
                          height: 58,
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Lap ke-${index + 1}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                                ),
                                Text(
                                  '${laps[index]}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(22.0, 0.0, 22.0, 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: RawMaterialButton(
                        onPressed: () {
                          if (!started) {
                            startTime();
                          } else {
                            stopTime();
                          }
                        },
                        fillColor: Colors.black,
                        shape: const StadiumBorder(
                          side: BorderSide(
                            color: Colors.grey,
                          )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            (!started) ? 'Start' : 'Pause',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        )
                      ),
                    ),
                    const SizedBox(
                        width: 8.0
                    ),
                    IconButton(
                      onPressed: () {
                        addLaps();
                      },
                      icon: const Icon(Icons.flag),
                      color: Colors.white,
                    ),
                    Expanded(
                      child: RawMaterialButton(
                          onPressed: () {
                            resetTime();
                          },
                          fillColor: Colors.black,
                          shape: const StadiumBorder(
                            side: BorderSide(
                              color: Colors.grey,
                            )
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Reset',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          )
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),

        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.grey.shade800,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: GNav(
            backgroundColor: Colors.grey.shade800,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.white24,
            gap: 14,
            padding: const EdgeInsets.all(16),
            selectedIndex: _selectedIndex, // Mengatur tab yang aktif
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index; // Perbarui nilai indeks yang dipilih
              });
              switch (index) {
                case 0:
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const StopwatchPage()),
                  );
                  break;
                case 1:
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                  break;
                case 2:
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const BantuanPage()),
                  );
                  break;
              }
            },
            tabs: const [
              GButton(
                icon: Icons.timer_outlined,
                text: 'Stopwatch',
              ),
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.live_help_outlined,
                text: 'Bantuan',
              )
            ],
          ),
        ),
      ),
    );
  }
}
