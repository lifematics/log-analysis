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

