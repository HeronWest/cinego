import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinego/design/selo_classificao_indicativa.dart';
import 'package:cinego/view/filme/widget/sessao_widget.dart';
import 'package:flutter/material.dart';

import '../../model/filme.dart';

class FilmePage extends StatefulWidget {
  final Filme filme;

  FilmePage({super.key, required this.filme});

  @override
  State<FilmePage> createState() => _FilmePageState();
}

class _FilmePageState extends State<FilmePage>
    with SingleTickerProviderStateMixin {
  int _current = 0;
  late TabController _tabController;
  ValueNotifier<bool> _isCollapsed = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 400.0,
              pinned: true,
              title: ValueListenableBuilder(
                valueListenable: _isCollapsed,
                builder: (context, value, child) {
                  return value ? Text(widget.filme.titulo) : const SizedBox();
                },
              ),
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  double percentage = (constraints.maxHeight - kToolbarHeight) /
                      (400.0 - kToolbarHeight);
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _isCollapsed.value = percentage < 0.5;
                  });
                  return FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    background: CarouselSlider(
                      options: CarouselOptions(
                        height: 360.0,
                        autoPlay: false,
                        aspectRatio: 1,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        viewportFraction: 0.9,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                      ),
                      items: widget.filme.imagens.map((image) {
                        return FractionallySizedBox(
                          widthFactor: 0.96,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image(
                              image: AssetImage(image),
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(widget.filme.imagens.length, (index) {
                  return GestureDetector(
                    onTap: () => setState(() {
                      _current = index;
                    }),
                    child: Container(
                      width: 10.0,
                      height: 10.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == index
                            ? Theme.of(context).primaryColor
                            : Color.fromRGBO(0, 0, 0, 0.4),
                      ),
                    ),
                  );
                }),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverTabBarDelegate(
                TabBar(
                  controller: _tabController,
                  labelColor: Colors.black,
                  indicatorColor: Theme.of(context).primaryColor,
                  tabs: [
                    Tab(text: 'Sobre'),
                    Tab(text: 'Sessões'),
                  ],
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Titulo do filme e classificação indicativa
                      Text(
                        widget.filme.titulo,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SeloClassificaoIndicativa(
                          idade: widget.filme.classificacao,
                          borderRadius: BorderRadius.circular(8),
                          height: 40,
                          width: 40),
                    ],
                  ),
                  SizedBox(height: 16),
                  //Genero
                  Row(
                    children: [
                      Text(
                        'Genêro: ',
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      Text(
                        widget.filme.genero,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                      Spacer(),
                      //Ano
                      Text(
                        'Ano: ',
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      Text(
                        widget.filme.ano.toString(),
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  //Duração
                  Row(
                    children: [
                      Text(
                        'Duração: ',
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      Text(
                        '${widget.filme.duracao} min',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                  //Atores
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Atores: ',
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.filme.atores.join(', '),
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  //Sinopse
                  Text(
                    'Sinopse',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    widget.filme.sinopse,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
            Center(child: SessaoWidget()),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _isCollapsed.dispose();
    super.dispose();
  }
}

class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverTabBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
        color: Colors.white,
        child: _tabBar);
  }

  @override
  bool shouldRebuild(_SliverTabBarDelegate oldDelegate) {
    return false;
  }
}
