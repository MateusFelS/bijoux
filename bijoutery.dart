import 'package:anotacoes/details.dart';
import 'package:flutter/material.dart';
import 'checkout.dart';

class Bijoutery extends StatefulWidget {
  @override
  State<Bijoutery> createState() => _BijouteryState();
}

class _BijouteryState extends State<Bijoutery> {
  List<Product> products = [
    Product(
        'Colar de Prata',
        'images/colar_prata.jpg',
        50.00,
        "Um acessório coringa que não pode faltar no seu porta joias. Fácil de combinar com qualquer look, combina com todos os tipos de brincos, colares, pulseiras e anéis. Não tem erro mesmo!",
        5),
    Product(
        'Bracelete de Diamante',
        'images/bracelete_diamante.jpg',
        200.00,
        "Este bracelete de diamante é perfeito para quem busca uma joia que destaque em qualquer ocasião. Com um design minimalista e uma qualidade de diamante de alta pureza, este bracelete é uma escolha inesquecível para quem valoriza a beleza e a durabilidade.",
        4),
    Product(
        'Anel de Pérola',
        'images/anel_perola.jpg',
        400.00,
        "O Anel de Pérola de Ouro 18k é um item de joia elegante e sofisticado, perfeito para adicionar um toque de luxo e sofisticação a qualquer look. Este colar é feito de ouro 18 quilates, que é uma aliação de ouro e outros metais, como cobre ou zinco, para aumentar a sua resistência e durabilidade. A escolha do ouro 18k é uma decisão inteligente para quem busca uma joia que não apenas seja bonita, mas também prática e acessível.",
        4),
    Product(
        'Pulseira de Ouro',
        'images/pulseira_ouro.jpg',
        350.00,
        "A Pulseira de Ouro é um item de jóia exuberante, feito de ouro puro, que destaca a elegância e a sofisticação. Este acessório é perfeito para complementar qualquer look, seja para ocasiões formais ou mais casuais. A pulseira é projetada com cuidado para ser leve e confortável, garantindo que você possa usá-la sem se preocupar com desconforto.",
        5),
    Product(
        'Brincos de Prata',
        'images/brincos_prata.jpg',
        97.00,
        "Brinco de prata elegante, com pingente em forma de coração cravejado de 2 cm de diâmetro, perfeito para adicionar um toque sofisticado e feminino a qualquer ocasião. Este brinco de prata é feito com a mais alta qualidade de metal, garantindo durabilidade e um brilho que nunca desaparece. O pingente em forma de coração é detalhado com pedras preciosas, realçando a beleza e a elegância do brinco. Ideal para quem busca um acessório que combine estilo e sofisticação.",
        3),
    Product(
        'Conjunto de Bijuterias',
        'images/conjunto_bijuterias.jpg',
        25.00,
        "Este conjunto é perfeito para quem busca uma expressão de estilo sofisticado e elegância, combinando peças que se complementam harmoniosamente. Cada peça é feita com ouro de alta qualidade, garantindo uma aparência luxuosa e durável.",
        4),
  ];

  List<Product> adicionais = [
    Product(
        'Colar de Ouro',
        'images/colar_ouro.jpg',
        24.00,
        "O Colar de Ouro é uma peça de jóia que combina a beleza do ouro com a elegância de um design sofisticado. Este colar é feito com ouro puro, garantindo uma aparência luxuosa e durável. O design do colar é intrincado, com detalhes delicados que destacam a habilidade do artesão.",
        5),
    Product(
        'Anel de Diamante',
        'images/anel_diamante.jpg',
        700.00,
        "Este anel é feito com diamantes de alta qualidade, garantindo uma aparência luxuosa e durável. Os diamantes são escolhidos cuidadosamente para garantir que cada um tenha a cor e a brilho perfeitos, destacando a beleza natural do ouro ou platina que serve como base do anel.",
        5),
    Product(
        'Bracelete de Prata',
        'images/bracelete_prata.jpg',
        70.00,
        "Este bracelete é feito com prata de alta qualidade, garantindo uma aparência luxuosa e durável. A prata é escolhida por sua cor suave e por sua capacidade de refletir a luz, criando um visual delicado e sofisticado.",
        4),
  ];

