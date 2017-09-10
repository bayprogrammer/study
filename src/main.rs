const GRID_STRIDE: usize = 10;
const GRID_ROWS:   usize = 10;
const GRID_SIZE:   usize = GRID_ROWS * GRID_STRIDE;

fn main() {
    let mut game_grid = GameGrid::new();

    game_grid.display();

    println!("");

    game_grid.tick();
    game_grid.display();
}

struct GameGrid {
    grid: [bool; GRID_SIZE],
}

impl GameGrid {
    fn new() -> GameGrid {
        GameGrid {
            grid: [true; GRID_SIZE]
        }
    }

    fn tick(&mut self) {
        let mut i = 0;
        for x in self.grid.iter_mut() {
            if i % 3 == 0 {
                *x = false;
            }
            i += 1;
        }
    }

    fn display(&self) {
        let mut i = 0;
        for x in self.grid.iter() {
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
}
