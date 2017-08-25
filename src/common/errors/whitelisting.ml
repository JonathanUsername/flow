
open Sys

let whitelist_env = try getenv "FLOW_WHITELIST" with Not_found -> ""
let whitelist_re_list = if whitelist_env = "" then [] else Str.split (Str.regexp "++") whitelist_env
let matches_whitelist_elem s1 s2 =
    let re = Str.regexp s2
    in
        try ignore (Str.search_forward re s1 0); true
        with Not_found -> false

let is_in_whitelist elem = List.exists (fun e ->  matches_whitelist_elem elem e) whitelist_re_list

(* type loc_elem =
    | Loct of Loc.t
    | Filename of Loc.filename

let to_string = function
    | Loct elem -> Loc.to_string elem
    | Filename elem ->Loc.string_of_filename elem *)

(* let in_whitelist elem = is_in_whitelist (to_string elem) *)

let loc_in_whitelist (elem: Loc.t) = is_in_whitelist (Loc.to_string elem)
let filename_in_whitelist elem = is_in_whitelist (Loc.string_of_filename elem)
