namespace :vendor do
  desc 'Clone the frontend apps repos into vendor/'
  task :clone do
    puts '----- Clone the frontend apps repos -----'
    puts
    @config['vendor'].each do |name, repo_url|
      if not Dir.exists?("vendor/#{name}") or Dir.empty?("vendor/#{name}")
        sh "git clone #{repo_url} vendor/#{name}"
      end
      puts
    end
  end
end
