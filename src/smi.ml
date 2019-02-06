
(* read one molecule from a SMILES file *)
let read_one (input: in_channel): string =
  (input_line input) ^ "\n"

let get_name smiles_line =
  let _smiles, name =
    try BatString.split smiles_line ~by:"\t"
    with Not_found -> failwith "Smi.get_name: smiles file not using tabs" in
  (* all other file formats expect molecule name only,
   * not molecule name followed by EOL *)
  if BatString.ends_with name "\n" then
    BatString.rchop ~n:1 name
  else
    name
