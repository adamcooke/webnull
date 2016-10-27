module Webnull
  class Server

    MAP = {
      200 => "OK",
      403 => "Forbidden",
      404 => "Not found",
      500 => "Internal Server Error",
      503 => "Service Unavailable"
    }

    def call(env)
      request = Rack::Request.new(env)
      status = request.path.gsub(/\A\//, '').to_i
      if body = MAP[status]
        [status, {'Content-type' => 'text/plain', 'Content-length' => body.bytesize.to_s}, [body]]
      else
        [200, {}, ["OK"]]
      end
    end

  end
end
