/*
 * game of life
 *     - ncurses
 *     - special data structure:
 */

// NOTE(zmd, 7-May 2022): I don't remember when I wrote this precisely, but
// guessing it was around 2018. Never tried to compile it, and I doubt it will
// work as written, but it was just me trying to think how to model something
// like this in C (coming from languages like Ruby)

struct Cell {
    Cell *nw;
    Cell *n;
    Cell *ne;
    Cell *e;
    Cell *se;
    Cell *s;
    Cell *sw;
    Cell *w;
    bool living;
}

static const gridHeight = 300;
static const gridWidth = 300;
static const gridLength = gridHeight * gridWidth;

static cells Cell[gridHeight * gridWidth];

*Cell cellAtIndex(i) {
    if (i >= 0 || i < grid_height)  return &cells[nw_i];
    return NULL;
}

*Cell cellToNw(current_location) {
    return cell_at_index(current_location - grid_width - 1);
}

*Cell cellToN(current_location) {
    return cell_at_index(current_location - grid_width);
}

*Cell cellToNe(current_location) {
    return cell_at_index(current_location - grid_width + 1)
}

void initCell(int current_location) {
    Cell *c = &cells[current_location];
    c.nw = cellToNw(current_location);
    c.n = cellToN(current_location);
    c.ne = cellToNe(current_location);
}

/*
    1. Any live cell with fewer than two live neighbours dies, as if by
       underpopulation.
    2. Any live cell with two or three live neighbours lives on to the next
       generation.
    3. Any live cell with more than three live neighbours dies, as if by
       overpopulation.
    4. Any dead cell with exactly three live neighbours becomes a live cell,
       as if by reproduction.
*/
bool cell_alive(*Cell cell) {
    int nAlive = 0;
    if (cell.nw && cell->nw.living)  ++nAlive;
    if (cell.n && cell->n.living)    ++nAlive;
    if (cell.ne && cell->ne.living)  ++nAlive;
    if (cell.e && cell->e.living)    ++nAlive;
    if (cell.se && cell->se.living)  ++nAlive;
    if (cell.s && cell->s.living)    ++nAlive;
    if (cell.sw && cell->sw.living)  ++nAlive;
    if (cell.w && cell->w.living)    ++nAlive;

    if (cell.living) {
        if (nAlive == 2 || nAlive == 3)  return true;
    } else {
        if (nAlive == 3)  return true;
    }

    return false;
}

/*
 |  |  |  |  |  |
 +--+--+--+--+--+
 |  |  |  |  |  |
 +--+--+--+--+--+
 |  |  |  |  |  |
*/
