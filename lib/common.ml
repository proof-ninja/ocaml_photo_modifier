let (!%) f = Printf.sprintf f

let read_current_dir () =
  let pwd = Sys.getcwd () in
  Sys.readdir pwd
  |> Array.to_list

let block_until_enter message =
  print_endline message;
  ignore @@ read_line ()

let filesize filename =
  let open Unix in
  let stat = Unix.stat filename in
  stat.st_size
