(* Setting *)
Print["Setting"]
basedir = "/Volumes/home/NII/togo-log/rcoslogs/log/"
Protect[undefined]

(* voc data *)
Print["voc data"]
vocrldir = "/Users/kouamano/gitsrc/log-analysis/voc_V2"
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

