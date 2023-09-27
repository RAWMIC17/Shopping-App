class item {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  item({this.id, this.name, this.desc, this.price, this.color, this.image});
}

final products = [    //creating array
  item(   
    id: "001",
    name: "Iphone 12",
    desc: "Super duper fast phone",
    price: 999,
    color: "#33505a",
    image: "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/refurb-iphone-12-mini-white-2020?wid=1144&hei=1144&fmt=jpeg&qlt=90&.v=1635202805000"
)];
