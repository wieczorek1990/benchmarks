require "kemal"

module Hello
  get "/" do
    "Hello World!"
  end

  Kemal.run
end
