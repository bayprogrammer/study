#!/usr/bin/env php
<?php

class ShellScript
{

    // TODO(zmd): dynamically declare the missing shell commands for
    //   performance
    // TODO(zmd): auto convert to dashified if underscorified command does not
    //   exist (so that things like ->my_cmd() can translate into my-cmd calls
    //   if there isn't otherwise a my_cmd on the system path
    public function __call($name, $args)
    {
        return $this->sh($name, ...$args);
    }

    public function __invoke(...$args)
    {
        return $this->sh(...$args);
    }

    public function sh($cmd, ...$args)
    {
        return compact('cmd', 'args');
    }

}

$script = new ShellScript();

print_r($script('ls', '-lah'));
print_r($script->sh('ls', '-lah'));
print_r($script->ls('-lah'));
