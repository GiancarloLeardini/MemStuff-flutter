import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/stuff_model.dart';
import 'detail_page.dart';
import '../widgets/stuff_card.dart';
import '../widgets/stuff_listview.dart';
import '../repositories/stuff_repository_impl.dart';
import '../controllers/home_controller.dart';
import '../core/app_const.dart';
import '../helpers/snackbar_helper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = HomeController(StuffRepositoryImpl());

  @override
  void initState() {
    _initialize();
    super.initState();
  }

  Future _initialize() async {
    await _controller.readAll();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(kAppTitle),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _onCreate,
      ),
      body: RefreshIndicator(
        onRefresh: _initialize,
        child: StuffListView(
          itemCount: _controller.length,
          itemBuilder: _buildStuffCard,
          loading: _controller.loading,
        ),
      ),
    );
  }

  Widget _buildStuffCard(BuildContext context, int index) {
    final stuff = _controller.stuffs[index];
    return AnimationConfiguration.staggeredList(
      position: index,
      duration: const Duration(milliseconds: 350),
      child: SlideAnimation(
        verticalOffset: 200.0,
        child: FadeInAnimation(
          child: StuffCard(
            stuff: stuff,
            onUpdate: () => _onUpdate(stuff),
            onDelete: () => _onDelete(stuff),
            onCall: () => _onCall(stuff),
          ),
        ),
      ),
    );
  }

  _onCreate() async {
    await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => DetailPage()),
    );
    _initialize();
  }

  _onUpdate(StuffModel stuff) async {
    await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => DetailPage(stuff: stuff)),
    );
    _initialize();
  }

  _onDelete(StuffModel stuff) async {
    await _controller.delete(stuff);
    _initialize();
    SnackbarHelper.showDeleteMessage(
      context: context,
      message: '${stuff.description} excluído com sucesso!',
    );
  }

  _onCall(StuffModel stuff) async {
    var url = 'tel:0' + '${stuff.phone}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Não foi possível prosseguir. Telefone: $url';
    }
  }
}
