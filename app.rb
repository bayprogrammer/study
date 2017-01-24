# frozen_string_literal: true

require 'rack'

require_relative 'flimsy'

# flimsy demo app
app = Proc.new do |env|
    handlers = {
      :hello_world => ->(env) { Flimsy.response('hello, world.') },
      :hello_bar => ->(env) { Flimsy.response('hello, bar.') },
      :echo_env => ->(env) { Flimsy.response(Flimsy::Utility.echo_env(env)) }
    }

    routes = [
      [%r{^/index.php$}, [:get], :hello_world],
      [%r{^/foo/?$},     [:get], :hello_world],
      [%r{^/foo/bar/?$}, [:get], :hello_bar],
      [%r{^/env/?$},     [:get], :echo_env]
    ]

    # TODO(zmd): handlers should return response hash to use to set status
    #     code, headers, and response strings
    Flimsy.router(env, routes, handlers).(env)
end

Rack::Handler::WEBrick.run app
