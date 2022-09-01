import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mediplus/components/reusable/pie_progress_bar.dart';
import 'package:mediplus/components/screens/news_page.dart';
import 'package:mediplus/system/api.dart';
import 'package:mediplus/system/classes/main_menu_item.dart';
import 'package:mediplus/system/models/news.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const mainMenuItems = [
      MainMenuItem("KLINIK TERDEKAT", "nearby_clinic"),
      MainMenuItem("RIWAYAT", "history"),
      MainMenuItem("DATA SCAN", "data_scan"),
      MainMenuItem("NOTIFIKASI", "notification", hasNotification: true),
      MainMenuItem("BERI NILAI", "rated"),
      MainMenuItem("PENGATURAN", "settings"),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          color: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("assets/img/mediplus.png"),
                  const Expanded(child: SizedBox()),
                  const Text("Hi, Bagus"),
                  const SizedBox(width: 15),
                  SvgPicture.asset("assets/img/icons/user.svg")
                ],
              ),
              const SizedBox(height: 25),
              TextField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    hintText: "Cari Klinik / Rumah Sakit",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: const BorderSide(color: Color(0xFFE7E7E7))),
                    filled: true,
                    fillColor: const Color(0xFFF4F4F4)),
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(colors: [
                              Color(0xFF0A8DD9),
                              Color(0xFFC61F85),
                            ]),
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Text("INFO ANTRIAN",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                            const Divider(
                              color: Colors.white,
                            ),
                            const SizedBox(height: 15),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Builder(builder: (context) {
                                const totalLine = 26.0;

                                return Row(
                                  children: [
                                    const PieProgressBar(
                                        total: totalLine,
                                        value: 21,
                                        label: "Nomor antrian"),
                                    const SizedBox(width: 15),
                                    const PieProgressBar(
                                        total: totalLine,
                                        value: totalLine - 21,
                                        label: "Sisa antrian"),
                                    const SizedBox(width: 25),
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text("Dokter Anda",
                                            style: TextStyle(
                                                color: Color(0xFFFFF9AA))),
                                        Text("dr. Rina Agustina",
                                            style:
                                                TextStyle(color: Colors.white)),
                                        SizedBox(height: 15),
                                        Text("Dokter Anda",
                                            style: TextStyle(
                                                color: Color(0xFFFFF9AA))),
                                        Text("dr. Rina Agustina",
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ],
                                    ))
                                  ],
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        children: mainMenuItems
                            .map((e) => Column(
                                  children: [
                                    Stack(
                                      textDirection: TextDirection.rtl,
                                      children: [
                                        SvgPicture.asset(
                                          "assets/img/icons/${e.icon}.svg",
                                        ),
                                        if (e.hasNotification)
                                          Container(
                                            decoration: BoxDecoration(
                                                color: const Color(0xFF50DEE3),
                                                border: Border.all(
                                                    color: Colors.white,
                                                    width: 3),
                                                borderRadius:
                                                    BorderRadius.circular(100)),
                                            width: 15,
                                            height: 15,
                                          )
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Text(e.label, textAlign: TextAlign.center)
                                  ],
                                ))
                            .toList(),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CarouselSlider(
                      options: CarouselOptions(
                          enlargeCenterPage: true, viewportFraction: 1),
                      items: List.generate(
                          5, (index) => Image.asset("assets/img/banner.png"))),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(20),
                  child: FutureBuilder<AllNews>(
                      future: Api.of(context).news.getNews({
                        "q": "health",
                        "form": "2022-08-01",
                        "sortBy": "publishedAt"
                      }),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        final data = snapshot.data!.news;

                        return ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 5,
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 30),
                            itemBuilder: (context, index) {
                              final news = data[index];

                              return InkWell(
                                onTap: () => Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            NewsPage(url: news.url))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Image.network(
                                        news.urlToImage ??
                                            "https://eurofish.dk/wp-content/uploads/2011/01/images_rocketlauncher_pages_offline-page_img-01.jpg",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(news.title,
                                        style: const TextStyle(fontSize: 18)),
                                    const SizedBox(height: 10),
                                    Text(
                                        "Sumber: ${news.source.name}\n${news.publicationDate.toString().split(" ").first}",
                                        style: const TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFF888888))),
                                    const SizedBox(height: 5),
                                    if (news.description != null)
                                      Text.rich(TextSpan(
                                          style: const TextStyle(height: 1.5),
                                          children: [
                                            TextSpan(text: news.description!),
                                            TextSpan(
                                                text: " Baca Selengkapnya",
                                                style: const TextStyle(
                                                    color: Colors.blue))
                                          ])),
                                  ],
                                ),
                              );
                            },
                            shrinkWrap: true);
                      }),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
