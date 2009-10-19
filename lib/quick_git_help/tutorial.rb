require 'fileutils'
require 'erb'
require 'grit'

module QuickGitHelp
  class Tutorial
    include Grit
    
    def initialize(dir)
      @repo_path = dir
    end

    def create
      repo = Repo.new(@repo_path)
      puts repo.inspect
    end
  end
end
