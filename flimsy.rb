# frozen_string_literal: true

module Flimsy

  def router(env, routes, handlers)
    Flimsy.router(env, routes, handlers)
  end

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

  def response(body, status: 200, content_type: 'text/html', headers: {})
    Flimsy.response(body, status, content_type, headers)
  end

  def self.response(body, status: 200, content_type: 'text/html', headers: {})
    [
      status.to_s,
      {'Content-Type' => content_type}.merge(headers),
      body.respond_to?(:each) ? body : [body]
    ]
  end

  module Utility
    def self.echo_env(env)
      result = ""
      env.each_pair do |k, v|
        result = result + "#{k.inspect} => #{v.inspect}\n"
      end
      "<br><pre>#{result}</pre><br>"
    end
  end

end
