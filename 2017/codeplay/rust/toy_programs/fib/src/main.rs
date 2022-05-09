use std::env;

const MAX_FIB: u64 = 1000;

fn main() {
    // https://en.wikipedia.org/wiki/Fibonacci_number

    let n = get_n();

    if n > 0 && n <= MAX_FIB {
        println!("{}", calc_fib_recur(n));
        println!("{}", calc_fib_recur2(n));

        println!("{}", calc_fib_tail_recur(n, 1, 0));

        println!("{}", calc_fib_loop(n));
        println!("{}", calc_fib_loop2(n));
    } else {
        println!("please enter a whole number between 1 and 1000 (inclusive)");
    }
}

#[allow(dead_code)]
fn calc_fib_recur(n: u64) -> u64 {
    if n < 3 {
        1
    } else {
        calc_fib_recur(n-1) + calc_fib_recur(n-2)
    }
}

#[allow(dead_code)]
fn calc_fib_recur2(n: u64) -> u64 {
    match n {
        1|2 => 1,
        _ => calc_fib_recur2(n - 1) + calc_fib_recur2(n - 2)
    }
}

#[allow(dead_code)]
fn calc_fib_tail_recur(i: u64, a: u64, b: u64) -> u64 {
    // call: calc_fib_recur2(n, 1, 0)

    // adapted from: https://en.wikibooks.org/wiki/
    //     Algorithm_Implementation/Mathematics/
    //     Fibonacci_Number_Program#Recursive_version_2

    if i == 1 {
        a+b
    } else {
        calc_fib_tail_recur(i-1, b, a+b)
    }
}

#[allow(dead_code)]
fn calc_fib_loop(n: u64) -> u64 {
    let mut cn  = 1;
    let mut pn  = 1;
    let mut ppn = 1;

    for i in 1..n+1 {
        if i > 2 {
            cn = pn + ppn;
            ppn = pn;
            pn = cn;
        }
    }

    cn
}

#[allow(dead_code)]
fn calc_fib_loop2(mut n: u64) -> u64 {
    let mut t;
    let mut a = 1;
    let mut b = 0;

    while n > 1 {
        n -= 1;

        // no `(a, b) = (b, a+b)` ? :'(
        t = b;
        b = a+b;
        a = t;
    }

    a+b
}

// TODO(zmd): fibo using closure as memoizing generator (both implemented via
//     loops and via recursion)? (don't know how to use lambdas and closures in
//     Rust yet, as of 2-Sept-2017.

fn get_n() -> u64 {
    let mut n = 0;

    // grab the first integer we can find from args
    for arg in env::args() {
        match arg.parse() {
            Ok(num) => { n = num },
            Err(_)  => continue
        }
        if n > 0 { break; }
    }

    n
}
