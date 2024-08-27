(* Setting *)
Print["Setting"]
basedir = "/Volumes/home/NII/togo-log/rcoslogs/log/"
Protect[undefined]

(* voc data *)
Print["voc data"]
vocrldir = "/Users/kouamano/gitsrc/log-analysis/voc"
vocRlFiles = FileNames[vocrldir <> "/*rl.wl"]
(vocRlList = Map[Get, vocRlFiles]) // Length
(vocRl["all:path"] = Apply[Join, vocRlList]) // Dimensions
voclist = 
 Sort[Union[Join[Map[#[[2]] &, vocRl["all:path"]], {undefined[]}]]]
voclistEffPos = 
 Flatten[{Table[n, {n, 2, 7}], Table[n, {n, 10, 25}], 
   Table[n, {n, 27, 31}], Table[n, {n, 33, 42}], 
   Table[n, {n, 44, 46}], Table[n, {n, 48, 56}]}]
(voclistEff = voclist[[voclistEffPos]]) // TableForm
vertexLabelList[g_] := Module[{gs, defg},
  gs = ToString[InputForm[g]];
  defg = ToExpression[StringReplace[gs, "Graph" -> "defGraph"]];
  Cases[defg, _voc, Infinity]
  ];
vocQ["all"] = Map[StringSplit[#[[1]], {",", ":"}] &, voclistEff]
vocSubject["all"] = Union[vocQ["all"][[All, 2]]]
vocActivity["all"] = Union[vocQ["all"][[All, 3]]]
vocObject["all"] = Select[vocQ["all"], Length[#] > 3 &][[All, 4]]

(* RDM-ontology map data *)
ontologyfile = \
"/Users/kouamano/gitsrc/log-analysis/rdm-ontology_vs_voc/ログ基盤ボキャブラリとのマッピング_V3.xlsx"
xls = Import[ontologyfile];
(xlssheet = xls[[1]]) // Dimensions

(** ci **)
Print["sheet: ci"]
xlssheetBase["ci"] = Cases[xlssheet, x_ /; x[[1]] == "ci"]
BaseRl["ci", "subject"] = 
 Map[#[[2]] -> #[[3]] &, xlssheetBase["ci"]] // Union
BaseRlrev["ci", "subject"] = 
 Append[Map[#[[3]] -> #[[2]] &, xlssheetBase["ci"]] // Union, 
  "rdm:Person" -> "many-match"]
BaseRl["ci", "activity"] = 
 Map[#[[4]] -> #[[5]] &, xlssheetBase["ci"]] // Union
BaseRlrev["ci", "activity"] = 
 DeleteCases[Map[#[[5]] -> #[[4]] &, xlssheetBase["ci"]] // Union, 
  Rule["UD", _]]
BaseRl["ci", "object"] = 
 Map[#[[6]] -> #[[7]] &, xlssheetBase["ci"]] // Union
BaseRlrev["ci", "object"] = 
 DeleteCases[
  Append[Map[#[[7]] -> #[[6]] &, xlssheetBase["ci"]] // Union, 
   "rdm:Resource" -> "many-match"], Rule["UD", _]]

(** cs **)
Print["sheet: cs"]
xlssheetBase["cs"] = Cases[xlssheet, x_ /; x[[1]] == "cs"]
BaseRl["cs", "subject"] = 
 Map[#[[2]] -> #[[3]] &, xlssheetBase["cs"]] // Union
BaseRlrev["cs", "subject"] = 
 Append[Map[#[[3]] -> #[[2]] &, xlssheetBase["cs"]] // Union, 
  "rdm:Person" -> "many-match"]
BaseRl["cs", "activity"] = 
 Map[#[[4]] -> #[[5]] &, xlssheetBase["cs"]] // Union
BaseRlrev["cs", "activity"] = 
 DeleteCases[Map[#[[5]] -> #[[4]] &, xlssheetBase["cs"]] // Union, 
  Rule["UD", _]]
BaseRl["cs", "object"] = 
 Map[#[[6]] -> #[[7]] &, xlssheetBase["cs"]] // Union
BaseRlrev["cs", "object"] = 
 DeleteCases[
  Append[Map[#[[7]] -> #[[6]] &, xlssheetBase["cs"]] // Union, 
   "rdm:Resource" -> "many-match"], Rule["UD", _]]

(** la **)
Print["sheet: la"]
xlssheetBase["la"] = Cases[xlssheet, x_ /; x[[1]] == "la"]
BaseRl["la", "subject"] = 
 Map[#[[2]] -> #[[3]] &, xlssheetBase["la"]] // Union
BaseRlrev["la", "subject"] = 
 Append[Map[#[[3]] -> #[[2]] &, xlssheetBase["la"]] // Union, 
  "rdm:Person" -> "many-match"]
BaseRl["la", "activity"] = 
 Map[#[[4]] -> #[[5]] &, xlssheetBase["la"]] // Union
BaseRlrev["la", "activity"] = 
 DeleteCases[Map[#[[5]] -> #[[4]] &, xlssheetBase["la"]] // Union, 
  Rule["UD", _]]
BaseRl["la", "object"] = 
 Map[#[[6]] -> #[[7]] &, xlssheetBase["la"]] // Union
BaseRlrev["la", "object"] = 
 DeleteCases[
  Append[Map[#[[7]] -> #[[6]] &, xlssheetBase["la"]] // Union, 
   "rdm:Resource" -> "many-match"], Rule["UD", _]]

(** wk **)
Print["sheet: wk"]
xlssheetBase["wk"] = Cases[xlssheet, x_ /; x[[1]] == "wk"]
BaseRl["wk", "subject"] = 
 Map[#[[2]] -> #[[3]] &, xlssheetBase["wk"]] // Union
BaseRlrev["wk", "subject"] = 
 Append[Map[#[[3]] -> #[[2]] &, xlssheetBase["wk"]] // Union, 
  "rdm:Person" -> "many-match"]
BaseRl["wk", "activity"] = 
 Map[#[[4]] -> #[[5]] &, xlssheetBase["wk"]] // Union
BaseRlrev["wk", "activity"] = 
 DeleteCases[Map[#[[5]] -> #[[4]] &, xlssheetBase["wk"]] // Union, 
  Rule["UD", _]]
BaseRl["wk", "object"] = 
 Map[#[[6]] -> #[[7]] &, xlssheetBase["wk"]] // Union
BaseRlrev["wk", "object"] = 
 DeleteCases[
  Append[Map[#[[7]] -> #[[6]] &, xlssheetBase["wk"]] // Union, 
   "rdm:Resource" -> "many-match"], Rule["UD", _]]

(** extract mapping terms **)
Print["map terms"]
APSubject["all"] = 
 Select[Drop[xlssheet, 1][[All, 3]] // Union, StringLength[#] > 0 &]
APActivity["all"] = 
 Select[Drop[xlssheet, 1][[All, 5]] // Union, StringLength[#] > 0 &]
APObject["all"] = 
 Select[Drop[xlssheet, 1][[All, 7]] // Union, StringLength[#] > 0 &]
APvocSubject["all"] = 
 Select[Drop[xlssheet[[2 ;; 50]], 1][[All, 2]] // Union, 
  StringLength[#] > 0 &]
APvocActivity["all"] = 
 Select[Drop[xlssheet, 1][[All, 4]] // Union, StringLength[#] > 0 &]
APvocObject["all"] = 
 Select[Drop[xlssheet, 1][[All, 6]] // Union, StringLength[#] > 0 &]
Complement[vocSubject["all"], APvocSubject["all"]]
Complement[vocActivity["all"], APvocActivity["all"]]
Complement[vocSubject["all"], APvocSubject["all"]]

(* User story *)
Print["User story"]
(** data **)
Print["User story: data"]
basedir <> "2022NII-RDCユーザーストーリー・機能対応表_V2.1.xlsx"
userStoryXlsx = 
  Import[basedir <> "2022NII-RDCユーザーストーリー・機能対応表_V2.1.xlsx"];
userStoryOtlSheet = userStoryXlsx[[3]][[2 ;; 190]];
(userStoryOtl["all"] = 
   Map[{#[[1]], #[[20]], #[[8]], "rdm:" <> #[[9]], "rdm:" <> #[[11]], 
      "rdm:" <> #[[13]]} &, userStoryOtlSheet]) // Length
userStoryOtlHead = userStoryXlsx[[3]][[1]][[{1, 20, 8, 9, 11, 13}]]
Cases[userStoryOtl["all"], x_ /; x[[2]] == "-"]
(userStoryOtl["sel"] = 
   Cases[userStoryOtl["all"], x_ /; x[[2]] != "-"]) // Length
rdmSubjectToUS["all"] = 
  Map[{#[[2]], #[[4]] -> #[[1]]} &, userStoryOtl["sel"]];
rdmActivityToUS["all"] = 
  Map[{#[[2]], #[[5]] -> #[[1]]} &, userStoryOtl["sel"]];
rdmObjectToUS["all"] = 
  Map[{#[[2]], #[[6]] -> #[[1]]} &, userStoryOtl["sel"]];
rdmSubjectToUS["ci"] = Cases[rdmSubjectToUS["all"], {"ci", __}]
rdmActivityToUS["ci"] = Cases[rdmActivityToUS["all"], {"ci", __}]
rdmObjectToUS["ci"] = Cases[rdmObjectToUS["all"], {"ci", __}]
rdmSubjectToUS["cs"] = Cases[rdmSubjectToUS["all"], {"cs", __}]
rdmActivityToUS["cs"] = Cases[rdmActivityToUS["all"], {"cs", __}]
rdmObjectToUS["cs"] = Cases[rdmObjectToUS["all"], {"cs", __}]
rdmSubjectToUS["la"] = Cases[rdmSubjectToUS["all"], {"la", __}]
rdmActivityToUS["la"] = Cases[rdmActivityToUS["all"], {"la", __}]
rdmObjectToUS["la"] = Cases[rdmObjectToUS["all"], {"la", __}]
rdmSubjectToUS["wk"] = Cases[rdmSubjectToUS["all"], {"wk", __}]
rdmActivityToUS["wk"] = Cases[rdmActivityToUS["all"], {"wk", __}]
rdmObjectToUS["wk"] = Cases[rdmObjectToUS["all"], {"wk", __}]

(** Duplicate check**)
Print["Duplicate check"]
dupRl[list_] := Module[{car, cdr},
  car = list[[1]];
  cdr = list[[2 ;;]];
  Map[# -> car &, cdr]
  ]
userStoryOtl["sel"] // Dimensions
(Gather[userStoryOtl[
    "sel"], #1[[2 ;; 6]] == #2[[2 ;; 6]] &]) // Length
(Gather[userStoryOtl[
    "sel"], #1[[3 ;; 6]] == #2[[3 ;; 6]] &]) // Length

usCount["gr"] = (userStoryOtl["sel", "gr"] = 
    Cases[userStoryOtl["sel"], {_, "gr", __}]) // Length
usCount["gr", 
  "uniq"] = (userStoryOtlGt["sel", "gr"] = 
    Gather[userStoryOtl["sel", 
      "gr"], #1[[2 ;; 6]] == #2[[2 ;; 6]] &]) // Length
usDupPos["gr"] = 
 Flatten[Position[Map[Length, userStoryOtlGt["sel", "gr"]], 
   x_ /; x != 1]]
usDupList["gr"] = 
 Map[#[[1]] &, userStoryOtlGt["sel", "gr"][[usDupPos["gr"]]], {2}]
usDupRl["gr"] = Map[dupRl[#] &, usDupList["gr"]]

usCount["dg"] = (userStoryOtl["sel", "dg"] = 
    Cases[userStoryOtl["sel"], {_, "dg", __}]) // Length
usCount["dg", 
  "uniq"] = (userStoryOtlGt["sel", "dg"] = 
    Gather[userStoryOtl["sel", 
      "dg"], #1[[2 ;; 6]] == #2[[2 ;; 6]] &]) // Length
usDupPos["dg"] = 
 Flatten[Position[Map[Length, userStoryOtlGt["sel", "dg"]], 
   x_ /; x != 1]]
usDupList["dg"] = 
 Map[#[[1]] &, userStoryOtlGt["sel", "dg"][[usDupPos["dg"]]], {2}]
usDupRl["dg"] = Map[dupRl[#] &, usDupList["dg"]]

usCount["dp"] = (userStoryOtl["sel", "dp"] = 
    Cases[userStoryOtl["sel"], {_, "dp", __}]) // Length
usCount["dp", 
  "uniq"] = (userStoryOtlGt["sel", "dp"] = 
    Gather[userStoryOtl["sel", 
      "dp"], #1[[2 ;; 6]] == #2[[2 ;; 6]] &]) // Length
usDupPos["dp"] = 
 Flatten[Position[Map[Length, userStoryOtlGt["sel", "dp"]], 
   x_ /; x != 1]]
usDupList["dp"] = 
 Map[#[[1]] &, userStoryOtlGt["sel", "dp"][[usDupPos["dp"]]], {2}]
usDupRl["dp"] = Map[dupRl[#] &, usDupList["dp"]]

usCount["ci"] = (userStoryOtl["sel", "ci"] = 
    Cases[userStoryOtl["sel"], {_, "ci", __}]) // Length
usCount["ci", 
  "uniq"] = (userStoryOtlGt["sel", "ci"] = 
    Gather[userStoryOtl["sel", 
      "ci"], #1[[2 ;; 6]] == #2[[2 ;; 6]] &]) // Length
usDupPos["ci"] = 
 Flatten[Position[Map[Length, userStoryOtlGt["sel", "ci"]], 
   x_ /; x != 1]]
usDupList["ci"] = 
 Map[#[[1]] &, userStoryOtlGt["sel", "ci"][[usDupPos["ci"]]], {2}]
usDupRl["ci"] = Map[dupRl[#] &, usDupList["ci"]]

usCount["cs"] = (userStoryOtl["sel", "cs"] = 
    Cases[userStoryOtl["sel"], {_, "cs", __}]) // Length
usCount["cs", 
  "uniq"] = (userStoryOtlGt["sel", "cs"] = 
    Gather[userStoryOtl["sel", 
      "cs"], #1[[2 ;; 6]] == #2[[2 ;; 6]] &]) // Length
usDupPos["cs"] = 
 Flatten[Position[Map[Length, userStoryOtlGt["sel", "cs"]], 
   x_ /; x != 1]]
usDupList["cs"] = 
 Map[#[[1]] &, userStoryOtlGt["sel", "cs"][[usDupPos["cs"]]], {2}]
usDupRl["cs"] = Map[dupRl[#] &, usDupList["cs"]]

usCount["la"] = (userStoryOtl["sel", "la"] = 
    Cases[userStoryOtl["sel"], {_, "la", __}]) // Length
usCount["la", 
  "uniq"] = (userStoryOtlGt["sel", "la"] = 
    Gather[userStoryOtl["sel", 
      "la"], #1[[2 ;; 6]] == #2[[2 ;; 6]] &]) // Length
usDupPos["la"] = 
 Flatten[Position[Map[Length, userStoryOtlGt["sel", "la"]], 
   x_ /; x != 1]]
usDupList["la"] = 
 Map[#[[1]] &, userStoryOtlGt["sel", "la"][[usDupPos["la"]]], {2}]
usDupRl["la"] = Map[dupRl[#] &, usDupList["la"]]

usCount["wk"] = (userStoryOtl["sel", "wk"] = 
    Cases[userStoryOtl["sel"], {_, "wk", __}]) // Length
usCount["wk", 
  "uniq"] = (userStoryOtlGt["sel", "wk"] = 
    Gather[userStoryOtl["sel", 
      "wk"], #1[[2 ;; 6]] == #2[[2 ;; 6]] &]) // Length
usDupPos["wk"] = 
 Flatten[Position[Map[Length, userStoryOtlGt["sel", "wk"]], 
   x_ /; x != 1]]
usDupList["wk"] = 
 Map[#[[1]] &, userStoryOtlGt["sel", "wk"][[usDupPos["wk"]]], {2}]
usDupRl["wk"] = Map[dupRl[#] &, usDupList["wk"]]

usDupRl["All"] = 
 Flatten[{usDupRl["gr"], usDupRl["dp"], usDupRl["dg"], usDupRl["ci"], 
   usDupRl["cs"], usDupRl["la"], usDupRl["wk"], {"番号" -> "重複"}}]


(** appearance of ontology term **)
USSubject["all"] = userStoryOtl["sel"][[All, 4]] // Union
USActivity["all"] = 
 Select[userStoryOtl["sel"][[All, 5]] // Union, StringLength[#] > 4 &]
USObject["all"] = 
 DeleteCases[
  Select[userStoryOtl["sel"][[All, 6]] // Union, 
   StringLength[#] > 4 &], 
  x_ /; StringMatchQ[x, RegularExpression["rdm:なし.*"]]]
Complement[USSubject["all"], APSubject["all"]]
Complement[USActivity["all"], APActivity["all"]]
Complement[USObject["all"], APObject["all"]]

(** Reverse match **)
Print["Reverse match"]
(revMatch[
    "ci"] = (Map[{#[[1]], #[[4]] /. 
        BaseRlrev["ci", "subject"], #[[5]] /. 
        BaseRlrev["ci", "activity"], #[[6]] /. 
        BaseRlrev["ci", "object"]} &, 
     userStoryOtl["sel", "ci"]])) // TableForm
(revNoMatchCase["ci"] = 
   Cases[revMatch["ci"], 
    x_ /; StringMatchQ[x[[3]], RegularExpression["rdm:.*"]] && 
      StringMatchQ[x[[4]], RegularExpression["rdm:.*"]]]) // Length
Map[#[[1]] &, revNoMatchCase["ci"]]

(revMatch[
    "cs"] = (Map[{#[[1]], #[[4]] /. 
        BaseRlrev["cs", "subject"], #[[5]] /. 
        BaseRlrev["cs", "activity"], #[[6]] /. 
        BaseRlrev["cs", "object"]} &, 
     userStoryOtl["sel", "cs"]])) // TableForm
(revNoMatchCase["cs"] = 
   Cases[revMatch["cs"], 
    x_ /; StringMatchQ[x[[3]], RegularExpression["rdm:.*"]] && 
      StringMatchQ[x[[4]], RegularExpression["rdm:.*"]]]) // Length
Map[#[[1]] &, revNoMatchCase["cs"]]

(revMatch[
    "la"] = (Map[{#[[1]], #[[4]] /. 
        BaseRlrev["la", "subject"], #[[5]] /. 
        BaseRlrev["la", "activity"], #[[6]] /. 
        BaseRlrev["la", "object"]} &, 
     userStoryOtl["sel", "la"]])) // TableForm
(revNoMatchCase["la"] = 
   Cases[revMatch["la"], 
    x_ /; StringMatchQ[x[[3]], RegularExpression["rdm:.*"]] && 
      StringMatchQ[x[[4]], RegularExpression["rdm:.*"]]]) // Length
Map[#[[1]] &, revNoMatchCase["la"]]

(revMatch[
    "wk"] = (Map[{#[[1]], #[[4]] /. 
        BaseRlrev["wk", "subject"], #[[5]] /. 
        BaseRlrev["wk", "activity"], #[[6]] /. 
        BaseRlrev["wk", "object"]} &, 
     userStoryOtl["sel", "wk"]])) // TableForm
(revNoMatchCase["wk"] = 
   Cases[revMatch["wk"], 
    x_ /; StringMatchQ[x[[3]], RegularExpression["rdm:.*"]] && 
      StringMatchQ[x[[4]], RegularExpression["rdm:.*"]]]) // Length
Map[#[[1]] &, revNoMatchCase["wk"]]

(* Graph *)
Print["Graph"]

