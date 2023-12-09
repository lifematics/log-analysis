(* Created with the Wolfram Language : www.wolfram.com *)
{x_ /; StringMatchQ[x, RegularExpression["https://lms.nii.ac.jp/"]] -> 
  voc["la:top"], 
 x_ /; StringMatchQ[x, RegularExpression["https://lms.nii.ac.jp/auth/.*"]] -> 
  voc["la:authenticate"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://lms.nii.ac.jp/login/.*"]] -> voc["la:login"], 
 x_ /; StringMatchQ[x, RegularExpression["https://lms.nii.ac.jp/my/"]] -> 
  voc["la:dashboard"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://lms.nii.ac.jp/my/courses.php"]] -> voc["la:course_list"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://lms.nii.ac.jp/pluginfile.php/.*"]] -> 
  voc["la:internalsystem_access"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://lms.nii.ac.jp/theme/.*"]] -> voc["la:internalsystem_access"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://lms.nii.ac.jp/local/.*"]] -> voc["la:internalsystem_access"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://lms.nii.ac.jp/lib/.*\\.php/.*js"]] -> 
  voc["la:internalsystem_access"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://lms.nii.ac.jp/lib/ajax/.*"]] -> 
  voc["la:internalsystem_access"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://lms.nii.ac.jp/admin/.*"]] -> voc["la:admin_access"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://lms.nii.ac.jp/.*/view.php.*"]] -> voc["la:content"], 
 x_ /; StringMatchQ[x, RegularExpression["https://lms.nii.ac.jp/mod/.*"]] -> 
  voc["la:content"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://lms.nii.ac.jp/message/.*"]] -> voc["la:content"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://lms.nii.ac.jp/badges/.*"]] -> voc["la:content"], 
 x_ /; StringMatchQ[x, RegularExpression["https://lms.nii.ac.jp/user/.*"]] -> 
  voc["la:profile"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://lms.nii.ac.jp/enrol/index.php\\?.*"]] -> voc["la:resister"]}
