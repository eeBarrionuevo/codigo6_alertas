import 'dart:io';

import 'package:codigo6_alertas/models/news_model.dart';
import 'package:codigo6_alertas/services/api_service.dart';
import 'package:codigo6_alertas/utils/types.dart';
import 'package:codigo6_alertas/widgets/common_button_widget.dart';
import 'package:codigo6_alertas/widgets/common_texfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:image_picker/image_picker.dart';

class NewsFormPage extends StatefulWidget {
  @override
  State<NewsFormPage> createState() => _NewsFormPageState();
}

class _NewsFormPageState extends State<NewsFormPage> {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _linkController = TextEditingController();

  ImagePicker imagePicker = ImagePicker();

  XFile? image;

  Future<void> getImageGallery() async {
    image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      print(image!.path);
      setState(() {});
    }
  }

  Future<void> getImageCamera() async {
    image = await imagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      print(image!.path);
      setState(() {});
    }
  }

  registerNews() async {
    print(image!.path);
    print(await image!.length());
    File newImageFile = await FlutterNativeImage.compressImage(image!.path);
    print(newImageFile);
    print(newImageFile.lengthSync());

    ApiService apiService = ApiService();
    NewsModel model = NewsModel(
      id: 0,
      link:
          "https://www.youtube.com/watch?v=2pqSKlI3QuU&list=RDGMEMYH9CUrFO7CfLJpaD7UR85w&index=5",
      titulo: "Noticia: Elvis desde el App 3",
      fecha: DateTime.now(),
      imagen: newImageFile.path,
    );

    apiService.registerNews(model);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Text(
                      "Registrar Noticia",
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    CommonTextFieldWidget(
                      label: "Título",
                      hintText: "Ingresa un título",
                      type: InputType.text,
                      controller: _titleController,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CommonTextFieldWidget(
                      label: "Link",
                      hintText: "Ingresa un link",
                      type: InputType.text,
                      controller: _linkController,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              getImageGallery();
                            },
                            icon: Icon(Icons.image),
                            label: Text("Galería"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.indigo,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12.0,
                        ),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              getImageCamera();
                            },
                            icon: Icon(Icons.camera),
                            label: Text("Cámara"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pinkAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // image != null
                    //     ? ClipRRect(
                    //         borderRadius: BorderRadius.circular(12.0),
                    //         child: Image.file(
                    //           File(image!.path),
                    //           height: 200,
                    //         ),
                    //       )
                    //     : Image.asset(
                    //         "assets/images/placeholder.webp",
                    //         height: 200,
                    //       ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      height: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.0),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: image != null
                              ? FileImage(File(image!.path))
                              : const AssetImage(
                                      "assets/images/placeholder.webp")
                                  as ImageProvider,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: CommonButtonWidget(
                text: "Registrar",
                onPressed: () {
                  registerNews();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
