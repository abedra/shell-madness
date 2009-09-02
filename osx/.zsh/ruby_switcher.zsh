export ORIGINAL_PATH=$PATH

function use_ruby_from_leopard {
 export MY_RUBY_HOME=/System/Library/Frameworks/Ruby.framework/Versions/Current/usr
 export GEM_HOME=~/.gem/ruby/1.8
 update_path
}

function use_ruby { use_ruby_from_leopard }

function use_jruby_120 {
 export MY_RUBY_HOME=~/.ruby_versions/jruby-1.2.0
 export GEM_HOME=~/.gem/jruby/1.8
 # Set jruby home to make nailgun happy.
 export JRUBY_HOME=/Users/abedra/.ruby_versions/jruby-1.2.0
 update_path
}

function use_jruby { use_jruby_120 }

function use_ruby_191 {
 export MY_RUBY_HOME=~/.ruby_versions/ruby_191
 export GEM_HOME=~/.gem/ruby/1.9.1
 update_path
}

function update_path {
 export PATH=$GEM_HOME/bin:$MY_RUBY_HOME/bin:$ORIGINAL_PATH
 echo "Using `ruby -v`"
}
