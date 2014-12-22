module SassUnit
  class BacktraceFilter
    def filter(trace)
      trace.select { |line| line.match /\.s[ca]ss:\d+\Z/ }
    end
  end
end
