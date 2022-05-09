// fn add_one(y: &mut i32) {
//     *y += 1
// }

fn main() {
    let mut x = 5;
    let y = &mut x;

    *y += 1;

    println!("{}", x);
}
