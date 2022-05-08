#include <SFML/Graphics.hpp>

int main()
{
    sf::RenderWindow window(sf::VideoMode(200, 200), "SFML works!");

    auto radius = 100.f;
    sf::CircleShape shape(radius);

    shape.setFillColor(sf::Color::Green);

    while (window.isOpen())
    {
        sf::Event event;
        while (window.pollEvent(event))
        {
            if (event.type == sf::Event::Closed)
                window.close();
        }

        shape.setRadius(radius);
        window.clear();
        window.draw(shape);
        window.display();

        if (radius > 1000.f)
        {
            radius = 100.f;
        } else {
            radius += 1.f;
        }
    }

    return 0;
}
