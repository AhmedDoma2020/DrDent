mixin ApiKey{


   static const String apiBaseUrl = 'http://dr-dent.crazyideaco.com/api/';


   final String uRLLogin = apiBaseUrl + "login";
   final String uRLRegister = apiBaseUrl + "register";
   final String uRLLoginWithEmail = apiBaseUrl + "login_with_gmail";
   final String uRLVerifyPhone = apiBaseUrl + "verify_phone";
   final String uRLSetWorkLicense = apiBaseUrl + "set_work_lisence";
// for doctor
   final String uRLAddWorkSpaceDetails = apiBaseUrl + "set_work_space_properaties";
   final String uRLAddDayTime = apiBaseUrl + "add_work_space_time";
   final String uRLDeleteDayTime = apiBaseUrl + "delete_work_space_time";
   final String uRLDoctorWorkDays = apiBaseUrl + "fetch_doctor_work_times";
// for center
   final String uRLAddDayTimeForCenter = apiBaseUrl + "add_work_center_day";
   final String uRLDeleteDayTimeForCenter = apiBaseUrl + "delete_work_center_day";
   final String uRLDoctorWorkDaysForCenter = apiBaseUrl + "fetch_my_center_days";
// for Company
   final String uRLAddDayTimeForCompany = apiBaseUrl + "add_work_user_day";
   final String uRLDeleteDayTimeForCompany = apiBaseUrl + "delete_work_user_day";
   final String uRLDoctorWorkDaysForCompany = apiBaseUrl + "fetch_my_user_days";


   final String uRLEditDayTime = apiBaseUrl + "delete_work_space_time";
   final String uRLFetchJobRequests = apiBaseUrl + "fetch_job_requests";
   final String uRLFetchPosts = apiBaseUrl + "fetch_social";
   final String uRLFetchMyPosts = apiBaseUrl + "my_posts";
   final String uRLStore = apiBaseUrl + "fetch_social";
   final String uRLFetchStore = apiBaseUrl + "fetch_store";
   final String uRLFetchPostComments = apiBaseUrl + "fetch_post_comments";
   final String uRLFetchJobOffers = apiBaseUrl + "fetch_job_offers";
   final String uRLFetchHomeVisits = apiBaseUrl + "home_visits";
   final String uRLFinishVisits = apiBaseUrl + "fetch_finish_visits";
   final String uRLWaitingVisits = apiBaseUrl + "fetch_waiting_visits";
   final String uRLAllNewVisits = apiBaseUrl + "all_new_visits";
   final String uRLAllFetchAllProducts = apiBaseUrl + "fetch_all_products";
   final String uRLCompanyFetchAllProducts = apiBaseUrl + "store_products";
   final String uRLCompanyAddProduct = apiBaseUrl + "company_add_product";
   final String uRLFetchCategories = apiBaseUrl + "fetch_categories";
   final String uRLAllFetchAllStores = apiBaseUrl + "fetch_all_Stores";
   final String uRLLikePost = apiBaseUrl + "like_post";
   final String uRLSharePost = apiBaseUrl + "share_post";
   final String uRLLikeComment = apiBaseUrl + "like_comment";
   final String uRLAddComment = apiBaseUrl + "add_comment";
   final String uRLAddJobOffer = apiBaseUrl + "add_job_offer";
   final String uRLEditJobOffer = apiBaseUrl + "edit_job_offer";
   final String uRLDeleteJobOffer = apiBaseUrl + "delete_job_offer";
   final String uRLDeleteJobRequest = apiBaseUrl + "delete_job_request";
   final String uRLLikeProduct = apiBaseUrl + "favorite_Product";

   final String uRLRequestProductPrice = apiBaseUrl + "send_product_information";
   final String uRLSearchDoctors = apiBaseUrl + "search_doctors";


   // String URLFetchMajorCategorySellers(int page)=>apiBaseUrl + "major_shops"+'?page=$page'; // soon


// New ApiKey For Pickup
   final String uRLResetPassword = apiBaseUrl + "reset_password";
   final String uRLSetExperienceYears = apiBaseUrl + "set_experience_years";
   final String uRLSetCommercialRegistrationAndTaxCard = apiBaseUrl + "company_set_store_info";
   final String uRLSetWorkSpace = apiBaseUrl + "set_work_space";
   final String uRLEditWorkSpace = apiBaseUrl + "edit_work_space";
   final String uRLCheckPhone = apiBaseUrl + "check_phone";
   final String uRLCity = apiBaseUrl + "city";
   final String uRLFetchAvailableInsurances = apiBaseUrl + "fetch_available_insurances";
   final String uRLFetchAvailableServices = apiBaseUrl + "fetch_available_services";
   final String uRLFetchMyInsurances = apiBaseUrl + "fetch_my_insurances";
   final String uRLFetchMyServices = apiBaseUrl + "fetch_my_services";
   final String uRLFetchMyOffer = apiBaseUrl + "my_offers";
   final String uRLFetchMyWorkSpaces = apiBaseUrl + "my_work_spaces";
   final String uRLDeleteMyWorkSpaces = apiBaseUrl + "delete_work_space";
   final String uRLFetchMyAssistant = apiBaseUrl + "my_assitants";
   final String uRLFetchMyOfferAndDiscount = apiBaseUrl + "my_offers";
   final String uRLDeleteInsurance = apiBaseUrl + "delete_insurance";
   final String uRLDeleteServices = apiBaseUrl + "delete_service";
   final String uRLDeleteAssistant = apiBaseUrl + "delete_assitant";
   final String uRLDeleteOfferAndDiscount = apiBaseUrl + "delete_offer";
   final String uRLSetInsurance = apiBaseUrl + "set_insurance";
   final String uRLSetAssistant = apiBaseUrl + "set_assitant";
   final String uRLEditAssistant = apiBaseUrl + "edit_assitant";
   final String uRLSetService = apiBaseUrl + "set_service";
   final String uRLNewVisits = apiBaseUrl + "all_new_visits";
   final String uRLSetOfferAndDiscount = apiBaseUrl + "add_offer";
   final String uRLFetchProfile = apiBaseUrl + "fetch_profile";
   final String uRLFetchScientific = apiBaseUrl + "fetch_seintific_levels";
   final String uRLFetchSpecialization = apiBaseUrl + "specializations";
   final String uRLEnterAndEditPersonalDataOfDoctor = apiBaseUrl + "edit_doctor_personal_info";
   final String uRLEnterAndEditPersonalDataOfCompanyAndCenter = apiBaseUrl + "company_edit_general_info";
   final String uRLEnterAndEditPersonalDataOfGraduated = apiBaseUrl + "edit_graduate_personal_info";
   final String uRLAddJopRequest = apiBaseUrl + "add_job_request";
   final String uRLEditJopRequest = apiBaseUrl + "edit_job_request";
   final String uRLAddAJopOffer = apiBaseUrl + "add_job_offer";
   final String uRLStates = apiBaseUrl + "states";
   final String uRLFetchUniversity = apiBaseUrl + "universities";
   final String uRLFetchCenterDoctor = apiBaseUrl + "center_doctors";
   final String uRLDeleteCenterDoctor = apiBaseUrl + "center_delete_doctor";
   final String uRLAddDoctorCertification = apiBaseUrl + "add_doctor_certificates";
   final String uRLDeleteDoctorCertification = apiBaseUrl + "delete_doctor_certificate";
   final String uRLFetchDoctorCertification = apiBaseUrl + "fetch_doctor_certificate";
   final String uRLCenterAddDoctor = apiBaseUrl + "center_add_doctor";
   final String uRLSetAvatar = apiBaseUrl + "set_user_image";
   final String uRLSetCover = apiBaseUrl + "set_cover_image";
   final String uRLAddPost = apiBaseUrl + "add_post";
   final String uRLEditPost = apiBaseUrl + "edit_post";
   final String uRLDeletePost = apiBaseUrl + "delete_post";
   final String uRLJobTitles = apiBaseUrl + "job_titles";
}
