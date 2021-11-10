class UrlList {
  static final BASE_URL = "http://beta.connectingalife.com/api/";
  static final REGISTER = "http://beta.connectingalife.com/register";
  static final PINCODE = BASE_URL + "geo-locations?postal_code=";
  static final AGENT_LIST = BASE_URL + "user_agents";
  static final SEND_OTP = BASE_URL + "send-otp";
  static final POST_REQUIREMENT = BASE_URL + "post-requirements";
  static final POSTED_LIST = BASE_URL + "posted-requirements";

  static String UPLOAD_IMAGE = BASE_URL + "imageUpload";

  static String LOGIN = BASE_URL + "login";
  static String USER_DETAILS = BASE_URL + "me?token=";
  static String FORGOT_PASSWORD = BASE_URL + "forgotPassword";
  static String CHECK_USER = BASE_URL + "checkUserEmail";
  static String CHECK_USER_MOBILE = BASE_URL + "checkMobileNumber";
  static String CHNAGE_PASSWORD = BASE_URL + "changePassword";
}
