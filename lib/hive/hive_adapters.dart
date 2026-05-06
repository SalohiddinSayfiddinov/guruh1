import 'package:guruh1/features/home/models/post.dart';
import 'package:guruh1/features/products/models/product_model.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

@GenerateAdapters([AdapterSpec<Post>(), AdapterSpec<Product>()])
part 'hive_adapters.g.dart';
