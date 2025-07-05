open Common

let read_current_dir () =
  let pwd = Sys.getcwd () in
  Sys.readdir pwd
  |> Array.to_list

let process_file filename =
  print_endline (!%"Processing %s" filename)

let () =
  let files = read_current_dir () in
  List.iter process_file files;
  print_endline "Press Enter. エンターキーをおしてね。";

  let _ = read_line () in
  ()
