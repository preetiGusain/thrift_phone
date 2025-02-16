import 'package:flutter/material.dart';
import 'package:phone_thrift/widgets/action_buttons.dart';
import 'package:phone_thrift/widgets/banner_images.dart';
import 'package:phone_thrift/widgets/brands_icons.dart';
import 'package:phone_thrift/widgets/drawer_Icons.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:phone_thrift/widgets/quick_links.dart';
import 'package:phone_thrift/widgets/title_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activeIndex = 0;
  final List<String> images = [
    'lib/images/banner/banner1.png',
    'lib/images/banner/banner2.png',
    'lib/images/banner/banner3.png',
    'lib/images/banner/banner4.png',
    'lib/images/banner/banner5.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Appbar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        titleSpacing: 0,
        title: const ThriftTitle(),
        actions: [
          Row(
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.black,
                size: 16,
              ),
              const SizedBox(width: 4),
              const Text(
                'India',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 16),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),

      //drawer
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width * 0.85,
        child: Drawer(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  color: const Color.fromARGB(66, 188, 184, 184),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const ThriftTitle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close),
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                  height: 1, color: Color.fromARGB(255, 210, 207, 207)),
              const SizedBox(height: 10),

              //Login/Signup
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 3, 81, 144),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text(
                      'Login/Signup',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 26),

              //Sell Your Phone
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      // Sell your phone
                    },
                    child: const Text(
                      'Sell Your Phone',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              const Spacer(),

              Padding(
                padding: const EdgeInsets.all(16),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    drawerIcons(Icons.shopping_cart, 'How to Buy'),
                    drawerIcons(Icons.handshake, 'How to Sell'),
                    drawerIcons(Icons.info, 'About Us'),
                    drawerIcons(Icons.question_answer, 'FAQs'),
                    drawerIcons(Icons.security, 'Privacy Policy'),
                    drawerIcons(Icons.currency_exchange, 'Refund Policy'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      //body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Search
              Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.orange),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Center(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search phones with make, model...',
                            hintStyle: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 18,
                      width: 2,
                      color: Colors.black54,
                      margin: const EdgeInsets.symmetric(horizontal: 0),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.mic, color: Colors.black54),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
              ),

              //Action buttons
              Container(
                padding: const EdgeInsets.symmetric(vertical: 18),
                height: 75,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    const SizedBox(width: 2),
                    actionButtons('Sell Used Phones', () => {}),
                    const SizedBox(width: 8),
                    actionButtons('Buy Used Phones', () => {}),
                    const SizedBox(width: 8),
                    actionButtons('Compare Prices', () => {}),
                    const SizedBox(width: 8),
                    actionButtons('My Profile', () => {}),
                    const SizedBox(width: 8),
                    actionButtons('My Listings', () => {}),
                    const SizedBox(width: 8),
                    actionButtons('Services', () => {}),
                    const SizedBox(width: 8),
                    actionButtons('Register your Store', () => {}),
                    const SizedBox(width: 8),
                    actionButtons('Get the App', () => {}),
                    const SizedBox(width: 8),
                  ],
                ),
              ),

              //Banners
              CarouselSlider.builder(
                options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  viewportFraction: 1,
                  autoPlayInterval: const Duration(seconds: 4),
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index; // Sync activeIndex
                    });
                  },
                ),
                itemCount: images.length,
                itemBuilder: (context, index, realIndex) {
                  return buildImage(images[index], index);
                },
              ),
              const SizedBox(height: 7),
              // Page indicator
              Center(
                child: buildIndicator(activeIndex, images.length),
              ),
              const SizedBox(height: 7),

              //What's on your mind?
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        'What\'s on your mind?',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 170,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          const SizedBox(width: 2),
                          quickLinks('lib/images/quickLinks/buy.png',
                              'Buy Used Phones'),
                          const SizedBox(width: 2),
                          quickLinks('lib/images/quickLinks/sell.png',
                              'Sell Used Phones'),
                          const SizedBox(width: 2),
                          quickLinks('lib/images/quickLinks/compare.png',
                              'Compare Prices'),
                          const SizedBox(width: 2),
                          quickLinks('lib/images/quickLinks/profile.png',
                              'My Profile'),
                          const SizedBox(width: 2),
                          quickLinks(
                              'lib/images/quickLinks/list.png', 'My Listings'),
                          const SizedBox(width: 2),
                          quickLinks(
                              'lib/images/quickLinks/store.png', 'Open Store'),
                          const SizedBox(width: 2),
                          quickLinks(
                              'lib/images/quickLinks/services.png', 'Services'),
                          const SizedBox(width: 2),
                          quickLinks('lib/images/quickLinks/health.png',
                              'Device Health Check'),
                          const SizedBox(width: 2),
                          quickLinks('lib/images/quickLinks/battery.png',
                              'Battery Health Check'),
                          const SizedBox(width: 2),
                          quickLinks('lib/images/quickLinks/simcard.png',
                              'IMEI Verification'),
                          const SizedBox(width: 2),
                          quickLinks('lib/images/quickLinks/details.png',
                              'Device Details'),
                          const SizedBox(width: 2),
                          quickLinks(
                              'lib/images/quickLinks/data.png', 'Data Wipe'),
                          const SizedBox(width: 2),
                          quickLinks('lib/images/quickLinks/warranty.png',
                              'Under Warranty Phones'),
                          const SizedBox(width: 2),
                          quickLinks('lib/images/quickLinks/premium.png',
                              'Premium Phones'),
                          const SizedBox(width: 2),
                          quickLinks('lib/images/quickLinks/newPhones.png',
                              'Like New Phones'),
                          const SizedBox(width: 2),
                          quickLinks('lib/images/quickLinks/refurbished.png',
                              'Refurbished Phones'),
                          const SizedBox(width: 2),
                          quickLinks('lib/images/quickLinks/verified.png',
                              'Verified Phones'),
                          const SizedBox(width: 2),
                          quickLinks('lib/images/quickLinks/negotiations.png',
                              'My Negotiations'),
                          const SizedBox(width: 2),
                          quickLinks('lib/images/quickLinks/favorites.png',
                              'My Favorites'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              //Brands
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        'Top brands',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          brandLogo('lib/images/brands/apple.png'),
                          const SizedBox(width: 18),
                          brandLogo('lib/images/brands/xiaomi.png'),
                          const SizedBox(width: 18),
                          brandLogo('lib/images/brands/samsung.png'),
                          const SizedBox(width: 18),
                          brandLogo('lib/images/brands/vivo.png'),
                          const SizedBox(width: 18),
                          brandLogo('lib/images/brands/realme.png'),
                          const SizedBox(width: 18),
                          brandLogo('lib/images/brands/motorola.png'),
                          const SizedBox(width: 18),
                          brandLogo('lib/images/brands/oppo.png'),
                          const SizedBox(width: 18),
                          brandLogo('lib/images/brands/nokia.png'),
                          const SizedBox(width: 18),
                          brandLogo('lib/images/brands/sony.png'),
                          const SizedBox(width: 18),
                          brandLogo('lib/images/brands/lg.png'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              //Best deals
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        'Best deals in India',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                  side: const BorderSide(color: Colors.grey),
                                ),
                                child: const Row(
                                  children: [
                                    Icon(Icons.swap_vert, color: Colors.black),
                                    SizedBox(width: 4),
                                    Text(
                                      'Sort',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    SizedBox(width: 4),
                                    Icon(Icons.expand_more,
                                        color: Colors.black),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                  side: const BorderSide(color: Colors.grey),
                                ),
                                child: const Row(
                                  children: [
                                    Icon(Icons.tune, color: Colors.black),
                                    SizedBox(width: 4),
                                    Text(
                                      'Filters',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    SizedBox(width: 4),
                                    Icon(Icons.expand_more,
                                        color: Colors.black),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
