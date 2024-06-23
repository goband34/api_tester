type t = {
    auth_token: string option;
    endpoint: string option
}

let default = {
    auth_token = None;
    endpoint = None
}

let with_token t self = { self with auth_token = Some t }
let with_endpoint e self = { self with endpoint = Some e }
