let make_get_request (config: Config.t) =
    let (let*) = Lwt.bind in
    let get_def opt = Option.value opt ~default:[] in
    let headers =
        Option.map (fun t -> ["Authorization", Printf.sprintf "Bearer %s" t]) config.auth_token |>
        get_def
    in
    let* result = Ezcurl_lwt.get ~headers ~url:(Option.get config.endpoint) () in
    match result with
    | Ok response ->
        Lwt_fmt.printf "%s" (Ezcurl_core.string_of_response response)
    | Error (e, s) -> Lwt_fmt.fprintf Lwt_fmt.stderr "Code: %s\n%s" (Curl.strerror e) s
