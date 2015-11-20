module PersonalWordlistCLI
  class Runner
    def initialize(argv, stdin = STDIN, stdout = STDOUT, stderr = STDERR, kernel = Kernel)
      @argv, @stdin, @stdout, @stderr, @kernel = argv, stdin, stdout, stderr, kernel
    end

    def execute!
      exit_code = begin
                    $stderr = @stderr
                    $stdin  = @stdin
                    $stdout = @stdout

                    PersonalWordlistCLI::Commands.start(ARGV)
                    0
                  rescue StandardError => e
                    b = e.backtrace
                    @stderr.puts("#{b.shift}: #{e.message} (#{e.class})")
                    @stderr.puts(b.map{|s| "\tfrom #{s}"}.join("\n"))
                    1
                  rescue SystemExit => e
                    e.status
                  ensure
                    $stderr = STDERR
                    $stdin  = STDIN
                    $stdout = STDOUT
                  end
      @kernel.exit(exit_code)
    end
  end
end
