library swagger_built_value;

import 'package:build/build.dart';
import 'src/builder.dart';

Builder swaggerChopperBuilder(BuilderOptions options) =>
    SwaggerBuiltValueBuilder(options);
