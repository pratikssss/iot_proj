import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class orderpage extends StatefulWidget {
  const orderpage({Key? key}) : super(key: key);
  static const String id = 'orderpage';
  @override
  _orderpageState createState() => _orderpageState();
}

class _orderpageState extends State<orderpage> {
  int a = 0;
  int b = 0;
  int c = 0, d = 0, e = 0, f = 0, g = 0, h = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Text(
              'Inventory Management!!!',
              textAlign: TextAlign.center,
              style: GoogleFonts.alegreya(
                // ignore: prefer_const_constructors
                textStyle: TextStyle(
                  fontSize: 40,
                  color: const Color(0xFF48A9A6),
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            order(a, 'Order for Tomatoes', () {
              setState(() {
                a--;
              });
            }, () {
              setState(() {
                a++;
              });
            }, 'https://mail.google.com/mail/mu/mp/552/#cv/priority/%5Esmartlabel_personal/17d715dc599bf946',
                'https://www.bigbasket.com/basket/?ver=1'),
            order(b, 'Order for Potatoes', () {
              setState(() {
                b--;
              });
            }, () {
              setState(() {
                b++;
              });
            }, 'https://mail.google.com/mail/mu/mp/552/#cv/search/Aws/17cbc45d5480f3fb',
                'https://www.bigbasket.com/basket/?ver=1'),
            order(c, 'Order for Cabbages', () {
              setState(() {
                c--;
              });
            }, () {
              setState(() {
                c++;
              });
            }, 'https://mail.google.com/mail/mu/mp/552/#cv/search/Aws/17cbc45d5480f3fb',
                'https://www.bigbasket.com/basket/?ver=1'),
            order(d, 'Order for Cauliflowers', () {
              setState(() {
                d--;
              });
            }, () {
              setState(() {
                d++;
              });
            }, 'https://mail.google.com/mail/mu/mp/552/#cv/search/Aws/17cbc45d5480f3fb',
                'https://www.bigbasket.com/basket/?ver=1'),
            order(e, 'Order for Apples', () {
              setState(() {
                e--;
              });
            }, () {
              setState(() {
                e++;
              });
            }, 'https://mail.google.com/mail/mu/mp/552/#cv/search/Aws/17cbc45d5480f3fb',
                'https://www.bigbasket.com/basket/?ver=1'),
            order(f, 'Order for Mangoes', () {
              setState(() {
                f--;
              });
            }, () {
              setState(() {
                f++;
              });
            }, 'https://mail.google.com/mail/mu/mp/552/#cv/search/Aws/17cbc45d5480f3fb',
                'https://www.bigbasket.com/basket/?ver=1'),
            order(g, 'Order for Bananas', () {
              setState(() {
                g--;
              });
            }, () {
              setState(() {
                g++;
              });
            }, 'https://mail.google.com/mail/mu/mp/552/#cv/search/Aws/17cbc45d5480f3fb',
                'https://www.bigbasket.com/basket/?ver=1'),
            order(h, 'Order for Capsicum', () {
              setState(() {
                h--;
              });
            }, () {
              setState(() {
                h++;
              });
            }, 'https://mail.google.com/mail/mu/mp/552/#cv/search/Aws/17cbc45d5480f3fb',
                'https://www.bigbasket.com/basket/?ver=1'),
          ],
        ),
      ),
    );
  }
}

class order extends StatelessWidget {
  final String x;
  final int abc;
  final VoidCallback func;
  final VoidCallback func1;
  final String url;
  final String pp;
  order(this.abc, this.x, this.func, this.func1, this.url, this.pp);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Container(
        //   color: Colors.amber,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.lightBlueAccent, width: 10),
            color: Colors.yellow[200]),
        child: Column(
          children: [
            Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: func,
                  child: Icon(
                    Icons.remove,
                    size: 40,
                    color: Colors.green[400],
                  ),
                ),
                TextButton(
                  onPressed: func1,
                  child: Icon(
                    Icons.add,
                    size: 40,
                    color: Colors.green[400],
                  ),
                ),
              ],
            ),
            Text(
              '$abc',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String url1 = url;
                if (await canLaunch(url1)) {
                  await launch(url1);
                } else {
                  throw 'Could not launch $url1';
                }
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                elevation: MaterialStateProperty.all(5),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xFF4A7B9D)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              child: Text('Check for recent emails!!!'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String url = pp;
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                elevation: MaterialStateProperty.all(5),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xFF4A7B9D)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              child: Text(x),
            ),
          ],
        ),
      ),
    );
  }
}
