use std::env;

enum TempChoice {
    Unkn,
    Fahr,
    Cels
}

fn main() {
    let (unit_of_measure, temp) = get_requested_conversion();

    match unit_of_measure {
        TempChoice::Fahr => {
            println!("{:.*}", 1, conv_fahr_to_cel(temp));
        },
        TempChoice::Cels => {
            println!("{:.*}", 1, conv_cel_to_fahr(temp));
        },
        _ => {
            usage();
            std::process::exit(1);
        },
    };
}

fn get_requested_conversion() -> (TempChoice, f64) {
    let mut conv = (TempChoice::Unkn, 0.0);
    for arg in env::args() {
        match &arg[..] {
            "-f" => conv.0 = TempChoice::Fahr,
            "-c" => conv.0 = TempChoice::Cels,
            _ => match conv.0 {
                TempChoice::Fahr |
                TempChoice::Cels => {
                    match arg.parse() {
                        Ok(num) => conv.1 = num,
                        Err(_)  => conv.0 = TempChoice::Unkn
                    }
                    break;
                },
                _ => ()
            }
        }
    }

    conv
}

fn usage(){
    println!("Got something other than that which I was seeking... :(");
}

fn conv_fahr_to_cel(deg_f: f64) -> f64 {
    (deg_f - 32.0) * 5.0/9.0
}

fn conv_cel_to_fahr(deg_c: f64) -> f64 {
    deg_c * (9.0/5.0) + 32.0
}
