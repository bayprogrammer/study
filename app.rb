# frozen_string_literal: true

require 'rack'

module Regexit
  App = Proc.new do |env|
    handlers = {
      :hello_world => ->(env) { Regexit.response('hello, world.') },
      :hello_bar => ->(env) { Regexit.response('hello, bar.') },
      :echo_env => ->(env) { Regexit.response(Regexit.echo_env(env)) }
    }

    routes = [
      [%r{^/index.php$}, [:get], :hello_world],
      [%r{^/foo/?$},     [:get], :hello_world],
      [%r{^/foo/bar/?$}, [:get], :hello_bar],
      [%r{^/env/?$},     [:get], :echo_env]
    ]

    # TODO(zmd): handlers should return response hash to use to set status
    #     code, headers, and response strings
    Regexit.router(env, routes, handlers).(env)
  end

  # basically, dispatch table lookup thingy, right?
  def self.router(env, routes, handlers)
    request_path = env['REQUEST_PATH']
    request_method = env['REQUEST_METHOD']

    # TODO(zmd): raise exception when no route to dispatch to...
    dispatch_to = lambda do |env|
      ['200', {'Content-Type' => 'text/html'}, ['no route found']]
    end

    # TODO(zmd): capture values from regex and pass to handler as args/kwargs
    routes.each do |regex, methods, handler|
      if regex.match(request_path)
        methods.each do |method|
          if method.to_s.upcase == request_method
            dispatch_to = handlers[handler]
            break
          end
        end
      end
    end

    dispatch_to
  end

  def self.response(body, status: 200, content_type: 'text/html', headers: {})
    [
      status.to_s,
      {'Content-Type' => content_type}.merge(headers),
      body.respond_to?(:each) ? body : [body]
    ]
  end

  def self.echo_env(env)
    result = ""
    env.each_pair do |k, v|
      result = result + "#{k.inspect} => #{v.inspect}\n"
    end
    "<br><pre>#{result}</pre>"
  end

end

Rack::Handler::WEBrick.run Regexit::App
