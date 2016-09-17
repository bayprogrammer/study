use std::thread;
use std::time::Duration;
use std::sync::{Mutex, Arc};

struct Philosopher {
    name:  String,
    left:  usize,
    right: usize,
}

impl Philosopher {
    fn new(name: &str, left: usize, right: usize) -> Philosopher {
        Philosopher {
            name:  name.to_string(),
            left:  left,
            right: right,
        }
    }

    fn eat(&self, table: &Table) {
        let _left = table.forks[self.left].lock().unwrap();
        thread::sleep(Duration::from_millis(150));
        let _right = table.forks[self.right].lock().unwrap();

        println!("{} is eating.", self.name);

        thread::sleep(Duration::from_millis(1000));

        println!("{} is done eating.", self.name);
    }
}

struct Table {
    forks: Vec<Mutex<()>>,
}

fn main() {
    let table = Arc::new(Table { forks: vec![
        Mutex::new(()), // fork 0
        Mutex::new(()), // fork 1
        Mutex::new(()), // fork 2
        Mutex::new(()), // fork 3
        Mutex::new(()), // fork 4
    ]});

    let philosophers = vec![
        Philosopher::new("James R. White",     0, 1),
        Philosopher::new("Frank Turek",        1, 2),
        Philosopher::new("William Lane Craig", 2, 3),
        Philosopher::new("Wayne Grudem",       3, 4),
        Philosopher::new("James Boyce",        0, 4),
    ];

    let handles: Vec<_> = philosophers.into_iter().map(|p| {
        let table = table.clone();

        thread::spawn(move || {
            p.eat(&table);
        })
    }).collect();

    for h in handles {
        h.join().unwrap();
    }
}
