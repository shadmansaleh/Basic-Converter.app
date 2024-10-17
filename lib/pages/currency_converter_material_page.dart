import 'package:flutter/material.dart';

class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> {
  double result = 0;
  final TextEditingController inputBoxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void onSubmitHandler() {
      setState(() {
        result = double.parse(inputBoxController.text) * 2.54;
      });
    }

    OutlineInputBorder widthBorder(double width, {Color? color}) =>
        OutlineInputBorder(
          borderSide: BorderSide(width: width, color: color ?? Colors.cyan),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Converter"),
        centerTitle: true,
        backgroundColor: Colors.cyan[300],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 48.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: Text(
                      result.toString(),
                      style: const TextStyle(
                          fontSize: 80,
                          fontWeight: FontWeight.w200,
                          color: Colors.blue),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: const Text(
                      "cm",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w200,
                          color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                  signed: true,
                ),
                controller: inputBoxController,
                onSubmitted: (value) => onSubmitHandler(),
                decoration: InputDecoration(
                  hintText: "Please enter value in inch",
                  hintStyle:
                      const TextStyle(fontSize: 16, color: Colors.black45),
                  prefixIcon: const Icon(Icons.equalizer_outlined),
                  prefixIconColor: Colors.black45,
                  enabledBorder: widthBorder(0.8),
                  focusedBorder: widthBorder(2),
                  suffix: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "inch",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Colors.black45),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16, left: 8, right: 8),
              child: ElevatedButton(
                onPressed: onSubmitHandler,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  foregroundColor: Colors.white,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  "Convert",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() =>
      _CurrencyConverterMaterialPageState();
}
