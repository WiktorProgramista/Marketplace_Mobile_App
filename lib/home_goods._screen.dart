import 'package:flutter/material.dart';
import 'package:marketplace_mobile_app/constants.dart';

class HomeGoods extends StatelessWidget {
  const HomeGoods({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Home goods',
            style: TextStyle(fontWeight: FontWeight.w500)),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [gridCards(context), brandsList()],
        ),
      )),
    );
  }

  Widget gridCards(context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 2.2 / 1.5,
        physics: const NeverScrollableScrollPhysics(),
        children: homeGoods.map((element) {
          return Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.12),
                borderRadius: BorderRadius.circular(20.0)),
            child: Center(
              child: Stack(
                children: [
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Image.asset(element['image'])),
                  Text(
                    element['name'],
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget brandsList() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Popular brands',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 23),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.black,
                ),
                label: const Text(
                  'View all',
                  style: TextStyle(color: Colors.black),
                ),
                iconAlignment: IconAlignment.end,
              ),
            ],
          ),
          SizedBox(
            height: 200,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: brands.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.2),
                                BlendMode.darken),
                            fit: BoxFit.cover,
                            image: AssetImage(brands[index]["image"]!))),
                    child: Center(
                        child: Text(
                      brands[index]['name']!,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
