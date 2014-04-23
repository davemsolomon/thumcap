class ThumCapFollower
  def Greet
    puts "hello david class" 
  end

  def follow
        x = 1
        url = URI.parse('http://bbcwssc.ic.llnwd.net/')
        Net::HTTP.start(url.host, url.port) do |http|
        randomstring = ('A'..'Z').to_a.shuffle[0,6].join
        filepath = "/var/capthurits/".to_s + randomstring.to_s + ".mp3".to_s
        f5 = open(filepath, "w+b")
        buffer = Array.new(240)
        begin
            http.request_get('/stream/bbcwssc_mp1_ws-eieuk') do |resp|
            resp.read_body do |segment|
                buffer[x] = segment
                x = x + 1
                break if x == 240
            end
            puts "outer x=".to_s + x.to_s
            for i in 2..240
                f5.write(buffer[i])
            end
            break if x == 240
            end
        ensure
            f5.close()
        end
    end
  end

end
