import 'splash_screen.dart';
import 'fungsi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() {
  runApp(const MyApp());
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // animasi splash screen
      home: SplashScreen(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   Widget buildBox({required String title, required String content}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blue, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            content,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: const Color.fromARGB(255, 66, 202, 91),
            centerTitle: true,
            // google fonts
            title: Text(
              'Home',
              style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
          endDrawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  accountName: const Text(
                    'Farhan Wali',
                    style: TextStyle(color: Color.fromARGB(255, 251, 251, 251)),
                  ),
                  accountEmail: const Text('farhan@gmail.com',
                      style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: Image.asset(
                        fit: BoxFit.cover,
                        'assets/farhan.png',
                        width: 90,
                      ),
                    ),
                  ),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 109, 246, 111),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://mutucertification.com/wp-content/uploads/2023/10/Hutan-Hujan-Tropis-Pengertian-Ciri-Manfaat-Hutan-Terluas.jpg'))),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.menu_book),
                  title: const Text('Hitung Umur'),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.scale,
                            alignment: Alignment.bottomCenter,
                            childCurrent: this,
                            duration: const Duration(milliseconds: 400),
                            child: const Fungsi()));
                  },
                ),
                ListTile(
                  leading: const Icon(FontAwesomeIcons.whatsapp),
                  title: const Text('WhatsApp'),
                  onTap: () async {
                    final Uri url =
                        Uri.parse('https://wa.me/628?text=Hello');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url,
                          mode: LaunchMode.externalApplication);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
                ListTile(
                  // font awesome icon
                  leading: const Icon(FontAwesomeIcons.instagram),
                  title: const Text('Instagram'),
                  onTap: () async {
                    final Uri url =
                        Uri.parse('https://www.instagram.com/drawhan_/');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url,
                          mode: LaunchMode.externalApplication);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Logout'),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                          title: const Text('Logout'),
                          content:
                              const Text('Apakah anda yakin ingin keluar?'),
                          actions: [
                            TextButton(
                                child: const Text('Batal'),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                            TextButton(
                                child: const Text(
                                  'Keluar',
                                  style: TextStyle(color: Colors.red),
                                ),
                                onPressed: () {
                                  SystemNavigator.pop();
                                }),
                          ]),
                    );
                  },
                ),
              ],
            ),
          ),
          body: SingleChildScrollView( 
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    const AnimatedLogo(),
                    const SizedBox(height: 25),

                       
                    Text(
                      'Farhan Wali',
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Mobile Application Engineer',
                      style: TextStyle(
                        fontSize: 17,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 20),
                   
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'My Skills',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                        Expanded(
                          child: Column(
                            children: [
                            CircularPercentIndicator(
                              radius: 40.0,
                              lineWidth: 10.0,
                              percent: 0.50,
                              center: const Text(
                                "50%",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                              ),
                              progressColor: Colors.green,
                              backgroundColor: Colors.grey.shade300,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'HTML',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),                 
                        ),
                        Expanded(
                        child: Column(
                          children: [
                          CircularPercentIndicator(
                            radius: 40.0,
                            lineWidth: 10.0,
                            percent: 0.40,
                            center: const Text(
                              "40%",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                            progressColor: Colors.blue,
                            backgroundColor: Colors.grey.shade300,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'PHP',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          ],
                        ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              CircularPercentIndicator(
                                radius: 40.0,
                                lineWidth: 10.0,
                                percent: 0.30,
                                center: const Text(
                                  "30%",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                                ),
                                progressColor: Colors.orange,
                                backgroundColor: Colors.grey.shade300,
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Database',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        ],
                    ),

                  ],
              ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: buildBox(
                            title: 'Umur:',
                            content: '20 tahun',
                          ),
                        ),
                        const SizedBox(width: 10), // Jarak antar box
                        Expanded(
                          flex: 1,
                          child: buildBox(
                            title: 'Hobi:',
                            content: 'Menggambar, Olahraga, dan Coding',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Box Tentang Saya
                    buildBox(
                      title: 'Tentang Saya:',
                      content:'Saya adalah mahasiswa yang menyukai tantangan dan pembelajaran hal baru.',
                    ),
                  ],
              ),
            ),
          ),     
        ); 
        }
      ),
    );
  }
}

// animated logo new class
class AnimatedLogo extends StatefulWidget {
  const AnimatedLogo({super.key});

  @override
  State<AnimatedLogo> createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo> {
  bool isZoomed = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.only(bottom: isZoomed ? 50.0 : 0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isZoomed = !isZoomed;
          });
        },
        child: AnimatedScale(
          scale: isZoomed ? 1.3 : 1.0,
          duration: const Duration(milliseconds: 300),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(isZoomed ? 20 : 75),
              // Menambahkan border tipis agar terlihat lebih bagus
              border: Border.all(
                color: Colors.pink,
                width: 2,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(isZoomed ? 20 : 75),
              child: Image.asset(
                fit: BoxFit.cover,
                'assets/farhan.png',
                width: 150,
                height: 150, // Menambahkan height agar gambar tetap persegi
              ),
            ),
          ),
        ),
      ),
    );
  }
}


