import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:padilni/data/endpoints.dart';
import 'package:padilni/data/repositories/items_repository.dart';
import 'package:padilni/models/area/area_model.dart';
import 'package:padilni/models/categories/categories_model.dart';
import 'package:padilni/models/categories/sub_category_model.dart';
import 'package:padilni/models/country/city_model.dart';
import 'package:padilni/models/country/country_model.dart';
import 'package:padilni/models/item_model/add_item_model.dart';
import 'package:padilni/presentation/home/controller/home_controller.dart';
import 'package:padilni/presentation/my_items/controllers/my_items_controller.dart';
import 'package:padilni/utils/colors.dart';
import 'package:padilni/utils/custom_dialogs.dart';
import 'package:padilni/utils/request_status.dart';
import 'package:padilni/utils/utils.dart';
import 'package:padilni/utils/widgets/custom_toasts.dart';

class AddItemController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  RxList<AddImage> images = <AddImage>[].obs;
  RxList<AddImage> editImages = <AddImage>[].obs;

  List<CategoriesModel> categories = [];
  List<SubCategoryModel> subCategories = <SubCategoryModel>[];
  Rx<int?> selectedcategoryId = Rx<int?>(null);
  Rx<int?> selectedsubCategoryId = Rx<int?>(null);

  bool isEdit = false;
  Color? color;
  Rx<RequestStatus> status = RequestStatus.begin.obs;
  Rx<RequestStatus> countriesStatus = RequestStatus.begin.obs;
  final ItemsRepository _repo = ItemsRepository();
  Rx<String> selectedState = ''.obs;
  ItemModel? editedItem;
  Rx<CountryModel?> selectedCountry = Rx(null);
  Rx<CityModel?> selectedCity = Rx(null);
  List<CountryModel> countries = [];
  RxList<CityModel> cities = <CityModel>[].obs;
  RxList<AreaModel> areas = <AreaModel>[].obs;
  Rx<AreaModel?> selectedArea = Rx(null);
  getCountries() async {
    // countriesStatus(RequestStatus.loading);
    final appResponse = await _repo.getCountries();
    if (appResponse.success!) {
      countries = (appResponse.data as List)
          .map((e) => CountryModel.fromMap(e))
          .toList();
      if (isEdit) {
        selectCountry(editedItem!.country_id!);
        selectCity(editedItem!.city_id!);
        selecArea(editedItem!.area_id);
      }
      update();
    } else {
      CustomToasts.ErrorDialog("Cannot Get Countries");
    }
  }

  selectCountry(int id) {
    selectedCountry.value = countries.firstWhere((element) => element.id == id);
    cities.value = selectedCountry.value!.cities;
    selectedCity.value = null;
    selectedArea.value = null;
    areas.value = [];
  }

  selectCity(int id) {
    selectedCity.value = cities.firstWhere((element) => element.id == id);
    areas.value = selectedCity.value!.areas;
  }

  selecArea(int id) {
    selectedArea.value = areas.firstWhere((element) => element.id == id);
  }

  @override
  Future<void> onInit() async {
    // getAreas();
    getCountries();
    isEdit = Get.arguments?['isEdit'] ?? false;
    categories = Get.find<HomeController>().categories;
    if (isEdit) {
      color = Color.fromRGBO(221, 75, 57, 1);
      editedItem = Get.arguments['item'];
      nameController.text = editedItem!.title!;
      descriptionController.text = editedItem!.description!;
      priceController.text = editedItem!.price!.toString();
      selectState(editedItem!.status);

      // selectubCategory(editedItem!.category_id);
      selectCategory(categories
          .firstWhere((element) => element.id == editedItem!.category_id)
          .id);
      // selectCountry(id);
      // selectedsubCategoryId(editedItem!.)
      selectedsubCategoryId.value = editedItem!.sub_category_id;

      for (AddImage image in editedItem!.images) {
        final file = await Utils.fileFromUrl(imagesBaseUrl + image.image!);
        images.add(AddImage(
            imageFile: file, id: image.id, is_default: image.is_default));
      }

      // oldImages.value = editedItem.images;

      // print(editedItem.images[0].image);
    } else {
      color = AppColors.secondaryColor;
    }
    super.onInit();
  }

  addItem() async {
    status(RequestStatus.loading);
    ItemModel addedItem = ItemModel(
      // sub_category_id: selectedsubCategoryId.value!,
      status: selectedState.value,
      area_id: selectedArea.value!.id,
      id: 1,
      title: nameController.text,
      description: descriptionController.text,
      category_id: selectedsubCategoryId.value!,
      images: images,
      price: double.parse(priceController.text),
    );
    final appResponse = await _repo.addItem(addedItem);
    if (appResponse.success!) {
      status(RequestStatus.success);
      Get.back();
      CustomDialogs.successToast("item_add_success".tr);
    } else {
      status(RequestStatus.onerror);
      CustomDialogs.errorToast(appResponse.errorMessage!);
    }
  }

  editItem() async {
    status(RequestStatus.loading);
    ItemModel item = ItemModel(
      // sub_category_id: selectedsubCategoryId.v,
      status: selectedState.value,
      area_id: selectedArea.value!.id,
      id: editedItem!.id,
      title: nameController.text,
      description: descriptionController.text,
      category_id: selectedsubCategoryId.value!,
      images: editImages,
      price: double.parse(priceController.text),
    );

    final appResponse = await _repo.editItem(item);
    if (appResponse.success!) {
      status(RequestStatus.success);
      Get.find<MyItemsController>().getMyItems();
      Get.back();
      CustomDialogs.successToast("item_edit_success".tr);
    } else {
      status(RequestStatus.onerror);
      CustomDialogs.errorToast(appResponse.errorMessage!);
    }
  }

  // getAreas() async {
  //   areasStatus(RequestStatus.loading);
  //   final appResponse = await _repo.getAreas();
  //   if (appResponse.success!) {
  //     areas =
  //         (appResponse.data as List).map((e) => AreaModel.fromMap(e)).toList();
  //     areasStatus(RequestStatus.success);
  //     if (isEdit) {
  //       selectedareaId.value = editedItem!.area_id;
  //     }
  //   } else {
  //     CustomDialogs.errorToast(appResponse.errorMessage!);
  //     areasStatus(RequestStatus.onerror);
  //   }
  // }

  selectState(String state) {
    selectedState.value = state;
  }

  getSubCategories() async {
    final appResponse = await _repo.getSubCategories(selectedcategoryId.value!);
    if (appResponse.success!) {
      subCategories = (appResponse.data as List)
          .map((e) => SubCategoryModel.fromMap(e))
          .toList();
      update();
    }
  }

  selectCategory(int v) {
    print("***********$v");
    subCategories.clear();
    update();
    selectedcategoryId.value = v;
    getSubCategories();
    print(subCategories);
    update();
  }

  Future<void> pickImage(bool replace, {AddImage? replacedImage}) async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      if (isEdit) {
        if (replace) {
          editImages.add(
            AddImage(imageFile: File(pickedFile.path), flag: 1),
          );
          editImages.add(AddImage(id: replacedImage!.id, flag: -1));
          final int index =
              images.indexWhere((element) => element.id == replacedImage.id);
          images.remove(replacedImage);
          images.insert(
              index, AddImage(imageFile: File(pickedFile.path), flag: 1));
        } else {
          editImages.add(
            AddImage(imageFile: File(pickedFile.path), flag: 1),
          );
          images.add(AddImage(imageFile: File(pickedFile.path), flag: 1));
        }
      } else {
        images.add(AddImage(imageFile: File(pickedFile.path), flag: 1));
      }
    }
  }

  void removeImage(AddImage image) {
    images.remove(image);
    if (isEdit) {
      editImages.add(AddImage(
        id: image.id,
        flag: -1,
      ));
    }
  }
}
