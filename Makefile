default: run

run: main.lua
	love .

%.lua: %.fnl fennel
	./fennel --compile $< > $@
