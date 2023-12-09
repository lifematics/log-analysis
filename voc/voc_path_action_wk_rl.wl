(* Created with the Wolfram Language : www.wolfram.com *)
{x_ /; StringMatchQ[x, RegularExpression["https://jdcat.jsps.go.jp/"]] -> 
  voc["wk/jd:top"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jdcat.jsps.go.jp/\\?.*"]] -> voc["wk/jd:search"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jdcat.jsps.go.jp/search.*"]] -> voc["wk/jd:search"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jdcat.jsps.go.jp/facet-search/.*"]] -> 
  voc["wk/jd:search/facet"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jdcat.jsps.go.jp/get_search_setting.*"]] -> 
  voc["wk/jd:search/setting"], 
 x_ /; StringMatchQ[x, RegularExpression["https://jdcat.jsps.go.jp/robots.txt\
"]] -> voc["wk/jd:robot"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jdcat.jsps.go.jp/get_child_list.*"]] -> 
  voc["wk/jd:internalsystem_access"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jdcat.jsps.go.jp/journal_info.*"]] -> 
  voc["wk/jd:internalsystem_access"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jdcat.jsps.go.jp/get_path_name_dict.*"]] -> 
  voc["wk/jd:internalsystem_access"], 
 x_ /; StringMatchQ[x, RegularExpression["https://jdcat.jsps.go.jp/accounts.*\
"]] -> voc["wk/jd:internalsystem_access"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jdcat.jsps.go.jp/records/[0-9]+$"]] -> voc["wk/jd:detail"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jdcat.jsps.go.jp/records/[0-9]+/export.*"]] -> 
  voc["wk/jd:export"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jdcat.jsps.go.jp/oai\\?.*"]] -> voc["wk/jd:export"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jdcat.jsps.go.jp/items.*"]] -> voc["wk/jd:admin-function"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jdcat.jsps.go.jp/workflow.*"]] -> voc["wk/jd:admin-function"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jdcat.jsps.go.jp/admin.*"]] -> voc["wk/jd:admin-function"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jdcat.jsps.go.jp/login.*"]] -> voc["wk/jd:authenticate"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jdcat.jsps.go.jp/JDCatmetadata.html"]] -> voc["wk/jd:scheme"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jdcat.jsps.go.jp/inform.html"]] -> voc["wk/jd:information"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jdcat.jsps.go.jp/about"]] -> voc["wk/jd:about"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jdcat.jsps.go.jp/manual.html"]] -> voc["wk/jd:manual"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jdcat.jsps.go.jp/link.html"]] -> voc["wk/jd:link_list"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jdcat.jsps.go.jp/guidance.html"]] -> voc["wk/jd:guide"], 
 x_ /; StringMatchQ[x, RegularExpression[
     "https://jdcat.jsps.go.jp/analysis.html"]] -> voc["wk/jd:analisys"]}
