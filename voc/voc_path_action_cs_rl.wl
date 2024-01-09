(* Created with the Wolfram Language : www.wolfram.com *)
{x_ /; StringMatchQ[x, RegularExpression[
     "https://jupyter.cs.rcos.nii.ac.jp/hub/home.*"]] -> voc["top"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jupyter.cs.rcos.nii.ac.jp/hub/{1,2}"]] -> voc["top"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jupyter.cs.rcos.nii.ac.jp/{1,2}"]] -> voc["top"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jupyter.cs.rcos.nii.ac.jp/hub/token.*"]] -> voc["token"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jupyter.cs.rcos.nii.ac.jp/user/.*/rstudio/.*"]] -> 
  voc["rstudio"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jupyter.cs.rcos.nii.ac.jp/user/.*/clusters.*"]] -> 
  voc["cluster"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jupyter.cs.rcos.nii.ac.jp/user/.*/notebooks.*"]] -> 
  voc["notebook"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jupyter.cs.rcos.nii.ac.jp/user/.*/terminals.*"]] -> 
  voc["terminal"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jupyter.cs.rcos.nii.ac.jp/user/.*/tree.*"]] -> 
  voc["item_list"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jupyter.cs.rcos.nii.ac.jp/user/.*/shiny.*"]] -> 
  voc["item_list"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jupyter.cs.rcos.nii.ac.jp/api/.*"]] -> voc["api"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jupyter.cs.rcos.nii.ac.jp/auth/.*"]] -> voc["authenticate"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jupyter.cs.rcos.nii.ac.jp/Shibboleth.sso/.*"]] -> 
  voc["authenticate"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jupyter.cs.rcos.nii.ac.jp/hub/login.*"]] -> 
  voc["authenticate"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jupyter.cs.rcos.nii.ac.jp/login.*"]] -> voc["authenticate"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jupyter.cs.rcos.nii.ac.jp/suite-auth/login"]] -> 
  voc["authenticate"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jupyter.cs.rcos.nii.ac.jp/user/login.*"]] -> voc["login"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jupyter.cs.rcos.nii.ac.jp/hub/static.*"]] -> 
  voc["internalsystem_access"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jupyter.cs.rcos.nii.ac.jp/user/.*/custom/.*"]] -> 
  voc["internalsystem_access"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jupyter.cs.rcos.nii.ac.jp/user/.*/static/.*"]] -> 
  voc["internalsystem_access"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jupyter.cs.rcos.nii.ac.jp/user/.*/nbextensions/.*"]] -> 
  voc["internalsystem_access"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jupyter.cs.rcos.nii.ac.jp/user/.*/lab.*"]] -> 
  voc["internalsystem_access"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jupyter.cs.rcos.nii.ac.jp/v2/.*"]] -> 
  voc["internalsystem_access"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jupyter.cs.rcos.nii.ac.jp/f{0,1}ckeditor/.*"]] -> 
  voc["internalsystem_access"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jupyter.cs.rcos.nii.ac.jp/user/.*/static/base/images.*"]] -> 
  voc["internalsystem_access"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jupyter.cs.rcos.nii.ac.jp/user/.*/rdm-binderhub/.*"]] -> 
  voc["internalsystem_access"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jupyter.cs.rcos.nii.ac.jp/user/.*/server-proxy/.*"]] -> 
  voc["internalsystem_access"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jupyter.cs.rcos.nii.ac.jp/user/.*/offlinenotebook/.*"]] -> 
  voc["internalsystem_access"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jupyter.cs.rcos.nii.ac.jp/user/.*/files/.*"]] -> 
  voc["internalsystem_access"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jupyter.cs.rcos.nii.ac.jp/user/.*/tree/.*"]] -> 
  voc["internalsystem_access"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jupyter.cs.rcos.nii.ac.jp/user/.*/uuid/.*"]] -> 
  voc["internalsystem_access"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jupyter.cs.rcos.nii.ac.jp/user/.*/lc/.*"]] -> 
  voc["internalsystem_access"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jupyter.cs.rcos.nii.ac.jp/build/.*"]] -> 
  voc["internalsystem_access"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jupyter.cs.rcos.nii.ac.jp/hub/logo"]] -> 
  voc["internalsystem_access"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jupyter.cs.rcos.nii.ac.jp/webtools/.*"]] -> 
  voc["internalsystem_access"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jupyter.cs.rcos.nii.ac.jp/version.*"]] -> 
  voc["internalsystem_access"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jupyter.cs.rcos.nii.ac.jp/arcgis.*"]] -> 
  voc["internalsystem_access"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jupyter.cs.rcos.nii.ac.jp/mifs.*"]] -> 
  voc["internalsystem_access"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jupyter.cs.rcos.nii.ac.jp/functionRouter.*"]] -> 
  voc["internalsystem_access"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jupyter.cs.rcos.nii.ac.jp/favicon.ico"]] -> 
  voc["internalsystem_access"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jupyter.cs.rcos.nii.ac.jp/user/.*\\.ico"]] -> 
  voc["internalsystem_access"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jupyter.cs.rcos.nii.ac.jp/hub/.*\\.ico"]] -> 
  voc["internalsystem_access"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jupyter.cs.rcos.nii.ac.jp/user/.*\\.svg"]] -> 
  voc["internalsystem_access"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jupyter.cs.rcos.nii.ac.jp/.*\\.svg"]] -> 
  voc["internalsystem_access"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jupyter.cs.rcos.nii.ac.jp/user/.*\\.txt"]] -> 
  voc["internalsystem_access"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jupyter.cs.rcos.nii.ac.jp/service.*"]] -> 
  voc["additional_service"]}
