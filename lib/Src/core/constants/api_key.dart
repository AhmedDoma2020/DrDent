mixin ApiKey{


   static const String apiBaseUrl = 'https://dr-dent.crazyideaco.com/api/';


   final String uRLLogin = apiBaseUrl + "login";
<<<<<<< HEAD
   final String uRLDoctorWorkDays = apiBaseUrl + "fetch_doctor_work_times";
   final String uRLAddDayTime = apiBaseUrl + "add_work_space_time";
   final String uRLDeleteDayTime = apiBaseUrl + "delete_work_space_time";
   final String uRLEditDayTime = apiBaseUrl + "delete_work_space_time";
   final String uRLFetchJobRequests = apiBaseUrl + "delete_work_space_time";
   final String uRLFetchPosts = apiBaseUrl + "fetch_social";
   final String uRLStore = apiBaseUrl + "fetch_social";
=======
   final String uRLLoginWithEmail = apiBaseUrl + "login_with_gmail";
>>>>>>> 002056a04ef1d0877606732e1afc4e22bd7b6283

   // String URLFetchMajorCategorySellers(int page)=>apiBaseUrl + "major_shops"+'?page=$page'; // soon


// New ApiKey For Pickup
   final String uRLResetPassword = apiBaseUrl + "reset_password";
   final String uRLCheckPhone = apiBaseUrl + "check_phone";
   final String uRLCity = apiBaseUrl + "city";
   final String uRLFetchAvailableInsurances = apiBaseUrl +
       "fetch_available_insurances";
   final String uRLFetchAvailableServices = apiBaseUrl +
       "fetch_available_insurances";
   final String uRLFetchMyInsurances = apiBaseUrl + "fetch_my_insurances";
   final String uRLFetchMyServices = apiBaseUrl + "fetch_my_insurances";
   final String uRLFetchMyAssistant = apiBaseUrl + "my_assitants";
   final String uRLFetchMyOfferAndDiscount = apiBaseUrl + "my_offer";
   final String uRLDeleteInsurance = apiBaseUrl + "delete_insurance";
   final String uRLDeleteServices = apiBaseUrl + "delete_insurance";
   final String uRLDeleteAssistant = apiBaseUrl + "delete_assitant";
   final String uRLDeleteOfferAndDiscount = apiBaseUrl + "delete_offer";
   final String uRLSetInsurance = apiBaseUrl + "set_insurance";
   final String uRLNewVisits = apiBaseUrl + "all_new_visits";
   final String uRLSetOfferAndDiscount = apiBaseUrl + "add_offer";
   final String uRLFetchProfileDoctor = apiBaseUrl + "fetch_profile_doctor";
   final String uRLFetchScientific = apiBaseUrl + "fetch_seintific_levels";
   final String uRLFetchSpecialization = apiBaseUrl + "fetch_specialization";
   final String uRLEnterAndEditMyPersonalData = apiBaseUrl + "edit_personal_info";
   final String uRLAddJopRequest = apiBaseUrl + "add_job_request";
   final String uRLAddAJopOffer = apiBaseUrl + "add_job_offer";
   final String uRLStates = apiBaseUrl + "states";
   final String uRLFetchUniversity = apiBaseUrl + "fetch_univeristy";
   final String uRLFetchCenterDoctor = apiBaseUrl + "center_doctors";
   final String uRLDeleteCenterDoctor = apiBaseUrl + "center_delete_doctor";
}
