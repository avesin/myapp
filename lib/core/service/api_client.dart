import 'package:dio/dio.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:myapp/core/model/data/user.dart';
import 'package:myapp/core/model/payload/check_username_payload.dart';
import 'package:myapp/core/model/payload/interest_payload.dart';
import 'package:myapp/core/model/payload/login_payload.dart';
import 'package:myapp/core/model/payload/profile_payload.dart';
import 'package:myapp/core/model/payload/register_payload.dart';
import 'package:myapp/core/model/payload/token_payload.dart';
import 'package:myapp/core/model/response/check_username_response.dart';
import 'package:myapp/core/model/response/base_response.dart';
import 'package:myapp/core/model/response/interest_response.dart';
import 'package:myapp/core/model/response/login_response.dart';
import 'package:myapp/core/model/response/token_response.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: '')
abstract class ApiClient {
  factory ApiClient(Dio dio, {required String? baseUrl}) {
    final url = baseUrl.isBlank == true ? dotenv.env['API_URL'] : baseUrl;
    print("${baseUrl.isBlank == true} :: $baseUrl :: ${dotenv.env['API_URL']}");
    return _ApiClient(dio, baseUrl: url);
  }

  @GET("/check-username")
  Future<BaseResponse<CheckUsernameResponse>> checkUsername(
    @Queries() CheckUsernamePayload payload,
  );

  @POST("/register")
  Future<BaseResponse> register(@Body() RegisterPayload payload);

  @POST("/login")
  Future<BaseResponse<LoginResponse>> login(@Body() LoginPayload payload);

  @GET("/profile")
  Future<BaseResponse<ProfilePayload>> profile();

  @PUT("/profile")
  Future<BaseResponse<ProfilePayload>> updateProfile(
    @Body() ProfilePayload payload,
  );

  @POST("/user")
  Future<BaseResponse<User>> user();

  @POST("/refresh-token")
  Future<BaseResponse<TokenResponse>> refreshToken(
    @Body() TokenPayload payload,
  );

  @GET("/interest")
  Future<BaseResponse<InterestResponse>> getInterest();

  @PUT("/interest")
  Future<BaseResponse<InterestResponse>> updateInterest(
    @Body() InterestPayload interests,
  );
}
