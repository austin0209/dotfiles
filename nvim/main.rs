fn main() {
    let args: Vec<String> = std::env::args().collect();
    let total: usize;

    if args.len() < 2 {
        total = 4;
    } else {
        total = args[1].trim().parse().unwrap();
    }

    let mut line = String::new();

    for _ in 0..total {
        line.push_str("#");
    }
    println!("{}", line);

    let mut blank = total - 1;
    let mut fill = 1;

    for _ in 0..total {
        line = String::new();

        for _ in 0..blank {
            line.push_str(" ");
        }
        for _ in 0..fill {
            line.push_str("#");
        }
        println!("{}", line);
        blank = if blank <= 0 { 0 } else { blank - 1 };
        fill += 2;
    }
    fill = total * 2 - 1;
    for _ in 0..total {
        line = String::new();

        for _ in 0..blank {
            line.push_str(" ");
        }
        for _ in 0..fill {
            line.push_str("#");
        }
        println!("{}", line);
        blank += 1;
        fill = if fill <= 2 { 0 } else { fill - 2 };
    }
}
