fn main() {
    let verses = [
        ("First", "Partridge in a Pear Tree"),
        ("Second", "Two Turtle Doves"),
        ("Third", "Three French Hens"),
        ("Fourth", "Four Calling Birds"),
        ("Fifth", "Five Golden Rings"),
        ("Sixth", "Six Geese a-Laying"),
        ("Seventh", "Seven Swans a-Swimming"),
        ("Eighth", "Eight Maids-a-Milking"),
        ("Ninth", "Nine Ladies Dancing"),
        ("Tenth", "Ten Lords a-Leaping"),
        ("Eleventh", "Eleven Pipers Piping"),
        ("Twelfth", "Twelve Drummers Drumming"),
    ];

    let mut verse;
    for v in 0..12 {
        verse = verses[v];
        println!("On the {} day of Christmas my true love sent to me", verse.0);

        for i in (0..v+1).rev() {
            verse = verses[i];
            if v == 0 {
                println!("a {}.", verse.1)
            } else if v > 0 && i == 0 {
                println!("and a {}.", verse.1);
            } else {
                println!("{},", verse.1);
            }
        }
        println!("");
    }
}
