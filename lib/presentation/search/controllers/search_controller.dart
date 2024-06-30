import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padilni/data/repositories/items_repository.dart';
import 'package:padilni/models/area/area_model.dart';
import 'package:padilni/models/country/city_model.dart';
import 'package:padilni/models/country/country_model.dart';
import 'package:padilni/models/item_model/add_item_model.dart';
import 'package:padilni/utils/request_status.dart';
import 'package:padilni/utils/widgets/custom_toasts.dart';

class SearchScreenController extends GetxController {
  List<ItemModel> items = [
    // ProductModel(
    //     id: 1,
    //     name: "Market",
    //     image:
    //         "https://www.collinsdictionary.com/images/full/market_large_354703739_1000.jpg",
    //     type: "Food"),
    // ProductModel(
    //     id: 1,
    //     name: "Box",
    //     image:
    //         "https://www.tinyboxcompany.co.uk/media/catalog/product/F/M/FMKRCU_22.jpg?width=800&height=800&store=default&image-type=image",
    //     type: "Stuff"),
    // ProductModel(
    //     id: 1,
    //     name: "Box",
    //     image:
    //         "https://www.tinyboxcompany.co.uk/media/catalog/product/F/M/FMKRCU_22.jpg?width=800&height=800&store=default&image-type=image",
    //     type: "Stuff"),
    // ProductModel(
    //     id: 1,
    //     name: "Box",
    //     image:
    //         "https://www.tinyboxcompany.co.uk/media/catalog/product/F/M/FMKRCU_22.jpg?width=800&height=800&store=default&image-type=image",
    //     type: "Stuff"),
    // ProductModel(
    //     id: 1,
    //     name: "Box",
    //     image:
    //         "https://www.tinyboxcompany.co.uk/media/catalog/product/F/M/FMKRCU_22.jpg?width=800&height=800&store=default&image-type=image",
    //     type: "Stuff"),
    // ProductModel(
    //     id: 1,
    //     name: "Box",
    //     image:
    //         "https://www.tinyboxcompany.co.uk/media/catalog/product/F/M/FMKRCU_22.jpg?width=800&height=800&store=default&image-type=image",
    //     type: "Stuff"),
  ];
  RxString selectedState = ''.obs;
  Rx<CountryModel?> selectedCountry = Rx(null);
  Rx<CityModel?> selectedCity = Rx(null);
  List<CountryModel> countries = [];
  RxList<CityModel> cities = <CityModel>[].obs;
  RxList<AreaModel> areas = <AreaModel>[].obs;
  Rx<AreaModel?> selectedArea = Rx(null);
  final ItemsRepository _repo = ItemsRepository();
  Rx<RequestStatus> status = RequestStatus.begin.obs;
  TextEditingController searchController = TextEditingController();
  getCountries() async {
    final appResponse = await _repo.getCountries();
    if (appResponse.success!) {
      countries = (appResponse.data as List)
          .map((e) => CountryModel.fromMap(e))
          .toList();
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
    searchItems();
  }

  selectCity(int id) {
    selectedCity.value = cities.firstWhere((element) => element.id == id);
    areas.value = selectedCity.value!.areas;
    searchItems();
  }

  selecArea(int id) {
    selectedArea.value = areas.firstWhere((element) => element.id == id);
    searchItems();
  }

  selectState(String state) {
    selectedState.value = state;
    searchItems();
  }

  searchItems() async {
    status(RequestStatus.loading);
    print(searchController.text);
    final appResponse = await _repo.searchItems(
        country_id: selectedCountry.value?.id,
        city_id: selectedCity.value?.id,
        area_id: selectedArea.value?.id,
        status: selectedState.value.toLowerCase(),
        search_text:
            searchController.text.isEmpty ? null : searchController.text);
    if (appResponse.success!) {
      items =
          (appResponse.data as List).map((e) => ItemModel.fromMap(e)).toList();
      if (items.isNotEmpty) {
        status(RequestStatus.success);
      } else {
        status(RequestStatus.nodata);
      }
    } else {
      status(RequestStatus.onerror);
      CustomToasts.ErrorDialog(appResponse.errorMessage!);
    }
  }

  clearFilters() {
    selectedCountry.value = null;
    selectedCity.value = null;
    selectedArea.value = null;
    selectedState("");
    searchController.clear();
  }

  @override
  void onInit() {
    getCountries();
    searchItems();
    super.onInit();
  }
}
