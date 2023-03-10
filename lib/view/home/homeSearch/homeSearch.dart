import 'package:flutter/material.dart';
import 'package:online_shop_app/common/products.dart';
import 'package:online_shop_app/view/home/homeDetail/DetailsPage.dart';
import 'package:online_shop_app/widget/gridItems.dart';
import 'package:online_shop_app/widget/searchFieldWidget.dart';

class HomeSearch extends StatefulWidget {
  const HomeSearch({Key? key}) : super(key: key);

  @override
  State<HomeSearch> createState() => _HomeSearchState();
}

class _HomeSearchState extends State<HomeSearch> {

  List<Products> searchProducts = [];
  TextEditingController? searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        try {
          Navigator.pop(context);
        } catch (e) {
          Navigator.pop(context);
        }
        return Future.value(false);
      },
      child: Scaffold(
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                toolbarHeight: 100,
                floating: true,
                snap: true,
                backgroundColor: Colors.white,
                elevation: 5,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new_sharp,
                    color: Colors.grey,
                    size: 15,
                  ),
                  onPressed: () {
                    try {
                      Navigator.pop(context);
                    } catch (e) {
                      Navigator.pop(context);
                    }
                  },
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    children: <Widget>[
                      const SizedBox(height: 55.0),
                      Container(
                        margin: const EdgeInsets.only(left: 55, right: 10),
                        width: double.infinity,
                        child: SearchFieldWidget(
                          controller: searchController,
                          readOnly: false,
                          autofocus: true,
                          hintText: "Handbag & more..",
                          onChanged: ((value) {
                            setState(() {
                              for(int i = 0; i < products.length; i++){
                                searchProducts = products.where((element) => element.title.toLowerCase().contains(value.toLowerCase())).toList();
                              }
                            });
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: searchController!.text.isNotEmpty && searchProducts.isEmpty
              ? const Center(
                  child: Text("No results found"),
                )
              : GridView.builder(
                  shrinkWrap: true,
                  itemCount: searchController!.text.isEmpty
                      ? products.length - 1
                      : searchProducts.length,
                  padding: const EdgeInsets.all(10.0),
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 1.6),
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailsPage(product: searchController!.text.isEmpty
                                    ? products[index]
                                    : searchProducts[index], item: "handbag"),
                          ),
                        );
                      },
                      child: GridItems(
                        color: searchController!.text.isEmpty
                            ? products[index].color
                            : searchProducts[index].color,
                        image: searchController!.text.isEmpty
                            ? products[index].image
                            : searchProducts[index].image,
                        name: searchController!.text.isEmpty
                            ? products[index].title
                            : searchProducts[index].title,
                        price: searchController!.text.isEmpty
                            ? products[index].price
                            : searchProducts[index].price,
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}



