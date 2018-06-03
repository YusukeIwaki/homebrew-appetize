require 'net/http'
require 'uri'
require 'digest/sha2'
require 'erb'

def formula(git_tag, sha256)
  erb_string = File.read('formula.erb')
  ERB.new(erb_string).result(binding.tap{|b|
    b.local_variable_set(:git_tag, git_tag)
    b.local_variable_set(:sha256, sha256)
  })
end

def fetch(url, depth = 0)
  res = Net::HTTP.get_response(URI.parse(url))
  if depth > 0 && res.is_a?(Net::HTTPRedirection)
    fetch(res['location'], depth - 1)
  else
    res.body
  end
end

def main()
  latest_url = "https://github.com/YusukeIwaki/appetize-cli/releases/latest"
  res = Net::HTTP.get_response(URI.parse(latest_url))
  return -1 unless res.is_a?(Net::HTTPRedirection)
  redirect_url = res['location']
  return -1 unless m = /https:\/\/github\.com\/YusukeIwaki\/appetize-cli\/releases\/tag\/(v[0-9]+(\..*)?)/.match(redirect_url)

  git_tag = m[1]
  url = "https://github.com/YusukeIwaki/appetize-cli/releases/download/#{git_tag}/appetize_darwin_amd64"
  sha256 = Digest::SHA256.hexdigest fetch(url, 5)
  puts formula(git_tag, sha256)
end

main()