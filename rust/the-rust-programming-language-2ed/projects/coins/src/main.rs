// The Rust Programming Language, Second Edition, Chapter 06 (Enums and Pattern
// Matching) -- code written as I follow along and experiment with the coins
// example

//#[allow(dead_code)]
fn main() {
    //let coin = Coin::Quarter(Some(UsState::Oregon));
    let coin = Coin::Quarter(None);
    println!("{:?}: {}¢", &coin, value_in_cents(&coin));

    println!("{:?} + 1 == {:?}¢", &coin, plus_one(Some(value_in_cents(&coin))))
}

#[allow(dead_code)]
#[derive(Debug)]
enum UsState {
    Alabama,
    Alaska,
    Arizona,
    Arkansas,
    California,
    Colorado,
    Connecticut,
    Delaware,
    DistrictOfColumbia,
    Florida,
    Georgia,
    Hawaii,
    Idaho,
    Illinois,
    Indiana,
    Iowa,
    Kansas,
    Kentucky,
    Louisiana,
    Maine,
    Maryland,
    Massachusetts,
    Michigan,
    Minnesota,
    Mississippi,
    Missouri,
    Montana,
    Nebraska,
    Nevada,
    NewHampshire,
    NewJersey,
    NewMexico,
    NewYork,
    NorthCarolina,
    NorthDakota,
    Ohio,
    Oklahoma,
    Oregon,
    Pennsylvania,
    RhodeIsland,
    SouthCarolina,
    SouthDakota,
    Tennessee,
    Texas,
    Utah,
    Vermont,
    Virginia,
    Washington,
    WestVirginia,
    Wisconsin,
    Wyoming,
}

#[allow(dead_code)]
#[derive(Debug)]
enum Coin {
    Penny,
    Nickel,
    Dime,
    Quarter(Option<UsState>),
}

#[allow(dead_code, unused_variables)]
fn value_in_cents(coin: &Coin) -> u32 {
    match *coin {
        Coin::Penny => {
            println!("Lucky penny!");
            1
        },
        Coin::Nickel => 5,
        Coin::Dime => 10,
        Coin::Quarter(ref state) => {
            /*
            match *state {
                Some(ref s) => println!("State quarter from {:?}!", s),
                _ => (),
            }
             */
            if let Some(ref s) = *state {
                println!("State quarter from {:?}!", s);
            }

            25
        },
    }
}

fn plus_one(x: Option<u32>) -> Option<u32> {
    match x {
        None => None,
        Some(i) => Some(i + 1),
    }
}
