function install_ruby_186 {
  mkdir -p ~/.ruby_versions && cd /tmp
  curl -L -O ftp://ftp.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p383.tar.gz &&
  tar xzf ruby-1.8.6-p383.tar.gz &&
  cd ruby-1.8.6-p383 &&
  ./configure --prefix=$HOME/.ruby_versions/ruby_186 --enable-shared &&
  make && make install &&
  rm -rf ruby-1.8.6-p383.tar.gz ruby-1.8.6-p383 &&
  use_ruby_186 && install_rubygems && install_basic_gems && cd ~
}

function install_ruby_187 {
  mkdir -p ~/.ruby_versions && cd /tmp
  curl -L -O ftp://ftp.ruby-lang.org/pub/ruby/ruby-1.8.7-p174.tar.bz2 &&
  tar xjf ruby-1.8.7-p174.tar.bz2 &&
  cd ruby-1.8.7-p174 &&
  ./configure --prefix=$HOME/.ruby_versions/ruby_187 --enable-shared --enable-pthread &&
  make && make install &&
  rm -rf ruby-1.8.7-p174.tar.gz ruby-1.8.7-p174 &&
  use_ruby_187 && install_rubygems && install_basic_gems && cd ~
}

function install_ruby_191 {
  mkdir -p ~/.ruby_versions && cd /tmp
  curl -L -O ftp://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p376.tar.gz &&
  tar xzf ruby-1.9.1-p376.tar.gz &&
  cd ruby-1.9.1-p376 &&
  ./configure --prefix=$HOME/.ruby_versions/ruby_191 --enable-shared &&
  make && make install &&
  rm -rf ruby-1.9.1-p376.tar.gz ruby-1.9.1-p376 &&
  use_ruby_191 && install_rubygems && install_basic_gems && cd ~
}

function install_jruby_140 {
  mkdir -p ~/.ruby_versions && cd ~/.ruby_versions &&
  curl -O -L --silent http://jruby.kenai.com/downloads/1.4.0/jruby-bin-1.4.0.zip &&
  rm -rf jruby-1.4.0 &&
  jar xf jruby-bin-1.4.0.zip &&
  ln -sf ~/.ruby_versions/jruby-1.4.0/bin/jruby ~/.ruby_versions/jruby-1.4.0/bin/ruby &&
  ln -sf ~/.ruby_versions/jruby-1.4.0/bin/jgem ~/.ruby_versions/jruby-1.4.0/bin/gem &&
  ln -sf ~/.ruby_versions/jruby-1.4.0/bin/jirb ~/.ruby_versions/jruby-1.4.0/bin/irb &&
  chmod +x ~/.ruby_versions/jruby-1.4.0/bin/{jruby,jgem,jirb} &&
  rm -rf ~/.ruby_versions/jruby-bin-1.4.0.zip &&
  use_jruby_131 && install_jruby_openssl && install_basic_gems &&
  cd ~
}

function make_rubies_go_now {
  install_ruby_186
  install_ruby_191
  install_jruby_140
}

function install_rubygems {
  cd /tmp
  curl -L -O http://rubyforge.org/frs/download.php/60718/rubygems-1.3.5.tgz
  tar xzf rubygems-1.3.5.tgz
  cd rubygems-1.3.5
  ruby setup.rb
}

function install_basic_gems {
  gem install rdoc rake
}

function install_jruby_openssl {
  gem install jruby-openssl
}