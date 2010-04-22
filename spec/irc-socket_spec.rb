require File.expand_path('../../lib/irc-socket', __FILE__)

class IRCSocket
  def write(data)
    return data
  end
end

commands = [
  [:pass,    %w(foobar),                        "PASS foobar"],
  [:nick,    %(ipsum),                          "NICK ipsum"],
  [:user,    ["guest", 0, '*', "real name"],    "USER guest 0 * :real name"],
  [:oper,    %w(foo bar),                       "OPER foo bar"],
  
  [:quit,    %w(goodbye),                       "QUIT :goodbye"],
  [:join,    %w(#mychan),                       "JOIN #mychan"],
  [:part,    %w(#mychan),                       "PART #mychan"],
  [:part,    %w(#mychan cya!),                  "PART #mychan :cya!",           "with part message"],
  [:topic,   %w(#mychan newtopic),              "TOPIC #mychan :newtopic"],
  [:names,   %w(#foo #bar),                     "NAMES #foo,#bar"],
  [:list,    %w(#foo #bar),                     "LIST #foo,#bar"],
  [:invite,  %w(foo #mychan),                   "INVITE foo #mychan"],
  [:kick,    %w(#chan villian),                 "KICK #chan villian"],
  [:kick,    %w(#chan villian gtfo!),           "KICK #chan villian :gtfo!",    "with kick reason"],
  [:privmsg, ['#chan', 'foo bar baz'],          "PRIVMSG #chan :foo bar baz"],
  [:notice,  ['#chan', 'foo bar baz'],          "NOTICE #chan :foo bar baz"],
]

describe "IRCSocket" do
  before do
    @irc = IRCSocket.new('irc.myserver.net')
  end
  
  describe "::new" do
    it "should return an IRCSocket" do
      @irc.class.should == IRCSocket
    end

    it "should default to port 6667" do
      @irc.port.should == 6667
    end

    it "should not automatically connect" do
      @irc.connected.should == false
    end

    it "should set socket instance as nil" do
      @irc.socket.should == nil
    end

  end

  describe "IRC commands as per rfc2812" do
    commands.each do |requirements|
      meth, params, pass, extra = *requirements
      describe "##{meth}" do
        it "should send a #{meth.to_s.upcase} command #{extra if extra}" do
          @irc.send(meth, *params).should == pass
        end
      end
    end
  end

end

