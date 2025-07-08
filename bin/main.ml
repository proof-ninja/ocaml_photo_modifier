open Photo_modifier
open Common

let process_file filename =
  print_endline (!%"Processing %s" filename);
  match Jpg.load filename  with
  | None -> ()
  | Some image ->
     Jpg.resize_if_needed filename image

let () =
  let files = read_current_dir () in
  List.iter process_file files;
  block_until_enter "Press Enter. エンターキーをおしてね。"
