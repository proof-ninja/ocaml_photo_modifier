open Photo_modifier
open Common

(* ファイルを一つずつ処理する関数 *)
let process_file filename =
  print_endline (!%"Processing %s" filename);
  match Jpg.load filename  with
  | None -> ()    (* JPGファイルじゃないときは何もしない *)
  | Some image -> (* JPGファイルの時は必要ならばリサイズします *)
     Jpg.resize_if_needed filename image

(* すべての最初にここが実行されます *)
let () =
  (* 現在のディレクトリ(フォルダ)にあるファイル名を取得します *)
  let files = read_current_dir () in
  (* すべてのファイルに process_file関数を適用します *)
  List.iter process_file files;
  (* エンターキーが押されるまで待ちます *)
  block_until_enter "Press Enter. エンターキーをおしてね。"
