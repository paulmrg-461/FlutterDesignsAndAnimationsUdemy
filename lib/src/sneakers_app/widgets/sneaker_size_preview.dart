import 'package:app_designs/src/pages/sneakers_app/models/sneaker_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SneakerSizeContainer {
  final double size;

  SneakerSizeContainer({@required this.size});
}

class SneakerSizePreview extends StatelessWidget {
  final List<SneakerSizeContainer> sizes;
  final double height;
  final double horizontalPadding;
  final double verticalPadding;
  final double topLeftRadius;
  final double topRightRadius;
  final double bottomLeftRadius;
  final double bottomRightRadius;

  SneakerSizePreview({
    this.sizes,
    this.height = 430.0,
    this.horizontalPadding = 22.0,
    this.verticalPadding = 22.0,
    this.topLeftRadius = 48.0,
    this.topRightRadius = 48.0,
    this.bottomLeftRadius = 48.0,
    this.bottomRightRadius = 48.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: this.horizontalPadding, vertical: this.verticalPadding),
      child: Container(
        width: double.infinity,
        height: this.height,
        decoration: BoxDecoration(
            color: Color(0xffFFCF53),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(this.topLeftRadius),
                topRight: Radius.circular(this.topRightRadius),
                bottomLeft: Radius.circular(this.bottomLeftRadius),
                bottomRight: Radius.circular(this.bottomRightRadius))),
        child: Column(
          children: <Widget>[
            //Sneaker
            _SneakerShadowImage(),
            _SneakerSize(this.sizes != null ? this.sizes : []),
          ],
        ),
      ),
    );
  }
}

//

class _SneakerShadowImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final urlAssetImage = Provider.of<SneakerModel>(context).urlAssetImage;
    return Padding(
      padding: EdgeInsets.all(32.0),
      child: Stack(
        children: <Widget>[
          Positioned(bottom: 20.0, left: 0.0, child: _SneakerShadow()),
          Image(image: AssetImage(urlAssetImage))
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
            boxShadow: [BoxShadow(color: Color(0xffEAA14E), blurRadius: 30.0)]),
      ),
    );
  }
}

class _SneakerSize extends StatelessWidget {
  final List<SneakerSizeContainer> sizeSneakerContainers;
  _SneakerSize(this.sizeSneakerContainers);
  @override
  Widget build(BuildContext context) {
    if (sizeSneakerContainers.length > 0) {
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
    } else {
      return Container();
    }
  }
}

class _SizeSneakerContainer extends StatelessWidget {
  final int index;
  final SneakerSizeContainer item;

  _SizeSneakerContainer(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    final sneakerModel = Provider.of<SneakerModel>(context);
    final bool isSelected = sneakerModel.index == index ? true : false;

    return GestureDetector(
      onTap: () =>
          Provider.of<SneakerModel>(context, listen: false).index = index,
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
