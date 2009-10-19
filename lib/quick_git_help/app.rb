require 'rubygems'

module QuickGitHelp
class App

  # Create a new instance of App, and run the application given
  # the command line _args_.
  #
  def self.run( args )
    self.new.run args
  end

  # Create a new main instance using _io_ for standard output and _err_ for
  # error messages.
  #
  def initialize( out = STDOUT, err = STDERR )
    @out = out
    @err = err
  end

  # Parse the desired user command and run that command object.
  #
  def run( args )
    dir_str = args.shift
    case dir_str
      when '-h', '--help'
        help
      when '-v', '--version'
        @out.puts "QuickGitHelp #{::QuickGitHelp::VERSION}"
        nil
      when nil
        QuickGitHelp::Tutorial.new(Dir.pwd).create
      else
        QuickGitHelp::Tutorial.new(File.expand_path(dir_str)).create
    end

  rescue StandardError => err
    @err.puts "ERROR:  While executing quickgithelp ... (#{err.class})"
    @err.puts "    #{err.to_s}"
    exit 1
  end

  def help
    @out.puts <<-MSG

  Quick, Git Help!
  A tool to create tutorials using a git repository.

  Usage:
    quickgithelp -h/--help
    quickgithelp -v/--version
    quickgithelp [directory]

  Examples:
    quickgithelp .

    MSG
    nil
  end
end
end

