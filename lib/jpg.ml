open Common
open Images

let load filename =
  let opts =
    let f x = prerr_endline (!%"Loading '%s' %f" filename x) in
    [Load_Progress f]
  in
  try Some (Jpeg.load filename opts) with
  | e ->
     print_endline (!%"load_jpeg error: %s" (Printexc.to_string e));
     None

let _3MB = 3 * 1024 * 1024

let resize_if_needed ?(max_size=_3MB) filename image =
  let sz = filesize filename in
  if sz <= max_size then () else
    let opts =
      [Save_Quality 80]
    in
    Images.save ("resized_" ^ filename) None  opts image
