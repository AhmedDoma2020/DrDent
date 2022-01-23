mixin ApiKey{


   static const String apiBaseUrl = 'http://dr-dent.crazyideaco.com/api/';


   final String uRLLogin = apiBaseUrl + "login";
   final String uRLRegister = apiBaseUrl + "register";
   final String uRLLoginWithEmail = apiBaseUrl + "login_with_gmail";
   final String uRLVerifyPhone = apiBaseUrl + "verify_phone";
   final String uRLSetWorkLicense = apiBaseUrl + "set_work_lisence";

   final String uRLDoctorWorkDays = apiBaseUrl + "fetch_doctor_work_times";
   final String uRLAddDayTime = apiBaseUrl + "add_work_space_time";
   final String uRLDeleteDayTime = apiBaseUrl + "delete_work_space_time";
   final String uRLEditDayTime = apiBaseUrl + "delete_work_space_time";
   final String uRLFetchJobRequests = apiBaseUrl + "fetch_job_requests";
   final String uRLFetchPosts = apiBaseUrl + "fetch_social";
   final String uRLStore = apiBaseUrl + "fetch_social";
   final String uRLFetchStore = apiBaseUrl + "fetch_store";
   final String uRLFetchPostComments = apiBaseUrl + "fetch_post_comments";
   final String uRLFetchJobOffers = apiBaseUrl + "fetch_job_offers";
   final String uRLFetchHomeVisits = apiBaseUrl + "home_visits";
   final String uRLFinishVisits = apiBaseUrl + "fetch_finish_visits";
   final String uRLWaitingVisits = apiBaseUrl + "fetch_waiting_visits";
   final String uRLAllNewVisits = apiBaseUrl + "all_new_visits";
   final String uRLAllFetchAllProducts = apiBaseUrl + "fetch_all_products";
   final String uRLAllFetchAllStores = apiBaseUrl + "fetch_all_Stores";
   final String uRLLikePost = apiBaseUrl + "like_post";
   final String uRLLikeComment = apiBaseUrl + "like_comment";
   final String uRLAddComment = apiBaseUrl + "add_comment";



   // String URLFetchMajorCategorySellers(int page)=>apiBaseUrl + "major_shops"+'?page=$page'; // soon


// New ApiKey For Pickup
   final String uRLResetPassword = apiBaseUrl + "reset_password";
   final String uRLSetExperienceYears = apiBaseUrl + "set_experience_years";
   final String uRLSetCommercialRegistrationAndTaxCard = apiBaseUrl + "company_set_store_info";
   final String uRLSetWorkSpace = apiBaseUrl + "set_work_space";
   final String uRLCheckPhone = apiBaseUrl + "check_phone";
   final String uRLCity = apiBaseUrl + "city";
   final String uRLFetchAvailableInsurances = apiBaseUrl + "fetch_available_insurances";
   final String uRLFetchAvailableServices = apiBaseUrl + "fetch_available_services";
   final String uRLFetchMyInsurances = apiBaseUrl + "fetch_my_insurances";
   final String uRLFetchMyServices = apiBaseUrl + "fetch_my_services";
   final String uRLFetchMyWorkSpaces = apiBaseUrl + "my_work_spaces";
   final String uRLDeleteMyWorkSpaces = apiBaseUrl + "delete_work_space_time";
   final String uRLFetchMyAssistant = apiBaseUrl + "my_assitants";
   final String uRLFetchMyOfferAndDiscount = apiBaseUrl + "my_offer";
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
   final String uRLEnterAndEditMyPersonalData = apiBaseUrl + "edit_personal_info";
   final String uRLAddJopRequest = apiBaseUrl + "add_job_request";
   final String uRLAddAJopOffer = apiBaseUrl + "add_job_offer";
   final String uRLStates = apiBaseUrl + "states";
   final String uRLFetchUniversity = apiBaseUrl + "fetch_univeristy";
   final String uRLFetchCenterDoctor = apiBaseUrl + "center_doctors";
   final String uRLDeleteCenterDoctor = apiBaseUrl + "center_delete_doctor";
}
