// The Rust Programming Language, Second Edition, Chapter 06 (Enums and Pattern
// Matching) -- code written as I follow along and experiment with the IP
// address enum type example

fn main() {
    let home = IpAddr::V4(127, 0, 0, 1);
    let loopback = IpAddr::V6(String::from("::1"));

    home.show();
    loopback.show();
}

enum IpAddr {
    V4(u8, u8, u8, u8),
    V6(String),
}

impl IpAddr {
    fn show(&self) {
        match *self {
            IpAddr::V4(ref s1, ref s2, ref s3, ref s4) => println!("{}.{}.{}.{}", s1, s2, s3, s4),
            IpAddr::V6(ref s) => println!("{}", s),
        };
    }
}
