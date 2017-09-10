const GRID_SIZE: usize = 10*10;

#[allow(unused_mut,unused_variables)]
fn main() {
    let mut game_grid: [bool; GRID_SIZE] = [true; GRID_SIZE];

    let mut i = 0;
    for x in game_grid.iter() {
        if *x {
            print!("# ")
        } else {
            print!("  ")
        }

        i += 1;
        if (i > 0) && (i % 10 == 0) {
            print!("\n");
        }
    }
}
