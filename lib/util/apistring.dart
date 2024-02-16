class ApiString {
  static const String baseUrl = "https://hiring-roof-backend.vercel.app";
  //Auth
  static const String signin = "$baseUrl/api/user/login/";
  static const String verify = "$baseUrl/api/user/verify/";
  static String updateProfile(final String id) => "$baseUrl/api/user/update/$id";
  static String getProfile(final String id) => "$baseUrl/api/user/$id";

  //jobs
  static const String myJobs = "$baseUrl/api/job/myJobs/";
  static const String allJobs = "$baseUrl/api/job/all";
  static const String categories = "$baseUrl/api/categories";

  static const String getJobs = "$baseUrl/api/job/all-after-login";
  //search
  static const String search = "$baseUrl/api/job/search";
  //save
  static const String save = "$baseUrl/api/save/";
  static const String getsave = "$baseUrl/api/save/get";
//apply
  static const String apply = "$baseUrl/api/jobApplication/apply/";
  //company
  static const String getApplication = "$baseUrl/api/jobApplication/get-applications-list/";
  static const String getshortlist = "$baseUrl/api/jobApplication/get-shortlist/";
  static const String getinterviewslist = "$baseUrl/api/jobApplication/get-interviews-list/";
  static const String getinterviews2list = "$baseUrl/api/jobApplication//get-interviews-2-list/";
  static const String getselectedcandidates = "$baseUrl/api/jobApplication/get-selected-candidates/";

  static const String getpostedjob = "$baseUrl/api/jobApplication/get/";
  //put
  static const String doShortlist = "$baseUrl/api/jobApplication/shortlist/";
  static const String doNotSelect = "$baseUrl/api/jobApplication/not-selected/";
  static const String interviewselect = "$baseUrl/api/jobApplication/interview-select/";
  static const String interview2select = "$baseUrl/api/jobApplication/interview-2-select/";
  static const String selected = "$baseUrl/api/jobApplication/selected/";
  // job post and update
  static const String putJob = "$baseUrl/api/job/createUpdate";

  // candidate
  static const String getSaved = "$baseUrl/api/save/get";
  static const String getApplications = "$baseUrl/api/jobApplication/job-seeker/get-applications-list/";
  static const String getShortlisted = "$baseUrl/api/jobApplication/job-seeker/get-shortlist/";
  static const String getCandidateinterviews = "$baseUrl/api/jobApplication/job-seeker/get-interviews-list/";
  static const String get2Candidateinterviews = "$baseUrl/api/jobApplication/job-seeker/get-interviews-2-list/";
  static const String getselectedCompany = "$baseUrl/api/jobApplication/job-seeker/get-selected-candidates/";

// Notification
  static String getNotification(final String id) => "$baseUrl/api/notification/get/$id";
  static const String createNotification = "$baseUrl/api/notification/create"; 
}
