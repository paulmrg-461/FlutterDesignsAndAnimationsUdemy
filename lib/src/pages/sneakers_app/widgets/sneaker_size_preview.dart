import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SneakerSizeContainer {
  final double size;

  SneakerSizeContainer({@required this.size});
}

class SneakerSizePreview extends StatelessWidget {
  final List<SneakerSizeContainer> sizes;

  SneakerSizePreview({@required this.sizes});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SneakerModel(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 22.0),
        child: Container(
          width: double.infinity,
          height: 430.0,
          decoration: BoxDecoration(
              color: Color(0xffFFCF53),
              borderRadius: BorderRadius.circular(48.0)),
          child: Column(
            children: <Widget>[
              //Sneaker
              _SneakerShadowImage(),
              _SneakerSize(this.sizes),
            ],
          ),
        ),
      ),
    );
  }
}

//

class _SneakerShadowImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32.0),
      child: Stack(
        children: <Widget>[
          Positioned(bottom: 20.0, left: 0.0, child: _SneakerShadow()),
          Image(image: AssetImage('assets/imgs/azul.png'))
        ],
      ),
    );
  }
}

class _SneakerShadow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 250,
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            boxShadow: [BoxShadow(color: Color(0xffEAA14E), blurRadius: 40.0)]),
      ),
    );
  }
}

class _SneakerSize extends StatelessWidget {
  final List<SneakerSizeContainer> sizeSneakerContainers;
  _SneakerSize(this.sizeSneakerContainers);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
            sizeSneakerContainers.length,
            (index) =>
                _SizeSneakerContainer(index, sizeSneakerContainers[index])),
      ),
    );
  }
}

class _SizeSneakerContainer extends StatelessWidget {
  final int index;
  final SneakerSizeContainer item;

  _SizeSneakerContainer(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    final sneakerModel = Provider.of<_SneakerModel>(context);
    final bool isSelected = sneakerModel.index == index ? true : false;

    return GestureDetector(
      onTap: () =>
          Provider.of<_SneakerModel>(context, listen: false).index = index,
      child: Container(
        child: Center(
          child: Text(
            '${item.size.toString().replaceAll('.0', '')}',
            style: TextStyle(
                color: isSelected ? Colors.white : Color(0xffF1A23A),
                fontSize: 16.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        width: 45,
        height: 45,
        decoration: BoxDecoration(
            color: isSelected
                ? sneakerModel.selectedColor
                : sneakerModel.unselectedColor,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                  color: isSelected ? Color(0xffF1A23A) : Colors.transparent,
                  blurRadius: 10.0,
                  offset: Offset(0, 5)),
            ]),
      ),
    );
  }
}

class _SneakerModel extends ChangeNotifier {
  int _index = 0;
  Color _selectedColor = Color(0xffF1A23A);
  Color _unselectedColor = Colors.white;

  int get index => this._index;
  set index(int index) {
    this._index = index;
    this.notifyListeners();
  }

  Color get selectedColor => this._selectedColor;
  set selectedColor(Color selectedColor) {
    this._selectedColor = selectedColor;
  }

  Color get unselectedColor => this._unselectedColor;
  set unselectedColor(Color unselectedColor) {
    this._unselectedColor = unselectedColor;
  }
}
