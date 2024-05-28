import 'package:flutter/material.dart';
import 'package:marketplace_mobile_app/constants.dart';
import 'package:marketplace_mobile_app/home_goods._screen.dart';
import 'package:marketplace_mobile_app/product_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedFilter = "";
  int _activePage = 0;
  String _selectedImage = "";
  int _navigationIndex = 0;

  @override
  @override
  void initState() {
    super.initState();
    _selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                appBar(),
                const SizedBox(height: 15),
                searchBar(),
                const SizedBox(height: 15),
                categoryCards(context),
                const SizedBox(height: 15),
                discountCard(),
                const SizedBox(height: 15),
                customFilters(),
                const SizedBox(height: 15),
                productsCards()
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: bottomNavigation(),
    );
  }

  Widget appBar() {
    return const ListTile(
      leading: Icon(
        Icons.location_on,
        size: 30,
        color: Colors.green,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Express delivery",
            style: TextStyle(color: Colors.black54),
          ),
          Text(
            "Leipzig Street, 21",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      trailing: Icon(
        Icons.notifications_outlined,
        size: 30,
      ),
    );
  }

  Widget searchBar() {
    return TextField(
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          suffixIcon: const Icon(Icons.qr_code_scanner_sharp),
          hintText: "Search",
          hintStyle: const TextStyle(fontSize: 16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none),
          ),
          filled: true,
          fillColor: Colors.grey.withOpacity(0.12)),
    );
  }

  Widget categoryCards(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: categorys.map((category) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage(category['image']!),
                            fit: BoxFit.fill)),
                  ),
                  Text(
                    category['name']!,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  )
                ],
              ),
            );
          }).toList()),
    );
  }

  Widget discountCard() {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Down payment 0%",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 20),
                ),
                Text(
                  "Action from 1 — 30 April",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      fontSize: 12),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: const Text(
              "LokkeStore",
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }

  Widget customFilters() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: filters.map((filter) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedFilter = filter;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: _selectedFilter == filter
                        ? Colors.black
                        : Colors.grey.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    filter,
                    style: TextStyle(
                        color: _selectedFilter == filter
                            ? Colors.white
                            : Colors.black),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomeGoods()));
          },
          child: const Row(
            children: [
              Text(
                "View all",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 15,
              )
            ],
          ),
        )
      ],
    );
  }

  Widget productsCards() {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          var product = products[index];
          var images = product["images"] as List<String>;
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProductDetail())),
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      width: 150,
                      height: 180,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          const Align(
                              alignment: Alignment.topRight,
                              child: Icon(Icons.favorite_outline)),
                          PageView.builder(
                            itemCount: product["images"].length,
                            onPageChanged: (index) {
                              setState(() {
                                _activePage = index;
                                _selectedImage = product["images"][index];
                              });
                            },
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Image.asset(product["images"][index]),
                              );
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: images.map((image) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child: CircleAvatar(
                                  radius: 4,
                                  backgroundColor:
                                      _activePage == images.indexOf(image) &&
                                              image == _selectedImage
                                          ? Colors.black
                                          : Colors.grey.withOpacity(0.4),
                                ),
                              );
                            }).toList(),
                          )
                        ],
                      ),
                    ),
                  ),
                  Text(product['name'],
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                  Text(product['price'],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14)),
                ],
              ));
        },
      ),
    );
  }

  Widget bottomNavigation() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 50,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            blurRadius: 8,
            spreadRadius: 5,
            offset: const Offset(0, 3),
            color: Colors.grey.withOpacity(0.2))
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          navigationButton(Icons.home_filled, Icons.home_outlined, 0),
          navigationButton(Icons.wallet, Icons.wallet_outlined, 1),
          navigationButton(Icons.shopping_bag, Icons.shopping_bag_outlined, 2),
          navigationButton(Icons.favorite, Icons.favorite_outline, 3),
          navigationButton(Icons.settings, Icons.settings_outlined, 4),
        ],
      ),
    );
  }

  Widget navigationButton(
      IconData selectedIcon, IconData unselectedIcon, int index) {
    return GestureDetector(
        onTap: () {
          setState(() {
            _navigationIndex = index;
          });
        },
        child: Icon(
          _navigationIndex == index ? selectedIcon : unselectedIcon,
          size: 30,
        ));
  }
}
