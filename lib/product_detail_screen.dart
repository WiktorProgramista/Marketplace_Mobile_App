import 'package:flutter/material.dart';
import 'package:marketplace_mobile_app/constants.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int _selectedIndex = 0;
  String productName = "GURLI";
  String description =
      "A popular solid color cushion cover that can easly be combined with other solid or patterned cushions...";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: const BackButton(),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_outline_outlined)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.ios_share)),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(15.0),
          children: [galleryView(size), productDetail()],
        ),
      ),
      bottomNavigationBar: bottomNavigation(size),
    );
  }

  Widget galleryView(Size size) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
                height: size.height / 2,
                width: size.width,
                child: PageView.builder(
                  onPageChanged: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  itemCount: categorys.length,
                  itemBuilder: (context, index) {
                    var image = categorys[index]["image"];
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(
                              image: AssetImage(image!), fit: BoxFit.cover)),
                    );
                  },
                )),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: categorys.map((category) {
              return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: Container(
                    height: 10,
                    width:
                        _selectedIndex == categorys.indexOf(category) ? 50 : 10,
                    decoration: BoxDecoration(
                        color: _selectedIndex == categorys.indexOf(category)
                            ? Colors.black
                            : Colors.grey.withOpacity(0.4),
                        borderRadius:
                            _selectedIndex == categorys.indexOf(category)
                                ? BorderRadius.circular(20)
                                : BorderRadius.circular(100.0)),
                  ));
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget productDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(productName,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 24)),
        Row(children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.12),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Selection 97%',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(width: 10.0),
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.12),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Best product',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ]),
        Text(
          description,
          style: const TextStyle(fontSize: 16),
        ),
        Row(
          children: List.generate(5, (index) {
            return const Icon(
              Icons.star,
              color: Color.fromARGB(255, 250, 236, 36),
              size: 30,
            );
          }),
        )
      ],
    );
  }

  Widget bottomNavigation(Size size) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 50.0),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0))),
              onPressed: () {},
              child: const Text('Buy now',
                  style: TextStyle(fontSize: 18, color: Colors.white))),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 40.0),
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0))),
              onPressed: () {},
              child: const Text('Add to cart',
                  style: TextStyle(fontSize: 18, color: Colors.white))),
        ],
      ),
    );
  }
}
