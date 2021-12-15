mixin ApiKey{


   static const String apiBaseUrl='https://ingaz.crazyideaco.com/public/api/customer/';




   final String uRLLogin = apiBaseUrl + "login";

   // String URLFetchMajorCategorySellers(int page)=>apiBaseUrl + "major_shops"+'?page=$page'; // soon



// New ApiKey For Pickup
   final String uRLCity = apiBaseUrl + "city";
   final String uRLFetchAvailableInsurances = apiBaseUrl + "fetch_available_insurances";
   final String uRLFetchAvailableServices = apiBaseUrl + "fetch_available_insurances";
   final String uRLFetchMyInsurances = apiBaseUrl + "fetch_my_insurances";
   final String uRLFetchMyServices = apiBaseUrl + "fetch_my_insurances";
   final String uRLFetchMyAssistant = apiBaseUrl + "my_assitants";
   final String uRLDeleteInsurance = apiBaseUrl + "delete_insurance";
   final String uRLDeleteServices = apiBaseUrl + "delete_insurance";
   final String uRLDeleteAssistant = apiBaseUrl + "delete_assitant";
   final String uRLSetInsurance = apiBaseUrl + "set_insurance";


}