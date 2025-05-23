import 'package:flame_forge2d/flame_forge2d.dart';

// フルーツ描画用クラス
class FruitsDraw extends BodyComponent {
  @override
  final Vector2 position;
  final double density;
  final double restitution;

  FruitsDraw(this.position, this.density, this.restitution);

  @override
  Body createBody() {
    final shape = CircleShape()..radius = 10;
    final fixtureDef = FixtureDef(shape)
      ..density = density
      ..restitution = restitution;
    final bodyDef = BodyDef(position: position, type: BodyType.dynamic);
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

// @override
// void render(Canvas canvas) {
//   final paint = Paint()..color = Cherry().loadFruitImage();
//   canvas.drawCircle(Offset.zero, 10, paint);
// }

// void fruitsView(Vector2 position) {
//   add(Cherry(position));
// }
}