  List<Product> selectedProducts = [];
  double preco = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bijoux',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/logo_promocional.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
              // Ad
            ),

            SizedBox(height: 20),
            // Seção Novidades
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Novidades',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 240,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: products
                    .map((product) => buildProductCard(product))
                    .toList(),
              ),
            ),
            SizedBox(height: 10),
            // Seção Adicionais
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Adicionais',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 240,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: adicionais
                    .map((product) => buildProductCard(product))
                    .toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .9,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Color.fromARGB(255, 246, 233, 112),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Ir para o Pagamento',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () => navigateToCheckout(context),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProductCard(Product product) {
    return GestureDetector(
      onTap: () {
        navigateToDetails(context, product);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 230,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.9),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                child: Image.asset(
                  product.imagePath,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.productName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color.fromARGB(255, 246, 233, 112),
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        QuantityControl(
                          product: product,
                          onQuantityChanged: () {
                            setState(() {
                              updatePrecoTotal();
                            });
                          },
                          onProductSelected: (isSelected) {
                            setState(() {
                              if (isSelected) {
                                selectedProducts.add(product);
                                preco += product.price;
                              } else {
                                selectedProducts.remove(product);
                                preco -= product.price;
                              }
                            });
                          },
                          preco: preco,
                          navigateToCheckout: navigateToCheckout,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToDetails(BuildContext context, Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Details(
          productName: product.productName,
          imagePath: product.imagePath,
          price: product.price,
          description: product.description,
          rating: product.rating,
        ),
      ),
    );
  }

  void updatePrecoTotal() {
    setState(() {
      preco = selectedProducts
          .map((product) => product.price * product.quantity)
          .fold(0, (previous, current) => previous + current);
    });
  }

  void navigateToCheckout(BuildContext context) {
    // Filtra os produtos selecionados que têm quantidade maior que 0
    List<Product> selectedItems =
        selectedProducts.where((product) => product.quantity > 0).toList();

    // Cria listas contendo apenas os nomes, quantidades e preços dos produtos selecionados
    List<String> itemNames =
        selectedItems.map((product) => product.productName).toList();
    List<int> itemQuantities =
        selectedItems.map((product) => product.quantity).toList();
    List<double> itemPrices =
        selectedItems.map((product) => product.price).toList();

    // Navega para a página de checkout com os dados dos produtos selecionados
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Checkout(
          itemNames: itemNames,
          itemQuantities: itemQuantities,
          totalPrice: preco,
          itemPrices:
              itemPrices, // Passando a lista de preços dos produtos selecionados
        ),
      ),
    );
  }
}

class QuantityControl extends StatelessWidget {
  final Product product;
  final VoidCallback onQuantityChanged;
  final ValueChanged<bool> onProductSelected;
  final double preco;
  final Function(BuildContext) navigateToCheckout;

  QuantityControl({
    required this.product,
    required this.onQuantityChanged,
    required this.onProductSelected,
    required this.preco,
    required this.navigateToCheckout,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                product.decrementQuantity();
                onQuantityChanged();
              },
              icon: Icon(
                Icons.remove,
                color: Colors.white,
              ),
            ),
            Text(
              product.quantity.toString(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                product.incrementQuantity();
                onQuantityChanged();
              },
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {
            product.toggleSelection();
            onProductSelected(product.isSelected);
          },
          icon: Icon(
            Icons.shopping_bag_rounded,
            color: product.getIconColor(),
          ),
        ),
      ],
    );
  }
}

class Product {
  String productName;
  String imagePath;
  double price;
  int quantity;
  String description;
  int rating;
  bool isSelected;

  Product(this.productName, this.imagePath, this.price, this.description,
      this.rating,
      {this.quantity = 0, this.isSelected = false});

  void incrementQuantity() {
    quantity++;
  }

  void decrementQuantity() {
    if (quantity > 0) {
      quantity--;
    }
  }

  void toggleSelection() {
    isSelected = !isSelected;
  }

  Color getIconColor() {
    if (quantity > 0 && isSelected) {
      return Color.fromARGB(255, 42, 246, 137);
    } else {
      return const Color.fromARGB(255, 244, 101, 54);
    }
  }
}
