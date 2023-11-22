class ApiString {
  static String baseUrl = "https://hiring-roof-backend.vercel.app";
  //Auth
  static String signin = "$baseUrl/api/user/login/";
  static String verify = "$baseUrl/api/user/verify/";
  //jobs
  static String myJobs = "$baseUrl/api/job/myJobs";
  static String allJobs = "$baseUrl/api/job/all";
  static String getJobs = "$baseUrl/api/job/all-after-login";
  //search
  static String search = "$baseUrl/api/job/search";
  //save
  static String save = "$baseUrl/api/save/";
  static String getsave = "$baseUrl/api/save/get";
//apply
  static String apply = "$baseUrl/api/jobApplication/apply/";
  //company
  static String getApplication = "$baseUrl/api/jobApplication/get-applications-list/";
  static String getshortlist = "$baseUrl/api/jobApplication/get-shortlist/";
  static String getinterviewslist = "$baseUrl/api/jobApplication/get-interviews-list/";
  static String getinterviews2list = "$baseUrl/api/jobApplication//get-interviews-2-list/";
  static String getselectedcandidates = "$baseUrl/api/jobApplication/get-selected-candidates/";
  static String doShortlist = "$baseUrl/api/jobApplication/shortlist/";
  static String doNotSelect = "$baseUrl/api/jobApplication/not-selected/";
  static String interviewselect = "$baseUrl/api/jobApplication/interview-select/";
  static String interview2select = "$baseUrl/api/jobApplication/interview-2-select/";
  static String selected = "$baseUrl/api/jobApplication/selected/";
  // candidate
  static String getShortlisted = "$baseUrl/api/jobApplication/job-seeker/get-shortlist/";
  static String getCandidateinterviewslist = "$baseUrl/api/jobApplication/job-seeker/get-interviews-list/";
  static String get2Candidateinterviewslist = "$baseUrl/api/jobApplication/job-seeker/get-interviews-2-list/";
  static String getselectedCompany = "$baseUrl/api/jobApplication/job-seeker/get-selected-candidates/";
}
