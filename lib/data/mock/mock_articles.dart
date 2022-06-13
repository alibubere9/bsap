// import 'package:classified_app/data/mock/mock_categories.dart';
// import 'package:classified_app/data/models/article.dart';
// import 'package:classified_app/data/models/review.dart';

// class MockArticles {
//   static List<ArticleModel> _articles = List.generate(
//     7,
//     (index) => ArticleModel(
//       description: 'Description',
//       subHeading: 'Hospitality, Lots, Of, Other',
//       address:
//           'Chhatrapati Shivaji International Airport, IA Project Rd, Navpada, Vile Parle East, Vile Parle, Andheri, Maharashtra ',
//       availability: '24 hours',
//       contactNo: '+918668821214',
//       id: index,
//       images: [
//         'https://lh3.googleusercontent.com/p/AF1QipM87tECa_FdJm99M3HkvP2diELaHJ6guWCrq0fO=w296-h202-n-k-rw-no-v1',
//         'https://lh3.googleusercontent.com/p/AF1QipO1V9h6A_DgitDjisCIGQTJ2N6c-8Q8MfVnFbCQ=w296-h202-n-k-rw-no-v1'
//       ],
//       latitude: 19.10208522795699,
//       longitude: 72.82618059233542,
//       location: 'Mumbai',
//       heading: 'J.W. Marriott',
//       rating: 5.0,
//       totalRatings: 97,
//       reviews: List.generate(
//         4,
//         (index) => ReviewModel(
//           name: 'Ali Bubere',
//           review:
//               'Something is very good and not everything but somewhat something and some of the thing and the test message is going really goood.',
//           rating: 5.0,
//         ),
//       ),
//       categories: MockCategories.allCategories
//           .sublist(5, 10)
//           .map((e) => e.name)
//           .toList(),
//     ),
//   );
//   static List<ArticleModel> get all => _articles;
//   static ArticleModel getbyId(int id) =>
//       _articles.firstWhere((element) => element.id == id);
// }
