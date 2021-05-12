default: run

run: main.lua
	love .

%.lua: %.fnl fennel
	vendor/fennel --compile $< > $@
