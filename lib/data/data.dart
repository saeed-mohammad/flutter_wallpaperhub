
import '../model/categories_model.dart';

String apiKey = "7zcBWKEJGdXxpp7GwkxflI5PRUfAzjaSUx70QjXte5hAaCpZJnPkLXW0";
List<CategoriesModel> getCategories(){
  List<CategoriesModel> categories = [
    CategoriesModel(categoryName: 'Street Art', imgUrl: 'https://images.pexels.com/photos/162379/lost-places-pforphoto-leave-factory-162379.jpeg?auto=compress&cs=tinysrgb&w=800'),
    CategoriesModel(categoryName: 'Wild Life', imgUrl: 'https://images.pexels.com/photos/16066/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=800'),
    CategoriesModel(categoryName: 'Cars', imgUrl: 'https://images.pexels.com/photos/210019/pexels-photo-210019.jpeg?auto=compress&cs=tinysrgb&w=800'),
    CategoriesModel(categoryName: 'Nature', imgUrl: 'https://images.pexels.com/photos/3408744/pexels-photo-3408744.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
    CategoriesModel(categoryName: 'Cityscapes', imgUrl: 'https://images.pexels.com/photos/1519088/pexels-photo-1519088.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
    CategoriesModel(categoryName: 'Food', imgUrl: 'https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
  ];
  return categories;
}