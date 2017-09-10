const GRID_STRIDE: usize = 10;
const GRID_ROWS: usize   = 10;
const GRID_SIZE: usize   = GRID_ROWS * GRID_STRIDE;

fn main() {
    let mut game_grid = new_game_grid();

    print_game_grid(&mut game_grid);

    println!("");

    tick_game_grid(&mut game_grid);
    print_game_grid(&mut game_grid);
}

// TODO(zmd): can we make a custom array type and implement the following as
//     methods on it?

fn new_game_grid() -> [bool; GRID_SIZE] {
    [true; GRID_SIZE]
}

fn tick_game_grid(grid: &mut[bool; GRID_SIZE]) {
    let mut i = 0;
    for x in grid.iter_mut() {
        if i % 3 == 0 {
            *x = false;
        }
        i += 1;
    }
}

fn print_game_grid(grid: &[bool; GRID_SIZE]) {
    let mut i = 0;
    for x in grid.iter() {
        if *x {
            print!("# ")
        } else {
            print!("  ")
        }

        i += 1;
        if (i > 0) && (i % GRID_STRIDE == 0) {
            print!("\n");
        }
    }
}
