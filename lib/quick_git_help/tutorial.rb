require 'fileutils'
require 'erb'
require 'grit'

module QuickGitHelp
  class Tutorial
    include Grit
    
    def initialize(dir)
      @repo_path = dir
      @repo = Repo.new(@repo_path)
    end

    def tutorial_dir
      File.join(@repo_path, 'quick_tutorial')
    end

    def make_tutorial_dir
      FileUtils.rm_rf(tutorial_dir)
      FileUtils.mkdir(tutorial_dir)
    end

    def write_tutorial_dirs
      @repo.commits.each do |commit|
        FileUtils.mkdir(File.join(tutorial_dir, commit.sha))
        commit.diffs.each do |diff|
          path = diff.a_path
          puts path
          data = diff.a_blob.data
          File.open(File.join(tutorial_dir, commit.sha, path), 'w') do |f|
            f.write(data)
          end
        end
      end
    end

    def guess_file_path
      @repo.commits.last.diffs.first.b_path
    end

    def create
      make_tutorial_dir
      write_tutorial_dirs
      @tutorial_file = guess_file_path
      puts @tutorial_file
    end
  end
end
