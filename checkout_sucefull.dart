import 'package:anotacoes/bijoutery.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CheckoutSucefull extends StatelessWidget {
  const CheckoutSucefull({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout Succefull',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Obrigado pelo seu pedido!',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: 100,
                      height: 100,
                      child: Image(
                        image: AssetImage('images/checkout.png'),
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Após completar o pagamento pelo App ou pelo site, clique em voltar.',
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Alguma dúvida? Entre em contato:',
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _enviarMensagem();
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.phone_android_rounded,
                                size: 16,
                                color: Color.fromARGB(255, 253, 228, 0),
                              ),
                              SizedBox(width: 5),
                              Text(
                                '(14)99769-2248',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _enviarEmail();
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.mail_outline,
                                size: 16,
                                color: Color.fromARGB(255, 253, 228, 0),
                              ),
                              SizedBox(width: 5),
                              Text(
                                'mateus.fes14@gmail.com',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * .6,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Bijoutery(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Color.fromARGB(255, 246, 233, 112),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Voltar ao início!',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _enviarMensagem() async {
    String url =
        'https://wa.me/5514997692248?text=Ol%C3%A1%2C+gostaria+de+falar+sobre...';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Não foi possível enviar a mensagem';
    }
  }

  void _enviarEmail() async {
    final email = 'mateus.fes14@gmail.com';
    final assunto = 'Compra';
    final corpo = 'Olá, Gostaria de falar sobre...';

    String url = 'mailto:$email?subject=$assunto&body=$corpo';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Não foi possível enviar o e-mail para $email';
    }
  }
}
