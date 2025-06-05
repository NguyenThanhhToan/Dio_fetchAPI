import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/formDataDioController.dart';

class UploadBookPage extends StatelessWidget {
  UploadBookPage({Key? key}) : super(key: key);

  final FormDataDioController controller = Get.put(FormDataDioController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Upload Book')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              onChanged: (val) => controller.title.value = val,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              onChanged: (val) => controller.categoryIds.value = val,
              decoration: const InputDecoration(labelText: 'Category IDs'),
            ),
            TextField(
              onChanged: (val) => controller.authorId.value = val,
              decoration: const InputDecoration(labelText: 'Author ID'),
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                ElevatedButton(
                  onPressed: controller.pickImage,
                  child: const Text('Chọn ảnh'),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Obx(() {
                    final path = controller.imagePath.value;
                    return Text(
                      path != null ? path.split('/').last : 'Chưa chọn ảnh',
                      overflow: TextOverflow.ellipsis,
                    );
                  }),
                ),
              ],
            ),

            const SizedBox(height: 8),

            Row(
              children: [
                ElevatedButton(
                  onPressed: controller.pickPdfFile,
                  child: const Text('Chọn file PDF'),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Obx(() {
                    final path = controller.pdfFilePath.value;
                    return Text(
                      path != null ? path.split('/').last : 'Chưa chọn file PDF',
                      overflow: TextOverflow.ellipsis,
                    );
                  }),
                ),
              ],
            ),

            const SizedBox(height: 24),

            Obx(() {
              if (controller.isLoading.value) {
                return const CircularProgressIndicator();
              }
              return ElevatedButton(
                onPressed: controller.uploadBook,
                child: const Text('Upload'),
              );
            }),

            const SizedBox(height: 12),

            Obx(() {
              if (controller.errorMessage.isNotEmpty) {
                return Text(
                  controller.errorMessage.value,
                  style: const TextStyle(color: Colors.red),
                );
              }
              if (controller.response.value != null) {
                return Text(
                  'Upload thành công! Status: ${controller.response.value!.statusCode}',
                  style: const TextStyle(color: Colors.green),
                );
              }
              return const SizedBox.shrink();
            }),
          ],
        ),
      ),
    );
  }
}
